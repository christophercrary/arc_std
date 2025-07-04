-- ------------------------------------------------------------------------- 
-- High Level Design Compiler for Intel(R) FPGAs Version 19.2 (Release Build #57)
-- Quartus Prime development tool and MATLAB/Simulink Interface
-- 
-- Legal Notice: Copyright 2019 Intel Corporation.  All rights reserved.
-- Your use of  Intel Corporation's design tools,  logic functions and other
-- software and  tools, and its AMPP partner logic functions, and any output
-- files any  of the foregoing (including  device programming  or simulation
-- files), and  any associated  documentation  or information  are expressly
-- subject  to the terms and  conditions of the  Intel FPGA Software License
-- Agreement, Intel MegaCore Function License Agreement, or other applicable
-- license agreement,  including,  without limitation,  that your use is for
-- the  sole  purpose of  programming  logic devices  manufactured by  Intel
-- and  sold by Intel  or its authorized  distributors. Please refer  to the
-- applicable agreement for further details.
-- ---------------------------------------------------------------------------

-- VHDL created from float32_mult_altera_fp_functions_191_m24j6ty
-- VHDL created on Mon Sep 26 21:06:48 2022


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.all;
use std.TextIO.all;
use work.dspba_library_package.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;
LIBRARY altera_lnsim;
USE altera_lnsim.altera_lnsim_components.altera_syncram;

library fourteennm;
use fourteennm.fourteennm_components.fourteennm_mac;
use fourteennm.fourteennm_components.fourteennm_fp_mac;

entity float32_mult_altera_fp_functions_191_m24j6ty is
    port (
        a : in std_logic_vector(31 downto 0);  -- float32_m23
        b : in std_logic_vector(31 downto 0);  -- float32_m23
        q : out std_logic_vector(31 downto 0);  -- float32_m23
        clk : in std_logic;
        areset : in std_logic
    );
end float32_mult_altera_fp_functions_191_m24j6ty;

architecture normal of float32_mult_altera_fp_functions_191_m24j6ty is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fpMulTest_impl_reset0 : std_logic;
    signal fpMulTest_impl_ena0 : std_logic;
    signal fpMulTest_impl_ay0 : STD_LOGIC_VECTOR (31 downto 0);
    signal fpMulTest_impl_az0 : STD_LOGIC_VECTOR (31 downto 0);
    signal fpMulTest_impl_q0 : STD_LOGIC_VECTOR (31 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- fpMulTest_impl(FPCOLUMN,5)@0
    -- out q0@3
    fpMulTest_impl_ay0 <= b;
    fpMulTest_impl_az0 <= a;
    fpMulTest_impl_reset0 <= areset;
    fpMulTest_impl_ena0 <= '1';
    fpMulTest_impl_DSP0 : fourteennm_fp_mac
    GENERIC MAP (
        operation_mode => "sp_mult",
        ay_clock => "0",
        az_clock => "0",
        mult_2nd_pipeline_clock => "0",
        output_clock => "0",
        clear_type => "sclr"
    )
    PORT MAP (
        clk(0) => clk,
        clk(1) => '0',
        clk(2) => '0',
        ena(0) => fpMulTest_impl_ena0,
        ena(1) => '0',
        ena(2) => '0',
        clr(0) => fpMulTest_impl_reset0,
        clr(1) => fpMulTest_impl_reset0,
        ay => fpMulTest_impl_ay0,
        az => fpMulTest_impl_az0,
        resulta => fpMulTest_impl_q0
    );

    -- xOut(GPOUT,4)@3
    q <= fpMulTest_impl_q0;

END normal;
