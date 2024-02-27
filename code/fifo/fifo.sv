// Greg Stitt
// University of Florida

// Module: fifo_sv

module fifo_sv
    #(
        parameter width = 8,
        parameter depth = 32,
        parameter int read_latency = 1,
        parameter int almost_full_threshold = depth-1,
        parameter string ram_style = "",
        parameter logic reg_full = 1'b1,
        parameter logic reg_almost_full = 1'b1,
        parameter logic reg_empty = 1'b1,
        parameter logic read_clears_full = 1'b0,
        parameter logic access_protection = 1'b1
    )
    (
        input logic                        clk,
        input logic                        rst,
        output logic                       full,
        output logic                       almost_full,
        output logic [$clog2(depth+1)-1:0] count,
        input logic                        wr_en,
        input logic [width-1:0]            wr_data,
        output logic                       empty, 
        input logic                        rd_en,
        output logic [width-1:0]           rd_data  
    );

   // Use the ram_style parameter to control the RAM resource.
   (* ramstyle = ram_style *) logic [width-1:0] ram[depth];
   logic [width-1:0]                   rd_data_ram;
   logic [$clog2(depth)-1:0]           wr_addr_r, rd_addr_r, rd_addr;

   localparam int                      COUNT_width = $clog2(depth)+1;   
   logic [COUNT_width-1:0]             count_r, next_count, count_update;
   logic                               valid_wr, valid_rd;
   
   assign count = count_r;
      
   // Infer the RAM using old-data for a read-during-write.
   always_ff @(posedge clk) begin
        if (valid_wr) ram[wr_addr_r] <= wr_data;
        rd_data_ram <= ram[rd_addr];
   end

    // Output read data and read address based on different read latencies.
    generate
    if (read_latency == 2) begin : l_rd_data
        assign rd_addr = rd_addr_r;
        
        // Register the ram output for a 2-cycle read.
        always_ff @(posedge clk) rd_data <= rd_data_ram;        
    end
    else if (read_latency == 1) begin : l_rd_data
        assign rd_addr = rd_addr_r;
        assign rd_data = rd_data_ram;
    end
    else if (read_latency == 0) begin : l_rd_data
        logic bypass_valid, wr_en_delayed_r;
        logic [width-1:0] bypass_r;

        // Adjust the read address for same-cycle reads depending on whether
        // or a not a read is current occurring.
        assign rd_addr = !valid_rd ? rd_addr_r : rd_addr_r + 1'b1;
        
        // Add manual bypass logic for same-cycle reads.
        assign rd_data = bypass_valid ? bypass_r : rd_data_ram;
        assign bypass_valid = wr_en_delayed_r && count_r == COUNT_width'(1);
        
        always @(posedge clk or posedge rst) begin
        if (rst) begin             
            wr_en_delayed_r <= '0;  
        end
        else begin
            bypass_r <= wr_data;
            wr_en_delayed_r <= wr_en;                               
        end
        end 
    end
    endgenerate

    // Addressing and count logic.
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            rd_addr_r <= '0;
            wr_addr_r <= '0;
            count_r <= '0;  
        end
        else begin
            count_r <= next_count;  
            if (valid_wr) wr_addr_r <= wr_addr_r + 1'b1;
            if (valid_rd) rd_addr_r <= rd_addr_r + 1'b1;
        end
    end

    // Update the count by 1, -1, or 0 based on the read and write status. 
    always_comb begin
        case ({valid_wr, valid_rd})
            2'b10 : count_update = COUNT_width'(1);
            2'b01 : count_update = '1;
            default : count_update = '0;    
        endcase      
        next_count = count_r + count_update;      
    end
   
    generate
        // Handle access protection.
        if (access_protection) begin : l_access_protection
            assign valid_wr = wr_en && !full;
            assign valid_rd = rd_en && !empty;
        end
        else begin : l_access_protection
            // Ignore validity of reads and writes.
            assign valid_wr = wr_en;
            assign valid_rd = rd_en;
        end

        // Almost full logic.
        if (!reg_almost_full) begin : l_almost_full
            if (read_clears_full) begin
                assign almost_full = count_r == almost_full_threshold && !rd_en;
            end     
            else begin         
                assign almost_full = count_r == almost_full_threshold;
            end
        end
        else begin : l_almost_full
            always_ff @(posedge clk or posedge rst)
            if (rst) almost_full <= 1'b0;
            else begin
                if (read_clears_full) almost_full <= next_count == almost_full_threshold && !rd_en;
                else almost_full <= next_count >= almost_full_threshold;
                // TODO: figure out if this has to be less than or equal to
            end
        end

        // Full logic.
        if (!reg_full) begin : l_full
            if (read_clears_full) begin
                assign full = count_r == depth && !rd_en;
            end
            else begin
                assign full = count_r == depth;
            end
        end
        else begin : l_full
            always_ff @(posedge clk or posedge rst) begin
            if (rst) full <= 1'b0;
            else begin
                if (read_clears_full) full <= next_count == depth && !rd_en;
                else full <= next_count == depth;
            end
            end
        end

        // Empty logic.
        if (!reg_empty) begin : l_empty
            assign empty = count_r == 0;
        end
        else begin : l_empty
            always_ff @(posedge clk or posedge rst)
            if (rst) empty <= 1'b1;
            else empty <= next_count == '0;
        end
    endgenerate    
endmodule

