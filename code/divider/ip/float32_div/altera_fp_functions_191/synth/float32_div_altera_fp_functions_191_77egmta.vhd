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

-- VHDL created from float32_div_altera_fp_functions_191_77egmta
-- VHDL created on Mon Sep 26 21:10:01 2022


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

entity float32_div_altera_fp_functions_191_77egmta is
    port (
        a : in std_logic_vector(31 downto 0);  -- float32_m23
        b : in std_logic_vector(31 downto 0);  -- float32_m23
        q : out std_logic_vector(31 downto 0);  -- float32_m23
        clk : in std_logic;
        areset : in std_logic
    );
end float32_div_altera_fp_functions_191_77egmta;

architecture normal of float32_div_altera_fp_functions_191_77egmta is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cstBiasM1_uid6_fpDivTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cstBias_uid7_fpDivTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal expX_uid9_fpDivTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal fracX_uid10_fpDivTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal signX_uid11_fpDivTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal expY_uid12_fpDivTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal fracY_uid13_fpDivTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal signY_uid14_fpDivTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal paddingY_uid15_fpDivTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal updatedY_uid16_fpDivTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal fracYZero_uid15_fpDivTest_a : STD_LOGIC_VECTOR (23 downto 0);
    signal fracYZero_uid15_fpDivTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracYZero_uid15_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cstAllOWE_uid18_fpDivTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cstAllZWE_uid20_fpDivTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal excZ_x_uid23_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid24_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid25_fpDivTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid25_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid26_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_x_uid27_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid28_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid29_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid30_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_x_uid31_fpDivTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_x_uid31_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_y_uid37_fpDivTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_y_uid37_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid38_fpDivTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid38_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid39_fpDivTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid39_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid40_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_y_uid41_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_y_uid42_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid43_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid44_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_y_uid45_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signR_uid46_fpDivTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal signR_uid46_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXmY_uid47_fpDivTest_a : STD_LOGIC_VECTOR (8 downto 0);
    signal expXmY_uid47_fpDivTest_b : STD_LOGIC_VECTOR (8 downto 0);
    signal expXmY_uid47_fpDivTest_o : STD_LOGIC_VECTOR (8 downto 0);
    signal expXmY_uid47_fpDivTest_q : STD_LOGIC_VECTOR (8 downto 0);
    signal expR_uid48_fpDivTest_a : STD_LOGIC_VECTOR (10 downto 0);
    signal expR_uid48_fpDivTest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal expR_uid48_fpDivTest_o : STD_LOGIC_VECTOR (10 downto 0);
    signal expR_uid48_fpDivTest_q : STD_LOGIC_VECTOR (9 downto 0);
    signal yAddr_uid51_fpDivTest_b : STD_LOGIC_VECTOR (8 downto 0);
    signal yPE_uid52_fpDivTest_b : STD_LOGIC_VECTOR (13 downto 0);
    signal invY_uid54_fpDivTest_in : STD_LOGIC_VECTOR (31 downto 0);
    signal invY_uid54_fpDivTest_b : STD_LOGIC_VECTOR (26 downto 0);
    signal invYO_uid55_fpDivTest_in : STD_LOGIC_VECTOR (32 downto 0);
    signal invYO_uid55_fpDivTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal lOAdded_uid57_fpDivTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal z4_uid60_fpDivTest_q : STD_LOGIC_VECTOR (3 downto 0);
    signal oFracXZ4_uid61_fpDivTest_q : STD_LOGIC_VECTOR (27 downto 0);
    signal divValPreNormYPow2Exc_uid63_fpDivTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal divValPreNormYPow2Exc_uid63_fpDivTest_q : STD_LOGIC_VECTOR (27 downto 0);
    signal norm_uid64_fpDivTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal divValPreNormHigh_uid65_fpDivTest_in : STD_LOGIC_VECTOR (26 downto 0);
    signal divValPreNormHigh_uid65_fpDivTest_b : STD_LOGIC_VECTOR (24 downto 0);
    signal divValPreNormLow_uid66_fpDivTest_in : STD_LOGIC_VECTOR (25 downto 0);
    signal divValPreNormLow_uid66_fpDivTest_b : STD_LOGIC_VECTOR (24 downto 0);
    signal normFracRnd_uid67_fpDivTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal normFracRnd_uid67_fpDivTest_q : STD_LOGIC_VECTOR (24 downto 0);
    signal expFracRnd_uid68_fpDivTest_q : STD_LOGIC_VECTOR (34 downto 0);
    signal zeroPaddingInAddition_uid74_fpDivTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal expFracPostRnd_uid75_fpDivTest_q : STD_LOGIC_VECTOR (25 downto 0);
    signal expFracPostRnd_uid76_fpDivTest_a : STD_LOGIC_VECTOR (36 downto 0);
    signal expFracPostRnd_uid76_fpDivTest_b : STD_LOGIC_VECTOR (36 downto 0);
    signal expFracPostRnd_uid76_fpDivTest_o : STD_LOGIC_VECTOR (36 downto 0);
    signal expFracPostRnd_uid76_fpDivTest_q : STD_LOGIC_VECTOR (35 downto 0);
    signal fracXExt_uid77_fpDivTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal fracPostRndF_uid79_fpDivTest_in : STD_LOGIC_VECTOR (24 downto 0);
    signal fracPostRndF_uid79_fpDivTest_b : STD_LOGIC_VECTOR (23 downto 0);
    signal fracPostRndF_uid80_fpDivTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fracPostRndF_uid80_fpDivTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal expPostRndFR_uid81_fpDivTest_in : STD_LOGIC_VECTOR (32 downto 0);
    signal expPostRndFR_uid81_fpDivTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expPostRndF_uid82_fpDivTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal expPostRndF_uid82_fpDivTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal lOAdded_uid84_fpDivTest_q : STD_LOGIC_VECTOR (24 downto 0);
    signal lOAdded_uid87_fpDivTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal qDivProdNorm_uid90_fpDivTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal qDivProdFracHigh_uid91_fpDivTest_in : STD_LOGIC_VECTOR (47 downto 0);
    signal qDivProdFracHigh_uid91_fpDivTest_b : STD_LOGIC_VECTOR (23 downto 0);
    signal qDivProdFracLow_uid92_fpDivTest_in : STD_LOGIC_VECTOR (46 downto 0);
    signal qDivProdFracLow_uid92_fpDivTest_b : STD_LOGIC_VECTOR (23 downto 0);
    signal qDivProdFrac_uid93_fpDivTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal qDivProdFrac_uid93_fpDivTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal qDivProdExp_opA_uid94_fpDivTest_a : STD_LOGIC_VECTOR (8 downto 0);
    signal qDivProdExp_opA_uid94_fpDivTest_b : STD_LOGIC_VECTOR (8 downto 0);
    signal qDivProdExp_opA_uid94_fpDivTest_o : STD_LOGIC_VECTOR (8 downto 0);
    signal qDivProdExp_opA_uid94_fpDivTest_q : STD_LOGIC_VECTOR (8 downto 0);
    signal qDivProdExp_opBs_uid95_fpDivTest_a : STD_LOGIC_VECTOR (8 downto 0);
    signal qDivProdExp_opBs_uid95_fpDivTest_b : STD_LOGIC_VECTOR (8 downto 0);
    signal qDivProdExp_opBs_uid95_fpDivTest_o : STD_LOGIC_VECTOR (8 downto 0);
    signal qDivProdExp_opBs_uid95_fpDivTest_q : STD_LOGIC_VECTOR (8 downto 0);
    signal qDivProdExp_uid96_fpDivTest_a : STD_LOGIC_VECTOR (11 downto 0);
    signal qDivProdExp_uid96_fpDivTest_b : STD_LOGIC_VECTOR (11 downto 0);
    signal qDivProdExp_uid96_fpDivTest_o : STD_LOGIC_VECTOR (11 downto 0);
    signal qDivProdExp_uid96_fpDivTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal qDivProdFracWF_uid97_fpDivTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal qDivProdLTX_opA_uid98_fpDivTest_in : STD_LOGIC_VECTOR (7 downto 0);
    signal qDivProdLTX_opA_uid98_fpDivTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal qDivProdLTX_opA_uid99_fpDivTest_q : STD_LOGIC_VECTOR (30 downto 0);
    signal qDivProdLTX_opB_uid100_fpDivTest_q : STD_LOGIC_VECTOR (30 downto 0);
    signal qDividerProdLTX_uid101_fpDivTest_a : STD_LOGIC_VECTOR (32 downto 0);
    signal qDividerProdLTX_uid101_fpDivTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal qDividerProdLTX_uid101_fpDivTest_o : STD_LOGIC_VECTOR (32 downto 0);
    signal qDividerProdLTX_uid101_fpDivTest_c : STD_LOGIC_VECTOR (0 downto 0);
    signal betweenFPwF_uid102_fpDivTest_in : STD_LOGIC_VECTOR (0 downto 0);
    signal betweenFPwF_uid102_fpDivTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal extraUlp_uid103_fpDivTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal extraUlp_uid103_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracPostRndFT_uid104_fpDivTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal fracRPreExcExt_uid105_fpDivTest_a : STD_LOGIC_VECTOR (23 downto 0);
    signal fracRPreExcExt_uid105_fpDivTest_b : STD_LOGIC_VECTOR (23 downto 0);
    signal fracRPreExcExt_uid105_fpDivTest_o : STD_LOGIC_VECTOR (23 downto 0);
    signal fracRPreExcExt_uid105_fpDivTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal fracPostRndFPostUlp_uid106_fpDivTest_in : STD_LOGIC_VECTOR (22 downto 0);
    signal fracPostRndFPostUlp_uid106_fpDivTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal fracRPreExc_uid107_fpDivTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPreExc_uid107_fpDivTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal ovfIncRnd_uid109_fpDivTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal expRExt_uid114_fpDivTest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal expUdf_uid115_fpDivTest_a : STD_LOGIC_VECTOR (12 downto 0);
    signal expUdf_uid115_fpDivTest_b : STD_LOGIC_VECTOR (12 downto 0);
    signal expUdf_uid115_fpDivTest_o : STD_LOGIC_VECTOR (12 downto 0);
    signal expUdf_uid115_fpDivTest_n : STD_LOGIC_VECTOR (0 downto 0);
    signal expOvf_uid118_fpDivTest_a : STD_LOGIC_VECTOR (12 downto 0);
    signal expOvf_uid118_fpDivTest_b : STD_LOGIC_VECTOR (12 downto 0);
    signal expOvf_uid118_fpDivTest_o : STD_LOGIC_VECTOR (12 downto 0);
    signal expOvf_uid118_fpDivTest_n : STD_LOGIC_VECTOR (0 downto 0);
    signal zeroOverReg_uid119_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal regOverRegWithUf_uid120_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xRegOrZero_uid121_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal regOrZeroOverInf_uid122_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZero_uid123_fpDivTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZero_uid123_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXRYZ_uid124_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXRYROvf_uid125_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXIYZ_uid126_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXIYR_uid127_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRInf_uid128_fpDivTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excRInf_uid128_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXZYZ_uid129_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXIYI_uid130_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid131_fpDivTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid131_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal concExc_uid132_fpDivTest_q : STD_LOGIC_VECTOR (2 downto 0);
    signal excREnc_uid133_fpDivTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal oneFracRPostExc2_uid134_fpDivTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal fracRPostExc_uid137_fpDivTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid137_fpDivTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal expRPostExc_uid141_fpDivTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal expRPostExc_uid141_fpDivTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal invExcRNaN_uid142_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sRPostExc_uid143_fpDivTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal sRPostExc_uid143_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal divR_uid144_fpDivTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal yT1_uid158_invPolyEval_b : STD_LOGIC_VECTOR (12 downto 0);
    signal lowRangeB_uid160_invPolyEval_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeB_uid160_invPolyEval_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highBBits_uid161_invPolyEval_b : STD_LOGIC_VECTOR (12 downto 0);
    signal s1sumAHighB_uid162_invPolyEval_a : STD_LOGIC_VECTOR (22 downto 0);
    signal s1sumAHighB_uid162_invPolyEval_b : STD_LOGIC_VECTOR (22 downto 0);
    signal s1sumAHighB_uid162_invPolyEval_o : STD_LOGIC_VECTOR (22 downto 0);
    signal s1sumAHighB_uid162_invPolyEval_q : STD_LOGIC_VECTOR (22 downto 0);
    signal s1_uid163_invPolyEval_q : STD_LOGIC_VECTOR (23 downto 0);
    signal lowRangeB_uid166_invPolyEval_in : STD_LOGIC_VECTOR (1 downto 0);
    signal lowRangeB_uid166_invPolyEval_b : STD_LOGIC_VECTOR (1 downto 0);
    signal highBBits_uid167_invPolyEval_b : STD_LOGIC_VECTOR (22 downto 0);
    signal s2sumAHighB_uid168_invPolyEval_a : STD_LOGIC_VECTOR (32 downto 0);
    signal s2sumAHighB_uid168_invPolyEval_b : STD_LOGIC_VECTOR (32 downto 0);
    signal s2sumAHighB_uid168_invPolyEval_o : STD_LOGIC_VECTOR (32 downto 0);
    signal s2sumAHighB_uid168_invPolyEval_q : STD_LOGIC_VECTOR (32 downto 0);
    signal s2_uid169_invPolyEval_q : STD_LOGIC_VECTOR (34 downto 0);
    signal osig_uid172_divValPreNorm_uid59_fpDivTest_b : STD_LOGIC_VECTOR (27 downto 0);
    signal osig_uid175_pT1_uid159_invPolyEval_b : STD_LOGIC_VECTOR (13 downto 0);
    signal osig_uid178_pT2_uid165_invPolyEval_b : STD_LOGIC_VECTOR (24 downto 0);
    signal expFracPostRndInc_uid110_fpDivTest_expRPreExc_uid112_fpDivTest_merged_a : STD_LOGIC_VECTOR (8 downto 0);
    signal expFracPostRndInc_uid110_fpDivTest_expRPreExc_uid112_fpDivTest_merged_b : STD_LOGIC_VECTOR (8 downto 0);
    signal expFracPostRndInc_uid110_fpDivTest_expRPreExc_uid112_fpDivTest_merged_i : STD_LOGIC_VECTOR (8 downto 0);
    signal expFracPostRndInc_uid110_fpDivTest_expRPreExc_uid112_fpDivTest_merged_a1 : STD_LOGIC_VECTOR (8 downto 0);
    signal expFracPostRndInc_uid110_fpDivTest_expRPreExc_uid112_fpDivTest_merged_b1 : STD_LOGIC_VECTOR (8 downto 0);
    signal expFracPostRndInc_uid110_fpDivTest_expRPreExc_uid112_fpDivTest_merged_o : STD_LOGIC_VECTOR (8 downto 0);
    signal expFracPostRndInc_uid110_fpDivTest_expRPreExc_uid112_fpDivTest_merged_q : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC0_uid146_invTables_lutmem_reset0 : std_logic;
    signal memoryC0_uid146_invTables_lutmem_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal memoryC0_uid146_invTables_lutmem_aa : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC0_uid146_invTables_lutmem_ab : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC0_uid146_invTables_lutmem_ir : STD_LOGIC_VECTOR (31 downto 0);
    signal memoryC0_uid146_invTables_lutmem_r : STD_LOGIC_VECTOR (31 downto 0);
    signal memoryC1_uid149_invTables_lutmem_reset0 : std_logic;
    signal memoryC1_uid149_invTables_lutmem_ia : STD_LOGIC_VECTOR (21 downto 0);
    signal memoryC1_uid149_invTables_lutmem_aa : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC1_uid149_invTables_lutmem_ab : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC1_uid149_invTables_lutmem_ir : STD_LOGIC_VECTOR (21 downto 0);
    signal memoryC1_uid149_invTables_lutmem_r : STD_LOGIC_VECTOR (21 downto 0);
    signal memoryC2_uid152_invTables_lutmem_reset0 : std_logic;
    signal memoryC2_uid152_invTables_lutmem_ia : STD_LOGIC_VECTOR (12 downto 0);
    signal memoryC2_uid152_invTables_lutmem_aa : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC2_uid152_invTables_lutmem_ab : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC2_uid152_invTables_lutmem_ir : STD_LOGIC_VECTOR (12 downto 0);
    signal memoryC2_uid152_invTables_lutmem_r : STD_LOGIC_VECTOR (12 downto 0);
    signal qDivProd_uid89_fpDivTest_cma_reset : std_logic;
    type qDivProd_uid89_fpDivTest_cma_ahtype is array(NATURAL range <>) of UNSIGNED(24 downto 0);
    signal qDivProd_uid89_fpDivTest_cma_ah : qDivProd_uid89_fpDivTest_cma_ahtype(0 to 0);
    attribute preserve_syn_only : boolean;
    attribute preserve_syn_only of qDivProd_uid89_fpDivTest_cma_ah : signal is true;
    type qDivProd_uid89_fpDivTest_cma_chtype is array(NATURAL range <>) of UNSIGNED(23 downto 0);
    signal qDivProd_uid89_fpDivTest_cma_ch : qDivProd_uid89_fpDivTest_cma_chtype(0 to 0);
    attribute preserve_syn_only of qDivProd_uid89_fpDivTest_cma_ch : signal is true;
    signal qDivProd_uid89_fpDivTest_cma_a0 : STD_LOGIC_VECTOR (24 downto 0);
    signal qDivProd_uid89_fpDivTest_cma_c0 : STD_LOGIC_VECTOR (23 downto 0);
    signal qDivProd_uid89_fpDivTest_cma_s0 : STD_LOGIC_VECTOR (48 downto 0);
    signal qDivProd_uid89_fpDivTest_cma_qq : STD_LOGIC_VECTOR (48 downto 0);
    signal qDivProd_uid89_fpDivTest_cma_q : STD_LOGIC_VECTOR (48 downto 0);
    signal qDivProd_uid89_fpDivTest_cma_ena0 : std_logic;
    signal qDivProd_uid89_fpDivTest_cma_ena1 : std_logic;
    signal qDivProd_uid89_fpDivTest_cma_ena2 : std_logic;
    signal prodXY_uid171_divValPreNorm_uid59_fpDivTest_cma_reset : std_logic;
    type prodXY_uid171_divValPreNorm_uid59_fpDivTest_cma_ahtype is array(NATURAL range <>) of UNSIGNED(26 downto 0);
    signal prodXY_uid171_divValPreNorm_uid59_fpDivTest_cma_ah : prodXY_uid171_divValPreNorm_uid59_fpDivTest_cma_ahtype(0 to 0);
    attribute preserve_syn_only of prodXY_uid171_divValPreNorm_uid59_fpDivTest_cma_ah : signal is true;
    signal prodXY_uid171_divValPreNorm_uid59_fpDivTest_cma_ch : qDivProd_uid89_fpDivTest_cma_chtype(0 to 0);
    attribute preserve_syn_only of prodXY_uid171_divValPreNorm_uid59_fpDivTest_cma_ch : signal is true;
    signal prodXY_uid171_divValPreNorm_uid59_fpDivTest_cma_a0 : STD_LOGIC_VECTOR (26 downto 0);
    signal prodXY_uid171_divValPreNorm_uid59_fpDivTest_cma_c0 : STD_LOGIC_VECTOR (23 downto 0);
    signal prodXY_uid171_divValPreNorm_uid59_fpDivTest_cma_s0 : STD_LOGIC_VECTOR (50 downto 0);
    signal prodXY_uid171_divValPreNorm_uid59_fpDivTest_cma_qq : STD_LOGIC_VECTOR (50 downto 0);
    signal prodXY_uid171_divValPreNorm_uid59_fpDivTest_cma_q : STD_LOGIC_VECTOR (50 downto 0);
    signal prodXY_uid171_divValPreNorm_uid59_fpDivTest_cma_ena0 : std_logic;
    signal prodXY_uid171_divValPreNorm_uid59_fpDivTest_cma_ena1 : std_logic;
    signal prodXY_uid171_divValPreNorm_uid59_fpDivTest_cma_ena2 : std_logic;
    signal prodXY_uid174_pT1_uid159_invPolyEval_cma_reset : std_logic;
    type prodXY_uid174_pT1_uid159_invPolyEval_cma_ahtype is array(NATURAL range <>) of UNSIGNED(12 downto 0);
    signal prodXY_uid174_pT1_uid159_invPolyEval_cma_ah : prodXY_uid174_pT1_uid159_invPolyEval_cma_ahtype(0 to 0);
    attribute preserve_syn_only of prodXY_uid174_pT1_uid159_invPolyEval_cma_ah : signal is true;
    type prodXY_uid174_pT1_uid159_invPolyEval_cma_chtype is array(NATURAL range <>) of SIGNED(12 downto 0);
    signal prodXY_uid174_pT1_uid159_invPolyEval_cma_ch : prodXY_uid174_pT1_uid159_invPolyEval_cma_chtype(0 to 0);
    attribute preserve_syn_only of prodXY_uid174_pT1_uid159_invPolyEval_cma_ch : signal is true;
    signal prodXY_uid174_pT1_uid159_invPolyEval_cma_a0 : STD_LOGIC_VECTOR (12 downto 0);
    signal prodXY_uid174_pT1_uid159_invPolyEval_cma_c0 : STD_LOGIC_VECTOR (12 downto 0);
    signal prodXY_uid174_pT1_uid159_invPolyEval_cma_s0 : STD_LOGIC_VECTOR (25 downto 0);
    signal prodXY_uid174_pT1_uid159_invPolyEval_cma_qq : STD_LOGIC_VECTOR (25 downto 0);
    signal prodXY_uid174_pT1_uid159_invPolyEval_cma_q : STD_LOGIC_VECTOR (25 downto 0);
    signal prodXY_uid174_pT1_uid159_invPolyEval_cma_ena0 : std_logic;
    signal prodXY_uid174_pT1_uid159_invPolyEval_cma_ena1 : std_logic;
    signal prodXY_uid174_pT1_uid159_invPolyEval_cma_ena2 : std_logic;
    signal prodXY_uid177_pT2_uid165_invPolyEval_cma_reset : std_logic;
    type prodXY_uid177_pT2_uid165_invPolyEval_cma_ahtype is array(NATURAL range <>) of UNSIGNED(13 downto 0);
    signal prodXY_uid177_pT2_uid165_invPolyEval_cma_ah : prodXY_uid177_pT2_uid165_invPolyEval_cma_ahtype(0 to 0);
    attribute preserve_syn_only of prodXY_uid177_pT2_uid165_invPolyEval_cma_ah : signal is true;
    type prodXY_uid177_pT2_uid165_invPolyEval_cma_chtype is array(NATURAL range <>) of SIGNED(23 downto 0);
    signal prodXY_uid177_pT2_uid165_invPolyEval_cma_ch : prodXY_uid177_pT2_uid165_invPolyEval_cma_chtype(0 to 0);
    attribute preserve_syn_only of prodXY_uid177_pT2_uid165_invPolyEval_cma_ch : signal is true;
    signal prodXY_uid177_pT2_uid165_invPolyEval_cma_a0 : STD_LOGIC_VECTOR (13 downto 0);
    signal prodXY_uid177_pT2_uid165_invPolyEval_cma_c0 : STD_LOGIC_VECTOR (23 downto 0);
    signal prodXY_uid177_pT2_uid165_invPolyEval_cma_s0 : STD_LOGIC_VECTOR (37 downto 0);
    signal prodXY_uid177_pT2_uid165_invPolyEval_cma_qq : STD_LOGIC_VECTOR (37 downto 0);
    signal prodXY_uid177_pT2_uid165_invPolyEval_cma_q : STD_LOGIC_VECTOR (37 downto 0);
    signal prodXY_uid177_pT2_uid165_invPolyEval_cma_ena0 : std_logic;
    signal prodXY_uid177_pT2_uid165_invPolyEval_cma_ena1 : std_logic;
    signal prodXY_uid177_pT2_uid165_invPolyEval_cma_ena2 : std_logic;
    signal redist0_memoryC2_uid152_invTables_lutmem_r_1_q : STD_LOGIC_VECTOR (12 downto 0);
    signal redist1_lowRangeB_uid160_invPolyEval_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_sRPostExc_uid143_fpDivTest_q_8_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_excREnc_uid133_fpDivTest_q_8_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist4_ovfIncRnd_uid109_fpDivTest_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_extraUlp_uid103_fpDivTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_betweenFPwF_uid102_fpDivTest_b_8_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_qDivProdLTX_opA_uid98_fpDivTest_b_1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist9_qDivProdFracWF_uid97_fpDivTest_b_2_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist9_qDivProdFracWF_uid97_fpDivTest_b_2_delay_0 : STD_LOGIC_VECTOR (22 downto 0);
    signal redist10_qDivProdExp_opA_uid94_fpDivTest_q_7_q : STD_LOGIC_VECTOR (8 downto 0);
    signal redist10_qDivProdExp_opA_uid94_fpDivTest_q_7_delay_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal redist10_qDivProdExp_opA_uid94_fpDivTest_q_7_delay_1 : STD_LOGIC_VECTOR (8 downto 0);
    signal redist10_qDivProdExp_opA_uid94_fpDivTest_q_7_delay_2 : STD_LOGIC_VECTOR (8 downto 0);
    signal redist10_qDivProdExp_opA_uid94_fpDivTest_q_7_delay_3 : STD_LOGIC_VECTOR (8 downto 0);
    signal redist12_norm_uid64_fpDivTest_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_invYO_uid55_fpDivTest_b_9_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_invY_uid54_fpDivTest_b_1_q : STD_LOGIC_VECTOR (26 downto 0);
    signal redist16_yPE_uid52_fpDivTest_b_3_q : STD_LOGIC_VECTOR (13 downto 0);
    signal redist16_yPE_uid52_fpDivTest_b_3_delay_0 : STD_LOGIC_VECTOR (13 downto 0);
    signal redist16_yPE_uid52_fpDivTest_b_3_delay_1 : STD_LOGIC_VECTOR (13 downto 0);
    signal redist19_yAddr_uid51_fpDivTest_b_14_q : STD_LOGIC_VECTOR (8 downto 0);
    signal redist19_yAddr_uid51_fpDivTest_b_14_delay_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal redist19_yAddr_uid51_fpDivTest_b_14_delay_1 : STD_LOGIC_VECTOR (8 downto 0);
    signal redist19_yAddr_uid51_fpDivTest_b_14_delay_2 : STD_LOGIC_VECTOR (8 downto 0);
    signal redist19_yAddr_uid51_fpDivTest_b_14_delay_3 : STD_LOGIC_VECTOR (8 downto 0);
    signal redist20_signR_uid46_fpDivTest_q_27_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist21_expXIsMax_uid24_fpDivTest_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist22_excZ_x_uid23_fpDivTest_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist24_fracY_uid13_fpDivTest_b_25_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist24_fracY_uid13_fpDivTest_b_25_delay_0 : STD_LOGIC_VECTOR (22 downto 0);
    signal redist24_fracY_uid13_fpDivTest_b_25_delay_1 : STD_LOGIC_VECTOR (22 downto 0);
    signal redist26_expY_uid12_fpDivTest_b_25_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist26_expY_uid12_fpDivTest_b_25_delay_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal redist31_expX_uid9_fpDivTest_b_25_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist31_expX_uid9_fpDivTest_b_25_delay_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal redist5_fracPostRndFT_uid104_fpDivTest_b_9_inputreg0_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist5_fracPostRndFT_uid104_fpDivTest_b_9_outputreg0_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist5_fracPostRndFT_uid104_fpDivTest_b_9_mem_reset0 : std_logic;
    signal redist5_fracPostRndFT_uid104_fpDivTest_b_9_mem_ia : STD_LOGIC_VECTOR (22 downto 0);
    signal redist5_fracPostRndFT_uid104_fpDivTest_b_9_mem_aa : STD_LOGIC_VECTOR (2 downto 0);
    signal redist5_fracPostRndFT_uid104_fpDivTest_b_9_mem_ab : STD_LOGIC_VECTOR (2 downto 0);
    signal redist5_fracPostRndFT_uid104_fpDivTest_b_9_mem_iq : STD_LOGIC_VECTOR (22 downto 0);
    signal redist5_fracPostRndFT_uid104_fpDivTest_b_9_mem_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist5_fracPostRndFT_uid104_fpDivTest_b_9_rdcnt_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist5_fracPostRndFT_uid104_fpDivTest_b_9_rdcnt_i : UNSIGNED (2 downto 0);
    attribute preserve_syn_only of redist5_fracPostRndFT_uid104_fpDivTest_b_9_rdcnt_i : signal is true;
    signal redist5_fracPostRndFT_uid104_fpDivTest_b_9_rdcnt_eq : std_logic;
    attribute preserve_syn_only of redist5_fracPostRndFT_uid104_fpDivTest_b_9_rdcnt_eq : signal is true;
    signal redist5_fracPostRndFT_uid104_fpDivTest_b_9_wraddr_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist5_fracPostRndFT_uid104_fpDivTest_b_9_mem_last_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist5_fracPostRndFT_uid104_fpDivTest_b_9_cmp_b : STD_LOGIC_VECTOR (3 downto 0);
    signal redist5_fracPostRndFT_uid104_fpDivTest_b_9_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_fracPostRndFT_uid104_fpDivTest_b_9_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_fracPostRndFT_uid104_fpDivTest_b_9_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_fracPostRndFT_uid104_fpDivTest_b_9_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_fracPostRndFT_uid104_fpDivTest_b_9_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist5_fracPostRndFT_uid104_fpDivTest_b_9_sticky_ena_q : signal is true;
    signal redist5_fracPostRndFT_uid104_fpDivTest_b_9_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_qDivProdExp_opA_uid94_fpDivTest_q_7_outputreg0_q : STD_LOGIC_VECTOR (8 downto 0);
    signal redist11_expPostRndFR_uid81_fpDivTest_b_10_outputreg0_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist11_expPostRndFR_uid81_fpDivTest_b_10_mem_reset0 : std_logic;
    signal redist11_expPostRndFR_uid81_fpDivTest_b_10_mem_ia : STD_LOGIC_VECTOR (7 downto 0);
    signal redist11_expPostRndFR_uid81_fpDivTest_b_10_mem_aa : STD_LOGIC_VECTOR (2 downto 0);
    signal redist11_expPostRndFR_uid81_fpDivTest_b_10_mem_ab : STD_LOGIC_VECTOR (2 downto 0);
    signal redist11_expPostRndFR_uid81_fpDivTest_b_10_mem_iq : STD_LOGIC_VECTOR (7 downto 0);
    signal redist11_expPostRndFR_uid81_fpDivTest_b_10_mem_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist11_expPostRndFR_uid81_fpDivTest_b_10_rdcnt_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist11_expPostRndFR_uid81_fpDivTest_b_10_rdcnt_i : UNSIGNED (2 downto 0);
    attribute preserve_syn_only of redist11_expPostRndFR_uid81_fpDivTest_b_10_rdcnt_i : signal is true;
    signal redist11_expPostRndFR_uid81_fpDivTest_b_10_wraddr_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist11_expPostRndFR_uid81_fpDivTest_b_10_mem_last_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist11_expPostRndFR_uid81_fpDivTest_b_10_cmp_b : STD_LOGIC_VECTOR (3 downto 0);
    signal redist11_expPostRndFR_uid81_fpDivTest_b_10_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_expPostRndFR_uid81_fpDivTest_b_10_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_expPostRndFR_uid81_fpDivTest_b_10_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_expPostRndFR_uid81_fpDivTest_b_10_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_expPostRndFR_uid81_fpDivTest_b_10_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist11_expPostRndFR_uid81_fpDivTest_b_10_sticky_ena_q : signal is true;
    signal redist11_expPostRndFR_uid81_fpDivTest_b_10_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_lOAdded_uid57_fpDivTest_q_6_inputreg0_q : STD_LOGIC_VECTOR (23 downto 0);
    signal redist13_lOAdded_uid57_fpDivTest_q_6_mem_reset0 : std_logic;
    signal redist13_lOAdded_uid57_fpDivTest_q_6_mem_ia : STD_LOGIC_VECTOR (23 downto 0);
    signal redist13_lOAdded_uid57_fpDivTest_q_6_mem_aa : STD_LOGIC_VECTOR (1 downto 0);
    signal redist13_lOAdded_uid57_fpDivTest_q_6_mem_ab : STD_LOGIC_VECTOR (1 downto 0);
    signal redist13_lOAdded_uid57_fpDivTest_q_6_mem_iq : STD_LOGIC_VECTOR (23 downto 0);
    signal redist13_lOAdded_uid57_fpDivTest_q_6_mem_q : STD_LOGIC_VECTOR (23 downto 0);
    signal redist13_lOAdded_uid57_fpDivTest_q_6_rdcnt_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist13_lOAdded_uid57_fpDivTest_q_6_rdcnt_i : UNSIGNED (1 downto 0);
    attribute preserve_syn_only of redist13_lOAdded_uid57_fpDivTest_q_6_rdcnt_i : signal is true;
    signal redist13_lOAdded_uid57_fpDivTest_q_6_wraddr_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist13_lOAdded_uid57_fpDivTest_q_6_mem_last_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist13_lOAdded_uid57_fpDivTest_q_6_cmp_b : STD_LOGIC_VECTOR (2 downto 0);
    signal redist13_lOAdded_uid57_fpDivTest_q_6_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_lOAdded_uid57_fpDivTest_q_6_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_lOAdded_uid57_fpDivTest_q_6_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_lOAdded_uid57_fpDivTest_q_6_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_lOAdded_uid57_fpDivTest_q_6_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist13_lOAdded_uid57_fpDivTest_q_6_sticky_ena_q : signal is true;
    signal redist13_lOAdded_uid57_fpDivTest_q_6_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_yPE_uid52_fpDivTest_b_10_outputreg0_q : STD_LOGIC_VECTOR (13 downto 0);
    signal redist17_yPE_uid52_fpDivTest_b_10_mem_reset0 : std_logic;
    signal redist17_yPE_uid52_fpDivTest_b_10_mem_ia : STD_LOGIC_VECTOR (13 downto 0);
    signal redist17_yPE_uid52_fpDivTest_b_10_mem_aa : STD_LOGIC_VECTOR (2 downto 0);
    signal redist17_yPE_uid52_fpDivTest_b_10_mem_ab : STD_LOGIC_VECTOR (2 downto 0);
    signal redist17_yPE_uid52_fpDivTest_b_10_mem_iq : STD_LOGIC_VECTOR (13 downto 0);
    signal redist17_yPE_uid52_fpDivTest_b_10_mem_q : STD_LOGIC_VECTOR (13 downto 0);
    signal redist17_yPE_uid52_fpDivTest_b_10_rdcnt_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist17_yPE_uid52_fpDivTest_b_10_rdcnt_i : UNSIGNED (2 downto 0);
    attribute preserve_syn_only of redist17_yPE_uid52_fpDivTest_b_10_rdcnt_i : signal is true;
    signal redist17_yPE_uid52_fpDivTest_b_10_rdcnt_eq : std_logic;
    attribute preserve_syn_only of redist17_yPE_uid52_fpDivTest_b_10_rdcnt_eq : signal is true;
    signal redist17_yPE_uid52_fpDivTest_b_10_wraddr_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist17_yPE_uid52_fpDivTest_b_10_mem_last_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist17_yPE_uid52_fpDivTest_b_10_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_yPE_uid52_fpDivTest_b_10_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_yPE_uid52_fpDivTest_b_10_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_yPE_uid52_fpDivTest_b_10_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_yPE_uid52_fpDivTest_b_10_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist17_yPE_uid52_fpDivTest_b_10_sticky_ena_q : signal is true;
    signal redist17_yPE_uid52_fpDivTest_b_10_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist18_yAddr_uid51_fpDivTest_b_7_outputreg0_q : STD_LOGIC_VECTOR (8 downto 0);
    signal redist18_yAddr_uid51_fpDivTest_b_7_mem_reset0 : std_logic;
    signal redist18_yAddr_uid51_fpDivTest_b_7_mem_ia : STD_LOGIC_VECTOR (8 downto 0);
    signal redist18_yAddr_uid51_fpDivTest_b_7_mem_aa : STD_LOGIC_VECTOR (2 downto 0);
    signal redist18_yAddr_uid51_fpDivTest_b_7_mem_ab : STD_LOGIC_VECTOR (2 downto 0);
    signal redist18_yAddr_uid51_fpDivTest_b_7_mem_iq : STD_LOGIC_VECTOR (8 downto 0);
    signal redist18_yAddr_uid51_fpDivTest_b_7_mem_q : STD_LOGIC_VECTOR (8 downto 0);
    signal redist18_yAddr_uid51_fpDivTest_b_7_rdcnt_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist18_yAddr_uid51_fpDivTest_b_7_rdcnt_i : UNSIGNED (2 downto 0);
    attribute preserve_syn_only of redist18_yAddr_uid51_fpDivTest_b_7_rdcnt_i : signal is true;
    signal redist18_yAddr_uid51_fpDivTest_b_7_rdcnt_eq : std_logic;
    attribute preserve_syn_only of redist18_yAddr_uid51_fpDivTest_b_7_rdcnt_eq : signal is true;
    signal redist18_yAddr_uid51_fpDivTest_b_7_wraddr_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist18_yAddr_uid51_fpDivTest_b_7_mem_last_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist18_yAddr_uid51_fpDivTest_b_7_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist18_yAddr_uid51_fpDivTest_b_7_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist18_yAddr_uid51_fpDivTest_b_7_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist18_yAddr_uid51_fpDivTest_b_7_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist18_yAddr_uid51_fpDivTest_b_7_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist18_yAddr_uid51_fpDivTest_b_7_sticky_ena_q : signal is true;
    signal redist18_yAddr_uid51_fpDivTest_b_7_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist19_yAddr_uid51_fpDivTest_b_14_inputreg0_q : STD_LOGIC_VECTOR (8 downto 0);
    signal redist19_yAddr_uid51_fpDivTest_b_14_outputreg0_q : STD_LOGIC_VECTOR (8 downto 0);
    signal redist23_fracY_uid13_fpDivTest_b_22_mem_reset0 : std_logic;
    signal redist23_fracY_uid13_fpDivTest_b_22_mem_ia : STD_LOGIC_VECTOR (22 downto 0);
    signal redist23_fracY_uid13_fpDivTest_b_22_mem_aa : STD_LOGIC_VECTOR (4 downto 0);
    signal redist23_fracY_uid13_fpDivTest_b_22_mem_ab : STD_LOGIC_VECTOR (4 downto 0);
    signal redist23_fracY_uid13_fpDivTest_b_22_mem_iq : STD_LOGIC_VECTOR (22 downto 0);
    signal redist23_fracY_uid13_fpDivTest_b_22_mem_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist23_fracY_uid13_fpDivTest_b_22_rdcnt_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist23_fracY_uid13_fpDivTest_b_22_rdcnt_i : UNSIGNED (4 downto 0);
    attribute preserve_syn_only of redist23_fracY_uid13_fpDivTest_b_22_rdcnt_i : signal is true;
    signal redist23_fracY_uid13_fpDivTest_b_22_rdcnt_eq : std_logic;
    attribute preserve_syn_only of redist23_fracY_uid13_fpDivTest_b_22_rdcnt_eq : signal is true;
    signal redist23_fracY_uid13_fpDivTest_b_22_wraddr_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist23_fracY_uid13_fpDivTest_b_22_mem_last_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist23_fracY_uid13_fpDivTest_b_22_cmp_b : STD_LOGIC_VECTOR (5 downto 0);
    signal redist23_fracY_uid13_fpDivTest_b_22_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist23_fracY_uid13_fpDivTest_b_22_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist23_fracY_uid13_fpDivTest_b_22_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist23_fracY_uid13_fpDivTest_b_22_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist23_fracY_uid13_fpDivTest_b_22_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist23_fracY_uid13_fpDivTest_b_22_sticky_ena_q : signal is true;
    signal redist23_fracY_uid13_fpDivTest_b_22_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist25_expY_uid12_fpDivTest_b_23_mem_reset0 : std_logic;
    signal redist25_expY_uid12_fpDivTest_b_23_mem_ia : STD_LOGIC_VECTOR (7 downto 0);
    signal redist25_expY_uid12_fpDivTest_b_23_mem_aa : STD_LOGIC_VECTOR (4 downto 0);
    signal redist25_expY_uid12_fpDivTest_b_23_mem_ab : STD_LOGIC_VECTOR (4 downto 0);
    signal redist25_expY_uid12_fpDivTest_b_23_mem_iq : STD_LOGIC_VECTOR (7 downto 0);
    signal redist25_expY_uid12_fpDivTest_b_23_mem_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist25_expY_uid12_fpDivTest_b_23_rdcnt_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist25_expY_uid12_fpDivTest_b_23_rdcnt_i : UNSIGNED (4 downto 0);
    attribute preserve_syn_only of redist25_expY_uid12_fpDivTest_b_23_rdcnt_i : signal is true;
    signal redist25_expY_uid12_fpDivTest_b_23_rdcnt_eq : std_logic;
    attribute preserve_syn_only of redist25_expY_uid12_fpDivTest_b_23_rdcnt_eq : signal is true;
    signal redist25_expY_uid12_fpDivTest_b_23_wraddr_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist25_expY_uid12_fpDivTest_b_23_mem_last_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist25_expY_uid12_fpDivTest_b_23_cmp_b : STD_LOGIC_VECTOR (5 downto 0);
    signal redist25_expY_uid12_fpDivTest_b_23_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist25_expY_uid12_fpDivTest_b_23_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist25_expY_uid12_fpDivTest_b_23_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist25_expY_uid12_fpDivTest_b_23_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist25_expY_uid12_fpDivTest_b_23_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist25_expY_uid12_fpDivTest_b_23_sticky_ena_q : signal is true;
    signal redist25_expY_uid12_fpDivTest_b_23_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist27_fracX_uid10_fpDivTest_b_17_outputreg0_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist27_fracX_uid10_fpDivTest_b_17_mem_reset0 : std_logic;
    signal redist27_fracX_uid10_fpDivTest_b_17_mem_ia : STD_LOGIC_VECTOR (22 downto 0);
    signal redist27_fracX_uid10_fpDivTest_b_17_mem_aa : STD_LOGIC_VECTOR (3 downto 0);
    signal redist27_fracX_uid10_fpDivTest_b_17_mem_ab : STD_LOGIC_VECTOR (3 downto 0);
    signal redist27_fracX_uid10_fpDivTest_b_17_mem_iq : STD_LOGIC_VECTOR (22 downto 0);
    signal redist27_fracX_uid10_fpDivTest_b_17_mem_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist27_fracX_uid10_fpDivTest_b_17_rdcnt_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist27_fracX_uid10_fpDivTest_b_17_rdcnt_i : UNSIGNED (3 downto 0);
    attribute preserve_syn_only of redist27_fracX_uid10_fpDivTest_b_17_rdcnt_i : signal is true;
    signal redist27_fracX_uid10_fpDivTest_b_17_rdcnt_eq : std_logic;
    attribute preserve_syn_only of redist27_fracX_uid10_fpDivTest_b_17_rdcnt_eq : signal is true;
    signal redist27_fracX_uid10_fpDivTest_b_17_wraddr_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist27_fracX_uid10_fpDivTest_b_17_mem_last_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist27_fracX_uid10_fpDivTest_b_17_cmp_b : STD_LOGIC_VECTOR (4 downto 0);
    signal redist27_fracX_uid10_fpDivTest_b_17_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist27_fracX_uid10_fpDivTest_b_17_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist27_fracX_uid10_fpDivTest_b_17_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist27_fracX_uid10_fpDivTest_b_17_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist27_fracX_uid10_fpDivTest_b_17_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist27_fracX_uid10_fpDivTest_b_17_sticky_ena_q : signal is true;
    signal redist27_fracX_uid10_fpDivTest_b_17_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist28_fracX_uid10_fpDivTest_b_25_inputreg0_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist28_fracX_uid10_fpDivTest_b_25_outputreg0_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist28_fracX_uid10_fpDivTest_b_25_mem_reset0 : std_logic;
    signal redist28_fracX_uid10_fpDivTest_b_25_mem_ia : STD_LOGIC_VECTOR (22 downto 0);
    signal redist28_fracX_uid10_fpDivTest_b_25_mem_aa : STD_LOGIC_VECTOR (2 downto 0);
    signal redist28_fracX_uid10_fpDivTest_b_25_mem_ab : STD_LOGIC_VECTOR (2 downto 0);
    signal redist28_fracX_uid10_fpDivTest_b_25_mem_iq : STD_LOGIC_VECTOR (22 downto 0);
    signal redist28_fracX_uid10_fpDivTest_b_25_mem_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist28_fracX_uid10_fpDivTest_b_25_rdcnt_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist28_fracX_uid10_fpDivTest_b_25_rdcnt_i : UNSIGNED (2 downto 0);
    attribute preserve_syn_only of redist28_fracX_uid10_fpDivTest_b_25_rdcnt_i : signal is true;
    signal redist28_fracX_uid10_fpDivTest_b_25_rdcnt_eq : std_logic;
    attribute preserve_syn_only of redist28_fracX_uid10_fpDivTest_b_25_rdcnt_eq : signal is true;
    signal redist28_fracX_uid10_fpDivTest_b_25_wraddr_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist28_fracX_uid10_fpDivTest_b_25_mem_last_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist28_fracX_uid10_fpDivTest_b_25_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist28_fracX_uid10_fpDivTest_b_25_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist28_fracX_uid10_fpDivTest_b_25_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist28_fracX_uid10_fpDivTest_b_25_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist28_fracX_uid10_fpDivTest_b_25_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist28_fracX_uid10_fpDivTest_b_25_sticky_ena_q : signal is true;
    signal redist28_fracX_uid10_fpDivTest_b_25_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist29_fracX_uid10_fpDivTest_b_33_inputreg0_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist29_fracX_uid10_fpDivTest_b_33_outputreg0_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist29_fracX_uid10_fpDivTest_b_33_mem_reset0 : std_logic;
    signal redist29_fracX_uid10_fpDivTest_b_33_mem_ia : STD_LOGIC_VECTOR (22 downto 0);
    signal redist29_fracX_uid10_fpDivTest_b_33_mem_aa : STD_LOGIC_VECTOR (2 downto 0);
    signal redist29_fracX_uid10_fpDivTest_b_33_mem_ab : STD_LOGIC_VECTOR (2 downto 0);
    signal redist29_fracX_uid10_fpDivTest_b_33_mem_iq : STD_LOGIC_VECTOR (22 downto 0);
    signal redist29_fracX_uid10_fpDivTest_b_33_mem_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist29_fracX_uid10_fpDivTest_b_33_rdcnt_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist29_fracX_uid10_fpDivTest_b_33_rdcnt_i : UNSIGNED (2 downto 0);
    attribute preserve_syn_only of redist29_fracX_uid10_fpDivTest_b_33_rdcnt_i : signal is true;
    signal redist29_fracX_uid10_fpDivTest_b_33_rdcnt_eq : std_logic;
    attribute preserve_syn_only of redist29_fracX_uid10_fpDivTest_b_33_rdcnt_eq : signal is true;
    signal redist29_fracX_uid10_fpDivTest_b_33_wraddr_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist29_fracX_uid10_fpDivTest_b_33_mem_last_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist29_fracX_uid10_fpDivTest_b_33_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist29_fracX_uid10_fpDivTest_b_33_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist29_fracX_uid10_fpDivTest_b_33_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist29_fracX_uid10_fpDivTest_b_33_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist29_fracX_uid10_fpDivTest_b_33_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist29_fracX_uid10_fpDivTest_b_33_sticky_ena_q : signal is true;
    signal redist29_fracX_uid10_fpDivTest_b_33_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist30_expX_uid9_fpDivTest_b_23_mem_reset0 : std_logic;
    signal redist30_expX_uid9_fpDivTest_b_23_mem_ia : STD_LOGIC_VECTOR (7 downto 0);
    signal redist30_expX_uid9_fpDivTest_b_23_mem_aa : STD_LOGIC_VECTOR (4 downto 0);
    signal redist30_expX_uid9_fpDivTest_b_23_mem_ab : STD_LOGIC_VECTOR (4 downto 0);
    signal redist30_expX_uid9_fpDivTest_b_23_mem_iq : STD_LOGIC_VECTOR (7 downto 0);
    signal redist30_expX_uid9_fpDivTest_b_23_mem_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist30_expX_uid9_fpDivTest_b_23_rdcnt_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist30_expX_uid9_fpDivTest_b_23_rdcnt_i : UNSIGNED (4 downto 0);
    attribute preserve_syn_only of redist30_expX_uid9_fpDivTest_b_23_rdcnt_i : signal is true;
    signal redist30_expX_uid9_fpDivTest_b_23_rdcnt_eq : std_logic;
    attribute preserve_syn_only of redist30_expX_uid9_fpDivTest_b_23_rdcnt_eq : signal is true;
    signal redist30_expX_uid9_fpDivTest_b_23_wraddr_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist30_expX_uid9_fpDivTest_b_23_mem_last_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist30_expX_uid9_fpDivTest_b_23_cmp_b : STD_LOGIC_VECTOR (5 downto 0);
    signal redist30_expX_uid9_fpDivTest_b_23_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist30_expX_uid9_fpDivTest_b_23_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist30_expX_uid9_fpDivTest_b_23_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist30_expX_uid9_fpDivTest_b_23_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist30_expX_uid9_fpDivTest_b_23_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist30_expX_uid9_fpDivTest_b_23_sticky_ena_q : signal is true;
    signal redist30_expX_uid9_fpDivTest_b_23_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist32_expX_uid9_fpDivTest_b_33_outputreg0_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist32_expX_uid9_fpDivTest_b_33_mem_reset0 : std_logic;
    signal redist32_expX_uid9_fpDivTest_b_33_mem_ia : STD_LOGIC_VECTOR (7 downto 0);
    signal redist32_expX_uid9_fpDivTest_b_33_mem_aa : STD_LOGIC_VECTOR (2 downto 0);
    signal redist32_expX_uid9_fpDivTest_b_33_mem_ab : STD_LOGIC_VECTOR (2 downto 0);
    signal redist32_expX_uid9_fpDivTest_b_33_mem_iq : STD_LOGIC_VECTOR (7 downto 0);
    signal redist32_expX_uid9_fpDivTest_b_33_mem_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist32_expX_uid9_fpDivTest_b_33_rdcnt_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist32_expX_uid9_fpDivTest_b_33_rdcnt_i : UNSIGNED (2 downto 0);
    attribute preserve_syn_only of redist32_expX_uid9_fpDivTest_b_33_rdcnt_i : signal is true;
    signal redist32_expX_uid9_fpDivTest_b_33_rdcnt_eq : std_logic;
    attribute preserve_syn_only of redist32_expX_uid9_fpDivTest_b_33_rdcnt_eq : signal is true;
    signal redist32_expX_uid9_fpDivTest_b_33_wraddr_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist32_expX_uid9_fpDivTest_b_33_mem_last_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist32_expX_uid9_fpDivTest_b_33_cmp_b : STD_LOGIC_VECTOR (3 downto 0);
    signal redist32_expX_uid9_fpDivTest_b_33_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist32_expX_uid9_fpDivTest_b_33_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist32_expX_uid9_fpDivTest_b_33_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist32_expX_uid9_fpDivTest_b_33_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist32_expX_uid9_fpDivTest_b_33_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist32_expX_uid9_fpDivTest_b_33_sticky_ena_q : signal is true;
    signal redist32_expX_uid9_fpDivTest_b_33_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- redist23_fracY_uid13_fpDivTest_b_22_notEnable(LOGICAL,285)
    redist23_fracY_uid13_fpDivTest_b_22_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist23_fracY_uid13_fpDivTest_b_22_nor(LOGICAL,286)
    redist23_fracY_uid13_fpDivTest_b_22_nor_q <= not (redist23_fracY_uid13_fpDivTest_b_22_notEnable_q or redist23_fracY_uid13_fpDivTest_b_22_sticky_ena_q);

    -- redist23_fracY_uid13_fpDivTest_b_22_mem_last(CONSTANT,282)
    redist23_fracY_uid13_fpDivTest_b_22_mem_last_q <= "010011";

    -- redist23_fracY_uid13_fpDivTest_b_22_cmp(LOGICAL,283)
    redist23_fracY_uid13_fpDivTest_b_22_cmp_b <= STD_LOGIC_VECTOR("0" & redist23_fracY_uid13_fpDivTest_b_22_rdcnt_q);
    redist23_fracY_uid13_fpDivTest_b_22_cmp_q <= "1" WHEN redist23_fracY_uid13_fpDivTest_b_22_mem_last_q = redist23_fracY_uid13_fpDivTest_b_22_cmp_b ELSE "0";

    -- redist23_fracY_uid13_fpDivTest_b_22_cmpReg(REG,284)
    redist23_fracY_uid13_fpDivTest_b_22_cmpReg_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist23_fracY_uid13_fpDivTest_b_22_cmpReg_q <= "0";
            ELSE
                redist23_fracY_uid13_fpDivTest_b_22_cmpReg_q <= STD_LOGIC_VECTOR(redist23_fracY_uid13_fpDivTest_b_22_cmp_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist23_fracY_uid13_fpDivTest_b_22_sticky_ena(REG,287)
    redist23_fracY_uid13_fpDivTest_b_22_sticky_ena_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist23_fracY_uid13_fpDivTest_b_22_sticky_ena_q <= "0";
            ELSE
                IF (redist23_fracY_uid13_fpDivTest_b_22_nor_q = "1") THEN
                    redist23_fracY_uid13_fpDivTest_b_22_sticky_ena_q <= STD_LOGIC_VECTOR(redist23_fracY_uid13_fpDivTest_b_22_cmpReg_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist23_fracY_uid13_fpDivTest_b_22_enaAnd(LOGICAL,288)
    redist23_fracY_uid13_fpDivTest_b_22_enaAnd_q <= redist23_fracY_uid13_fpDivTest_b_22_sticky_ena_q and VCC_q;

    -- redist23_fracY_uid13_fpDivTest_b_22_rdcnt(COUNTER,280)
    -- low=0, high=20, step=1, init=0
    redist23_fracY_uid13_fpDivTest_b_22_rdcnt_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist23_fracY_uid13_fpDivTest_b_22_rdcnt_i <= TO_UNSIGNED(0, 5);
                redist23_fracY_uid13_fpDivTest_b_22_rdcnt_eq <= '0';
            ELSE
                IF (redist23_fracY_uid13_fpDivTest_b_22_rdcnt_i = TO_UNSIGNED(19, 5)) THEN
                    redist23_fracY_uid13_fpDivTest_b_22_rdcnt_eq <= '1';
                ELSE
                    redist23_fracY_uid13_fpDivTest_b_22_rdcnt_eq <= '0';
                END IF;
                IF (redist23_fracY_uid13_fpDivTest_b_22_rdcnt_eq = '1') THEN
                    redist23_fracY_uid13_fpDivTest_b_22_rdcnt_i <= redist23_fracY_uid13_fpDivTest_b_22_rdcnt_i + 12;
                ELSE
                    redist23_fracY_uid13_fpDivTest_b_22_rdcnt_i <= redist23_fracY_uid13_fpDivTest_b_22_rdcnt_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    redist23_fracY_uid13_fpDivTest_b_22_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist23_fracY_uid13_fpDivTest_b_22_rdcnt_i, 5)));

    -- fracY_uid13_fpDivTest(BITSELECT,12)@0
    fracY_uid13_fpDivTest_b <= b(22 downto 0);

    -- redist23_fracY_uid13_fpDivTest_b_22_wraddr(REG,281)
    redist23_fracY_uid13_fpDivTest_b_22_wraddr_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist23_fracY_uid13_fpDivTest_b_22_wraddr_q <= "10100";
            ELSE
                redist23_fracY_uid13_fpDivTest_b_22_wraddr_q <= STD_LOGIC_VECTOR(redist23_fracY_uid13_fpDivTest_b_22_rdcnt_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist23_fracY_uid13_fpDivTest_b_22_mem(DUALMEM,279)
    redist23_fracY_uid13_fpDivTest_b_22_mem_ia <= STD_LOGIC_VECTOR(fracY_uid13_fpDivTest_b);
    redist23_fracY_uid13_fpDivTest_b_22_mem_aa <= redist23_fracY_uid13_fpDivTest_b_22_wraddr_q;
    redist23_fracY_uid13_fpDivTest_b_22_mem_ab <= redist23_fracY_uid13_fpDivTest_b_22_rdcnt_q;
    redist23_fracY_uid13_fpDivTest_b_22_mem_reset0 <= areset;
    redist23_fracY_uid13_fpDivTest_b_22_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 23,
        widthad_a => 5,
        numwords_a => 21,
        width_b => 23,
        widthad_b => 5,
        numwords_b => 21,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_sclr_b => "SCLEAR",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Stratix 10"
    )
    PORT MAP (
        clocken1 => redist23_fracY_uid13_fpDivTest_b_22_enaAnd_q(0),
        clocken0 => '1',
        clock0 => clk,
        sclr => redist23_fracY_uid13_fpDivTest_b_22_mem_reset0,
        clock1 => clk,
        address_a => redist23_fracY_uid13_fpDivTest_b_22_mem_aa,
        data_a => redist23_fracY_uid13_fpDivTest_b_22_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist23_fracY_uid13_fpDivTest_b_22_mem_ab,
        q_b => redist23_fracY_uid13_fpDivTest_b_22_mem_iq
    );
    redist23_fracY_uid13_fpDivTest_b_22_mem_q <= redist23_fracY_uid13_fpDivTest_b_22_mem_iq(22 downto 0);

    -- redist24_fracY_uid13_fpDivTest_b_25(DELAY,211)
    redist24_fracY_uid13_fpDivTest_b_25_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist24_fracY_uid13_fpDivTest_b_25_delay_0 <= (others => '0');
                redist24_fracY_uid13_fpDivTest_b_25_delay_1 <= (others => '0');
                redist24_fracY_uid13_fpDivTest_b_25_q <= (others => '0');
            ELSE
                redist24_fracY_uid13_fpDivTest_b_25_delay_0 <= STD_LOGIC_VECTOR(redist23_fracY_uid13_fpDivTest_b_22_mem_q);
                redist24_fracY_uid13_fpDivTest_b_25_delay_1 <= redist24_fracY_uid13_fpDivTest_b_25_delay_0;
                redist24_fracY_uid13_fpDivTest_b_25_q <= redist24_fracY_uid13_fpDivTest_b_25_delay_1;
            END IF;
        END IF;
    END PROCESS;

    -- paddingY_uid15_fpDivTest(CONSTANT,14)
    paddingY_uid15_fpDivTest_q <= "00000000000000000000000";

    -- fracXIsZero_uid39_fpDivTest(LOGICAL,38)@25 + 1
    fracXIsZero_uid39_fpDivTest_qi <= "1" WHEN paddingY_uid15_fpDivTest_q = redist24_fracY_uid13_fpDivTest_b_25_q ELSE "0";
    fracXIsZero_uid39_fpDivTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => fracXIsZero_uid39_fpDivTest_qi, xout => fracXIsZero_uid39_fpDivTest_q, clk => clk, aclr => areset, ena => '1' );

    -- cstAllOWE_uid18_fpDivTest(CONSTANT,17)
    cstAllOWE_uid18_fpDivTest_q <= "11111111";

    -- redist25_expY_uid12_fpDivTest_b_23_notEnable(LOGICAL,295)
    redist25_expY_uid12_fpDivTest_b_23_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist25_expY_uid12_fpDivTest_b_23_nor(LOGICAL,296)
    redist25_expY_uid12_fpDivTest_b_23_nor_q <= not (redist25_expY_uid12_fpDivTest_b_23_notEnable_q or redist25_expY_uid12_fpDivTest_b_23_sticky_ena_q);

    -- redist25_expY_uid12_fpDivTest_b_23_mem_last(CONSTANT,292)
    redist25_expY_uid12_fpDivTest_b_23_mem_last_q <= "010100";

    -- redist25_expY_uid12_fpDivTest_b_23_cmp(LOGICAL,293)
    redist25_expY_uid12_fpDivTest_b_23_cmp_b <= STD_LOGIC_VECTOR("0" & redist25_expY_uid12_fpDivTest_b_23_rdcnt_q);
    redist25_expY_uid12_fpDivTest_b_23_cmp_q <= "1" WHEN redist25_expY_uid12_fpDivTest_b_23_mem_last_q = redist25_expY_uid12_fpDivTest_b_23_cmp_b ELSE "0";

    -- redist25_expY_uid12_fpDivTest_b_23_cmpReg(REG,294)
    redist25_expY_uid12_fpDivTest_b_23_cmpReg_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist25_expY_uid12_fpDivTest_b_23_cmpReg_q <= "0";
            ELSE
                redist25_expY_uid12_fpDivTest_b_23_cmpReg_q <= STD_LOGIC_VECTOR(redist25_expY_uid12_fpDivTest_b_23_cmp_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist25_expY_uid12_fpDivTest_b_23_sticky_ena(REG,297)
    redist25_expY_uid12_fpDivTest_b_23_sticky_ena_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist25_expY_uid12_fpDivTest_b_23_sticky_ena_q <= "0";
            ELSE
                IF (redist25_expY_uid12_fpDivTest_b_23_nor_q = "1") THEN
                    redist25_expY_uid12_fpDivTest_b_23_sticky_ena_q <= STD_LOGIC_VECTOR(redist25_expY_uid12_fpDivTest_b_23_cmpReg_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist25_expY_uid12_fpDivTest_b_23_enaAnd(LOGICAL,298)
    redist25_expY_uid12_fpDivTest_b_23_enaAnd_q <= redist25_expY_uid12_fpDivTest_b_23_sticky_ena_q and VCC_q;

    -- redist25_expY_uid12_fpDivTest_b_23_rdcnt(COUNTER,290)
    -- low=0, high=21, step=1, init=0
    redist25_expY_uid12_fpDivTest_b_23_rdcnt_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist25_expY_uid12_fpDivTest_b_23_rdcnt_i <= TO_UNSIGNED(0, 5);
                redist25_expY_uid12_fpDivTest_b_23_rdcnt_eq <= '0';
            ELSE
                IF (redist25_expY_uid12_fpDivTest_b_23_rdcnt_i = TO_UNSIGNED(20, 5)) THEN
                    redist25_expY_uid12_fpDivTest_b_23_rdcnt_eq <= '1';
                ELSE
                    redist25_expY_uid12_fpDivTest_b_23_rdcnt_eq <= '0';
                END IF;
                IF (redist25_expY_uid12_fpDivTest_b_23_rdcnt_eq = '1') THEN
                    redist25_expY_uid12_fpDivTest_b_23_rdcnt_i <= redist25_expY_uid12_fpDivTest_b_23_rdcnt_i + 11;
                ELSE
                    redist25_expY_uid12_fpDivTest_b_23_rdcnt_i <= redist25_expY_uid12_fpDivTest_b_23_rdcnt_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    redist25_expY_uid12_fpDivTest_b_23_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist25_expY_uid12_fpDivTest_b_23_rdcnt_i, 5)));

    -- expY_uid12_fpDivTest(BITSELECT,11)@0
    expY_uid12_fpDivTest_b <= b(30 downto 23);

    -- redist25_expY_uid12_fpDivTest_b_23_wraddr(REG,291)
    redist25_expY_uid12_fpDivTest_b_23_wraddr_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist25_expY_uid12_fpDivTest_b_23_wraddr_q <= "10101";
            ELSE
                redist25_expY_uid12_fpDivTest_b_23_wraddr_q <= STD_LOGIC_VECTOR(redist25_expY_uid12_fpDivTest_b_23_rdcnt_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist25_expY_uid12_fpDivTest_b_23_mem(DUALMEM,289)
    redist25_expY_uid12_fpDivTest_b_23_mem_ia <= STD_LOGIC_VECTOR(expY_uid12_fpDivTest_b);
    redist25_expY_uid12_fpDivTest_b_23_mem_aa <= redist25_expY_uid12_fpDivTest_b_23_wraddr_q;
    redist25_expY_uid12_fpDivTest_b_23_mem_ab <= redist25_expY_uid12_fpDivTest_b_23_rdcnt_q;
    redist25_expY_uid12_fpDivTest_b_23_mem_reset0 <= areset;
    redist25_expY_uid12_fpDivTest_b_23_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 8,
        widthad_a => 5,
        numwords_a => 22,
        width_b => 8,
        widthad_b => 5,
        numwords_b => 22,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_sclr_b => "SCLEAR",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Stratix 10"
    )
    PORT MAP (
        clocken1 => redist25_expY_uid12_fpDivTest_b_23_enaAnd_q(0),
        clocken0 => '1',
        clock0 => clk,
        sclr => redist25_expY_uid12_fpDivTest_b_23_mem_reset0,
        clock1 => clk,
        address_a => redist25_expY_uid12_fpDivTest_b_23_mem_aa,
        data_a => redist25_expY_uid12_fpDivTest_b_23_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist25_expY_uid12_fpDivTest_b_23_mem_ab,
        q_b => redist25_expY_uid12_fpDivTest_b_23_mem_iq
    );
    redist25_expY_uid12_fpDivTest_b_23_mem_q <= redist25_expY_uid12_fpDivTest_b_23_mem_iq(7 downto 0);

    -- redist26_expY_uid12_fpDivTest_b_25(DELAY,213)
    redist26_expY_uid12_fpDivTest_b_25_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist26_expY_uid12_fpDivTest_b_25_delay_0 <= (others => '0');
                redist26_expY_uid12_fpDivTest_b_25_q <= (others => '0');
            ELSE
                redist26_expY_uid12_fpDivTest_b_25_delay_0 <= STD_LOGIC_VECTOR(redist25_expY_uid12_fpDivTest_b_23_mem_q);
                redist26_expY_uid12_fpDivTest_b_25_q <= redist26_expY_uid12_fpDivTest_b_25_delay_0;
            END IF;
        END IF;
    END PROCESS;

    -- expXIsMax_uid38_fpDivTest(LOGICAL,37)@25 + 1
    expXIsMax_uid38_fpDivTest_qi <= "1" WHEN redist26_expY_uid12_fpDivTest_b_25_q = cstAllOWE_uid18_fpDivTest_q ELSE "0";
    expXIsMax_uid38_fpDivTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => expXIsMax_uid38_fpDivTest_qi, xout => expXIsMax_uid38_fpDivTest_q, clk => clk, aclr => areset, ena => '1' );

    -- excI_y_uid41_fpDivTest(LOGICAL,40)@26
    excI_y_uid41_fpDivTest_q <= expXIsMax_uid38_fpDivTest_q and fracXIsZero_uid39_fpDivTest_q;

    -- redist28_fracX_uid10_fpDivTest_b_25_notEnable(LOGICAL,318)
    redist28_fracX_uid10_fpDivTest_b_25_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist28_fracX_uid10_fpDivTest_b_25_nor(LOGICAL,319)
    redist28_fracX_uid10_fpDivTest_b_25_nor_q <= not (redist28_fracX_uid10_fpDivTest_b_25_notEnable_q or redist28_fracX_uid10_fpDivTest_b_25_sticky_ena_q);

    -- redist28_fracX_uid10_fpDivTest_b_25_mem_last(CONSTANT,315)
    redist28_fracX_uid10_fpDivTest_b_25_mem_last_q <= "011";

    -- redist28_fracX_uid10_fpDivTest_b_25_cmp(LOGICAL,316)
    redist28_fracX_uid10_fpDivTest_b_25_cmp_q <= "1" WHEN redist28_fracX_uid10_fpDivTest_b_25_mem_last_q = redist28_fracX_uid10_fpDivTest_b_25_rdcnt_q ELSE "0";

    -- redist28_fracX_uid10_fpDivTest_b_25_cmpReg(REG,317)
    redist28_fracX_uid10_fpDivTest_b_25_cmpReg_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist28_fracX_uid10_fpDivTest_b_25_cmpReg_q <= "0";
            ELSE
                redist28_fracX_uid10_fpDivTest_b_25_cmpReg_q <= STD_LOGIC_VECTOR(redist28_fracX_uid10_fpDivTest_b_25_cmp_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist28_fracX_uid10_fpDivTest_b_25_sticky_ena(REG,320)
    redist28_fracX_uid10_fpDivTest_b_25_sticky_ena_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist28_fracX_uid10_fpDivTest_b_25_sticky_ena_q <= "0";
            ELSE
                IF (redist28_fracX_uid10_fpDivTest_b_25_nor_q = "1") THEN
                    redist28_fracX_uid10_fpDivTest_b_25_sticky_ena_q <= STD_LOGIC_VECTOR(redist28_fracX_uid10_fpDivTest_b_25_cmpReg_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist28_fracX_uid10_fpDivTest_b_25_enaAnd(LOGICAL,321)
    redist28_fracX_uid10_fpDivTest_b_25_enaAnd_q <= redist28_fracX_uid10_fpDivTest_b_25_sticky_ena_q and VCC_q;

    -- redist28_fracX_uid10_fpDivTest_b_25_rdcnt(COUNTER,313)
    -- low=0, high=4, step=1, init=0
    redist28_fracX_uid10_fpDivTest_b_25_rdcnt_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist28_fracX_uid10_fpDivTest_b_25_rdcnt_i <= TO_UNSIGNED(0, 3);
                redist28_fracX_uid10_fpDivTest_b_25_rdcnt_eq <= '0';
            ELSE
                IF (redist28_fracX_uid10_fpDivTest_b_25_rdcnt_i = TO_UNSIGNED(3, 3)) THEN
                    redist28_fracX_uid10_fpDivTest_b_25_rdcnt_eq <= '1';
                ELSE
                    redist28_fracX_uid10_fpDivTest_b_25_rdcnt_eq <= '0';
                END IF;
                IF (redist28_fracX_uid10_fpDivTest_b_25_rdcnt_eq = '1') THEN
                    redist28_fracX_uid10_fpDivTest_b_25_rdcnt_i <= redist28_fracX_uid10_fpDivTest_b_25_rdcnt_i + 4;
                ELSE
                    redist28_fracX_uid10_fpDivTest_b_25_rdcnt_i <= redist28_fracX_uid10_fpDivTest_b_25_rdcnt_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    redist28_fracX_uid10_fpDivTest_b_25_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist28_fracX_uid10_fpDivTest_b_25_rdcnt_i, 3)));

    -- redist27_fracX_uid10_fpDivTest_b_17_notEnable(LOGICAL,306)
    redist27_fracX_uid10_fpDivTest_b_17_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist27_fracX_uid10_fpDivTest_b_17_nor(LOGICAL,307)
    redist27_fracX_uid10_fpDivTest_b_17_nor_q <= not (redist27_fracX_uid10_fpDivTest_b_17_notEnable_q or redist27_fracX_uid10_fpDivTest_b_17_sticky_ena_q);

    -- redist27_fracX_uid10_fpDivTest_b_17_mem_last(CONSTANT,303)
    redist27_fracX_uid10_fpDivTest_b_17_mem_last_q <= "01101";

    -- redist27_fracX_uid10_fpDivTest_b_17_cmp(LOGICAL,304)
    redist27_fracX_uid10_fpDivTest_b_17_cmp_b <= STD_LOGIC_VECTOR("0" & redist27_fracX_uid10_fpDivTest_b_17_rdcnt_q);
    redist27_fracX_uid10_fpDivTest_b_17_cmp_q <= "1" WHEN redist27_fracX_uid10_fpDivTest_b_17_mem_last_q = redist27_fracX_uid10_fpDivTest_b_17_cmp_b ELSE "0";

    -- redist27_fracX_uid10_fpDivTest_b_17_cmpReg(REG,305)
    redist27_fracX_uid10_fpDivTest_b_17_cmpReg_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist27_fracX_uid10_fpDivTest_b_17_cmpReg_q <= "0";
            ELSE
                redist27_fracX_uid10_fpDivTest_b_17_cmpReg_q <= STD_LOGIC_VECTOR(redist27_fracX_uid10_fpDivTest_b_17_cmp_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist27_fracX_uid10_fpDivTest_b_17_sticky_ena(REG,308)
    redist27_fracX_uid10_fpDivTest_b_17_sticky_ena_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist27_fracX_uid10_fpDivTest_b_17_sticky_ena_q <= "0";
            ELSE
                IF (redist27_fracX_uid10_fpDivTest_b_17_nor_q = "1") THEN
                    redist27_fracX_uid10_fpDivTest_b_17_sticky_ena_q <= STD_LOGIC_VECTOR(redist27_fracX_uid10_fpDivTest_b_17_cmpReg_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist27_fracX_uid10_fpDivTest_b_17_enaAnd(LOGICAL,309)
    redist27_fracX_uid10_fpDivTest_b_17_enaAnd_q <= redist27_fracX_uid10_fpDivTest_b_17_sticky_ena_q and VCC_q;

    -- redist27_fracX_uid10_fpDivTest_b_17_rdcnt(COUNTER,301)
    -- low=0, high=14, step=1, init=0
    redist27_fracX_uid10_fpDivTest_b_17_rdcnt_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist27_fracX_uid10_fpDivTest_b_17_rdcnt_i <= TO_UNSIGNED(0, 4);
                redist27_fracX_uid10_fpDivTest_b_17_rdcnt_eq <= '0';
            ELSE
                IF (redist27_fracX_uid10_fpDivTest_b_17_rdcnt_i = TO_UNSIGNED(13, 4)) THEN
                    redist27_fracX_uid10_fpDivTest_b_17_rdcnt_eq <= '1';
                ELSE
                    redist27_fracX_uid10_fpDivTest_b_17_rdcnt_eq <= '0';
                END IF;
                IF (redist27_fracX_uid10_fpDivTest_b_17_rdcnt_eq = '1') THEN
                    redist27_fracX_uid10_fpDivTest_b_17_rdcnt_i <= redist27_fracX_uid10_fpDivTest_b_17_rdcnt_i + 2;
                ELSE
                    redist27_fracX_uid10_fpDivTest_b_17_rdcnt_i <= redist27_fracX_uid10_fpDivTest_b_17_rdcnt_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    redist27_fracX_uid10_fpDivTest_b_17_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist27_fracX_uid10_fpDivTest_b_17_rdcnt_i, 4)));

    -- fracX_uid10_fpDivTest(BITSELECT,9)@0
    fracX_uid10_fpDivTest_b <= a(22 downto 0);

    -- redist27_fracX_uid10_fpDivTest_b_17_wraddr(REG,302)
    redist27_fracX_uid10_fpDivTest_b_17_wraddr_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist27_fracX_uid10_fpDivTest_b_17_wraddr_q <= "1110";
            ELSE
                redist27_fracX_uid10_fpDivTest_b_17_wraddr_q <= STD_LOGIC_VECTOR(redist27_fracX_uid10_fpDivTest_b_17_rdcnt_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist27_fracX_uid10_fpDivTest_b_17_mem(DUALMEM,300)
    redist27_fracX_uid10_fpDivTest_b_17_mem_ia <= STD_LOGIC_VECTOR(fracX_uid10_fpDivTest_b);
    redist27_fracX_uid10_fpDivTest_b_17_mem_aa <= redist27_fracX_uid10_fpDivTest_b_17_wraddr_q;
    redist27_fracX_uid10_fpDivTest_b_17_mem_ab <= redist27_fracX_uid10_fpDivTest_b_17_rdcnt_q;
    redist27_fracX_uid10_fpDivTest_b_17_mem_reset0 <= areset;
    redist27_fracX_uid10_fpDivTest_b_17_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 23,
        widthad_a => 4,
        numwords_a => 15,
        width_b => 23,
        widthad_b => 4,
        numwords_b => 15,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_sclr_b => "SCLEAR",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Stratix 10"
    )
    PORT MAP (
        clocken1 => redist27_fracX_uid10_fpDivTest_b_17_enaAnd_q(0),
        clocken0 => '1',
        clock0 => clk,
        sclr => redist27_fracX_uid10_fpDivTest_b_17_mem_reset0,
        clock1 => clk,
        address_a => redist27_fracX_uid10_fpDivTest_b_17_mem_aa,
        data_a => redist27_fracX_uid10_fpDivTest_b_17_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist27_fracX_uid10_fpDivTest_b_17_mem_ab,
        q_b => redist27_fracX_uid10_fpDivTest_b_17_mem_iq
    );
    redist27_fracX_uid10_fpDivTest_b_17_mem_q <= redist27_fracX_uid10_fpDivTest_b_17_mem_iq(22 downto 0);

    -- redist27_fracX_uid10_fpDivTest_b_17_outputreg0(DELAY,299)
    redist27_fracX_uid10_fpDivTest_b_17_outputreg0_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist27_fracX_uid10_fpDivTest_b_17_outputreg0_q <= (others => '0');
            ELSE
                redist27_fracX_uid10_fpDivTest_b_17_outputreg0_q <= STD_LOGIC_VECTOR(redist27_fracX_uid10_fpDivTest_b_17_mem_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist28_fracX_uid10_fpDivTest_b_25_inputreg0(DELAY,310)
    redist28_fracX_uid10_fpDivTest_b_25_inputreg0_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist28_fracX_uid10_fpDivTest_b_25_inputreg0_q <= (others => '0');
            ELSE
                redist28_fracX_uid10_fpDivTest_b_25_inputreg0_q <= STD_LOGIC_VECTOR(redist27_fracX_uid10_fpDivTest_b_17_outputreg0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist28_fracX_uid10_fpDivTest_b_25_wraddr(REG,314)
    redist28_fracX_uid10_fpDivTest_b_25_wraddr_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist28_fracX_uid10_fpDivTest_b_25_wraddr_q <= "100";
            ELSE
                redist28_fracX_uid10_fpDivTest_b_25_wraddr_q <= STD_LOGIC_VECTOR(redist28_fracX_uid10_fpDivTest_b_25_rdcnt_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist28_fracX_uid10_fpDivTest_b_25_mem(DUALMEM,312)
    redist28_fracX_uid10_fpDivTest_b_25_mem_ia <= STD_LOGIC_VECTOR(redist28_fracX_uid10_fpDivTest_b_25_inputreg0_q);
    redist28_fracX_uid10_fpDivTest_b_25_mem_aa <= redist28_fracX_uid10_fpDivTest_b_25_wraddr_q;
    redist28_fracX_uid10_fpDivTest_b_25_mem_ab <= redist28_fracX_uid10_fpDivTest_b_25_rdcnt_q;
    redist28_fracX_uid10_fpDivTest_b_25_mem_reset0 <= areset;
    redist28_fracX_uid10_fpDivTest_b_25_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 23,
        widthad_a => 3,
        numwords_a => 5,
        width_b => 23,
        widthad_b => 3,
        numwords_b => 5,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_sclr_b => "SCLEAR",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Stratix 10"
    )
    PORT MAP (
        clocken1 => redist28_fracX_uid10_fpDivTest_b_25_enaAnd_q(0),
        clocken0 => '1',
        clock0 => clk,
        sclr => redist28_fracX_uid10_fpDivTest_b_25_mem_reset0,
        clock1 => clk,
        address_a => redist28_fracX_uid10_fpDivTest_b_25_mem_aa,
        data_a => redist28_fracX_uid10_fpDivTest_b_25_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist28_fracX_uid10_fpDivTest_b_25_mem_ab,
        q_b => redist28_fracX_uid10_fpDivTest_b_25_mem_iq
    );
    redist28_fracX_uid10_fpDivTest_b_25_mem_q <= redist28_fracX_uid10_fpDivTest_b_25_mem_iq(22 downto 0);

    -- redist28_fracX_uid10_fpDivTest_b_25_outputreg0(DELAY,311)
    redist28_fracX_uid10_fpDivTest_b_25_outputreg0_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist28_fracX_uid10_fpDivTest_b_25_outputreg0_q <= (others => '0');
            ELSE
                redist28_fracX_uid10_fpDivTest_b_25_outputreg0_q <= STD_LOGIC_VECTOR(redist28_fracX_uid10_fpDivTest_b_25_mem_q);
            END IF;
        END IF;
    END PROCESS;

    -- fracXIsZero_uid25_fpDivTest(LOGICAL,24)@25 + 1
    fracXIsZero_uid25_fpDivTest_qi <= "1" WHEN paddingY_uid15_fpDivTest_q = redist28_fracX_uid10_fpDivTest_b_25_outputreg0_q ELSE "0";
    fracXIsZero_uid25_fpDivTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => fracXIsZero_uid25_fpDivTest_qi, xout => fracXIsZero_uid25_fpDivTest_q, clk => clk, aclr => areset, ena => '1' );

    -- redist30_expX_uid9_fpDivTest_b_23_notEnable(LOGICAL,340)
    redist30_expX_uid9_fpDivTest_b_23_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist30_expX_uid9_fpDivTest_b_23_nor(LOGICAL,341)
    redist30_expX_uid9_fpDivTest_b_23_nor_q <= not (redist30_expX_uid9_fpDivTest_b_23_notEnable_q or redist30_expX_uid9_fpDivTest_b_23_sticky_ena_q);

    -- redist30_expX_uid9_fpDivTest_b_23_mem_last(CONSTANT,337)
    redist30_expX_uid9_fpDivTest_b_23_mem_last_q <= "010100";

    -- redist30_expX_uid9_fpDivTest_b_23_cmp(LOGICAL,338)
    redist30_expX_uid9_fpDivTest_b_23_cmp_b <= STD_LOGIC_VECTOR("0" & redist30_expX_uid9_fpDivTest_b_23_rdcnt_q);
    redist30_expX_uid9_fpDivTest_b_23_cmp_q <= "1" WHEN redist30_expX_uid9_fpDivTest_b_23_mem_last_q = redist30_expX_uid9_fpDivTest_b_23_cmp_b ELSE "0";

    -- redist30_expX_uid9_fpDivTest_b_23_cmpReg(REG,339)
    redist30_expX_uid9_fpDivTest_b_23_cmpReg_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist30_expX_uid9_fpDivTest_b_23_cmpReg_q <= "0";
            ELSE
                redist30_expX_uid9_fpDivTest_b_23_cmpReg_q <= STD_LOGIC_VECTOR(redist30_expX_uid9_fpDivTest_b_23_cmp_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist30_expX_uid9_fpDivTest_b_23_sticky_ena(REG,342)
    redist30_expX_uid9_fpDivTest_b_23_sticky_ena_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist30_expX_uid9_fpDivTest_b_23_sticky_ena_q <= "0";
            ELSE
                IF (redist30_expX_uid9_fpDivTest_b_23_nor_q = "1") THEN
                    redist30_expX_uid9_fpDivTest_b_23_sticky_ena_q <= STD_LOGIC_VECTOR(redist30_expX_uid9_fpDivTest_b_23_cmpReg_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist30_expX_uid9_fpDivTest_b_23_enaAnd(LOGICAL,343)
    redist30_expX_uid9_fpDivTest_b_23_enaAnd_q <= redist30_expX_uid9_fpDivTest_b_23_sticky_ena_q and VCC_q;

    -- redist30_expX_uid9_fpDivTest_b_23_rdcnt(COUNTER,335)
    -- low=0, high=21, step=1, init=0
    redist30_expX_uid9_fpDivTest_b_23_rdcnt_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist30_expX_uid9_fpDivTest_b_23_rdcnt_i <= TO_UNSIGNED(0, 5);
                redist30_expX_uid9_fpDivTest_b_23_rdcnt_eq <= '0';
            ELSE
                IF (redist30_expX_uid9_fpDivTest_b_23_rdcnt_i = TO_UNSIGNED(20, 5)) THEN
                    redist30_expX_uid9_fpDivTest_b_23_rdcnt_eq <= '1';
                ELSE
                    redist30_expX_uid9_fpDivTest_b_23_rdcnt_eq <= '0';
                END IF;
                IF (redist30_expX_uid9_fpDivTest_b_23_rdcnt_eq = '1') THEN
                    redist30_expX_uid9_fpDivTest_b_23_rdcnt_i <= redist30_expX_uid9_fpDivTest_b_23_rdcnt_i + 11;
                ELSE
                    redist30_expX_uid9_fpDivTest_b_23_rdcnt_i <= redist30_expX_uid9_fpDivTest_b_23_rdcnt_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    redist30_expX_uid9_fpDivTest_b_23_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist30_expX_uid9_fpDivTest_b_23_rdcnt_i, 5)));

    -- expX_uid9_fpDivTest(BITSELECT,8)@0
    expX_uid9_fpDivTest_b <= a(30 downto 23);

    -- redist30_expX_uid9_fpDivTest_b_23_wraddr(REG,336)
    redist30_expX_uid9_fpDivTest_b_23_wraddr_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist30_expX_uid9_fpDivTest_b_23_wraddr_q <= "10101";
            ELSE
                redist30_expX_uid9_fpDivTest_b_23_wraddr_q <= STD_LOGIC_VECTOR(redist30_expX_uid9_fpDivTest_b_23_rdcnt_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist30_expX_uid9_fpDivTest_b_23_mem(DUALMEM,334)
    redist30_expX_uid9_fpDivTest_b_23_mem_ia <= STD_LOGIC_VECTOR(expX_uid9_fpDivTest_b);
    redist30_expX_uid9_fpDivTest_b_23_mem_aa <= redist30_expX_uid9_fpDivTest_b_23_wraddr_q;
    redist30_expX_uid9_fpDivTest_b_23_mem_ab <= redist30_expX_uid9_fpDivTest_b_23_rdcnt_q;
    redist30_expX_uid9_fpDivTest_b_23_mem_reset0 <= areset;
    redist30_expX_uid9_fpDivTest_b_23_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 8,
        widthad_a => 5,
        numwords_a => 22,
        width_b => 8,
        widthad_b => 5,
        numwords_b => 22,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_sclr_b => "SCLEAR",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Stratix 10"
    )
    PORT MAP (
        clocken1 => redist30_expX_uid9_fpDivTest_b_23_enaAnd_q(0),
        clocken0 => '1',
        clock0 => clk,
        sclr => redist30_expX_uid9_fpDivTest_b_23_mem_reset0,
        clock1 => clk,
        address_a => redist30_expX_uid9_fpDivTest_b_23_mem_aa,
        data_a => redist30_expX_uid9_fpDivTest_b_23_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist30_expX_uid9_fpDivTest_b_23_mem_ab,
        q_b => redist30_expX_uid9_fpDivTest_b_23_mem_iq
    );
    redist30_expX_uid9_fpDivTest_b_23_mem_q <= redist30_expX_uid9_fpDivTest_b_23_mem_iq(7 downto 0);

    -- redist31_expX_uid9_fpDivTest_b_25(DELAY,218)
    redist31_expX_uid9_fpDivTest_b_25_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist31_expX_uid9_fpDivTest_b_25_delay_0 <= (others => '0');
                redist31_expX_uid9_fpDivTest_b_25_q <= (others => '0');
            ELSE
                redist31_expX_uid9_fpDivTest_b_25_delay_0 <= STD_LOGIC_VECTOR(redist30_expX_uid9_fpDivTest_b_23_mem_q);
                redist31_expX_uid9_fpDivTest_b_25_q <= redist31_expX_uid9_fpDivTest_b_25_delay_0;
            END IF;
        END IF;
    END PROCESS;

    -- expXIsMax_uid24_fpDivTest(LOGICAL,23)@25
    expXIsMax_uid24_fpDivTest_q <= "1" WHEN redist31_expX_uid9_fpDivTest_b_25_q = cstAllOWE_uid18_fpDivTest_q ELSE "0";

    -- redist21_expXIsMax_uid24_fpDivTest_q_1(DELAY,208)
    redist21_expXIsMax_uid24_fpDivTest_q_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist21_expXIsMax_uid24_fpDivTest_q_1_q <= (others => '0');
            ELSE
                redist21_expXIsMax_uid24_fpDivTest_q_1_q <= STD_LOGIC_VECTOR(expXIsMax_uid24_fpDivTest_q);
            END IF;
        END IF;
    END PROCESS;

    -- excI_x_uid27_fpDivTest(LOGICAL,26)@26
    excI_x_uid27_fpDivTest_q <= redist21_expXIsMax_uid24_fpDivTest_q_1_q and fracXIsZero_uid25_fpDivTest_q;

    -- excXIYI_uid130_fpDivTest(LOGICAL,129)@26
    excXIYI_uid130_fpDivTest_q <= excI_x_uid27_fpDivTest_q and excI_y_uid41_fpDivTest_q;

    -- fracXIsNotZero_uid40_fpDivTest(LOGICAL,39)@26
    fracXIsNotZero_uid40_fpDivTest_q <= not (fracXIsZero_uid39_fpDivTest_q);

    -- excN_y_uid42_fpDivTest(LOGICAL,41)@26
    excN_y_uid42_fpDivTest_q <= expXIsMax_uid38_fpDivTest_q and fracXIsNotZero_uid40_fpDivTest_q;

    -- fracXIsNotZero_uid26_fpDivTest(LOGICAL,25)@26
    fracXIsNotZero_uid26_fpDivTest_q <= not (fracXIsZero_uid25_fpDivTest_q);

    -- excN_x_uid28_fpDivTest(LOGICAL,27)@26
    excN_x_uid28_fpDivTest_q <= redist21_expXIsMax_uid24_fpDivTest_q_1_q and fracXIsNotZero_uid26_fpDivTest_q;

    -- cstAllZWE_uid20_fpDivTest(CONSTANT,19)
    cstAllZWE_uid20_fpDivTest_q <= "00000000";

    -- excZ_y_uid37_fpDivTest(LOGICAL,36)@25 + 1
    excZ_y_uid37_fpDivTest_qi <= "1" WHEN redist26_expY_uid12_fpDivTest_b_25_q = cstAllZWE_uid20_fpDivTest_q ELSE "0";
    excZ_y_uid37_fpDivTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => excZ_y_uid37_fpDivTest_qi, xout => excZ_y_uid37_fpDivTest_q, clk => clk, aclr => areset, ena => '1' );

    -- excZ_x_uid23_fpDivTest(LOGICAL,22)@25
    excZ_x_uid23_fpDivTest_q <= "1" WHEN redist31_expX_uid9_fpDivTest_b_25_q = cstAllZWE_uid20_fpDivTest_q ELSE "0";

    -- redist22_excZ_x_uid23_fpDivTest_q_1(DELAY,209)
    redist22_excZ_x_uid23_fpDivTest_q_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist22_excZ_x_uid23_fpDivTest_q_1_q <= (others => '0');
            ELSE
                redist22_excZ_x_uid23_fpDivTest_q_1_q <= STD_LOGIC_VECTOR(excZ_x_uid23_fpDivTest_q);
            END IF;
        END IF;
    END PROCESS;

    -- excXZYZ_uid129_fpDivTest(LOGICAL,128)@26
    excXZYZ_uid129_fpDivTest_q <= redist22_excZ_x_uid23_fpDivTest_q_1_q and excZ_y_uid37_fpDivTest_q;

    -- excRNaN_uid131_fpDivTest(LOGICAL,130)@26 + 1
    excRNaN_uid131_fpDivTest_qi <= excXZYZ_uid129_fpDivTest_q or excN_x_uid28_fpDivTest_q or excN_y_uid42_fpDivTest_q or excXIYI_uid130_fpDivTest_q;
    excRNaN_uid131_fpDivTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => excRNaN_uid131_fpDivTest_qi, xout => excRNaN_uid131_fpDivTest_q, clk => clk, aclr => areset, ena => '1' );

    -- invExcRNaN_uid142_fpDivTest(LOGICAL,141)@27
    invExcRNaN_uid142_fpDivTest_q <= not (excRNaN_uid131_fpDivTest_q);

    -- signY_uid14_fpDivTest(BITSELECT,13)@0
    signY_uid14_fpDivTest_b <= STD_LOGIC_VECTOR(b(31 downto 31));

    -- signX_uid11_fpDivTest(BITSELECT,10)@0
    signX_uid11_fpDivTest_b <= STD_LOGIC_VECTOR(a(31 downto 31));

    -- signR_uid46_fpDivTest(LOGICAL,45)@0 + 1
    signR_uid46_fpDivTest_qi <= signX_uid11_fpDivTest_b xor signY_uid14_fpDivTest_b;
    signR_uid46_fpDivTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => signR_uid46_fpDivTest_qi, xout => signR_uid46_fpDivTest_q, clk => clk, aclr => areset, ena => '1' );

    -- redist20_signR_uid46_fpDivTest_q_27(DELAY,207)
    redist20_signR_uid46_fpDivTest_q_27 : dspba_delay
    GENERIC MAP ( width => 1, depth => 26, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => signR_uid46_fpDivTest_q, xout => redist20_signR_uid46_fpDivTest_q_27_q, clk => clk, aclr => areset, ena => '1' );

    -- sRPostExc_uid143_fpDivTest(LOGICAL,142)@27 + 1
    sRPostExc_uid143_fpDivTest_qi <= redist20_signR_uid46_fpDivTest_q_27_q and invExcRNaN_uid142_fpDivTest_q;
    sRPostExc_uid143_fpDivTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => sRPostExc_uid143_fpDivTest_qi, xout => sRPostExc_uid143_fpDivTest_q, clk => clk, aclr => areset, ena => '1' );

    -- redist2_sRPostExc_uid143_fpDivTest_q_8(DELAY,189)
    redist2_sRPostExc_uid143_fpDivTest_q_8 : dspba_delay
    GENERIC MAP ( width => 1, depth => 7, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => sRPostExc_uid143_fpDivTest_q, xout => redist2_sRPostExc_uid143_fpDivTest_q_8_q, clk => clk, aclr => areset, ena => '1' );

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- fracXExt_uid77_fpDivTest(BITJOIN,76)@25
    fracXExt_uid77_fpDivTest_q <= redist28_fracX_uid10_fpDivTest_b_25_outputreg0_q & GND_q;

    -- redist13_lOAdded_uid57_fpDivTest_q_6_notEnable(LOGICAL,251)
    redist13_lOAdded_uid57_fpDivTest_q_6_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist13_lOAdded_uid57_fpDivTest_q_6_nor(LOGICAL,252)
    redist13_lOAdded_uid57_fpDivTest_q_6_nor_q <= not (redist13_lOAdded_uid57_fpDivTest_q_6_notEnable_q or redist13_lOAdded_uid57_fpDivTest_q_6_sticky_ena_q);

    -- redist13_lOAdded_uid57_fpDivTest_q_6_mem_last(CONSTANT,248)
    redist13_lOAdded_uid57_fpDivTest_q_6_mem_last_q <= "010";

    -- redist13_lOAdded_uid57_fpDivTest_q_6_cmp(LOGICAL,249)
    redist13_lOAdded_uid57_fpDivTest_q_6_cmp_b <= STD_LOGIC_VECTOR("0" & redist13_lOAdded_uid57_fpDivTest_q_6_rdcnt_q);
    redist13_lOAdded_uid57_fpDivTest_q_6_cmp_q <= "1" WHEN redist13_lOAdded_uid57_fpDivTest_q_6_mem_last_q = redist13_lOAdded_uid57_fpDivTest_q_6_cmp_b ELSE "0";

    -- redist13_lOAdded_uid57_fpDivTest_q_6_cmpReg(REG,250)
    redist13_lOAdded_uid57_fpDivTest_q_6_cmpReg_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist13_lOAdded_uid57_fpDivTest_q_6_cmpReg_q <= "0";
            ELSE
                redist13_lOAdded_uid57_fpDivTest_q_6_cmpReg_q <= STD_LOGIC_VECTOR(redist13_lOAdded_uid57_fpDivTest_q_6_cmp_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist13_lOAdded_uid57_fpDivTest_q_6_sticky_ena(REG,253)
    redist13_lOAdded_uid57_fpDivTest_q_6_sticky_ena_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist13_lOAdded_uid57_fpDivTest_q_6_sticky_ena_q <= "0";
            ELSE
                IF (redist13_lOAdded_uid57_fpDivTest_q_6_nor_q = "1") THEN
                    redist13_lOAdded_uid57_fpDivTest_q_6_sticky_ena_q <= STD_LOGIC_VECTOR(redist13_lOAdded_uid57_fpDivTest_q_6_cmpReg_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist13_lOAdded_uid57_fpDivTest_q_6_enaAnd(LOGICAL,254)
    redist13_lOAdded_uid57_fpDivTest_q_6_enaAnd_q <= redist13_lOAdded_uid57_fpDivTest_q_6_sticky_ena_q and VCC_q;

    -- redist13_lOAdded_uid57_fpDivTest_q_6_rdcnt(COUNTER,246)
    -- low=0, high=3, step=1, init=0
    redist13_lOAdded_uid57_fpDivTest_q_6_rdcnt_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist13_lOAdded_uid57_fpDivTest_q_6_rdcnt_i <= TO_UNSIGNED(0, 2);
            ELSE
                redist13_lOAdded_uid57_fpDivTest_q_6_rdcnt_i <= redist13_lOAdded_uid57_fpDivTest_q_6_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist13_lOAdded_uid57_fpDivTest_q_6_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist13_lOAdded_uid57_fpDivTest_q_6_rdcnt_i, 2)));

    -- lOAdded_uid57_fpDivTest(BITJOIN,56)@17
    lOAdded_uid57_fpDivTest_q <= VCC_q & redist27_fracX_uid10_fpDivTest_b_17_outputreg0_q;

    -- redist13_lOAdded_uid57_fpDivTest_q_6_inputreg0(DELAY,244)
    redist13_lOAdded_uid57_fpDivTest_q_6_inputreg0_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist13_lOAdded_uid57_fpDivTest_q_6_inputreg0_q <= (others => '0');
            ELSE
                redist13_lOAdded_uid57_fpDivTest_q_6_inputreg0_q <= STD_LOGIC_VECTOR(lOAdded_uid57_fpDivTest_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist13_lOAdded_uid57_fpDivTest_q_6_wraddr(REG,247)
    redist13_lOAdded_uid57_fpDivTest_q_6_wraddr_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist13_lOAdded_uid57_fpDivTest_q_6_wraddr_q <= "11";
            ELSE
                redist13_lOAdded_uid57_fpDivTest_q_6_wraddr_q <= STD_LOGIC_VECTOR(redist13_lOAdded_uid57_fpDivTest_q_6_rdcnt_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist13_lOAdded_uid57_fpDivTest_q_6_mem(DUALMEM,245)
    redist13_lOAdded_uid57_fpDivTest_q_6_mem_ia <= STD_LOGIC_VECTOR(redist13_lOAdded_uid57_fpDivTest_q_6_inputreg0_q);
    redist13_lOAdded_uid57_fpDivTest_q_6_mem_aa <= redist13_lOAdded_uid57_fpDivTest_q_6_wraddr_q;
    redist13_lOAdded_uid57_fpDivTest_q_6_mem_ab <= redist13_lOAdded_uid57_fpDivTest_q_6_rdcnt_q;
    redist13_lOAdded_uid57_fpDivTest_q_6_mem_reset0 <= areset;
    redist13_lOAdded_uid57_fpDivTest_q_6_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 24,
        widthad_a => 2,
        numwords_a => 4,
        width_b => 24,
        widthad_b => 2,
        numwords_b => 4,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_sclr_b => "SCLEAR",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Stratix 10"
    )
    PORT MAP (
        clocken1 => redist13_lOAdded_uid57_fpDivTest_q_6_enaAnd_q(0),
        clocken0 => '1',
        clock0 => clk,
        sclr => redist13_lOAdded_uid57_fpDivTest_q_6_mem_reset0,
        clock1 => clk,
        address_a => redist13_lOAdded_uid57_fpDivTest_q_6_mem_aa,
        data_a => redist13_lOAdded_uid57_fpDivTest_q_6_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist13_lOAdded_uid57_fpDivTest_q_6_mem_ab,
        q_b => redist13_lOAdded_uid57_fpDivTest_q_6_mem_iq
    );
    redist13_lOAdded_uid57_fpDivTest_q_6_mem_q <= redist13_lOAdded_uid57_fpDivTest_q_6_mem_iq(23 downto 0);

    -- z4_uid60_fpDivTest(CONSTANT,59)
    z4_uid60_fpDivTest_q <= "0000";

    -- oFracXZ4_uid61_fpDivTest(BITJOIN,60)@23
    oFracXZ4_uid61_fpDivTest_q <= redist13_lOAdded_uid57_fpDivTest_q_6_mem_q & z4_uid60_fpDivTest_q;

    -- yAddr_uid51_fpDivTest(BITSELECT,50)@0
    yAddr_uid51_fpDivTest_b <= fracY_uid13_fpDivTest_b(22 downto 14);

    -- memoryC2_uid152_invTables_lutmem(DUALMEM,182)@0 + 2
    -- in j@20000000
    memoryC2_uid152_invTables_lutmem_aa <= yAddr_uid51_fpDivTest_b;
    memoryC2_uid152_invTables_lutmem_reset0 <= areset;
    memoryC2_uid152_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "ROM",
        width_a => 13,
        widthad_a => 9,
        numwords_a => 512,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_sclr_a => "SCLEAR",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "float32_div_altera_fp_functions_191_77egmta_memoryC2_uid152_invTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Stratix 10"
    )
    PORT MAP (
        clocken0 => '1',
        sclr => memoryC2_uid152_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC2_uid152_invTables_lutmem_aa,
        q_a => memoryC2_uid152_invTables_lutmem_ir
    );
    memoryC2_uid152_invTables_lutmem_r <= memoryC2_uid152_invTables_lutmem_ir(12 downto 0);

    -- redist0_memoryC2_uid152_invTables_lutmem_r_1(DELAY,187)
    redist0_memoryC2_uid152_invTables_lutmem_r_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist0_memoryC2_uid152_invTables_lutmem_r_1_q <= (others => '0');
            ELSE
                redist0_memoryC2_uid152_invTables_lutmem_r_1_q <= STD_LOGIC_VECTOR(memoryC2_uid152_invTables_lutmem_r);
            END IF;
        END IF;
    END PROCESS;

    -- yPE_uid52_fpDivTest(BITSELECT,51)@0
    yPE_uid52_fpDivTest_b <= b(13 downto 0);

    -- redist16_yPE_uid52_fpDivTest_b_3(DELAY,203)
    redist16_yPE_uid52_fpDivTest_b_3_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist16_yPE_uid52_fpDivTest_b_3_delay_0 <= (others => '0');
                redist16_yPE_uid52_fpDivTest_b_3_delay_1 <= (others => '0');
                redist16_yPE_uid52_fpDivTest_b_3_q <= (others => '0');
            ELSE
                redist16_yPE_uid52_fpDivTest_b_3_delay_0 <= STD_LOGIC_VECTOR(yPE_uid52_fpDivTest_b);
                redist16_yPE_uid52_fpDivTest_b_3_delay_1 <= redist16_yPE_uid52_fpDivTest_b_3_delay_0;
                redist16_yPE_uid52_fpDivTest_b_3_q <= redist16_yPE_uid52_fpDivTest_b_3_delay_1;
            END IF;
        END IF;
    END PROCESS;

    -- yT1_uid158_invPolyEval(BITSELECT,157)@3
    yT1_uid158_invPolyEval_b <= redist16_yPE_uid52_fpDivTest_b_3_q(13 downto 1);

    -- prodXY_uid174_pT1_uid159_invPolyEval_cma(CHAINMULTADD,185)@3 + 5
    -- out q@9
    prodXY_uid174_pT1_uid159_invPolyEval_cma_reset <= areset;
    prodXY_uid174_pT1_uid159_invPolyEval_cma_ena0 <= '1';
    prodXY_uid174_pT1_uid159_invPolyEval_cma_ena1 <= prodXY_uid174_pT1_uid159_invPolyEval_cma_ena0;
    prodXY_uid174_pT1_uid159_invPolyEval_cma_ena2 <= prodXY_uid174_pT1_uid159_invPolyEval_cma_ena0;
    prodXY_uid174_pT1_uid159_invPolyEval_cma_chainmultadd_hyper: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (false) THEN
            ELSE
                prodXY_uid174_pT1_uid159_invPolyEval_cma_ah(0) <= RESIZE(UNSIGNED(yT1_uid158_invPolyEval_b),13);
                prodXY_uid174_pT1_uid159_invPolyEval_cma_ch(0) <= RESIZE(SIGNED(redist0_memoryC2_uid152_invTables_lutmem_r_1_q),13);
            END IF;
        END IF;
    END PROCESS;

    prodXY_uid174_pT1_uid159_invPolyEval_cma_a0 <= STD_LOGIC_VECTOR(prodXY_uid174_pT1_uid159_invPolyEval_cma_ah(0));
    prodXY_uid174_pT1_uid159_invPolyEval_cma_c0 <= STD_LOGIC_VECTOR(prodXY_uid174_pT1_uid159_invPolyEval_cma_ch(0));
    prodXY_uid174_pT1_uid159_invPolyEval_cma_DSP0 : fourteennm_mac
    GENERIC MAP (
        operation_mode => "m18x18_full",
        clear_type => "sclr",
        ay_scan_in_clock => "0",
        ay_scan_in_width => 13,
        ax_clock => "0",
        ax_width => 13,
        signed_may => "false",
        signed_max => "true",
        input_pipeline_clock => "2",
        second_pipeline_clock => "2",
        output_clock => "1",
        result_a_width => 26,
        bx_width => 0,
        by_width => 0,
        result_b_width => 0
    )
    PORT MAP (
        clk(0) => clk,
        clk(1) => clk,
        clk(2) => clk,
        ena(0) => prodXY_uid174_pT1_uid159_invPolyEval_cma_ena0,
        ena(1) => prodXY_uid174_pT1_uid159_invPolyEval_cma_ena1,
        ena(2) => prodXY_uid174_pT1_uid159_invPolyEval_cma_ena2,
        clr(0) => prodXY_uid174_pT1_uid159_invPolyEval_cma_reset,
        clr(1) => prodXY_uid174_pT1_uid159_invPolyEval_cma_reset,
        ay => prodXY_uid174_pT1_uid159_invPolyEval_cma_a0,
        ax => prodXY_uid174_pT1_uid159_invPolyEval_cma_c0,
        resulta => prodXY_uid174_pT1_uid159_invPolyEval_cma_s0
    );
    prodXY_uid174_pT1_uid159_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 26, depth => 1, reset_kind => "NONE", phase => 0, modulus => 1 )
    PORT MAP ( xin => prodXY_uid174_pT1_uid159_invPolyEval_cma_s0, xout => prodXY_uid174_pT1_uid159_invPolyEval_cma_qq, clk => clk, aclr => areset, ena => '1' );
    prodXY_uid174_pT1_uid159_invPolyEval_cma_q <= STD_LOGIC_VECTOR(prodXY_uid174_pT1_uid159_invPolyEval_cma_qq(25 downto 0));

    -- osig_uid175_pT1_uid159_invPolyEval(BITSELECT,174)@9
    osig_uid175_pT1_uid159_invPolyEval_b <= STD_LOGIC_VECTOR(prodXY_uid174_pT1_uid159_invPolyEval_cma_q(25 downto 12));

    -- highBBits_uid161_invPolyEval(BITSELECT,160)@9
    highBBits_uid161_invPolyEval_b <= STD_LOGIC_VECTOR(osig_uid175_pT1_uid159_invPolyEval_b(13 downto 1));

    -- redist18_yAddr_uid51_fpDivTest_b_7_notEnable(LOGICAL,273)
    redist18_yAddr_uid51_fpDivTest_b_7_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist18_yAddr_uid51_fpDivTest_b_7_nor(LOGICAL,274)
    redist18_yAddr_uid51_fpDivTest_b_7_nor_q <= not (redist18_yAddr_uid51_fpDivTest_b_7_notEnable_q or redist18_yAddr_uid51_fpDivTest_b_7_sticky_ena_q);

    -- redist18_yAddr_uid51_fpDivTest_b_7_mem_last(CONSTANT,270)
    redist18_yAddr_uid51_fpDivTest_b_7_mem_last_q <= "011";

    -- redist18_yAddr_uid51_fpDivTest_b_7_cmp(LOGICAL,271)
    redist18_yAddr_uid51_fpDivTest_b_7_cmp_q <= "1" WHEN redist18_yAddr_uid51_fpDivTest_b_7_mem_last_q = redist18_yAddr_uid51_fpDivTest_b_7_rdcnt_q ELSE "0";

    -- redist18_yAddr_uid51_fpDivTest_b_7_cmpReg(REG,272)
    redist18_yAddr_uid51_fpDivTest_b_7_cmpReg_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist18_yAddr_uid51_fpDivTest_b_7_cmpReg_q <= "0";
            ELSE
                redist18_yAddr_uid51_fpDivTest_b_7_cmpReg_q <= STD_LOGIC_VECTOR(redist18_yAddr_uid51_fpDivTest_b_7_cmp_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist18_yAddr_uid51_fpDivTest_b_7_sticky_ena(REG,275)
    redist18_yAddr_uid51_fpDivTest_b_7_sticky_ena_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist18_yAddr_uid51_fpDivTest_b_7_sticky_ena_q <= "0";
            ELSE
                IF (redist18_yAddr_uid51_fpDivTest_b_7_nor_q = "1") THEN
                    redist18_yAddr_uid51_fpDivTest_b_7_sticky_ena_q <= STD_LOGIC_VECTOR(redist18_yAddr_uid51_fpDivTest_b_7_cmpReg_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist18_yAddr_uid51_fpDivTest_b_7_enaAnd(LOGICAL,276)
    redist18_yAddr_uid51_fpDivTest_b_7_enaAnd_q <= redist18_yAddr_uid51_fpDivTest_b_7_sticky_ena_q and VCC_q;

    -- redist18_yAddr_uid51_fpDivTest_b_7_rdcnt(COUNTER,268)
    -- low=0, high=4, step=1, init=0
    redist18_yAddr_uid51_fpDivTest_b_7_rdcnt_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist18_yAddr_uid51_fpDivTest_b_7_rdcnt_i <= TO_UNSIGNED(0, 3);
                redist18_yAddr_uid51_fpDivTest_b_7_rdcnt_eq <= '0';
            ELSE
                IF (redist18_yAddr_uid51_fpDivTest_b_7_rdcnt_i = TO_UNSIGNED(3, 3)) THEN
                    redist18_yAddr_uid51_fpDivTest_b_7_rdcnt_eq <= '1';
                ELSE
                    redist18_yAddr_uid51_fpDivTest_b_7_rdcnt_eq <= '0';
                END IF;
                IF (redist18_yAddr_uid51_fpDivTest_b_7_rdcnt_eq = '1') THEN
                    redist18_yAddr_uid51_fpDivTest_b_7_rdcnt_i <= redist18_yAddr_uid51_fpDivTest_b_7_rdcnt_i + 4;
                ELSE
                    redist18_yAddr_uid51_fpDivTest_b_7_rdcnt_i <= redist18_yAddr_uid51_fpDivTest_b_7_rdcnt_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    redist18_yAddr_uid51_fpDivTest_b_7_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist18_yAddr_uid51_fpDivTest_b_7_rdcnt_i, 3)));

    -- redist18_yAddr_uid51_fpDivTest_b_7_wraddr(REG,269)
    redist18_yAddr_uid51_fpDivTest_b_7_wraddr_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist18_yAddr_uid51_fpDivTest_b_7_wraddr_q <= "100";
            ELSE
                redist18_yAddr_uid51_fpDivTest_b_7_wraddr_q <= STD_LOGIC_VECTOR(redist18_yAddr_uid51_fpDivTest_b_7_rdcnt_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist18_yAddr_uid51_fpDivTest_b_7_mem(DUALMEM,267)
    redist18_yAddr_uid51_fpDivTest_b_7_mem_ia <= STD_LOGIC_VECTOR(yAddr_uid51_fpDivTest_b);
    redist18_yAddr_uid51_fpDivTest_b_7_mem_aa <= redist18_yAddr_uid51_fpDivTest_b_7_wraddr_q;
    redist18_yAddr_uid51_fpDivTest_b_7_mem_ab <= redist18_yAddr_uid51_fpDivTest_b_7_rdcnt_q;
    redist18_yAddr_uid51_fpDivTest_b_7_mem_reset0 <= areset;
    redist18_yAddr_uid51_fpDivTest_b_7_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 9,
        widthad_a => 3,
        numwords_a => 5,
        width_b => 9,
        widthad_b => 3,
        numwords_b => 5,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_sclr_b => "SCLEAR",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Stratix 10"
    )
    PORT MAP (
        clocken1 => redist18_yAddr_uid51_fpDivTest_b_7_enaAnd_q(0),
        clocken0 => '1',
        clock0 => clk,
        sclr => redist18_yAddr_uid51_fpDivTest_b_7_mem_reset0,
        clock1 => clk,
        address_a => redist18_yAddr_uid51_fpDivTest_b_7_mem_aa,
        data_a => redist18_yAddr_uid51_fpDivTest_b_7_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist18_yAddr_uid51_fpDivTest_b_7_mem_ab,
        q_b => redist18_yAddr_uid51_fpDivTest_b_7_mem_iq
    );
    redist18_yAddr_uid51_fpDivTest_b_7_mem_q <= redist18_yAddr_uid51_fpDivTest_b_7_mem_iq(8 downto 0);

    -- redist18_yAddr_uid51_fpDivTest_b_7_outputreg0(DELAY,266)
    redist18_yAddr_uid51_fpDivTest_b_7_outputreg0_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist18_yAddr_uid51_fpDivTest_b_7_outputreg0_q <= (others => '0');
            ELSE
                redist18_yAddr_uid51_fpDivTest_b_7_outputreg0_q <= STD_LOGIC_VECTOR(redist18_yAddr_uid51_fpDivTest_b_7_mem_q);
            END IF;
        END IF;
    END PROCESS;

    -- memoryC1_uid149_invTables_lutmem(DUALMEM,181)@7 + 2
    -- in j@20000000
    memoryC1_uid149_invTables_lutmem_aa <= redist18_yAddr_uid51_fpDivTest_b_7_outputreg0_q;
    memoryC1_uid149_invTables_lutmem_reset0 <= areset;
    memoryC1_uid149_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "ROM",
        width_a => 22,
        widthad_a => 9,
        numwords_a => 512,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_sclr_a => "SCLEAR",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "float32_div_altera_fp_functions_191_77egmta_memoryC1_uid149_invTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Stratix 10"
    )
    PORT MAP (
        clocken0 => '1',
        sclr => memoryC1_uid149_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC1_uid149_invTables_lutmem_aa,
        q_a => memoryC1_uid149_invTables_lutmem_ir
    );
    memoryC1_uid149_invTables_lutmem_r <= memoryC1_uid149_invTables_lutmem_ir(21 downto 0);

    -- s1sumAHighB_uid162_invPolyEval(ADD,161)@9 + 1
    s1sumAHighB_uid162_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((22 downto 22 => memoryC1_uid149_invTables_lutmem_r(21)) & memoryC1_uid149_invTables_lutmem_r));
    s1sumAHighB_uid162_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((22 downto 13 => highBBits_uid161_invPolyEval_b(12)) & highBBits_uid161_invPolyEval_b));
    s1sumAHighB_uid162_invPolyEval_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                s1sumAHighB_uid162_invPolyEval_o <= (others => '0');
            ELSE
                s1sumAHighB_uid162_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(s1sumAHighB_uid162_invPolyEval_a) + SIGNED(s1sumAHighB_uid162_invPolyEval_b));
            END IF;
        END IF;
    END PROCESS;
    s1sumAHighB_uid162_invPolyEval_q <= s1sumAHighB_uid162_invPolyEval_o(22 downto 0);

    -- lowRangeB_uid160_invPolyEval(BITSELECT,159)@9
    lowRangeB_uid160_invPolyEval_in <= osig_uid175_pT1_uid159_invPolyEval_b(0 downto 0);
    lowRangeB_uid160_invPolyEval_b <= lowRangeB_uid160_invPolyEval_in(0 downto 0);

    -- redist1_lowRangeB_uid160_invPolyEval_b_1(DELAY,188)
    redist1_lowRangeB_uid160_invPolyEval_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist1_lowRangeB_uid160_invPolyEval_b_1_q <= (others => '0');
            ELSE
                redist1_lowRangeB_uid160_invPolyEval_b_1_q <= STD_LOGIC_VECTOR(lowRangeB_uid160_invPolyEval_b);
            END IF;
        END IF;
    END PROCESS;

    -- s1_uid163_invPolyEval(BITJOIN,162)@10
    s1_uid163_invPolyEval_q <= s1sumAHighB_uid162_invPolyEval_q & redist1_lowRangeB_uid160_invPolyEval_b_1_q;

    -- redist17_yPE_uid52_fpDivTest_b_10_notEnable(LOGICAL,262)
    redist17_yPE_uid52_fpDivTest_b_10_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist17_yPE_uid52_fpDivTest_b_10_nor(LOGICAL,263)
    redist17_yPE_uid52_fpDivTest_b_10_nor_q <= not (redist17_yPE_uid52_fpDivTest_b_10_notEnable_q or redist17_yPE_uid52_fpDivTest_b_10_sticky_ena_q);

    -- redist17_yPE_uid52_fpDivTest_b_10_mem_last(CONSTANT,259)
    redist17_yPE_uid52_fpDivTest_b_10_mem_last_q <= "011";

    -- redist17_yPE_uid52_fpDivTest_b_10_cmp(LOGICAL,260)
    redist17_yPE_uid52_fpDivTest_b_10_cmp_q <= "1" WHEN redist17_yPE_uid52_fpDivTest_b_10_mem_last_q = redist17_yPE_uid52_fpDivTest_b_10_rdcnt_q ELSE "0";

    -- redist17_yPE_uid52_fpDivTest_b_10_cmpReg(REG,261)
    redist17_yPE_uid52_fpDivTest_b_10_cmpReg_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist17_yPE_uid52_fpDivTest_b_10_cmpReg_q <= "0";
            ELSE
                redist17_yPE_uid52_fpDivTest_b_10_cmpReg_q <= STD_LOGIC_VECTOR(redist17_yPE_uid52_fpDivTest_b_10_cmp_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist17_yPE_uid52_fpDivTest_b_10_sticky_ena(REG,264)
    redist17_yPE_uid52_fpDivTest_b_10_sticky_ena_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist17_yPE_uid52_fpDivTest_b_10_sticky_ena_q <= "0";
            ELSE
                IF (redist17_yPE_uid52_fpDivTest_b_10_nor_q = "1") THEN
                    redist17_yPE_uid52_fpDivTest_b_10_sticky_ena_q <= STD_LOGIC_VECTOR(redist17_yPE_uid52_fpDivTest_b_10_cmpReg_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist17_yPE_uid52_fpDivTest_b_10_enaAnd(LOGICAL,265)
    redist17_yPE_uid52_fpDivTest_b_10_enaAnd_q <= redist17_yPE_uid52_fpDivTest_b_10_sticky_ena_q and VCC_q;

    -- redist17_yPE_uid52_fpDivTest_b_10_rdcnt(COUNTER,257)
    -- low=0, high=4, step=1, init=0
    redist17_yPE_uid52_fpDivTest_b_10_rdcnt_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist17_yPE_uid52_fpDivTest_b_10_rdcnt_i <= TO_UNSIGNED(0, 3);
                redist17_yPE_uid52_fpDivTest_b_10_rdcnt_eq <= '0';
            ELSE
                IF (redist17_yPE_uid52_fpDivTest_b_10_rdcnt_i = TO_UNSIGNED(3, 3)) THEN
                    redist17_yPE_uid52_fpDivTest_b_10_rdcnt_eq <= '1';
                ELSE
                    redist17_yPE_uid52_fpDivTest_b_10_rdcnt_eq <= '0';
                END IF;
                IF (redist17_yPE_uid52_fpDivTest_b_10_rdcnt_eq = '1') THEN
                    redist17_yPE_uid52_fpDivTest_b_10_rdcnt_i <= redist17_yPE_uid52_fpDivTest_b_10_rdcnt_i + 4;
                ELSE
                    redist17_yPE_uid52_fpDivTest_b_10_rdcnt_i <= redist17_yPE_uid52_fpDivTest_b_10_rdcnt_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    redist17_yPE_uid52_fpDivTest_b_10_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist17_yPE_uid52_fpDivTest_b_10_rdcnt_i, 3)));

    -- redist17_yPE_uid52_fpDivTest_b_10_wraddr(REG,258)
    redist17_yPE_uid52_fpDivTest_b_10_wraddr_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist17_yPE_uid52_fpDivTest_b_10_wraddr_q <= "100";
            ELSE
                redist17_yPE_uid52_fpDivTest_b_10_wraddr_q <= STD_LOGIC_VECTOR(redist17_yPE_uid52_fpDivTest_b_10_rdcnt_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist17_yPE_uid52_fpDivTest_b_10_mem(DUALMEM,256)
    redist17_yPE_uid52_fpDivTest_b_10_mem_ia <= STD_LOGIC_VECTOR(redist16_yPE_uid52_fpDivTest_b_3_q);
    redist17_yPE_uid52_fpDivTest_b_10_mem_aa <= redist17_yPE_uid52_fpDivTest_b_10_wraddr_q;
    redist17_yPE_uid52_fpDivTest_b_10_mem_ab <= redist17_yPE_uid52_fpDivTest_b_10_rdcnt_q;
    redist17_yPE_uid52_fpDivTest_b_10_mem_reset0 <= areset;
    redist17_yPE_uid52_fpDivTest_b_10_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 14,
        widthad_a => 3,
        numwords_a => 5,
        width_b => 14,
        widthad_b => 3,
        numwords_b => 5,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_sclr_b => "SCLEAR",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Stratix 10"
    )
    PORT MAP (
        clocken1 => redist17_yPE_uid52_fpDivTest_b_10_enaAnd_q(0),
        clocken0 => '1',
        clock0 => clk,
        sclr => redist17_yPE_uid52_fpDivTest_b_10_mem_reset0,
        clock1 => clk,
        address_a => redist17_yPE_uid52_fpDivTest_b_10_mem_aa,
        data_a => redist17_yPE_uid52_fpDivTest_b_10_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist17_yPE_uid52_fpDivTest_b_10_mem_ab,
        q_b => redist17_yPE_uid52_fpDivTest_b_10_mem_iq
    );
    redist17_yPE_uid52_fpDivTest_b_10_mem_q <= redist17_yPE_uid52_fpDivTest_b_10_mem_iq(13 downto 0);

    -- redist17_yPE_uid52_fpDivTest_b_10_outputreg0(DELAY,255)
    redist17_yPE_uid52_fpDivTest_b_10_outputreg0_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist17_yPE_uid52_fpDivTest_b_10_outputreg0_q <= (others => '0');
            ELSE
                redist17_yPE_uid52_fpDivTest_b_10_outputreg0_q <= STD_LOGIC_VECTOR(redist17_yPE_uid52_fpDivTest_b_10_mem_q);
            END IF;
        END IF;
    END PROCESS;

    -- prodXY_uid177_pT2_uid165_invPolyEval_cma(CHAINMULTADD,186)@10 + 5
    -- out q@16
    prodXY_uid177_pT2_uid165_invPolyEval_cma_reset <= areset;
    prodXY_uid177_pT2_uid165_invPolyEval_cma_ena0 <= '1';
    prodXY_uid177_pT2_uid165_invPolyEval_cma_ena1 <= prodXY_uid177_pT2_uid165_invPolyEval_cma_ena0;
    prodXY_uid177_pT2_uid165_invPolyEval_cma_ena2 <= prodXY_uid177_pT2_uid165_invPolyEval_cma_ena0;
    prodXY_uid177_pT2_uid165_invPolyEval_cma_chainmultadd_hyper: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (false) THEN
            ELSE
                prodXY_uid177_pT2_uid165_invPolyEval_cma_ah(0) <= RESIZE(UNSIGNED(redist17_yPE_uid52_fpDivTest_b_10_outputreg0_q),14);
                prodXY_uid177_pT2_uid165_invPolyEval_cma_ch(0) <= RESIZE(SIGNED(s1_uid163_invPolyEval_q),24);
            END IF;
        END IF;
    END PROCESS;

    prodXY_uid177_pT2_uid165_invPolyEval_cma_a0 <= STD_LOGIC_VECTOR(prodXY_uid177_pT2_uid165_invPolyEval_cma_ah(0));
    prodXY_uid177_pT2_uid165_invPolyEval_cma_c0 <= STD_LOGIC_VECTOR(prodXY_uid177_pT2_uid165_invPolyEval_cma_ch(0));
    prodXY_uid177_pT2_uid165_invPolyEval_cma_DSP0 : fourteennm_mac
    GENERIC MAP (
        operation_mode => "m27x27",
        clear_type => "sclr",
        use_chainadder => "false",
        ay_scan_in_clock => "0",
        ay_scan_in_width => 14,
        ax_clock => "0",
        ax_width => 24,
        signed_may => "false",
        signed_max => "true",
        input_pipeline_clock => "2",
        second_pipeline_clock => "2",
        output_clock => "1",
        result_a_width => 38
    )
    PORT MAP (
        clk(0) => clk,
        clk(1) => clk,
        clk(2) => clk,
        ena(0) => prodXY_uid177_pT2_uid165_invPolyEval_cma_ena0,
        ena(1) => prodXY_uid177_pT2_uid165_invPolyEval_cma_ena1,
        ena(2) => prodXY_uid177_pT2_uid165_invPolyEval_cma_ena2,
        clr(0) => prodXY_uid177_pT2_uid165_invPolyEval_cma_reset,
        clr(1) => prodXY_uid177_pT2_uid165_invPolyEval_cma_reset,
        ay => prodXY_uid177_pT2_uid165_invPolyEval_cma_a0,
        ax => prodXY_uid177_pT2_uid165_invPolyEval_cma_c0,
        resulta => prodXY_uid177_pT2_uid165_invPolyEval_cma_s0
    );
    prodXY_uid177_pT2_uid165_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 38, depth => 1, reset_kind => "NONE", phase => 0, modulus => 1 )
    PORT MAP ( xin => prodXY_uid177_pT2_uid165_invPolyEval_cma_s0, xout => prodXY_uid177_pT2_uid165_invPolyEval_cma_qq, clk => clk, aclr => areset, ena => '1' );
    prodXY_uid177_pT2_uid165_invPolyEval_cma_q <= STD_LOGIC_VECTOR(prodXY_uid177_pT2_uid165_invPolyEval_cma_qq(37 downto 0));

    -- osig_uid178_pT2_uid165_invPolyEval(BITSELECT,177)@16
    osig_uid178_pT2_uid165_invPolyEval_b <= STD_LOGIC_VECTOR(prodXY_uid177_pT2_uid165_invPolyEval_cma_q(37 downto 13));

    -- highBBits_uid167_invPolyEval(BITSELECT,166)@16
    highBBits_uid167_invPolyEval_b <= STD_LOGIC_VECTOR(osig_uid178_pT2_uid165_invPolyEval_b(24 downto 2));

    -- redist19_yAddr_uid51_fpDivTest_b_14_inputreg0(DELAY,277)
    redist19_yAddr_uid51_fpDivTest_b_14_inputreg0_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist19_yAddr_uid51_fpDivTest_b_14_inputreg0_q <= (others => '0');
            ELSE
                redist19_yAddr_uid51_fpDivTest_b_14_inputreg0_q <= STD_LOGIC_VECTOR(redist18_yAddr_uid51_fpDivTest_b_7_outputreg0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist19_yAddr_uid51_fpDivTest_b_14(DELAY,206)
    redist19_yAddr_uid51_fpDivTest_b_14_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist19_yAddr_uid51_fpDivTest_b_14_delay_0 <= (others => '0');
                redist19_yAddr_uid51_fpDivTest_b_14_delay_1 <= (others => '0');
                redist19_yAddr_uid51_fpDivTest_b_14_delay_2 <= (others => '0');
                redist19_yAddr_uid51_fpDivTest_b_14_delay_3 <= (others => '0');
                redist19_yAddr_uid51_fpDivTest_b_14_q <= (others => '0');
            ELSE
                redist19_yAddr_uid51_fpDivTest_b_14_delay_0 <= STD_LOGIC_VECTOR(redist19_yAddr_uid51_fpDivTest_b_14_inputreg0_q);
                redist19_yAddr_uid51_fpDivTest_b_14_delay_1 <= redist19_yAddr_uid51_fpDivTest_b_14_delay_0;
                redist19_yAddr_uid51_fpDivTest_b_14_delay_2 <= redist19_yAddr_uid51_fpDivTest_b_14_delay_1;
                redist19_yAddr_uid51_fpDivTest_b_14_delay_3 <= redist19_yAddr_uid51_fpDivTest_b_14_delay_2;
                redist19_yAddr_uid51_fpDivTest_b_14_q <= redist19_yAddr_uid51_fpDivTest_b_14_delay_3;
            END IF;
        END IF;
    END PROCESS;

    -- redist19_yAddr_uid51_fpDivTest_b_14_outputreg0(DELAY,278)
    redist19_yAddr_uid51_fpDivTest_b_14_outputreg0_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist19_yAddr_uid51_fpDivTest_b_14_outputreg0_q <= (others => '0');
            ELSE
                redist19_yAddr_uid51_fpDivTest_b_14_outputreg0_q <= STD_LOGIC_VECTOR(redist19_yAddr_uid51_fpDivTest_b_14_q);
            END IF;
        END IF;
    END PROCESS;

    -- memoryC0_uid146_invTables_lutmem(DUALMEM,180)@14 + 2
    -- in j@20000000
    memoryC0_uid146_invTables_lutmem_aa <= redist19_yAddr_uid51_fpDivTest_b_14_outputreg0_q;
    memoryC0_uid146_invTables_lutmem_reset0 <= areset;
    memoryC0_uid146_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "ROM",
        width_a => 32,
        widthad_a => 9,
        numwords_a => 512,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_sclr_a => "SCLEAR",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "float32_div_altera_fp_functions_191_77egmta_memoryC0_uid146_invTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Stratix 10"
    )
    PORT MAP (
        clocken0 => '1',
        sclr => memoryC0_uid146_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC0_uid146_invTables_lutmem_aa,
        q_a => memoryC0_uid146_invTables_lutmem_ir
    );
    memoryC0_uid146_invTables_lutmem_r <= memoryC0_uid146_invTables_lutmem_ir(31 downto 0);

    -- s2sumAHighB_uid168_invPolyEval(ADD,167)@16
    s2sumAHighB_uid168_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((32 downto 32 => memoryC0_uid146_invTables_lutmem_r(31)) & memoryC0_uid146_invTables_lutmem_r));
    s2sumAHighB_uid168_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((32 downto 23 => highBBits_uid167_invPolyEval_b(22)) & highBBits_uid167_invPolyEval_b));
    s2sumAHighB_uid168_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(s2sumAHighB_uid168_invPolyEval_a) + SIGNED(s2sumAHighB_uid168_invPolyEval_b));
    s2sumAHighB_uid168_invPolyEval_q <= s2sumAHighB_uid168_invPolyEval_o(32 downto 0);

    -- lowRangeB_uid166_invPolyEval(BITSELECT,165)@16
    lowRangeB_uid166_invPolyEval_in <= osig_uid178_pT2_uid165_invPolyEval_b(1 downto 0);
    lowRangeB_uid166_invPolyEval_b <= lowRangeB_uid166_invPolyEval_in(1 downto 0);

    -- s2_uid169_invPolyEval(BITJOIN,168)@16
    s2_uid169_invPolyEval_q <= s2sumAHighB_uid168_invPolyEval_q & lowRangeB_uid166_invPolyEval_b;

    -- invY_uid54_fpDivTest(BITSELECT,53)@16
    invY_uid54_fpDivTest_in <= s2_uid169_invPolyEval_q(31 downto 0);
    invY_uid54_fpDivTest_b <= invY_uid54_fpDivTest_in(31 downto 5);

    -- redist15_invY_uid54_fpDivTest_b_1(DELAY,202)
    redist15_invY_uid54_fpDivTest_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist15_invY_uid54_fpDivTest_b_1_q <= (others => '0');
            ELSE
                redist15_invY_uid54_fpDivTest_b_1_q <= STD_LOGIC_VECTOR(invY_uid54_fpDivTest_b);
            END IF;
        END IF;
    END PROCESS;

    -- prodXY_uid171_divValPreNorm_uid59_fpDivTest_cma(CHAINMULTADD,184)@17 + 5
    -- out q@23
    prodXY_uid171_divValPreNorm_uid59_fpDivTest_cma_reset <= areset;
    prodXY_uid171_divValPreNorm_uid59_fpDivTest_cma_ena0 <= '1';
    prodXY_uid171_divValPreNorm_uid59_fpDivTest_cma_ena1 <= prodXY_uid171_divValPreNorm_uid59_fpDivTest_cma_ena0;
    prodXY_uid171_divValPreNorm_uid59_fpDivTest_cma_ena2 <= prodXY_uid171_divValPreNorm_uid59_fpDivTest_cma_ena0;
    prodXY_uid171_divValPreNorm_uid59_fpDivTest_cma_chainmultadd_hyper: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (false) THEN
            ELSE
                prodXY_uid171_divValPreNorm_uid59_fpDivTest_cma_ah(0) <= RESIZE(UNSIGNED(redist15_invY_uid54_fpDivTest_b_1_q),27);
                prodXY_uid171_divValPreNorm_uid59_fpDivTest_cma_ch(0) <= RESIZE(UNSIGNED(lOAdded_uid57_fpDivTest_q),24);
            END IF;
        END IF;
    END PROCESS;

    prodXY_uid171_divValPreNorm_uid59_fpDivTest_cma_a0 <= STD_LOGIC_VECTOR(prodXY_uid171_divValPreNorm_uid59_fpDivTest_cma_ah(0));
    prodXY_uid171_divValPreNorm_uid59_fpDivTest_cma_c0 <= STD_LOGIC_VECTOR(prodXY_uid171_divValPreNorm_uid59_fpDivTest_cma_ch(0));
    prodXY_uid171_divValPreNorm_uid59_fpDivTest_cma_DSP0 : fourteennm_mac
    GENERIC MAP (
        operation_mode => "m27x27",
        clear_type => "sclr",
        use_chainadder => "false",
        ay_scan_in_clock => "0",
        ay_scan_in_width => 27,
        ax_clock => "0",
        ax_width => 24,
        signed_may => "false",
        signed_max => "false",
        input_pipeline_clock => "2",
        second_pipeline_clock => "2",
        output_clock => "1",
        result_a_width => 51
    )
    PORT MAP (
        clk(0) => clk,
        clk(1) => clk,
        clk(2) => clk,
        ena(0) => prodXY_uid171_divValPreNorm_uid59_fpDivTest_cma_ena0,
        ena(1) => prodXY_uid171_divValPreNorm_uid59_fpDivTest_cma_ena1,
        ena(2) => prodXY_uid171_divValPreNorm_uid59_fpDivTest_cma_ena2,
        clr(0) => prodXY_uid171_divValPreNorm_uid59_fpDivTest_cma_reset,
        clr(1) => prodXY_uid171_divValPreNorm_uid59_fpDivTest_cma_reset,
        ay => prodXY_uid171_divValPreNorm_uid59_fpDivTest_cma_a0,
        ax => prodXY_uid171_divValPreNorm_uid59_fpDivTest_cma_c0,
        resulta => prodXY_uid171_divValPreNorm_uid59_fpDivTest_cma_s0
    );
    prodXY_uid171_divValPreNorm_uid59_fpDivTest_cma_delay : dspba_delay
    GENERIC MAP ( width => 51, depth => 1, reset_kind => "NONE", phase => 0, modulus => 1 )
    PORT MAP ( xin => prodXY_uid171_divValPreNorm_uid59_fpDivTest_cma_s0, xout => prodXY_uid171_divValPreNorm_uid59_fpDivTest_cma_qq, clk => clk, aclr => areset, ena => '1' );
    prodXY_uid171_divValPreNorm_uid59_fpDivTest_cma_q <= STD_LOGIC_VECTOR(prodXY_uid171_divValPreNorm_uid59_fpDivTest_cma_qq(50 downto 0));

    -- osig_uid172_divValPreNorm_uid59_fpDivTest(BITSELECT,171)@23
    osig_uid172_divValPreNorm_uid59_fpDivTest_b <= prodXY_uid171_divValPreNorm_uid59_fpDivTest_cma_q(50 downto 23);

    -- updatedY_uid16_fpDivTest(BITJOIN,15)@22
    updatedY_uid16_fpDivTest_q <= GND_q & paddingY_uid15_fpDivTest_q;

    -- fracYZero_uid15_fpDivTest(LOGICAL,16)@22 + 1
    fracYZero_uid15_fpDivTest_a <= STD_LOGIC_VECTOR("0" & redist23_fracY_uid13_fpDivTest_b_22_mem_q);
    fracYZero_uid15_fpDivTest_qi <= "1" WHEN fracYZero_uid15_fpDivTest_a = updatedY_uid16_fpDivTest_q ELSE "0";
    fracYZero_uid15_fpDivTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => fracYZero_uid15_fpDivTest_qi, xout => fracYZero_uid15_fpDivTest_q, clk => clk, aclr => areset, ena => '1' );

    -- divValPreNormYPow2Exc_uid63_fpDivTest(MUX,62)@23
    divValPreNormYPow2Exc_uid63_fpDivTest_s <= fracYZero_uid15_fpDivTest_q;
    divValPreNormYPow2Exc_uid63_fpDivTest_combproc: PROCESS (divValPreNormYPow2Exc_uid63_fpDivTest_s, osig_uid172_divValPreNorm_uid59_fpDivTest_b, oFracXZ4_uid61_fpDivTest_q)
    BEGIN
        CASE (divValPreNormYPow2Exc_uid63_fpDivTest_s) IS
            WHEN "0" => divValPreNormYPow2Exc_uid63_fpDivTest_q <= osig_uid172_divValPreNorm_uid59_fpDivTest_b;
            WHEN "1" => divValPreNormYPow2Exc_uid63_fpDivTest_q <= oFracXZ4_uid61_fpDivTest_q;
            WHEN OTHERS => divValPreNormYPow2Exc_uid63_fpDivTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- norm_uid64_fpDivTest(BITSELECT,63)@23
    norm_uid64_fpDivTest_b <= STD_LOGIC_VECTOR(divValPreNormYPow2Exc_uid63_fpDivTest_q(27 downto 27));

    -- redist12_norm_uid64_fpDivTest_b_1(DELAY,199)
    redist12_norm_uid64_fpDivTest_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist12_norm_uid64_fpDivTest_b_1_q <= (others => '0');
            ELSE
                redist12_norm_uid64_fpDivTest_b_1_q <= STD_LOGIC_VECTOR(norm_uid64_fpDivTest_b);
            END IF;
        END IF;
    END PROCESS;

    -- zeroPaddingInAddition_uid74_fpDivTest(CONSTANT,73)
    zeroPaddingInAddition_uid74_fpDivTest_q <= "000000000000000000000000";

    -- expFracPostRnd_uid75_fpDivTest(BITJOIN,74)@24
    expFracPostRnd_uid75_fpDivTest_q <= redist12_norm_uid64_fpDivTest_b_1_q & zeroPaddingInAddition_uid74_fpDivTest_q & VCC_q;

    -- cstBiasM1_uid6_fpDivTest(CONSTANT,5)
    cstBiasM1_uid6_fpDivTest_q <= "01111110";

    -- expXmY_uid47_fpDivTest(SUB,46)@23
    expXmY_uid47_fpDivTest_a <= STD_LOGIC_VECTOR("0" & redist30_expX_uid9_fpDivTest_b_23_mem_q);
    expXmY_uid47_fpDivTest_b <= STD_LOGIC_VECTOR("0" & redist25_expY_uid12_fpDivTest_b_23_mem_q);
    expXmY_uid47_fpDivTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expXmY_uid47_fpDivTest_a) - UNSIGNED(expXmY_uid47_fpDivTest_b));
    expXmY_uid47_fpDivTest_q <= expXmY_uid47_fpDivTest_o(8 downto 0);

    -- expR_uid48_fpDivTest(ADD,47)@23 + 1
    expR_uid48_fpDivTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((10 downto 9 => expXmY_uid47_fpDivTest_q(8)) & expXmY_uid47_fpDivTest_q));
    expR_uid48_fpDivTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & cstBiasM1_uid6_fpDivTest_q));
    expR_uid48_fpDivTest_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                expR_uid48_fpDivTest_o <= (others => '0');
            ELSE
                expR_uid48_fpDivTest_o <= STD_LOGIC_VECTOR(SIGNED(expR_uid48_fpDivTest_a) + SIGNED(expR_uid48_fpDivTest_b));
            END IF;
        END IF;
    END PROCESS;
    expR_uid48_fpDivTest_q <= expR_uid48_fpDivTest_o(9 downto 0);

    -- divValPreNormHigh_uid65_fpDivTest(BITSELECT,64)@23
    divValPreNormHigh_uid65_fpDivTest_in <= divValPreNormYPow2Exc_uid63_fpDivTest_q(26 downto 0);
    divValPreNormHigh_uid65_fpDivTest_b <= divValPreNormHigh_uid65_fpDivTest_in(26 downto 2);

    -- divValPreNormLow_uid66_fpDivTest(BITSELECT,65)@23
    divValPreNormLow_uid66_fpDivTest_in <= divValPreNormYPow2Exc_uid63_fpDivTest_q(25 downto 0);
    divValPreNormLow_uid66_fpDivTest_b <= divValPreNormLow_uid66_fpDivTest_in(25 downto 1);

    -- normFracRnd_uid67_fpDivTest(MUX,66)@23 + 1
    normFracRnd_uid67_fpDivTest_s <= norm_uid64_fpDivTest_b;
    normFracRnd_uid67_fpDivTest_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                normFracRnd_uid67_fpDivTest_q <= (others => '0');
            ELSE
                CASE (normFracRnd_uid67_fpDivTest_s) IS
                    WHEN "0" => normFracRnd_uid67_fpDivTest_q <= divValPreNormLow_uid66_fpDivTest_b;
                    WHEN "1" => normFracRnd_uid67_fpDivTest_q <= divValPreNormHigh_uid65_fpDivTest_b;
                    WHEN OTHERS => normFracRnd_uid67_fpDivTest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;

    -- expFracRnd_uid68_fpDivTest(BITJOIN,67)@24
    expFracRnd_uid68_fpDivTest_q <= expR_uid48_fpDivTest_q & normFracRnd_uid67_fpDivTest_q;

    -- expFracPostRnd_uid76_fpDivTest(ADD,75)@24 + 1
    expFracPostRnd_uid76_fpDivTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((36 downto 35 => expFracRnd_uid68_fpDivTest_q(34)) & expFracRnd_uid68_fpDivTest_q));
    expFracPostRnd_uid76_fpDivTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("00000000000" & expFracPostRnd_uid75_fpDivTest_q));
    expFracPostRnd_uid76_fpDivTest_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                expFracPostRnd_uid76_fpDivTest_o <= (others => '0');
            ELSE
                expFracPostRnd_uid76_fpDivTest_o <= STD_LOGIC_VECTOR(SIGNED(expFracPostRnd_uid76_fpDivTest_a) + SIGNED(expFracPostRnd_uid76_fpDivTest_b));
            END IF;
        END IF;
    END PROCESS;
    expFracPostRnd_uid76_fpDivTest_q <= expFracPostRnd_uid76_fpDivTest_o(35 downto 0);

    -- fracPostRndF_uid79_fpDivTest(BITSELECT,78)@25
    fracPostRndF_uid79_fpDivTest_in <= expFracPostRnd_uid76_fpDivTest_q(24 downto 0);
    fracPostRndF_uid79_fpDivTest_b <= fracPostRndF_uid79_fpDivTest_in(24 downto 1);

    -- invYO_uid55_fpDivTest(BITSELECT,54)@16
    invYO_uid55_fpDivTest_in <= STD_LOGIC_VECTOR(s2_uid169_invPolyEval_q(32 downto 0));
    invYO_uid55_fpDivTest_b <= STD_LOGIC_VECTOR(invYO_uid55_fpDivTest_in(32 downto 32));

    -- redist14_invYO_uid55_fpDivTest_b_9(DELAY,201)
    redist14_invYO_uid55_fpDivTest_b_9 : dspba_delay
    GENERIC MAP ( width => 1, depth => 9, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => invYO_uid55_fpDivTest_b, xout => redist14_invYO_uid55_fpDivTest_b_9_q, clk => clk, aclr => areset, ena => '1' );

    -- fracPostRndF_uid80_fpDivTest(MUX,79)@25
    fracPostRndF_uid80_fpDivTest_s <= redist14_invYO_uid55_fpDivTest_b_9_q;
    fracPostRndF_uid80_fpDivTest_combproc: PROCESS (fracPostRndF_uid80_fpDivTest_s, fracPostRndF_uid79_fpDivTest_b, fracXExt_uid77_fpDivTest_q)
    BEGIN
        CASE (fracPostRndF_uid80_fpDivTest_s) IS
            WHEN "0" => fracPostRndF_uid80_fpDivTest_q <= fracPostRndF_uid79_fpDivTest_b;
            WHEN "1" => fracPostRndF_uid80_fpDivTest_q <= fracXExt_uid77_fpDivTest_q;
            WHEN OTHERS => fracPostRndF_uid80_fpDivTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- betweenFPwF_uid102_fpDivTest(BITSELECT,101)@25
    betweenFPwF_uid102_fpDivTest_in <= STD_LOGIC_VECTOR(fracPostRndF_uid80_fpDivTest_q(0 downto 0));
    betweenFPwF_uid102_fpDivTest_b <= STD_LOGIC_VECTOR(betweenFPwF_uid102_fpDivTest_in(0 downto 0));

    -- redist7_betweenFPwF_uid102_fpDivTest_b_8(DELAY,194)
    redist7_betweenFPwF_uid102_fpDivTest_b_8 : dspba_delay
    GENERIC MAP ( width => 1, depth => 8, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => betweenFPwF_uid102_fpDivTest_b, xout => redist7_betweenFPwF_uid102_fpDivTest_b_8_q, clk => clk, aclr => areset, ena => '1' );

    -- redist32_expX_uid9_fpDivTest_b_33_notEnable(LOGICAL,351)
    redist32_expX_uid9_fpDivTest_b_33_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist32_expX_uid9_fpDivTest_b_33_nor(LOGICAL,352)
    redist32_expX_uid9_fpDivTest_b_33_nor_q <= not (redist32_expX_uid9_fpDivTest_b_33_notEnable_q or redist32_expX_uid9_fpDivTest_b_33_sticky_ena_q);

    -- redist32_expX_uid9_fpDivTest_b_33_mem_last(CONSTANT,348)
    redist32_expX_uid9_fpDivTest_b_33_mem_last_q <= "0100";

    -- redist32_expX_uid9_fpDivTest_b_33_cmp(LOGICAL,349)
    redist32_expX_uid9_fpDivTest_b_33_cmp_b <= STD_LOGIC_VECTOR("0" & redist32_expX_uid9_fpDivTest_b_33_rdcnt_q);
    redist32_expX_uid9_fpDivTest_b_33_cmp_q <= "1" WHEN redist32_expX_uid9_fpDivTest_b_33_mem_last_q = redist32_expX_uid9_fpDivTest_b_33_cmp_b ELSE "0";

    -- redist32_expX_uid9_fpDivTest_b_33_cmpReg(REG,350)
    redist32_expX_uid9_fpDivTest_b_33_cmpReg_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist32_expX_uid9_fpDivTest_b_33_cmpReg_q <= "0";
            ELSE
                redist32_expX_uid9_fpDivTest_b_33_cmpReg_q <= STD_LOGIC_VECTOR(redist32_expX_uid9_fpDivTest_b_33_cmp_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist32_expX_uid9_fpDivTest_b_33_sticky_ena(REG,353)
    redist32_expX_uid9_fpDivTest_b_33_sticky_ena_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist32_expX_uid9_fpDivTest_b_33_sticky_ena_q <= "0";
            ELSE
                IF (redist32_expX_uid9_fpDivTest_b_33_nor_q = "1") THEN
                    redist32_expX_uid9_fpDivTest_b_33_sticky_ena_q <= STD_LOGIC_VECTOR(redist32_expX_uid9_fpDivTest_b_33_cmpReg_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist32_expX_uid9_fpDivTest_b_33_enaAnd(LOGICAL,354)
    redist32_expX_uid9_fpDivTest_b_33_enaAnd_q <= redist32_expX_uid9_fpDivTest_b_33_sticky_ena_q and VCC_q;

    -- redist32_expX_uid9_fpDivTest_b_33_rdcnt(COUNTER,346)
    -- low=0, high=5, step=1, init=0
    redist32_expX_uid9_fpDivTest_b_33_rdcnt_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist32_expX_uid9_fpDivTest_b_33_rdcnt_i <= TO_UNSIGNED(0, 3);
                redist32_expX_uid9_fpDivTest_b_33_rdcnt_eq <= '0';
            ELSE
                IF (redist32_expX_uid9_fpDivTest_b_33_rdcnt_i = TO_UNSIGNED(4, 3)) THEN
                    redist32_expX_uid9_fpDivTest_b_33_rdcnt_eq <= '1';
                ELSE
                    redist32_expX_uid9_fpDivTest_b_33_rdcnt_eq <= '0';
                END IF;
                IF (redist32_expX_uid9_fpDivTest_b_33_rdcnt_eq = '1') THEN
                    redist32_expX_uid9_fpDivTest_b_33_rdcnt_i <= redist32_expX_uid9_fpDivTest_b_33_rdcnt_i + 3;
                ELSE
                    redist32_expX_uid9_fpDivTest_b_33_rdcnt_i <= redist32_expX_uid9_fpDivTest_b_33_rdcnt_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    redist32_expX_uid9_fpDivTest_b_33_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist32_expX_uid9_fpDivTest_b_33_rdcnt_i, 3)));

    -- redist32_expX_uid9_fpDivTest_b_33_wraddr(REG,347)
    redist32_expX_uid9_fpDivTest_b_33_wraddr_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist32_expX_uid9_fpDivTest_b_33_wraddr_q <= "101";
            ELSE
                redist32_expX_uid9_fpDivTest_b_33_wraddr_q <= STD_LOGIC_VECTOR(redist32_expX_uid9_fpDivTest_b_33_rdcnt_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist32_expX_uid9_fpDivTest_b_33_mem(DUALMEM,345)
    redist32_expX_uid9_fpDivTest_b_33_mem_ia <= STD_LOGIC_VECTOR(redist31_expX_uid9_fpDivTest_b_25_q);
    redist32_expX_uid9_fpDivTest_b_33_mem_aa <= redist32_expX_uid9_fpDivTest_b_33_wraddr_q;
    redist32_expX_uid9_fpDivTest_b_33_mem_ab <= redist32_expX_uid9_fpDivTest_b_33_rdcnt_q;
    redist32_expX_uid9_fpDivTest_b_33_mem_reset0 <= areset;
    redist32_expX_uid9_fpDivTest_b_33_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 8,
        widthad_a => 3,
        numwords_a => 6,
        width_b => 8,
        widthad_b => 3,
        numwords_b => 6,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_sclr_b => "SCLEAR",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Stratix 10"
    )
    PORT MAP (
        clocken1 => redist32_expX_uid9_fpDivTest_b_33_enaAnd_q(0),
        clocken0 => '1',
        clock0 => clk,
        sclr => redist32_expX_uid9_fpDivTest_b_33_mem_reset0,
        clock1 => clk,
        address_a => redist32_expX_uid9_fpDivTest_b_33_mem_aa,
        data_a => redist32_expX_uid9_fpDivTest_b_33_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist32_expX_uid9_fpDivTest_b_33_mem_ab,
        q_b => redist32_expX_uid9_fpDivTest_b_33_mem_iq
    );
    redist32_expX_uid9_fpDivTest_b_33_mem_q <= redist32_expX_uid9_fpDivTest_b_33_mem_iq(7 downto 0);

    -- redist32_expX_uid9_fpDivTest_b_33_outputreg0(DELAY,344)
    redist32_expX_uid9_fpDivTest_b_33_outputreg0_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist32_expX_uid9_fpDivTest_b_33_outputreg0_q <= (others => '0');
            ELSE
                redist32_expX_uid9_fpDivTest_b_33_outputreg0_q <= STD_LOGIC_VECTOR(redist32_expX_uid9_fpDivTest_b_33_mem_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist29_fracX_uid10_fpDivTest_b_33_notEnable(LOGICAL,330)
    redist29_fracX_uid10_fpDivTest_b_33_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist29_fracX_uid10_fpDivTest_b_33_nor(LOGICAL,331)
    redist29_fracX_uid10_fpDivTest_b_33_nor_q <= not (redist29_fracX_uid10_fpDivTest_b_33_notEnable_q or redist29_fracX_uid10_fpDivTest_b_33_sticky_ena_q);

    -- redist29_fracX_uid10_fpDivTest_b_33_mem_last(CONSTANT,327)
    redist29_fracX_uid10_fpDivTest_b_33_mem_last_q <= "011";

    -- redist29_fracX_uid10_fpDivTest_b_33_cmp(LOGICAL,328)
    redist29_fracX_uid10_fpDivTest_b_33_cmp_q <= "1" WHEN redist29_fracX_uid10_fpDivTest_b_33_mem_last_q = redist29_fracX_uid10_fpDivTest_b_33_rdcnt_q ELSE "0";

    -- redist29_fracX_uid10_fpDivTest_b_33_cmpReg(REG,329)
    redist29_fracX_uid10_fpDivTest_b_33_cmpReg_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist29_fracX_uid10_fpDivTest_b_33_cmpReg_q <= "0";
            ELSE
                redist29_fracX_uid10_fpDivTest_b_33_cmpReg_q <= STD_LOGIC_VECTOR(redist29_fracX_uid10_fpDivTest_b_33_cmp_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist29_fracX_uid10_fpDivTest_b_33_sticky_ena(REG,332)
    redist29_fracX_uid10_fpDivTest_b_33_sticky_ena_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist29_fracX_uid10_fpDivTest_b_33_sticky_ena_q <= "0";
            ELSE
                IF (redist29_fracX_uid10_fpDivTest_b_33_nor_q = "1") THEN
                    redist29_fracX_uid10_fpDivTest_b_33_sticky_ena_q <= STD_LOGIC_VECTOR(redist29_fracX_uid10_fpDivTest_b_33_cmpReg_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist29_fracX_uid10_fpDivTest_b_33_enaAnd(LOGICAL,333)
    redist29_fracX_uid10_fpDivTest_b_33_enaAnd_q <= redist29_fracX_uid10_fpDivTest_b_33_sticky_ena_q and VCC_q;

    -- redist29_fracX_uid10_fpDivTest_b_33_rdcnt(COUNTER,325)
    -- low=0, high=4, step=1, init=0
    redist29_fracX_uid10_fpDivTest_b_33_rdcnt_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist29_fracX_uid10_fpDivTest_b_33_rdcnt_i <= TO_UNSIGNED(0, 3);
                redist29_fracX_uid10_fpDivTest_b_33_rdcnt_eq <= '0';
            ELSE
                IF (redist29_fracX_uid10_fpDivTest_b_33_rdcnt_i = TO_UNSIGNED(3, 3)) THEN
                    redist29_fracX_uid10_fpDivTest_b_33_rdcnt_eq <= '1';
                ELSE
                    redist29_fracX_uid10_fpDivTest_b_33_rdcnt_eq <= '0';
                END IF;
                IF (redist29_fracX_uid10_fpDivTest_b_33_rdcnt_eq = '1') THEN
                    redist29_fracX_uid10_fpDivTest_b_33_rdcnt_i <= redist29_fracX_uid10_fpDivTest_b_33_rdcnt_i + 4;
                ELSE
                    redist29_fracX_uid10_fpDivTest_b_33_rdcnt_i <= redist29_fracX_uid10_fpDivTest_b_33_rdcnt_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    redist29_fracX_uid10_fpDivTest_b_33_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist29_fracX_uid10_fpDivTest_b_33_rdcnt_i, 3)));

    -- redist29_fracX_uid10_fpDivTest_b_33_inputreg0(DELAY,322)
    redist29_fracX_uid10_fpDivTest_b_33_inputreg0_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist29_fracX_uid10_fpDivTest_b_33_inputreg0_q <= (others => '0');
            ELSE
                redist29_fracX_uid10_fpDivTest_b_33_inputreg0_q <= STD_LOGIC_VECTOR(redist28_fracX_uid10_fpDivTest_b_25_outputreg0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist29_fracX_uid10_fpDivTest_b_33_wraddr(REG,326)
    redist29_fracX_uid10_fpDivTest_b_33_wraddr_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist29_fracX_uid10_fpDivTest_b_33_wraddr_q <= "100";
            ELSE
                redist29_fracX_uid10_fpDivTest_b_33_wraddr_q <= STD_LOGIC_VECTOR(redist29_fracX_uid10_fpDivTest_b_33_rdcnt_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist29_fracX_uid10_fpDivTest_b_33_mem(DUALMEM,324)
    redist29_fracX_uid10_fpDivTest_b_33_mem_ia <= STD_LOGIC_VECTOR(redist29_fracX_uid10_fpDivTest_b_33_inputreg0_q);
    redist29_fracX_uid10_fpDivTest_b_33_mem_aa <= redist29_fracX_uid10_fpDivTest_b_33_wraddr_q;
    redist29_fracX_uid10_fpDivTest_b_33_mem_ab <= redist29_fracX_uid10_fpDivTest_b_33_rdcnt_q;
    redist29_fracX_uid10_fpDivTest_b_33_mem_reset0 <= areset;
    redist29_fracX_uid10_fpDivTest_b_33_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 23,
        widthad_a => 3,
        numwords_a => 5,
        width_b => 23,
        widthad_b => 3,
        numwords_b => 5,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_sclr_b => "SCLEAR",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Stratix 10"
    )
    PORT MAP (
        clocken1 => redist29_fracX_uid10_fpDivTest_b_33_enaAnd_q(0),
        clocken0 => '1',
        clock0 => clk,
        sclr => redist29_fracX_uid10_fpDivTest_b_33_mem_reset0,
        clock1 => clk,
        address_a => redist29_fracX_uid10_fpDivTest_b_33_mem_aa,
        data_a => redist29_fracX_uid10_fpDivTest_b_33_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist29_fracX_uid10_fpDivTest_b_33_mem_ab,
        q_b => redist29_fracX_uid10_fpDivTest_b_33_mem_iq
    );
    redist29_fracX_uid10_fpDivTest_b_33_mem_q <= redist29_fracX_uid10_fpDivTest_b_33_mem_iq(22 downto 0);

    -- redist29_fracX_uid10_fpDivTest_b_33_outputreg0(DELAY,323)
    redist29_fracX_uid10_fpDivTest_b_33_outputreg0_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist29_fracX_uid10_fpDivTest_b_33_outputreg0_q <= (others => '0');
            ELSE
                redist29_fracX_uid10_fpDivTest_b_33_outputreg0_q <= STD_LOGIC_VECTOR(redist29_fracX_uid10_fpDivTest_b_33_mem_q);
            END IF;
        END IF;
    END PROCESS;

    -- qDivProdLTX_opB_uid100_fpDivTest(BITJOIN,99)@33
    qDivProdLTX_opB_uid100_fpDivTest_q <= redist32_expX_uid9_fpDivTest_b_33_outputreg0_q & redist29_fracX_uid10_fpDivTest_b_33_outputreg0_q;

    -- lOAdded_uid87_fpDivTest(BITJOIN,86)@25
    lOAdded_uid87_fpDivTest_q <= VCC_q & redist24_fracY_uid13_fpDivTest_b_25_q;

    -- lOAdded_uid84_fpDivTest(BITJOIN,83)@25
    lOAdded_uid84_fpDivTest_q <= VCC_q & fracPostRndF_uid80_fpDivTest_q;

    -- qDivProd_uid89_fpDivTest_cma(CHAINMULTADD,183)@25 + 5
    -- out q@31
    qDivProd_uid89_fpDivTest_cma_reset <= areset;
    qDivProd_uid89_fpDivTest_cma_ena0 <= '1';
    qDivProd_uid89_fpDivTest_cma_ena1 <= qDivProd_uid89_fpDivTest_cma_ena0;
    qDivProd_uid89_fpDivTest_cma_ena2 <= qDivProd_uid89_fpDivTest_cma_ena0;
    qDivProd_uid89_fpDivTest_cma_chainmultadd_hyper: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (false) THEN
            ELSE
                qDivProd_uid89_fpDivTest_cma_ah(0) <= RESIZE(UNSIGNED(lOAdded_uid84_fpDivTest_q),25);
                qDivProd_uid89_fpDivTest_cma_ch(0) <= RESIZE(UNSIGNED(lOAdded_uid87_fpDivTest_q),24);
            END IF;
        END IF;
    END PROCESS;

    qDivProd_uid89_fpDivTest_cma_a0 <= STD_LOGIC_VECTOR(qDivProd_uid89_fpDivTest_cma_ah(0));
    qDivProd_uid89_fpDivTest_cma_c0 <= STD_LOGIC_VECTOR(qDivProd_uid89_fpDivTest_cma_ch(0));
    qDivProd_uid89_fpDivTest_cma_DSP0 : fourteennm_mac
    GENERIC MAP (
        operation_mode => "m27x27",
        clear_type => "sclr",
        use_chainadder => "false",
        ay_scan_in_clock => "0",
        ay_scan_in_width => 25,
        ax_clock => "0",
        ax_width => 24,
        signed_may => "false",
        signed_max => "false",
        input_pipeline_clock => "2",
        second_pipeline_clock => "2",
        output_clock => "1",
        result_a_width => 49
    )
    PORT MAP (
        clk(0) => clk,
        clk(1) => clk,
        clk(2) => clk,
        ena(0) => qDivProd_uid89_fpDivTest_cma_ena0,
        ena(1) => qDivProd_uid89_fpDivTest_cma_ena1,
        ena(2) => qDivProd_uid89_fpDivTest_cma_ena2,
        clr(0) => qDivProd_uid89_fpDivTest_cma_reset,
        clr(1) => qDivProd_uid89_fpDivTest_cma_reset,
        ay => qDivProd_uid89_fpDivTest_cma_a0,
        ax => qDivProd_uid89_fpDivTest_cma_c0,
        resulta => qDivProd_uid89_fpDivTest_cma_s0
    );
    qDivProd_uid89_fpDivTest_cma_delay : dspba_delay
    GENERIC MAP ( width => 49, depth => 1, reset_kind => "NONE", phase => 0, modulus => 1 )
    PORT MAP ( xin => qDivProd_uid89_fpDivTest_cma_s0, xout => qDivProd_uid89_fpDivTest_cma_qq, clk => clk, aclr => areset, ena => '1' );
    qDivProd_uid89_fpDivTest_cma_q <= STD_LOGIC_VECTOR(qDivProd_uid89_fpDivTest_cma_qq(48 downto 0));

    -- qDivProdNorm_uid90_fpDivTest(BITSELECT,89)@31
    qDivProdNorm_uid90_fpDivTest_b <= STD_LOGIC_VECTOR(qDivProd_uid89_fpDivTest_cma_q(48 downto 48));

    -- cstBias_uid7_fpDivTest(CONSTANT,6)
    cstBias_uid7_fpDivTest_q <= "01111111";

    -- qDivProdExp_opBs_uid95_fpDivTest(SUB,94)@31 + 1
    qDivProdExp_opBs_uid95_fpDivTest_a <= STD_LOGIC_VECTOR("0" & cstBias_uid7_fpDivTest_q);
    qDivProdExp_opBs_uid95_fpDivTest_b <= STD_LOGIC_VECTOR("00000000" & qDivProdNorm_uid90_fpDivTest_b);
    qDivProdExp_opBs_uid95_fpDivTest_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                qDivProdExp_opBs_uid95_fpDivTest_o <= (others => '0');
            ELSE
                qDivProdExp_opBs_uid95_fpDivTest_o <= STD_LOGIC_VECTOR(UNSIGNED(qDivProdExp_opBs_uid95_fpDivTest_a) - UNSIGNED(qDivProdExp_opBs_uid95_fpDivTest_b));
            END IF;
        END IF;
    END PROCESS;
    qDivProdExp_opBs_uid95_fpDivTest_q <= qDivProdExp_opBs_uid95_fpDivTest_o(8 downto 0);

    -- expPostRndFR_uid81_fpDivTest(BITSELECT,80)@25
    expPostRndFR_uid81_fpDivTest_in <= expFracPostRnd_uid76_fpDivTest_q(32 downto 0);
    expPostRndFR_uid81_fpDivTest_b <= expPostRndFR_uid81_fpDivTest_in(32 downto 25);

    -- expPostRndF_uid82_fpDivTest(MUX,81)@25
    expPostRndF_uid82_fpDivTest_s <= redist14_invYO_uid55_fpDivTest_b_9_q;
    expPostRndF_uid82_fpDivTest_combproc: PROCESS (expPostRndF_uid82_fpDivTest_s, expPostRndFR_uid81_fpDivTest_b, redist31_expX_uid9_fpDivTest_b_25_q)
    BEGIN
        CASE (expPostRndF_uid82_fpDivTest_s) IS
            WHEN "0" => expPostRndF_uid82_fpDivTest_q <= expPostRndFR_uid81_fpDivTest_b;
            WHEN "1" => expPostRndF_uid82_fpDivTest_q <= redist31_expX_uid9_fpDivTest_b_25_q;
            WHEN OTHERS => expPostRndF_uid82_fpDivTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- qDivProdExp_opA_uid94_fpDivTest(ADD,93)@25 + 1
    qDivProdExp_opA_uid94_fpDivTest_a <= STD_LOGIC_VECTOR("0" & redist26_expY_uid12_fpDivTest_b_25_q);
    qDivProdExp_opA_uid94_fpDivTest_b <= STD_LOGIC_VECTOR("0" & expPostRndF_uid82_fpDivTest_q);
    qDivProdExp_opA_uid94_fpDivTest_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                qDivProdExp_opA_uid94_fpDivTest_o <= (others => '0');
            ELSE
                qDivProdExp_opA_uid94_fpDivTest_o <= STD_LOGIC_VECTOR(UNSIGNED(qDivProdExp_opA_uid94_fpDivTest_a) + UNSIGNED(qDivProdExp_opA_uid94_fpDivTest_b));
            END IF;
        END IF;
    END PROCESS;
    qDivProdExp_opA_uid94_fpDivTest_q <= qDivProdExp_opA_uid94_fpDivTest_o(8 downto 0);

    -- redist10_qDivProdExp_opA_uid94_fpDivTest_q_7(DELAY,197)
    redist10_qDivProdExp_opA_uid94_fpDivTest_q_7_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist10_qDivProdExp_opA_uid94_fpDivTest_q_7_delay_0 <= (others => '0');
                redist10_qDivProdExp_opA_uid94_fpDivTest_q_7_delay_1 <= (others => '0');
                redist10_qDivProdExp_opA_uid94_fpDivTest_q_7_delay_2 <= (others => '0');
                redist10_qDivProdExp_opA_uid94_fpDivTest_q_7_delay_3 <= (others => '0');
                redist10_qDivProdExp_opA_uid94_fpDivTest_q_7_q <= (others => '0');
            ELSE
                redist10_qDivProdExp_opA_uid94_fpDivTest_q_7_delay_0 <= STD_LOGIC_VECTOR(qDivProdExp_opA_uid94_fpDivTest_q);
                redist10_qDivProdExp_opA_uid94_fpDivTest_q_7_delay_1 <= redist10_qDivProdExp_opA_uid94_fpDivTest_q_7_delay_0;
                redist10_qDivProdExp_opA_uid94_fpDivTest_q_7_delay_2 <= redist10_qDivProdExp_opA_uid94_fpDivTest_q_7_delay_1;
                redist10_qDivProdExp_opA_uid94_fpDivTest_q_7_delay_3 <= redist10_qDivProdExp_opA_uid94_fpDivTest_q_7_delay_2;
                redist10_qDivProdExp_opA_uid94_fpDivTest_q_7_q <= redist10_qDivProdExp_opA_uid94_fpDivTest_q_7_delay_3;
            END IF;
        END IF;
    END PROCESS;

    -- redist10_qDivProdExp_opA_uid94_fpDivTest_q_7_outputreg0(DELAY,232)
    redist10_qDivProdExp_opA_uid94_fpDivTest_q_7_outputreg0_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist10_qDivProdExp_opA_uid94_fpDivTest_q_7_outputreg0_q <= (others => '0');
            ELSE
                redist10_qDivProdExp_opA_uid94_fpDivTest_q_7_outputreg0_q <= STD_LOGIC_VECTOR(redist10_qDivProdExp_opA_uid94_fpDivTest_q_7_q);
            END IF;
        END IF;
    END PROCESS;

    -- qDivProdExp_uid96_fpDivTest(SUB,95)@32
    qDivProdExp_uid96_fpDivTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & redist10_qDivProdExp_opA_uid94_fpDivTest_q_7_outputreg0_q));
    qDivProdExp_uid96_fpDivTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((11 downto 9 => qDivProdExp_opBs_uid95_fpDivTest_q(8)) & qDivProdExp_opBs_uid95_fpDivTest_q));
    qDivProdExp_uid96_fpDivTest_o <= STD_LOGIC_VECTOR(SIGNED(qDivProdExp_uid96_fpDivTest_a) - SIGNED(qDivProdExp_uid96_fpDivTest_b));
    qDivProdExp_uid96_fpDivTest_q <= qDivProdExp_uid96_fpDivTest_o(10 downto 0);

    -- qDivProdLTX_opA_uid98_fpDivTest(BITSELECT,97)@32
    qDivProdLTX_opA_uid98_fpDivTest_in <= qDivProdExp_uid96_fpDivTest_q(7 downto 0);
    qDivProdLTX_opA_uid98_fpDivTest_b <= qDivProdLTX_opA_uid98_fpDivTest_in(7 downto 0);

    -- redist8_qDivProdLTX_opA_uid98_fpDivTest_b_1(DELAY,195)
    redist8_qDivProdLTX_opA_uid98_fpDivTest_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist8_qDivProdLTX_opA_uid98_fpDivTest_b_1_q <= (others => '0');
            ELSE
                redist8_qDivProdLTX_opA_uid98_fpDivTest_b_1_q <= STD_LOGIC_VECTOR(qDivProdLTX_opA_uid98_fpDivTest_b);
            END IF;
        END IF;
    END PROCESS;

    -- qDivProdFracHigh_uid91_fpDivTest(BITSELECT,90)@31
    qDivProdFracHigh_uid91_fpDivTest_in <= qDivProd_uid89_fpDivTest_cma_q(47 downto 0);
    qDivProdFracHigh_uid91_fpDivTest_b <= qDivProdFracHigh_uid91_fpDivTest_in(47 downto 24);

    -- qDivProdFracLow_uid92_fpDivTest(BITSELECT,91)@31
    qDivProdFracLow_uid92_fpDivTest_in <= qDivProd_uid89_fpDivTest_cma_q(46 downto 0);
    qDivProdFracLow_uid92_fpDivTest_b <= qDivProdFracLow_uid92_fpDivTest_in(46 downto 23);

    -- qDivProdFrac_uid93_fpDivTest(MUX,92)@31
    qDivProdFrac_uid93_fpDivTest_s <= qDivProdNorm_uid90_fpDivTest_b;
    qDivProdFrac_uid93_fpDivTest_combproc: PROCESS (qDivProdFrac_uid93_fpDivTest_s, qDivProdFracLow_uid92_fpDivTest_b, qDivProdFracHigh_uid91_fpDivTest_b)
    BEGIN
        CASE (qDivProdFrac_uid93_fpDivTest_s) IS
            WHEN "0" => qDivProdFrac_uid93_fpDivTest_q <= qDivProdFracLow_uid92_fpDivTest_b;
            WHEN "1" => qDivProdFrac_uid93_fpDivTest_q <= qDivProdFracHigh_uid91_fpDivTest_b;
            WHEN OTHERS => qDivProdFrac_uid93_fpDivTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- qDivProdFracWF_uid97_fpDivTest(BITSELECT,96)@31
    qDivProdFracWF_uid97_fpDivTest_b <= qDivProdFrac_uid93_fpDivTest_q(23 downto 1);

    -- redist9_qDivProdFracWF_uid97_fpDivTest_b_2(DELAY,196)
    redist9_qDivProdFracWF_uid97_fpDivTest_b_2_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist9_qDivProdFracWF_uid97_fpDivTest_b_2_delay_0 <= (others => '0');
                redist9_qDivProdFracWF_uid97_fpDivTest_b_2_q <= (others => '0');
            ELSE
                redist9_qDivProdFracWF_uid97_fpDivTest_b_2_delay_0 <= STD_LOGIC_VECTOR(qDivProdFracWF_uid97_fpDivTest_b);
                redist9_qDivProdFracWF_uid97_fpDivTest_b_2_q <= redist9_qDivProdFracWF_uid97_fpDivTest_b_2_delay_0;
            END IF;
        END IF;
    END PROCESS;

    -- qDivProdLTX_opA_uid99_fpDivTest(BITJOIN,98)@33
    qDivProdLTX_opA_uid99_fpDivTest_q <= redist8_qDivProdLTX_opA_uid98_fpDivTest_b_1_q & redist9_qDivProdFracWF_uid97_fpDivTest_b_2_q;

    -- qDividerProdLTX_uid101_fpDivTest(COMPARE,100)@33
    qDividerProdLTX_uid101_fpDivTest_a <= STD_LOGIC_VECTOR("00" & qDivProdLTX_opA_uid99_fpDivTest_q);
    qDividerProdLTX_uid101_fpDivTest_b <= STD_LOGIC_VECTOR("00" & qDivProdLTX_opB_uid100_fpDivTest_q);
    qDividerProdLTX_uid101_fpDivTest_o <= STD_LOGIC_VECTOR(UNSIGNED(qDividerProdLTX_uid101_fpDivTest_a) - UNSIGNED(qDividerProdLTX_uid101_fpDivTest_b));
    qDividerProdLTX_uid101_fpDivTest_c(0) <= qDividerProdLTX_uid101_fpDivTest_o(32);

    -- extraUlp_uid103_fpDivTest(LOGICAL,102)@33 + 1
    extraUlp_uid103_fpDivTest_qi <= qDividerProdLTX_uid101_fpDivTest_c and redist7_betweenFPwF_uid102_fpDivTest_b_8_q;
    extraUlp_uid103_fpDivTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => extraUlp_uid103_fpDivTest_qi, xout => extraUlp_uid103_fpDivTest_q, clk => clk, aclr => areset, ena => '1' );

    -- redist6_extraUlp_uid103_fpDivTest_q_2(DELAY,193)
    redist6_extraUlp_uid103_fpDivTest_q_2_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist6_extraUlp_uid103_fpDivTest_q_2_q <= (others => '0');
            ELSE
                redist6_extraUlp_uid103_fpDivTest_q_2_q <= STD_LOGIC_VECTOR(extraUlp_uid103_fpDivTest_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist5_fracPostRndFT_uid104_fpDivTest_b_9_notEnable(LOGICAL,228)
    redist5_fracPostRndFT_uid104_fpDivTest_b_9_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist5_fracPostRndFT_uid104_fpDivTest_b_9_nor(LOGICAL,229)
    redist5_fracPostRndFT_uid104_fpDivTest_b_9_nor_q <= not (redist5_fracPostRndFT_uid104_fpDivTest_b_9_notEnable_q or redist5_fracPostRndFT_uid104_fpDivTest_b_9_sticky_ena_q);

    -- redist5_fracPostRndFT_uid104_fpDivTest_b_9_mem_last(CONSTANT,225)
    redist5_fracPostRndFT_uid104_fpDivTest_b_9_mem_last_q <= "0100";

    -- redist5_fracPostRndFT_uid104_fpDivTest_b_9_cmp(LOGICAL,226)
    redist5_fracPostRndFT_uid104_fpDivTest_b_9_cmp_b <= STD_LOGIC_VECTOR("0" & redist5_fracPostRndFT_uid104_fpDivTest_b_9_rdcnt_q);
    redist5_fracPostRndFT_uid104_fpDivTest_b_9_cmp_q <= "1" WHEN redist5_fracPostRndFT_uid104_fpDivTest_b_9_mem_last_q = redist5_fracPostRndFT_uid104_fpDivTest_b_9_cmp_b ELSE "0";

    -- redist5_fracPostRndFT_uid104_fpDivTest_b_9_cmpReg(REG,227)
    redist5_fracPostRndFT_uid104_fpDivTest_b_9_cmpReg_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist5_fracPostRndFT_uid104_fpDivTest_b_9_cmpReg_q <= "0";
            ELSE
                redist5_fracPostRndFT_uid104_fpDivTest_b_9_cmpReg_q <= STD_LOGIC_VECTOR(redist5_fracPostRndFT_uid104_fpDivTest_b_9_cmp_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist5_fracPostRndFT_uid104_fpDivTest_b_9_sticky_ena(REG,230)
    redist5_fracPostRndFT_uid104_fpDivTest_b_9_sticky_ena_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist5_fracPostRndFT_uid104_fpDivTest_b_9_sticky_ena_q <= "0";
            ELSE
                IF (redist5_fracPostRndFT_uid104_fpDivTest_b_9_nor_q = "1") THEN
                    redist5_fracPostRndFT_uid104_fpDivTest_b_9_sticky_ena_q <= STD_LOGIC_VECTOR(redist5_fracPostRndFT_uid104_fpDivTest_b_9_cmpReg_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist5_fracPostRndFT_uid104_fpDivTest_b_9_enaAnd(LOGICAL,231)
    redist5_fracPostRndFT_uid104_fpDivTest_b_9_enaAnd_q <= redist5_fracPostRndFT_uid104_fpDivTest_b_9_sticky_ena_q and VCC_q;

    -- redist5_fracPostRndFT_uid104_fpDivTest_b_9_rdcnt(COUNTER,223)
    -- low=0, high=5, step=1, init=0
    redist5_fracPostRndFT_uid104_fpDivTest_b_9_rdcnt_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist5_fracPostRndFT_uid104_fpDivTest_b_9_rdcnt_i <= TO_UNSIGNED(0, 3);
                redist5_fracPostRndFT_uid104_fpDivTest_b_9_rdcnt_eq <= '0';
            ELSE
                IF (redist5_fracPostRndFT_uid104_fpDivTest_b_9_rdcnt_i = TO_UNSIGNED(4, 3)) THEN
                    redist5_fracPostRndFT_uid104_fpDivTest_b_9_rdcnt_eq <= '1';
                ELSE
                    redist5_fracPostRndFT_uid104_fpDivTest_b_9_rdcnt_eq <= '0';
                END IF;
                IF (redist5_fracPostRndFT_uid104_fpDivTest_b_9_rdcnt_eq = '1') THEN
                    redist5_fracPostRndFT_uid104_fpDivTest_b_9_rdcnt_i <= redist5_fracPostRndFT_uid104_fpDivTest_b_9_rdcnt_i + 3;
                ELSE
                    redist5_fracPostRndFT_uid104_fpDivTest_b_9_rdcnt_i <= redist5_fracPostRndFT_uid104_fpDivTest_b_9_rdcnt_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    redist5_fracPostRndFT_uid104_fpDivTest_b_9_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist5_fracPostRndFT_uid104_fpDivTest_b_9_rdcnt_i, 3)));

    -- fracPostRndFT_uid104_fpDivTest(BITSELECT,103)@25
    fracPostRndFT_uid104_fpDivTest_b <= fracPostRndF_uid80_fpDivTest_q(23 downto 1);

    -- redist5_fracPostRndFT_uid104_fpDivTest_b_9_inputreg0(DELAY,220)
    redist5_fracPostRndFT_uid104_fpDivTest_b_9_inputreg0_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist5_fracPostRndFT_uid104_fpDivTest_b_9_inputreg0_q <= (others => '0');
            ELSE
                redist5_fracPostRndFT_uid104_fpDivTest_b_9_inputreg0_q <= STD_LOGIC_VECTOR(fracPostRndFT_uid104_fpDivTest_b);
            END IF;
        END IF;
    END PROCESS;

    -- redist5_fracPostRndFT_uid104_fpDivTest_b_9_wraddr(REG,224)
    redist5_fracPostRndFT_uid104_fpDivTest_b_9_wraddr_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist5_fracPostRndFT_uid104_fpDivTest_b_9_wraddr_q <= "101";
            ELSE
                redist5_fracPostRndFT_uid104_fpDivTest_b_9_wraddr_q <= STD_LOGIC_VECTOR(redist5_fracPostRndFT_uid104_fpDivTest_b_9_rdcnt_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist5_fracPostRndFT_uid104_fpDivTest_b_9_mem(DUALMEM,222)
    redist5_fracPostRndFT_uid104_fpDivTest_b_9_mem_ia <= STD_LOGIC_VECTOR(redist5_fracPostRndFT_uid104_fpDivTest_b_9_inputreg0_q);
    redist5_fracPostRndFT_uid104_fpDivTest_b_9_mem_aa <= redist5_fracPostRndFT_uid104_fpDivTest_b_9_wraddr_q;
    redist5_fracPostRndFT_uid104_fpDivTest_b_9_mem_ab <= redist5_fracPostRndFT_uid104_fpDivTest_b_9_rdcnt_q;
    redist5_fracPostRndFT_uid104_fpDivTest_b_9_mem_reset0 <= areset;
    redist5_fracPostRndFT_uid104_fpDivTest_b_9_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 23,
        widthad_a => 3,
        numwords_a => 6,
        width_b => 23,
        widthad_b => 3,
        numwords_b => 6,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_sclr_b => "SCLEAR",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Stratix 10"
    )
    PORT MAP (
        clocken1 => redist5_fracPostRndFT_uid104_fpDivTest_b_9_enaAnd_q(0),
        clocken0 => '1',
        clock0 => clk,
        sclr => redist5_fracPostRndFT_uid104_fpDivTest_b_9_mem_reset0,
        clock1 => clk,
        address_a => redist5_fracPostRndFT_uid104_fpDivTest_b_9_mem_aa,
        data_a => redist5_fracPostRndFT_uid104_fpDivTest_b_9_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist5_fracPostRndFT_uid104_fpDivTest_b_9_mem_ab,
        q_b => redist5_fracPostRndFT_uid104_fpDivTest_b_9_mem_iq
    );
    redist5_fracPostRndFT_uid104_fpDivTest_b_9_mem_q <= redist5_fracPostRndFT_uid104_fpDivTest_b_9_mem_iq(22 downto 0);

    -- redist5_fracPostRndFT_uid104_fpDivTest_b_9_outputreg0(DELAY,221)
    redist5_fracPostRndFT_uid104_fpDivTest_b_9_outputreg0_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist5_fracPostRndFT_uid104_fpDivTest_b_9_outputreg0_q <= (others => '0');
            ELSE
                redist5_fracPostRndFT_uid104_fpDivTest_b_9_outputreg0_q <= STD_LOGIC_VECTOR(redist5_fracPostRndFT_uid104_fpDivTest_b_9_mem_q);
            END IF;
        END IF;
    END PROCESS;

    -- fracRPreExcExt_uid105_fpDivTest(ADD,104)@34
    fracRPreExcExt_uid105_fpDivTest_a <= STD_LOGIC_VECTOR("0" & redist5_fracPostRndFT_uid104_fpDivTest_b_9_outputreg0_q);
    fracRPreExcExt_uid105_fpDivTest_b <= STD_LOGIC_VECTOR("00000000000000000000000" & extraUlp_uid103_fpDivTest_q);
    fracRPreExcExt_uid105_fpDivTest_o <= STD_LOGIC_VECTOR(UNSIGNED(fracRPreExcExt_uid105_fpDivTest_a) + UNSIGNED(fracRPreExcExt_uid105_fpDivTest_b));
    fracRPreExcExt_uid105_fpDivTest_q <= fracRPreExcExt_uid105_fpDivTest_o(23 downto 0);

    -- ovfIncRnd_uid109_fpDivTest(BITSELECT,108)@34
    ovfIncRnd_uid109_fpDivTest_b <= STD_LOGIC_VECTOR(fracRPreExcExt_uid105_fpDivTest_q(23 downto 23));

    -- redist4_ovfIncRnd_uid109_fpDivTest_b_1(DELAY,191)
    redist4_ovfIncRnd_uid109_fpDivTest_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist4_ovfIncRnd_uid109_fpDivTest_b_1_q <= (others => '0');
            ELSE
                redist4_ovfIncRnd_uid109_fpDivTest_b_1_q <= STD_LOGIC_VECTOR(ovfIncRnd_uid109_fpDivTest_b);
            END IF;
        END IF;
    END PROCESS;

    -- redist11_expPostRndFR_uid81_fpDivTest_b_10_notEnable(LOGICAL,240)
    redist11_expPostRndFR_uid81_fpDivTest_b_10_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist11_expPostRndFR_uid81_fpDivTest_b_10_nor(LOGICAL,241)
    redist11_expPostRndFR_uid81_fpDivTest_b_10_nor_q <= not (redist11_expPostRndFR_uid81_fpDivTest_b_10_notEnable_q or redist11_expPostRndFR_uid81_fpDivTest_b_10_sticky_ena_q);

    -- redist11_expPostRndFR_uid81_fpDivTest_b_10_mem_last(CONSTANT,237)
    redist11_expPostRndFR_uid81_fpDivTest_b_10_mem_last_q <= "0110";

    -- redist11_expPostRndFR_uid81_fpDivTest_b_10_cmp(LOGICAL,238)
    redist11_expPostRndFR_uid81_fpDivTest_b_10_cmp_b <= STD_LOGIC_VECTOR("0" & redist11_expPostRndFR_uid81_fpDivTest_b_10_rdcnt_q);
    redist11_expPostRndFR_uid81_fpDivTest_b_10_cmp_q <= "1" WHEN redist11_expPostRndFR_uid81_fpDivTest_b_10_mem_last_q = redist11_expPostRndFR_uid81_fpDivTest_b_10_cmp_b ELSE "0";

    -- redist11_expPostRndFR_uid81_fpDivTest_b_10_cmpReg(REG,239)
    redist11_expPostRndFR_uid81_fpDivTest_b_10_cmpReg_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist11_expPostRndFR_uid81_fpDivTest_b_10_cmpReg_q <= "0";
            ELSE
                redist11_expPostRndFR_uid81_fpDivTest_b_10_cmpReg_q <= STD_LOGIC_VECTOR(redist11_expPostRndFR_uid81_fpDivTest_b_10_cmp_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist11_expPostRndFR_uid81_fpDivTest_b_10_sticky_ena(REG,242)
    redist11_expPostRndFR_uid81_fpDivTest_b_10_sticky_ena_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist11_expPostRndFR_uid81_fpDivTest_b_10_sticky_ena_q <= "0";
            ELSE
                IF (redist11_expPostRndFR_uid81_fpDivTest_b_10_nor_q = "1") THEN
                    redist11_expPostRndFR_uid81_fpDivTest_b_10_sticky_ena_q <= STD_LOGIC_VECTOR(redist11_expPostRndFR_uid81_fpDivTest_b_10_cmpReg_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist11_expPostRndFR_uid81_fpDivTest_b_10_enaAnd(LOGICAL,243)
    redist11_expPostRndFR_uid81_fpDivTest_b_10_enaAnd_q <= redist11_expPostRndFR_uid81_fpDivTest_b_10_sticky_ena_q and VCC_q;

    -- redist11_expPostRndFR_uid81_fpDivTest_b_10_rdcnt(COUNTER,235)
    -- low=0, high=7, step=1, init=0
    redist11_expPostRndFR_uid81_fpDivTest_b_10_rdcnt_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist11_expPostRndFR_uid81_fpDivTest_b_10_rdcnt_i <= TO_UNSIGNED(0, 3);
            ELSE
                redist11_expPostRndFR_uid81_fpDivTest_b_10_rdcnt_i <= redist11_expPostRndFR_uid81_fpDivTest_b_10_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist11_expPostRndFR_uid81_fpDivTest_b_10_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist11_expPostRndFR_uid81_fpDivTest_b_10_rdcnt_i, 3)));

    -- redist11_expPostRndFR_uid81_fpDivTest_b_10_wraddr(REG,236)
    redist11_expPostRndFR_uid81_fpDivTest_b_10_wraddr_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist11_expPostRndFR_uid81_fpDivTest_b_10_wraddr_q <= "111";
            ELSE
                redist11_expPostRndFR_uid81_fpDivTest_b_10_wraddr_q <= STD_LOGIC_VECTOR(redist11_expPostRndFR_uid81_fpDivTest_b_10_rdcnt_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist11_expPostRndFR_uid81_fpDivTest_b_10_mem(DUALMEM,234)
    redist11_expPostRndFR_uid81_fpDivTest_b_10_mem_ia <= STD_LOGIC_VECTOR(expPostRndFR_uid81_fpDivTest_b);
    redist11_expPostRndFR_uid81_fpDivTest_b_10_mem_aa <= redist11_expPostRndFR_uid81_fpDivTest_b_10_wraddr_q;
    redist11_expPostRndFR_uid81_fpDivTest_b_10_mem_ab <= redist11_expPostRndFR_uid81_fpDivTest_b_10_rdcnt_q;
    redist11_expPostRndFR_uid81_fpDivTest_b_10_mem_reset0 <= areset;
    redist11_expPostRndFR_uid81_fpDivTest_b_10_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 8,
        widthad_a => 3,
        numwords_a => 8,
        width_b => 8,
        widthad_b => 3,
        numwords_b => 8,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_sclr_b => "SCLEAR",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Stratix 10"
    )
    PORT MAP (
        clocken1 => redist11_expPostRndFR_uid81_fpDivTest_b_10_enaAnd_q(0),
        clocken0 => '1',
        clock0 => clk,
        sclr => redist11_expPostRndFR_uid81_fpDivTest_b_10_mem_reset0,
        clock1 => clk,
        address_a => redist11_expPostRndFR_uid81_fpDivTest_b_10_mem_aa,
        data_a => redist11_expPostRndFR_uid81_fpDivTest_b_10_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist11_expPostRndFR_uid81_fpDivTest_b_10_mem_ab,
        q_b => redist11_expPostRndFR_uid81_fpDivTest_b_10_mem_iq
    );
    redist11_expPostRndFR_uid81_fpDivTest_b_10_mem_q <= redist11_expPostRndFR_uid81_fpDivTest_b_10_mem_iq(7 downto 0);

    -- redist11_expPostRndFR_uid81_fpDivTest_b_10_outputreg0(DELAY,233)
    redist11_expPostRndFR_uid81_fpDivTest_b_10_outputreg0_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist11_expPostRndFR_uid81_fpDivTest_b_10_outputreg0_q <= (others => '0');
            ELSE
                redist11_expPostRndFR_uid81_fpDivTest_b_10_outputreg0_q <= STD_LOGIC_VECTOR(redist11_expPostRndFR_uid81_fpDivTest_b_10_mem_q);
            END IF;
        END IF;
    END PROCESS;

    -- expFracPostRndInc_uid110_fpDivTest_expRPreExc_uid112_fpDivTest_merged(ADD,179)@35
    expFracPostRndInc_uid110_fpDivTest_expRPreExc_uid112_fpDivTest_merged_a <= STD_LOGIC_VECTOR("0" & redist11_expPostRndFR_uid81_fpDivTest_b_10_outputreg0_q);
    expFracPostRndInc_uid110_fpDivTest_expRPreExc_uid112_fpDivTest_merged_b <= STD_LOGIC_VECTOR("00000000" & redist4_ovfIncRnd_uid109_fpDivTest_b_1_q);
    expFracPostRndInc_uid110_fpDivTest_expRPreExc_uid112_fpDivTest_merged_i <= expFracPostRndInc_uid110_fpDivTest_expRPreExc_uid112_fpDivTest_merged_a;
    expFracPostRndInc_uid110_fpDivTest_expRPreExc_uid112_fpDivTest_merged_a1 <= expFracPostRndInc_uid110_fpDivTest_expRPreExc_uid112_fpDivTest_merged_i;
    expFracPostRndInc_uid110_fpDivTest_expRPreExc_uid112_fpDivTest_merged_b1 <= (others => '0') WHEN redist6_extraUlp_uid103_fpDivTest_q_2_q = "0" ELSE expFracPostRndInc_uid110_fpDivTest_expRPreExc_uid112_fpDivTest_merged_b;
    expFracPostRndInc_uid110_fpDivTest_expRPreExc_uid112_fpDivTest_merged_o <= STD_LOGIC_VECTOR(UNSIGNED(expFracPostRndInc_uid110_fpDivTest_expRPreExc_uid112_fpDivTest_merged_a1) + UNSIGNED(expFracPostRndInc_uid110_fpDivTest_expRPreExc_uid112_fpDivTest_merged_b1));
    expFracPostRndInc_uid110_fpDivTest_expRPreExc_uid112_fpDivTest_merged_q <= expFracPostRndInc_uid110_fpDivTest_expRPreExc_uid112_fpDivTest_merged_o(7 downto 0);

    -- invExpXIsMax_uid43_fpDivTest(LOGICAL,42)@26
    invExpXIsMax_uid43_fpDivTest_q <= not (expXIsMax_uid38_fpDivTest_q);

    -- InvExpXIsZero_uid44_fpDivTest(LOGICAL,43)@26
    InvExpXIsZero_uid44_fpDivTest_q <= not (excZ_y_uid37_fpDivTest_q);

    -- excR_y_uid45_fpDivTest(LOGICAL,44)@26
    excR_y_uid45_fpDivTest_q <= InvExpXIsZero_uid44_fpDivTest_q and invExpXIsMax_uid43_fpDivTest_q;

    -- excXIYR_uid127_fpDivTest(LOGICAL,126)@26
    excXIYR_uid127_fpDivTest_q <= excI_x_uid27_fpDivTest_q and excR_y_uid45_fpDivTest_q;

    -- excXIYZ_uid126_fpDivTest(LOGICAL,125)@26
    excXIYZ_uid126_fpDivTest_q <= excI_x_uid27_fpDivTest_q and excZ_y_uid37_fpDivTest_q;

    -- expRExt_uid114_fpDivTest(BITSELECT,113)@25
    expRExt_uid114_fpDivTest_b <= STD_LOGIC_VECTOR(expFracPostRnd_uid76_fpDivTest_q(35 downto 25));

    -- expOvf_uid118_fpDivTest(COMPARE,117)@25 + 1
    expOvf_uid118_fpDivTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 11 => expRExt_uid114_fpDivTest_b(10)) & expRExt_uid114_fpDivTest_b));
    expOvf_uid118_fpDivTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("00000" & cstAllOWE_uid18_fpDivTest_q));
    expOvf_uid118_fpDivTest_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                expOvf_uid118_fpDivTest_o <= (others => '0');
            ELSE
                expOvf_uid118_fpDivTest_o <= STD_LOGIC_VECTOR(SIGNED(expOvf_uid118_fpDivTest_a) - SIGNED(expOvf_uid118_fpDivTest_b));
            END IF;
        END IF;
    END PROCESS;
    expOvf_uid118_fpDivTest_n(0) <= not (expOvf_uid118_fpDivTest_o(12));

    -- invExpXIsMax_uid29_fpDivTest(LOGICAL,28)@25
    invExpXIsMax_uid29_fpDivTest_q <= not (expXIsMax_uid24_fpDivTest_q);

    -- InvExpXIsZero_uid30_fpDivTest(LOGICAL,29)@25
    InvExpXIsZero_uid30_fpDivTest_q <= not (excZ_x_uid23_fpDivTest_q);

    -- excR_x_uid31_fpDivTest(LOGICAL,30)@25 + 1
    excR_x_uid31_fpDivTest_qi <= InvExpXIsZero_uid30_fpDivTest_q and invExpXIsMax_uid29_fpDivTest_q;
    excR_x_uid31_fpDivTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => excR_x_uid31_fpDivTest_qi, xout => excR_x_uid31_fpDivTest_q, clk => clk, aclr => areset, ena => '1' );

    -- excXRYROvf_uid125_fpDivTest(LOGICAL,124)@26
    excXRYROvf_uid125_fpDivTest_q <= excR_x_uid31_fpDivTest_q and excR_y_uid45_fpDivTest_q and expOvf_uid118_fpDivTest_n;

    -- excXRYZ_uid124_fpDivTest(LOGICAL,123)@26
    excXRYZ_uid124_fpDivTest_q <= excR_x_uid31_fpDivTest_q and excZ_y_uid37_fpDivTest_q;

    -- excRInf_uid128_fpDivTest(LOGICAL,127)@26 + 1
    excRInf_uid128_fpDivTest_qi <= excXRYZ_uid124_fpDivTest_q or excXRYROvf_uid125_fpDivTest_q or excXIYZ_uid126_fpDivTest_q or excXIYR_uid127_fpDivTest_q;
    excRInf_uid128_fpDivTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => excRInf_uid128_fpDivTest_qi, xout => excRInf_uid128_fpDivTest_q, clk => clk, aclr => areset, ena => '1' );

    -- xRegOrZero_uid121_fpDivTest(LOGICAL,120)@26
    xRegOrZero_uid121_fpDivTest_q <= excR_x_uid31_fpDivTest_q or redist22_excZ_x_uid23_fpDivTest_q_1_q;

    -- regOrZeroOverInf_uid122_fpDivTest(LOGICAL,121)@26
    regOrZeroOverInf_uid122_fpDivTest_q <= xRegOrZero_uid121_fpDivTest_q and excI_y_uid41_fpDivTest_q;

    -- expUdf_uid115_fpDivTest(COMPARE,114)@25 + 1
    expUdf_uid115_fpDivTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000000000000" & GND_q));
    expUdf_uid115_fpDivTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 11 => expRExt_uid114_fpDivTest_b(10)) & expRExt_uid114_fpDivTest_b));
    expUdf_uid115_fpDivTest_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                expUdf_uid115_fpDivTest_o <= (others => '0');
            ELSE
                expUdf_uid115_fpDivTest_o <= STD_LOGIC_VECTOR(SIGNED(expUdf_uid115_fpDivTest_a) - SIGNED(expUdf_uid115_fpDivTest_b));
            END IF;
        END IF;
    END PROCESS;
    expUdf_uid115_fpDivTest_n(0) <= not (expUdf_uid115_fpDivTest_o(12));

    -- regOverRegWithUf_uid120_fpDivTest(LOGICAL,119)@26
    regOverRegWithUf_uid120_fpDivTest_q <= expUdf_uid115_fpDivTest_n and excR_x_uid31_fpDivTest_q and excR_y_uid45_fpDivTest_q;

    -- zeroOverReg_uid119_fpDivTest(LOGICAL,118)@26
    zeroOverReg_uid119_fpDivTest_q <= redist22_excZ_x_uid23_fpDivTest_q_1_q and excR_y_uid45_fpDivTest_q;

    -- excRZero_uid123_fpDivTest(LOGICAL,122)@26 + 1
    excRZero_uid123_fpDivTest_qi <= zeroOverReg_uid119_fpDivTest_q or regOverRegWithUf_uid120_fpDivTest_q or regOrZeroOverInf_uid122_fpDivTest_q;
    excRZero_uid123_fpDivTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => excRZero_uid123_fpDivTest_qi, xout => excRZero_uid123_fpDivTest_q, clk => clk, aclr => areset, ena => '1' );

    -- concExc_uid132_fpDivTest(BITJOIN,131)@27
    concExc_uid132_fpDivTest_q <= excRNaN_uid131_fpDivTest_q & excRInf_uid128_fpDivTest_q & excRZero_uid123_fpDivTest_q;

    -- excREnc_uid133_fpDivTest(LOOKUP,132)@27 + 1
    excREnc_uid133_fpDivTest_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                excREnc_uid133_fpDivTest_q <= "01";
            ELSE
                CASE (concExc_uid132_fpDivTest_q) IS
                    WHEN "000" => excREnc_uid133_fpDivTest_q <= "01";
                    WHEN "001" => excREnc_uid133_fpDivTest_q <= "00";
                    WHEN "010" => excREnc_uid133_fpDivTest_q <= "10";
                    WHEN "011" => excREnc_uid133_fpDivTest_q <= "00";
                    WHEN "100" => excREnc_uid133_fpDivTest_q <= "11";
                    WHEN "101" => excREnc_uid133_fpDivTest_q <= "00";
                    WHEN "110" => excREnc_uid133_fpDivTest_q <= "00";
                    WHEN "111" => excREnc_uid133_fpDivTest_q <= "00";
                    WHEN OTHERS => -- unreachable
                                   excREnc_uid133_fpDivTest_q <= (others => '-');
                END CASE;
            END IF;
        END IF;
    END PROCESS;

    -- redist3_excREnc_uid133_fpDivTest_q_8(DELAY,190)
    redist3_excREnc_uid133_fpDivTest_q_8 : dspba_delay
    GENERIC MAP ( width => 2, depth => 7, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => excREnc_uid133_fpDivTest_q, xout => redist3_excREnc_uid133_fpDivTest_q_8_q, clk => clk, aclr => areset, ena => '1' );

    -- expRPostExc_uid141_fpDivTest(MUX,140)@35
    expRPostExc_uid141_fpDivTest_s <= redist3_excREnc_uid133_fpDivTest_q_8_q;
    expRPostExc_uid141_fpDivTest_combproc: PROCESS (expRPostExc_uid141_fpDivTest_s, cstAllZWE_uid20_fpDivTest_q, expFracPostRndInc_uid110_fpDivTest_expRPreExc_uid112_fpDivTest_merged_q, cstAllOWE_uid18_fpDivTest_q)
    BEGIN
        CASE (expRPostExc_uid141_fpDivTest_s) IS
            WHEN "00" => expRPostExc_uid141_fpDivTest_q <= cstAllZWE_uid20_fpDivTest_q;
            WHEN "01" => expRPostExc_uid141_fpDivTest_q <= expFracPostRndInc_uid110_fpDivTest_expRPreExc_uid112_fpDivTest_merged_q;
            WHEN "10" => expRPostExc_uid141_fpDivTest_q <= cstAllOWE_uid18_fpDivTest_q;
            WHEN "11" => expRPostExc_uid141_fpDivTest_q <= cstAllOWE_uid18_fpDivTest_q;
            WHEN OTHERS => expRPostExc_uid141_fpDivTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- oneFracRPostExc2_uid134_fpDivTest(CONSTANT,133)
    oneFracRPostExc2_uid134_fpDivTest_q <= "00000000000000000000001";

    -- fracPostRndFPostUlp_uid106_fpDivTest(BITSELECT,105)@34
    fracPostRndFPostUlp_uid106_fpDivTest_in <= fracRPreExcExt_uid105_fpDivTest_q(22 downto 0);
    fracPostRndFPostUlp_uid106_fpDivTest_b <= fracPostRndFPostUlp_uid106_fpDivTest_in(22 downto 0);

    -- fracRPreExc_uid107_fpDivTest(MUX,106)@34 + 1
    fracRPreExc_uid107_fpDivTest_s <= extraUlp_uid103_fpDivTest_q;
    fracRPreExc_uid107_fpDivTest_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                fracRPreExc_uid107_fpDivTest_q <= (others => '0');
            ELSE
                CASE (fracRPreExc_uid107_fpDivTest_s) IS
                    WHEN "0" => fracRPreExc_uid107_fpDivTest_q <= redist5_fracPostRndFT_uid104_fpDivTest_b_9_outputreg0_q;
                    WHEN "1" => fracRPreExc_uid107_fpDivTest_q <= fracPostRndFPostUlp_uid106_fpDivTest_b;
                    WHEN OTHERS => fracRPreExc_uid107_fpDivTest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;

    -- fracRPostExc_uid137_fpDivTest(MUX,136)@35
    fracRPostExc_uid137_fpDivTest_s <= redist3_excREnc_uid133_fpDivTest_q_8_q;
    fracRPostExc_uid137_fpDivTest_combproc: PROCESS (fracRPostExc_uid137_fpDivTest_s, paddingY_uid15_fpDivTest_q, fracRPreExc_uid107_fpDivTest_q, oneFracRPostExc2_uid134_fpDivTest_q)
    BEGIN
        CASE (fracRPostExc_uid137_fpDivTest_s) IS
            WHEN "00" => fracRPostExc_uid137_fpDivTest_q <= paddingY_uid15_fpDivTest_q;
            WHEN "01" => fracRPostExc_uid137_fpDivTest_q <= fracRPreExc_uid107_fpDivTest_q;
            WHEN "10" => fracRPostExc_uid137_fpDivTest_q <= paddingY_uid15_fpDivTest_q;
            WHEN "11" => fracRPostExc_uid137_fpDivTest_q <= oneFracRPostExc2_uid134_fpDivTest_q;
            WHEN OTHERS => fracRPostExc_uid137_fpDivTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- divR_uid144_fpDivTest(BITJOIN,143)@35
    divR_uid144_fpDivTest_q <= redist2_sRPostExc_uid143_fpDivTest_q_8_q & expRPostExc_uid141_fpDivTest_q & fracRPostExc_uid137_fpDivTest_q;

    -- xOut(GPOUT,4)@35
    q <= divR_uid144_fpDivTest_q;

END normal;
