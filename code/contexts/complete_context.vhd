-- ****************************************************************************
-- complete_context.vhd --
--
--     File to declare a complete VHDL context for the `arc_std` library.
--
-- Author(s):
--     Christopher Crary (ccrary@ufl.edu)
--
-- Last Modified By:
--     Christopher Crary
--
-- Last Modified On:
--     November 12, 2021
-- ****************************************************************************
context complete_context is
  library arc_std;
  context arc_std.std_context;

  use arc_std.reg_pkg;
  use arc_std.reg_pkg.all;
  use arc_std.fanout_tree_pkg;
  use arc_std.ram_pkg;
  use arc_std.ram_pkg.all;
  use arc_std.fifo_pkg;
  use arc_std.counter_pkg;
  use arc_std.counter_pkg.all;
  use arc_std.multiplexer_pkg;
  use arc_std.adder_pkg;
  use arc_std.divider_pkg;
  use arc_std.multiplier_pkg;
  use arc_std.square_root_pkg;
  use arc_std.subtractor_pkg;
  use arc_std.parallel_accumulator_pkg;
  use arc_std.parallel_accumulator_pkg.all;
  use arc_std.sequential_accumulator_pkg;
  use arc_std.sequential_accumulator_pkg.all;
  use arc_std.accumulator_pkg;
  use arc_std.accumulator_pkg.all;
  use arc_std.multiply_accumulator_pkg;
  use arc_std.tuple_modifier_pkg;
  use arc_std.tuple_modifier_pkg.all;
  use arc_std.function_input_modifier_pkg;
  use arc_std.function_input_modifier_pkg.all;
  use arc_std.function_output_modifier_pkg;
  use arc_std.function_output_modifier_pkg.all;
  use arc_std.function_complete_modifier_pkg;
  use arc_std.function_complete_modifier_pkg.all;
  
end context;
