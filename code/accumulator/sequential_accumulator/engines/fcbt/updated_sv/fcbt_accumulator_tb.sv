// Author: Rujuta Vaze
// // FCBT Accumulator TB used to test basic functionality of fcbt_accumulator

`timescale 1 ns / 10 ps

module fcbt_accumulator_tb;

    localparam WIDTH = 32;
    localparam FCBT_max_inputs = 128;
    //localparam FCBT_obuf_size = 14;

    logic   clk, rst, ready, end_of_group, valid_in, valid_out;
    logic hold_output = 1'b0;
    logic   [WIDTH-1:0] in, out, value;
    //logic   [WIDTH-1:0] ip, result, value;
    

    localparam TOT_GROUPS = 10;
    localparam MAX_GROUP_SIZE = 5;
    localparam MIN_INPUT_VALUE = 0;
    localparam MAX_INPUT_VALUE = 10;
    longint group_count = 0;
    logic [WIDTH-1:0] sum [TOT_GROUPS-1:0];
    integer group_sizes_array [TOT_GROUPS-1:0];

    //fcbtWrapper #(.width(WIDTH), .FCBT_max_inputs(FCBT_max_inputs)) DUT (.*);
    fcbt_sv #(WIDTH, FCBT_max_inputs) DUT (.*);

    // Generate the clock.
    initial begin : generate_clock
        clk = 1'b0;
        while(1) #10 clk = ~clk;
    end

    initial begin
        $timeformat(-9, 0, " ns");
        
        // Reset the design.
        rst <= 1'b1;
        end_of_group <= 1'b0;
        hold_output <= 1'b0;
        valid_in <= 1'b0;
        in <= '0;
        //ip <= '0;

        for (int i=0; i < 5; i++) @(posedge clk);
        
        @(negedge clk);
        rst <= 1'b0;
        @(posedge clk);

        // Initialize sum array elements to zero
        sum <= '{default: '0};
        @(posedge clk);

        // Perform test
        for (int i=0; i<TOT_GROUPS; i++) begin
            group_sizes_array[i] = $urandom_range(MAX_GROUP_SIZE, 1);
            $display("Group %0d starting [%0t]", i, $time);
            for (int j=1; j<=group_sizes_array[i]; j++) begin
                if (ready == 1'b1) begin
                    value = $urandom_range(MAX_INPUT_VALUE,MIN_INPUT_VALUE);
                    in <= $shortrealtobits(shortreal'(value));
                    //ip <= $shortrealtobits(shortreal'(value));
                    sum[i] <= sum[i] + int'(value);
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

            // Check if the out obtained is correct
            if($bitstoshortreal(out) == sum[group_count]) begin
            //if($bitstoshortreal(result) == sum[group_count]) begin
                $display("Test Passed (%0t) for group %d", $time, group_count);
            end
            else begin
                $display("Test Failed (%0t) for group %d where out = %0d and expected output = %0d", $time, group_count, $bitstoshortreal(out), sum[group_count]);
                //$display("Test Failed (%0t) for group %d where out = %0d and expected output = %0d", $time, group_count, $bitstoshortreal(result), sum[group_count]);
            end

            group_count <= group_count + 1;
        end
    end

    min_group_size : cover property (@(posedge clk) end_of_group |=> end_of_group );

endmodule