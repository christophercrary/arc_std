`timescale 1 ns / 10 ps

module fcbt_accumulator_orig_tb;

    localparam WIDTH = 32;
    localparam FCBT_max_inputs = 32768;
    localparam FCBT_obuf_size = 100;

    logic   clk, rst, ready, end_of_group, valid_in, valid_out;
    logic hold_output = 1'b0;
    logic  signed [WIDTH-1:0] ip, result, value;
    

    localparam TOT_GROUPS = 50;
    localparam MAX_GROUP_SIZE = 31000;
    localparam MIN_INPUT_VALUE = 0;
    localparam MAX_INPUT_VALUE = 100000;
    integer group_count = 0;
    logic signed [WIDTH-1:0] sum [TOT_GROUPS-1:0];
    integer group_sizes_array [TOT_GROUPS-1:0];

    fcbtWrapper #(.width(WIDTH), .FCBT_max_inputs(FCBT_max_inputs), .FCBT_obuf_size(FCBT_obuf_size)) DUT (.*);


    // Generate the clock.
    initial begin : generate_clock
        clk = 1'b0;
        while(1) #5 clk = ~clk;
    end

    initial begin
        $timeformat(-9, 0, " ns");
        // Reset the design.
        rst <= 1'b1;
        end_of_group <= 1'b0;
        valid_in <= 1'b0;
        ip <= '0;
        sum <= '{default: '0};
        value = '0;
        for (int i=0; i < 5; i++) @(posedge clk);
        @(negedge clk);
        rst <= 1'b0;
        @(posedge clk);

        // Perform test
        for (int i=0; i<TOT_GROUPS; i++) begin
            group_sizes_array[i] = $urandom_range(MAX_GROUP_SIZE,1);
            $display("Starting Group %d (%0t)", i, $time);
            for (int j=1; j<=group_sizes_array[i]; j++) begin
                if (ready == 1'b1) begin
                    value = (-1**$urandom) * $urandom_range(MAX_INPUT_VALUE,MIN_INPUT_VALUE);
                    ip <= $shortrealtobits(shortreal'(value));
                    sum[i] <= sum[i] + value;
                    valid_in <= 1'b1;
                    if(j == group_sizes_array[i]) end_of_group <= 1'b1;
                    else end_of_group <= 1'b0;
                    @(posedge clk);
                end
            end
            valid_in <= 1'b0;
            end_of_group <= 1'b0;
        end

        for (int i=0; i<500; i++) @(posedge clk);
        disable generate_clock;

    end

    initial begin: check_outputs

        while (group_count < TOT_GROUPS) begin
            // Wait for valid_out to be asserted
            @(posedge clk iff (valid_out == 1'b1));
            // Check if the result obtained is correct
            if($bitstoshortreal(result) == sum[group_count]) begin
                $display("Test Passed (%0t) for group %0d and group size %0d", $time, group_count, group_sizes_array[group_count]);
            end
            else begin
                $display("Test Failed (%0t) for group %0d and group size %0d where result = %0d and expected output = %0d", $time, group_count, group_sizes_array[group_count], $bitstoshortreal(result), sum[group_count]);
            end
            group_count <= group_count + 1;
        end
    end

endmodule