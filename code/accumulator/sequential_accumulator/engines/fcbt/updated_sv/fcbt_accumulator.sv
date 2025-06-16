module fcbt_sv
  #(parameter int WIDTH = 32,
    parameter int FCBT_max_inputs = 128 
   )
   (
    input logic 		       clk,
    input logic 		       rst,
    input logic 		       hold_output,
    output logic               ready,
    input logic                end_of_group,

    input logic [WIDTH-1:0]    in,
    output logic [WIDTH-1:0]   out,
    input logic 		       valid_in, 
    output logic               valid_out
    );

    localparam int ADD_LATENCY = 3;
    localparam int BUFFER_DEPTH = 6;

    localparam int BUFFER_DEPTH_BITS = $clog2(BUFFER_DEPTH); 
    localparam int TREE_LEVELS = $clog2(FCBT_max_inputs);
    localparam int TREE_LEVELS_BITS = $clog2(TREE_LEVELS+1);  
    localparam int TAGGING_BITS = 1;

    // Adder signals
    logic [WIDTH-1:0] add_in1[2];
    logic [WIDTH-1:0] add_in2[2]; 
    logic [WIDTH-1:0] add_out[2];
    logic [1:0] add_valid_in;
    logic [1:0] add_valid_out;
    logic [TAGGING_BITS-1:0] add_group_tags_in[2]; 
    logic [TAGGING_BITS-1:0] add_group_tags_out[2];
    logic [1:0] add_end_of_group_in;
    logic [1:0] add_end_of_group_out;

    logic [WIDTH+TAGGING_BITS-1:0] buf_regs[TREE_LEVELS][BUFFER_DEPTH];
    logic [WIDTH-1:0] temp_buf_regs[TREE_LEVELS][BUFFER_DEPTH];        //new
    logic [TREE_LEVELS-1:0] buf_wr_en;
    logic [BUFFER_DEPTH_BITS-1:0] buf_count[TREE_LEVELS];
    //logic [BUFFER_DEPTH-1:0] buf_count[TREE_LEVELS];
    logic buf_rd_en1[TREE_LEVELS]; 
    logic buf_rd_en2[TREE_LEVELS];

    // ctrl signals
    logic ctrl_en;
    logic [TREE_LEVELS-2:0] ctrl_count;

    logic [TREE_LEVELS_BITS-1:0] ctrl_buf_sel;
    logic [TREE_LEVELS_BITS-1:0] ctrl_next_buf_in;
    logic [TREE_LEVELS_BITS-1:0] ctrl_next_buf_out;

    localparam int CTRL_BUF_WIDTH = $bits(ctrl_next_buf_out);

    // BUF Process

    assign {ctrl_en, ready} = '1;

    always @(posedge clk or posedge rst) begin

        logic [BUFFER_DEPTH_BITS-1:0] temp_buf_count[TREE_LEVELS];
        //logic [BUFFER_DEPTH-1:0] temp_buf_count[TREE_LEVELS];

        if (rst == 1'b1) begin
            for (int i = 0; i < TREE_LEVELS; i++) begin
                buf_count[i] <= '0;
                for (int j = 0; j < BUFFER_DEPTH; j++) begin
                    buf_regs[i][j] <= '0;
                end
            end
        end
        else begin
            for (int i = 0; i < TREE_LEVELS; i++) begin
                if (buf_wr_en[i] == 1'b1) begin
                // Write new element to buffer `i`.

                // Determine from where the new element originates,
                // and update the first register in the buffer
                // accordingly.

                    // Element originates directly from input.
                    if (i == 0) begin
                        buf_regs[0][0] <= {end_of_group, in};
                        temp_buf_regs[0][0] <= in;
                    end 
                    // Element originates from the first adder.
                    else if (i == 1) begin
                        buf_regs[1][0] <= {add_end_of_group_out[0], add_out[0]};
                        temp_buf_regs[1][0] <= add_out[0];
                    end
                    // Element originates from the second adder.
                    else begin
                        buf_regs[i][0] <= {add_end_of_group_out[1], add_out[1]};
                        temp_buf_regs[i][0] <= add_out[1];
                    end
                    // Shift all other elements in the buffer.
                    for (int j = 0; j <= BUFFER_DEPTH - 2; j++) begin
                        buf_regs[i][j+1] <= buf_regs[i][j];
                        temp_buf_regs[i][j+1] <= temp_buf_regs[i][j];
                    end
                end

                // Update buffer count accordingly.
                temp_buf_count[i] = buf_count[i];

                if (buf_wr_en[i] == 1'b1) temp_buf_count[i] = temp_buf_count[i] + 1'b1;
                
                if (buf_rd_en1[i] == 1'b1) temp_buf_count[i] = temp_buf_count[i] - 1'b1;
                else if (buf_rd_en2[i] == 1'b1) temp_buf_count[i] = temp_buf_count[i] - 2'b10;

                buf_count[i] <= temp_buf_count[i];
            end
        end
    end
    //& buf_count[0] < BUFFER_DEPTH'(BUFFER_DEPTH)
    assign buf_wr_en[0] = valid_in == 1'b1 ? 1'b1 : 1'b0; //& buf_count[0] < BUFFER_DEPTH_BITS'(BUFFER_DEPTH) ? 1'b1 : 1'b0;
    assign buf_wr_en[1] = add_valid_out[0] == 1'b1 ? 1'b1 : 1'b0; //& buf_count[1] < BUFFER_DEPTH_BITS'(BUFFER_DEPTH) ? 1'b1 : 1'b0;

    genvar i;
    generate 
        for (i = 2; i < TREE_LEVELS; i++) begin : L_BUFF_WR
            assign buf_wr_en[i] = (add_valid_out[1] == 1'b1 & ctrl_next_buf_out == TREE_LEVELS_BITS'(i)) ? 1'b1 : 1'b0;  //& buf_count[i] < BUFFER_DEPTH'(BUFFER_DEPTH) ? 1'b1 : 1'b0;
        end
    endgenerate

    always_comb begin
        logic [TREE_LEVELS-2:0] temp_ctrl_count;
        // Default values
        for (int z = 0; z < TREE_LEVELS; z++) begin 
            buf_rd_en1[z] = 1'b0;
            buf_rd_en2[z] = 1'b0;
        end

        add_valid_in         = '0;
        ctrl_buf_sel         = '0;
        add_end_of_group_in  = '0;
        add_in1[0]           = '0;
        add_in2[1]           = '0;
        temp_ctrl_count      = '0;
        // Perform singleton addition with 1st adder if the next element in buffer 0
        // is the last element of a group
        if (buf_count[0] > BUFFER_DEPTH_BITS'(0) & buf_regs[0][BUFFER_DEPTH_BITS'(buf_count[0]-1'b1)][WIDTH] == 1'b1) begin
            buf_rd_en1[0]           = 1'b1;
            add_in1[0]              = buf_regs[0][BUFFER_DEPTH_BITS'(buf_count[0]-1'b1)][WIDTH-1:0];
            add_in2[0]              = '0;
            add_valid_in[0]         = 1'b1;
            add_end_of_group_in[0]  = buf_regs[0][BUFFER_DEPTH_BITS'(buf_count[0]-1'b1)][WIDTH];
        end
        else if (buf_count[0] > BUFFER_DEPTH_BITS'(1)) begin
                buf_rd_en2[0]           = 1'b1;
                add_in1[0]              = buf_regs[0][BUFFER_DEPTH_BITS'(buf_count[0]-1'b1)][WIDTH-1:0];
                add_in2[0]              = buf_regs[0][BUFFER_DEPTH_BITS'(buf_count[0]-2'b10)][WIDTH-1:0];
                add_valid_in[0]         = 1'b1;
                add_end_of_group_in[0]  = buf_regs[0][BUFFER_DEPTH_BITS'(buf_count[0]-1'b1)][WIDTH] | buf_regs[0][BUFFER_DEPTH_BITS'(buf_count[0]-2'b10)][WIDTH];
        end

        for (int i = 1; i < TREE_LEVELS; i++) begin
            // 2nd adder uses inputs from buffer i (i>=1) every 2^i cycles
            for (int k = 0; k < i; k++) begin
                temp_ctrl_count[k] = ctrl_count[k];
            end
            if (temp_ctrl_count == 2**(i-1)-1) begin
                ctrl_buf_sel = TREE_LEVELS_BITS'(i);

                // perform singleton addition if the next element in buffer i is the last 
                // element of a group
                if (buf_count[i] > BUFFER_DEPTH_BITS'(0) & buf_regs[i][BUFFER_DEPTH_BITS'(buf_count[i]-1'b1)][WIDTH] == 1'b1) begin
                    buf_rd_en1[i]           = 1'b1;
                    add_in1[1]              = buf_regs[i][BUFFER_DEPTH_BITS'(buf_count[i]-1'b1)][WIDTH-1:0];
                    add_in2[1]              = '0;
                    add_valid_in[1]         = 1'b1;
                    add_end_of_group_in[1]  = buf_regs[i][BUFFER_DEPTH_BITS'(buf_count[i]-1'b1)][WIDTH];
                end
                else if (buf_count[i] > BUFFER_DEPTH_BITS'(1)) begin
                    buf_rd_en2[i]              = 1'b1;
                    add_in1[1]                 = buf_regs[i][BUFFER_DEPTH_BITS'(buf_count[i]-1'b1)][WIDTH-1:0];
                    add_in2[1]                 = buf_regs[i][BUFFER_DEPTH_BITS'(buf_count[i]-2'b10)][WIDTH-1:0];
                    add_valid_in[1]            = 1'b1;
                    // adder end_of_group bits. Value only considers first element in singleton add.
                    add_end_of_group_in[1]     = buf_regs[i][BUFFER_DEPTH_BITS'(buf_count[i]-1'b1)][WIDTH] | buf_regs[i][BUFFER_DEPTH_BITS'(buf_count[i]-2'b10)][WIDTH];
                end
            end
        end
    end

    // Adders

    genvar x;
    generate
        for (x = 0; x < 2; x++) begin : L_ADDER
            adder_wrapper U_ADDER (clk,
                                   rst,
                                   add_in1[x],
                                   add_in2[x],
                                   add_valid_in[x],
                                   add_out[x],
                                   add_valid_out[x]);
            delay_fcbt #(ADD_LATENCY, 1) U_GROUP_TAGS (clk,
                                        rst,
                                        ctrl_en,
                                        add_group_tags_in[x],
                                        add_group_tags_out[x]);
            // carry along tagging information while sum is in adder
            assign add_group_tags_in[x] = add_end_of_group_in[x];

            // break up tagging signal into end_of_group flag, and group_num data
            assign add_end_of_group_out[x] = add_group_tags_out[x];
        end
    endgenerate

    delay_fcbt #(ADD_LATENCY, TREE_LEVELS_BITS) U_NEXT_BUF (clk,
                                 rst,
                                 ctrl_en,
                                 ctrl_next_buf_in,
                                 ctrl_next_buf_out);

    assign ctrl_next_buf_in = ctrl_buf_sel + 1'b1;

    // Output
    assign out = add_out[1];
    assign valid_out = (add_valid_out[1] == 1'b1 & ctrl_next_buf_out == TREE_LEVELS_BITS'(TREE_LEVELS)) ? 1'b1 : 1'b0;

    // Scheduling Counter
    always_ff @(posedge clk or posedge rst) begin
        if (rst == 1) ctrl_count <= '0;
        else ctrl_count <= ctrl_count + 1'b1;
    end

endmodule