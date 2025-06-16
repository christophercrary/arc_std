// Author: Scarlett Pinedo
// FCBT Accumulator TB used to test basic functionality of fcbt_accumulator.sv

`timescale 1 ns/10 ps // 1 ns time unit, 10 ps precision

module fcbt_accumulator_basic_tb;

    localparam WIDTH = 32;
    localparam FCBT_max_inputs = 30; 
    logic clk = 1'b0, rst, hold_output, ready, end_of_group, valid_in, valid_out;
    logic [WIDTH-1:0] in, out;

    // Define a period of time between tests. Uses specified timescale (ns).
    localparam period = 20;

    // Instantiate the module we want to test. The typical SV naming convention
    // is DUT for design under test.
    fcbt_sv #(WIDTH, FCBT_max_inputs) DUT (.*);

    always begin : generate_clock
      #5 clk = ~clk;
    end

    initial 
        begin
            $timeformat(-9, 0, " ns");

            rst <= 1'b1;
            in <= '0;      
            hold_output <= 1'b0;
            end_of_group <= 1'b0;
            valid_in <= 1'b0;

            // Wait 5 cycles
            for (int i=0; i < 5; i++)
                @(posedge clk);

            // Clear reset on a falling edge (as suggested in previous example)
            @(negedge clk);
            rst <= 1'b0;
            @(posedge clk);

            for (integer i=0; i < 30; i = i+1) begin
                for (integer j=1; j <= 25; j = j+1) begin
                    if (ready == 1'b1) begin
                        in <= $shortrealtobits(shortreal'(j*(i + 1)));
                        valid_in <= 1'b1;
                        if (i == 0 & j == 6) begin
                            in <= $shortrealtobits(shortreal'(9));
                            end_of_group <= 1'b1;
                            @(posedge clk);
                            break;
                        end
                        else if (i == 1 & j == 1) begin
                            in <= $shortrealtobits(shortreal'(6));
                            end_of_group <= 1'b1;
                            @(posedge clk);
                            break;
                        end
                        else if (i == 2 & j == 1) begin
                            in <= $shortrealtobits(shortreal'(7));
                            end_of_group <= 1'b0;
                            //@(posedge clk);
                            //break;
                        end
                        else if (i == 2 & j == 2) begin
                            in <= $shortrealtobits(shortreal'(0));
                            end_of_group <= 1'b1;
                            @(posedge clk);
                            break;
                        end
                        else if (j == 25)
                            end_of_group <= 1'b1;
                        else end_of_group <= 1'b0;
                        @(posedge clk);
                    end
                end
                valid_in <= 1'b0;
                end_of_group <= 1'b0;
            end

            valid_in <= 1'b0;
            end_of_group <= 1'b0;

            #450ns;

            $display("Tests completed.");
            $stop;
        end
endmodule