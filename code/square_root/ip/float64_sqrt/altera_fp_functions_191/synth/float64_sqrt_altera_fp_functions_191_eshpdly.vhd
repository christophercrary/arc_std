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

-- VHDL created from float64_sqrt_altera_fp_functions_191_eshpdly
-- VHDL created on Mon Sep 26 21:01:13 2022


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

entity float64_sqrt_altera_fp_functions_191_eshpdly is
    port (
        a : in std_logic_vector(63 downto 0);  -- float64_m52
        q : out std_logic_vector(63 downto 0);  -- float64_m52
        clk : in std_logic;
        areset : in std_logic
    );
end float64_sqrt_altera_fp_functions_191_eshpdly;

architecture normal of float64_sqrt_altera_fp_functions_191_eshpdly is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expX_uid6_fpSqrtTest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal signX_uid7_fpSqrtTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal cstAllOWE_uid8_fpSqrtTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal cstZeroWF_uid9_fpSqrtTest_q : STD_LOGIC_VECTOR (51 downto 0);
    signal cstAllZWE_uid10_fpSqrtTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal frac_x_uid12_fpSqrtTest_b : STD_LOGIC_VECTOR (51 downto 0);
    signal excZ_x_uid13_fpSqrtTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_x_uid13_fpSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid14_fpSqrtTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid14_fpSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid16_fpSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_x_uid17_fpSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid18_fpSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid19_fpSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid20_fpSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_x_uid21_fpSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sBias_uid22_fpSqrtTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal expEvenSig_uid24_fpSqrtTest_a : STD_LOGIC_VECTOR (11 downto 0);
    signal expEvenSig_uid24_fpSqrtTest_b : STD_LOGIC_VECTOR (11 downto 0);
    signal expEvenSig_uid24_fpSqrtTest_o : STD_LOGIC_VECTOR (11 downto 0);
    signal expEvenSig_uid24_fpSqrtTest_q : STD_LOGIC_VECTOR (11 downto 0);
    signal expREven_uid25_fpSqrtTest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal sBiasM1_uid26_fpSqrtTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal expOddSig_uid27_fpSqrtTest_a : STD_LOGIC_VECTOR (11 downto 0);
    signal expOddSig_uid27_fpSqrtTest_b : STD_LOGIC_VECTOR (11 downto 0);
    signal expOddSig_uid27_fpSqrtTest_o : STD_LOGIC_VECTOR (11 downto 0);
    signal expOddSig_uid27_fpSqrtTest_q : STD_LOGIC_VECTOR (11 downto 0);
    signal expROdd_uid28_fpSqrtTest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal expX0PS_uid29_fpSqrtTest_in : STD_LOGIC_VECTOR (0 downto 0);
    signal expX0PS_uid29_fpSqrtTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal expOddSelect_uid30_fpSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expRMux_uid31_fpSqrtTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal expRMux_uid31_fpSqrtTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal addrFull_uid33_fpSqrtTest_q : STD_LOGIC_VECTOR (52 downto 0);
    signal yAddr_uid35_fpSqrtTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal yForPe_uid36_fpSqrtTest_in : STD_LOGIC_VECTOR (44 downto 0);
    signal yForPe_uid36_fpSqrtTest_b : STD_LOGIC_VECTOR (44 downto 0);
    signal expInc_uid38_fpSqrtTest_in : STD_LOGIC_VECTOR (58 downto 0);
    signal expInc_uid38_fpSqrtTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPostProcessings_uid39_fpSqrtTest_in : STD_LOGIC_VECTOR (56 downto 0);
    signal fracRPostProcessings_uid39_fpSqrtTest_b : STD_LOGIC_VECTOR (51 downto 0);
    signal expR_uid40_fpSqrtTest_a : STD_LOGIC_VECTOR (11 downto 0);
    signal expR_uid40_fpSqrtTest_b : STD_LOGIC_VECTOR (11 downto 0);
    signal expR_uid40_fpSqrtTest_o : STD_LOGIC_VECTOR (11 downto 0);
    signal expR_uid40_fpSqrtTest_q : STD_LOGIC_VECTOR (11 downto 0);
    signal invSignX_uid41_fpSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal inInfAndNotNeg_uid42_fpSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal minReg_uid43_fpSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal minInf_uid44_fpSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid45_fpSqrtTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid45_fpSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excConc_uid46_fpSqrtTest_q : STD_LOGIC_VECTOR (2 downto 0);
    signal fracSelIn_uid47_fpSqrtTest_q : STD_LOGIC_VECTOR (3 downto 0);
    signal fracSel_uid48_fpSqrtTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal expRR_uid51_fpSqrtTest_in : STD_LOGIC_VECTOR (10 downto 0);
    signal expRR_uid51_fpSqrtTest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal expRPostExc_uid53_fpSqrtTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal expRPostExc_uid53_fpSqrtTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal fracNaN_uid54_fpSqrtTest_q : STD_LOGIC_VECTOR (51 downto 0);
    signal fracRPostExc_uid58_fpSqrtTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid58_fpSqrtTest_q : STD_LOGIC_VECTOR (51 downto 0);
    signal negZero_uid59_fpSqrtTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal negZero_uid59_fpSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal RSqrt_uid60_fpSqrtTest_q : STD_LOGIC_VECTOR (63 downto 0);
    signal os_uid64_sqrtTables_q : STD_LOGIC_VECTOR (56 downto 0);
    signal os_uid68_sqrtTables_q : STD_LOGIC_VECTOR (48 downto 0);
    signal yT1_uid88_invPolyEval_b : STD_LOGIC_VECTOR (16 downto 0);
    signal lowRangeB_uid90_invPolyEval_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeB_uid90_invPolyEval_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highBBits_uid91_invPolyEval_b : STD_LOGIC_VECTOR (16 downto 0);
    signal s1sumAHighB_uid92_invPolyEval_a : STD_LOGIC_VECTOR (24 downto 0);
    signal s1sumAHighB_uid92_invPolyEval_b : STD_LOGIC_VECTOR (24 downto 0);
    signal s1sumAHighB_uid92_invPolyEval_o : STD_LOGIC_VECTOR (24 downto 0);
    signal s1sumAHighB_uid92_invPolyEval_q : STD_LOGIC_VECTOR (24 downto 0);
    signal s1_uid93_invPolyEval_q : STD_LOGIC_VECTOR (25 downto 0);
    signal yT2_uid94_invPolyEval_b : STD_LOGIC_VECTOR (23 downto 0);
    signal lowRangeB_uid96_invPolyEval_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeB_uid96_invPolyEval_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highBBits_uid97_invPolyEval_b : STD_LOGIC_VECTOR (25 downto 0);
    signal s2sumAHighB_uid98_invPolyEval_a : STD_LOGIC_VECTOR (33 downto 0);
    signal s2sumAHighB_uid98_invPolyEval_b : STD_LOGIC_VECTOR (33 downto 0);
    signal s2sumAHighB_uid98_invPolyEval_o : STD_LOGIC_VECTOR (33 downto 0);
    signal s2sumAHighB_uid98_invPolyEval_q : STD_LOGIC_VECTOR (33 downto 0);
    signal s2_uid99_invPolyEval_q : STD_LOGIC_VECTOR (34 downto 0);
    signal yT3_uid100_invPolyEval_b : STD_LOGIC_VECTOR (32 downto 0);
    signal lowRangeB_uid102_invPolyEval_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeB_uid102_invPolyEval_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highBBits_uid103_invPolyEval_b : STD_LOGIC_VECTOR (32 downto 0);
    signal s3sumAHighB_uid104_invPolyEval_a : STD_LOGIC_VECTOR (40 downto 0);
    signal s3sumAHighB_uid104_invPolyEval_b : STD_LOGIC_VECTOR (40 downto 0);
    signal s3sumAHighB_uid104_invPolyEval_o : STD_LOGIC_VECTOR (40 downto 0);
    signal s3sumAHighB_uid104_invPolyEval_q : STD_LOGIC_VECTOR (40 downto 0);
    signal s3_uid105_invPolyEval_q : STD_LOGIC_VECTOR (41 downto 0);
    signal yT4_uid106_invPolyEval_b : STD_LOGIC_VECTOR (39 downto 0);
    signal lowRangeB_uid108_invPolyEval_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeB_uid108_invPolyEval_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highBBits_uid109_invPolyEval_b : STD_LOGIC_VECTOR (40 downto 0);
    signal s4sumAHighB_uid110_invPolyEval_a : STD_LOGIC_VECTOR (49 downto 0);
    signal s4sumAHighB_uid110_invPolyEval_b : STD_LOGIC_VECTOR (49 downto 0);
    signal s4sumAHighB_uid110_invPolyEval_o : STD_LOGIC_VECTOR (49 downto 0);
    signal s4sumAHighB_uid110_invPolyEval_q : STD_LOGIC_VECTOR (49 downto 0);
    signal s4_uid111_invPolyEval_q : STD_LOGIC_VECTOR (50 downto 0);
    signal lowRangeB_uid114_invPolyEval_in : STD_LOGIC_VECTOR (1 downto 0);
    signal lowRangeB_uid114_invPolyEval_b : STD_LOGIC_VECTOR (1 downto 0);
    signal highBBits_uid115_invPolyEval_b : STD_LOGIC_VECTOR (49 downto 0);
    signal s5sumAHighB_uid116_invPolyEval_a : STD_LOGIC_VECTOR (57 downto 0);
    signal s5sumAHighB_uid116_invPolyEval_b : STD_LOGIC_VECTOR (57 downto 0);
    signal s5sumAHighB_uid116_invPolyEval_o : STD_LOGIC_VECTOR (57 downto 0);
    signal s5sumAHighB_uid116_invPolyEval_q : STD_LOGIC_VECTOR (57 downto 0);
    signal s5_uid117_invPolyEval_q : STD_LOGIC_VECTOR (59 downto 0);
    signal osig_uid120_pT1_uid89_invPolyEval_b : STD_LOGIC_VECTOR (17 downto 0);
    signal osig_uid123_pT2_uid95_invPolyEval_b : STD_LOGIC_VECTOR (26 downto 0);
    signal nx_mergedSignalTM_uid137_pT3_uid101_invPolyEval_q : STD_LOGIC_VECTOR (33 downto 0);
    signal aboveLeftY_mergedSignalTM_uid144_pT3_uid101_invPolyEval_q : STD_LOGIC_VECTOR (17 downto 0);
    signal rightBottomX_bottomExtension_uid146_pT3_uid101_invPolyEval_q : STD_LOGIC_VECTOR (1 downto 0);
    signal rightBottomX_mergedSignalTM_uid148_pT3_uid101_invPolyEval_q : STD_LOGIC_VECTOR (17 downto 0);
    signal lowRangeB_uid154_pT3_uid101_invPolyEval_in : STD_LOGIC_VECTOR (17 downto 0);
    signal lowRangeB_uid154_pT3_uid101_invPolyEval_b : STD_LOGIC_VECTOR (17 downto 0);
    signal highBBits_uid155_pT3_uid101_invPolyEval_b : STD_LOGIC_VECTOR (18 downto 0);
    signal lev1_a0sumAHighB_uid156_pT3_uid101_invPolyEval_a : STD_LOGIC_VECTOR (36 downto 0);
    signal lev1_a0sumAHighB_uid156_pT3_uid101_invPolyEval_b : STD_LOGIC_VECTOR (36 downto 0);
    signal lev1_a0sumAHighB_uid156_pT3_uid101_invPolyEval_o : STD_LOGIC_VECTOR (36 downto 0);
    signal lev1_a0sumAHighB_uid156_pT3_uid101_invPolyEval_q : STD_LOGIC_VECTOR (36 downto 0);
    signal lev1_a0_uid157_pT3_uid101_invPolyEval_q : STD_LOGIC_VECTOR (54 downto 0);
    signal os_uid158_pT3_uid101_invPolyEval_in : STD_LOGIC_VECTOR (52 downto 0);
    signal os_uid158_pT3_uid101_invPolyEval_b : STD_LOGIC_VECTOR (33 downto 0);
    signal nx_mergedSignalTM_uid172_pT4_uid107_invPolyEval_q : STD_LOGIC_VECTOR (40 downto 0);
    signal topRangeX_uid174_pT4_uid107_invPolyEval_b : STD_LOGIC_VECTOR (26 downto 0);
    signal topRangeY_uid175_pT4_uid107_invPolyEval_b : STD_LOGIC_VECTOR (26 downto 0);
    signal aboveLeftX_uid176_pT4_uid107_invPolyEval_b : STD_LOGIC_VECTOR (17 downto 0);
    signal aboveLeftY_bottomExtension_uid177_pT4_uid107_invPolyEval_q : STD_LOGIC_VECTOR (2 downto 0);
    signal aboveLeftY_bottomRange_uid178_pT4_uid107_invPolyEval_in : STD_LOGIC_VECTOR (14 downto 0);
    signal aboveLeftY_bottomRange_uid178_pT4_uid107_invPolyEval_b : STD_LOGIC_VECTOR (14 downto 0);
    signal aboveLeftY_mergedSignalTM_uid179_pT4_uid107_invPolyEval_q : STD_LOGIC_VECTOR (17 downto 0);
    signal rightBottomX_bottomExtension_uid181_pT4_uid107_invPolyEval_q : STD_LOGIC_VECTOR (3 downto 0);
    signal rightBottomX_bottomRange_uid182_pT4_uid107_invPolyEval_in : STD_LOGIC_VECTOR (13 downto 0);
    signal rightBottomX_bottomRange_uid182_pT4_uid107_invPolyEval_b : STD_LOGIC_VECTOR (13 downto 0);
    signal rightBottomX_mergedSignalTM_uid183_pT4_uid107_invPolyEval_q : STD_LOGIC_VECTOR (17 downto 0);
    signal rightBottomY_uid185_pT4_uid107_invPolyEval_b : STD_LOGIC_VECTOR (17 downto 0);
    signal lowRangeB_uid189_pT4_uid107_invPolyEval_in : STD_LOGIC_VECTOR (8 downto 0);
    signal lowRangeB_uid189_pT4_uid107_invPolyEval_b : STD_LOGIC_VECTOR (8 downto 0);
    signal highBBits_uid190_pT4_uid107_invPolyEval_b : STD_LOGIC_VECTOR (27 downto 0);
    signal lev1_a0sumAHighB_uid191_pT4_uid107_invPolyEval_a : STD_LOGIC_VECTOR (54 downto 0);
    signal lev1_a0sumAHighB_uid191_pT4_uid107_invPolyEval_b : STD_LOGIC_VECTOR (54 downto 0);
    signal lev1_a0sumAHighB_uid191_pT4_uid107_invPolyEval_o : STD_LOGIC_VECTOR (54 downto 0);
    signal lev1_a0sumAHighB_uid191_pT4_uid107_invPolyEval_q : STD_LOGIC_VECTOR (54 downto 0);
    signal lev1_a0_uid192_pT4_uid107_invPolyEval_q : STD_LOGIC_VECTOR (63 downto 0);
    signal os_uid193_pT4_uid107_invPolyEval_in : STD_LOGIC_VECTOR (61 downto 0);
    signal os_uid193_pT4_uid107_invPolyEval_b : STD_LOGIC_VECTOR (41 downto 0);
    signal nx_mergedSignalTM_uid207_pT5_uid113_invPolyEval_q : STD_LOGIC_VECTOR (45 downto 0);
    signal topRangeX_uid209_pT5_uid113_invPolyEval_b : STD_LOGIC_VECTOR (26 downto 0);
    signal topRangeY_uid210_pT5_uid113_invPolyEval_b : STD_LOGIC_VECTOR (26 downto 0);
    signal aboveLeftY_bottomRange_uid213_pT5_uid113_invPolyEval_in : STD_LOGIC_VECTOR (23 downto 0);
    signal aboveLeftY_bottomRange_uid213_pT5_uid113_invPolyEval_b : STD_LOGIC_VECTOR (23 downto 0);
    signal aboveLeftY_mergedSignalTM_uid214_pT5_uid113_invPolyEval_q : STD_LOGIC_VECTOR (26 downto 0);
    signal rightBottomX_bottomExtension_uid216_pT5_uid113_invPolyEval_q : STD_LOGIC_VECTOR (7 downto 0);
    signal rightBottomX_bottomRange_uid217_pT5_uid113_invPolyEval_in : STD_LOGIC_VECTOR (18 downto 0);
    signal rightBottomX_bottomRange_uid217_pT5_uid113_invPolyEval_b : STD_LOGIC_VECTOR (18 downto 0);
    signal rightBottomX_mergedSignalTM_uid218_pT5_uid113_invPolyEval_q : STD_LOGIC_VECTOR (26 downto 0);
    signal aboveLeftX_uid221_pT5_uid113_invPolyEval_in : STD_LOGIC_VECTOR (18 downto 0);
    signal aboveLeftX_uid221_pT5_uid113_invPolyEval_b : STD_LOGIC_VECTOR (1 downto 0);
    signal aboveLeftY_uid222_pT5_uid113_invPolyEval_in : STD_LOGIC_VECTOR (23 downto 0);
    signal aboveLeftY_uid222_pT5_uid113_invPolyEval_b : STD_LOGIC_VECTOR (1 downto 0);
    signal sm0_uid226_pT5_uid113_invPolyEval_a0 : STD_LOGIC_VECTOR (1 downto 0);
    signal sm0_uid226_pT5_uid113_invPolyEval_b0 : STD_LOGIC_VECTOR (1 downto 0);
    signal sm0_uid226_pT5_uid113_invPolyEval_a1 : STD_LOGIC_VECTOR (1 downto 0);
    signal sm0_uid226_pT5_uid113_invPolyEval_b1 : STD_LOGIC_VECTOR (1 downto 0);
    signal sm0_uid226_pT5_uid113_invPolyEval_a2 : STD_LOGIC_VECTOR (1 downto 0);
    signal sm0_uid226_pT5_uid113_invPolyEval_b2 : STD_LOGIC_VECTOR (1 downto 0);
    signal sm0_uid226_pT5_uid113_invPolyEval_s1 : STD_LOGIC_VECTOR (3 downto 0);
    signal sm0_uid226_pT5_uid113_invPolyEval_pr : UNSIGNED (3 downto 0);
    attribute multstyle : string;
    attribute multstyle of sm0_uid226_pT5_uid113_invPolyEval_pr : signal is "logic";
    signal sm0_uid226_pT5_uid113_invPolyEval_q : STD_LOGIC_VECTOR (3 downto 0);
    signal sumAb_uid227_pT5_uid113_invPolyEval_q : STD_LOGIC_VECTOR (57 downto 0);
    signal lowRangeB_uid228_pT5_uid113_invPolyEval_in : STD_LOGIC_VECTOR (22 downto 0);
    signal lowRangeB_uid228_pT5_uid113_invPolyEval_b : STD_LOGIC_VECTOR (22 downto 0);
    signal highBBits_uid229_pT5_uid113_invPolyEval_b : STD_LOGIC_VECTOR (31 downto 0);
    signal lev1_a0sumAHighB_uid230_pT5_uid113_invPolyEval_a : STD_LOGIC_VECTOR (58 downto 0);
    signal lev1_a0sumAHighB_uid230_pT5_uid113_invPolyEval_b : STD_LOGIC_VECTOR (58 downto 0);
    signal lev1_a0sumAHighB_uid230_pT5_uid113_invPolyEval_o : STD_LOGIC_VECTOR (58 downto 0);
    signal lev1_a0sumAHighB_uid230_pT5_uid113_invPolyEval_q : STD_LOGIC_VECTOR (58 downto 0);
    signal lev1_a0_uid231_pT5_uid113_invPolyEval_q : STD_LOGIC_VECTOR (81 downto 0);
    signal os_uid232_pT5_uid113_invPolyEval_in : STD_LOGIC_VECTOR (79 downto 0);
    signal os_uid232_pT5_uid113_invPolyEval_b : STD_LOGIC_VECTOR (51 downto 0);
    signal z0_uid234_fracXIsZero_uid15_fpSqrtTest_in : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid234_fracXIsZero_uid15_fpSqrtTest_b : STD_LOGIC_VECTOR (5 downto 0);
    signal eq0_uid236_fracXIsZero_uid15_fpSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal z1_uid237_fracXIsZero_uid15_fpSqrtTest_in : STD_LOGIC_VECTOR (11 downto 0);
    signal z1_uid237_fracXIsZero_uid15_fpSqrtTest_b : STD_LOGIC_VECTOR (5 downto 0);
    signal eq1_uid239_fracXIsZero_uid15_fpSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal z2_uid240_fracXIsZero_uid15_fpSqrtTest_in : STD_LOGIC_VECTOR (17 downto 0);
    signal z2_uid240_fracXIsZero_uid15_fpSqrtTest_b : STD_LOGIC_VECTOR (5 downto 0);
    signal eq2_uid242_fracXIsZero_uid15_fpSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal z3_uid243_fracXIsZero_uid15_fpSqrtTest_in : STD_LOGIC_VECTOR (23 downto 0);
    signal z3_uid243_fracXIsZero_uid15_fpSqrtTest_b : STD_LOGIC_VECTOR (5 downto 0);
    signal eq3_uid245_fracXIsZero_uid15_fpSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal z4_uid246_fracXIsZero_uid15_fpSqrtTest_in : STD_LOGIC_VECTOR (29 downto 0);
    signal z4_uid246_fracXIsZero_uid15_fpSqrtTest_b : STD_LOGIC_VECTOR (5 downto 0);
    signal eq4_uid248_fracXIsZero_uid15_fpSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal z5_uid249_fracXIsZero_uid15_fpSqrtTest_in : STD_LOGIC_VECTOR (35 downto 0);
    signal z5_uid249_fracXIsZero_uid15_fpSqrtTest_b : STD_LOGIC_VECTOR (5 downto 0);
    signal eq5_uid251_fracXIsZero_uid15_fpSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal z6_uid252_fracXIsZero_uid15_fpSqrtTest_in : STD_LOGIC_VECTOR (41 downto 0);
    signal z6_uid252_fracXIsZero_uid15_fpSqrtTest_b : STD_LOGIC_VECTOR (5 downto 0);
    signal eq6_uid254_fracXIsZero_uid15_fpSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal z7_uid255_fracXIsZero_uid15_fpSqrtTest_in : STD_LOGIC_VECTOR (47 downto 0);
    signal z7_uid255_fracXIsZero_uid15_fpSqrtTest_b : STD_LOGIC_VECTOR (5 downto 0);
    signal eq7_uid257_fracXIsZero_uid15_fpSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal z8_uid258_fracXIsZero_uid15_fpSqrtTest_b : STD_LOGIC_VECTOR (3 downto 0);
    signal eq8_uid260_fracXIsZero_uid15_fpSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid261_fracXIsZero_uid15_fpSqrtTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid261_fracXIsZero_uid15_fpSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid262_fracXIsZero_uid15_fpSqrtTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid262_fracXIsZero_uid15_fpSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev1_uid263_fracXIsZero_uid15_fpSqrtTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev1_uid263_fracXIsZero_uid15_fpSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal memoryC0_uid62_sqrtTables_lutmem_reset0 : std_logic;
    signal memoryC0_uid62_sqrtTables_lutmem_ia : STD_LOGIC_VECTOR (39 downto 0);
    signal memoryC0_uid62_sqrtTables_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC0_uid62_sqrtTables_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC0_uid62_sqrtTables_lutmem_ir : STD_LOGIC_VECTOR (39 downto 0);
    signal memoryC0_uid62_sqrtTables_lutmem_r : STD_LOGIC_VECTOR (39 downto 0);
    signal memoryC0_uid63_sqrtTables_lutmem_reset0 : std_logic;
    signal memoryC0_uid63_sqrtTables_lutmem_ia : STD_LOGIC_VECTOR (16 downto 0);
    signal memoryC0_uid63_sqrtTables_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC0_uid63_sqrtTables_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC0_uid63_sqrtTables_lutmem_ir : STD_LOGIC_VECTOR (16 downto 0);
    signal memoryC0_uid63_sqrtTables_lutmem_r : STD_LOGIC_VECTOR (16 downto 0);
    signal memoryC1_uid66_sqrtTables_lutmem_reset0 : std_logic;
    signal memoryC1_uid66_sqrtTables_lutmem_ia : STD_LOGIC_VECTOR (39 downto 0);
    signal memoryC1_uid66_sqrtTables_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC1_uid66_sqrtTables_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC1_uid66_sqrtTables_lutmem_ir : STD_LOGIC_VECTOR (39 downto 0);
    signal memoryC1_uid66_sqrtTables_lutmem_r : STD_LOGIC_VECTOR (39 downto 0);
    signal memoryC1_uid67_sqrtTables_lutmem_reset0 : std_logic;
    signal memoryC1_uid67_sqrtTables_lutmem_ia : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC1_uid67_sqrtTables_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC1_uid67_sqrtTables_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC1_uid67_sqrtTables_lutmem_ir : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC1_uid67_sqrtTables_lutmem_r : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC2_uid70_sqrtTables_lutmem_reset0 : std_logic;
    signal memoryC2_uid70_sqrtTables_lutmem_ia : STD_LOGIC_VECTOR (39 downto 0);
    signal memoryC2_uid70_sqrtTables_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC2_uid70_sqrtTables_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC2_uid70_sqrtTables_lutmem_ir : STD_LOGIC_VECTOR (39 downto 0);
    signal memoryC2_uid70_sqrtTables_lutmem_r : STD_LOGIC_VECTOR (39 downto 0);
    signal memoryC3_uid73_sqrtTables_lutmem_reset0 : std_logic;
    signal memoryC3_uid73_sqrtTables_lutmem_ia : STD_LOGIC_VECTOR (32 downto 0);
    signal memoryC3_uid73_sqrtTables_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC3_uid73_sqrtTables_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC3_uid73_sqrtTables_lutmem_ir : STD_LOGIC_VECTOR (32 downto 0);
    signal memoryC3_uid73_sqrtTables_lutmem_r : STD_LOGIC_VECTOR (32 downto 0);
    signal memoryC4_uid76_sqrtTables_lutmem_reset0 : std_logic;
    signal memoryC4_uid76_sqrtTables_lutmem_ia : STD_LOGIC_VECTOR (23 downto 0);
    signal memoryC4_uid76_sqrtTables_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC4_uid76_sqrtTables_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC4_uid76_sqrtTables_lutmem_ir : STD_LOGIC_VECTOR (23 downto 0);
    signal memoryC4_uid76_sqrtTables_lutmem_r : STD_LOGIC_VECTOR (23 downto 0);
    signal memoryC5_uid79_sqrtTables_lutmem_reset0 : std_logic;
    signal memoryC5_uid79_sqrtTables_lutmem_ia : STD_LOGIC_VECTOR (16 downto 0);
    signal memoryC5_uid79_sqrtTables_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC5_uid79_sqrtTables_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC5_uid79_sqrtTables_lutmem_ir : STD_LOGIC_VECTOR (16 downto 0);
    signal memoryC5_uid79_sqrtTables_lutmem_r : STD_LOGIC_VECTOR (16 downto 0);
    signal prodXY_uid119_pT1_uid89_invPolyEval_cma_reset : std_logic;
    type prodXY_uid119_pT1_uid89_invPolyEval_cma_ahtype is array(NATURAL range <>) of UNSIGNED(16 downto 0);
    signal prodXY_uid119_pT1_uid89_invPolyEval_cma_ah : prodXY_uid119_pT1_uid89_invPolyEval_cma_ahtype(0 to 0);
    attribute preserve_syn_only : boolean;
    attribute preserve_syn_only of prodXY_uid119_pT1_uid89_invPolyEval_cma_ah : signal is true;
    type prodXY_uid119_pT1_uid89_invPolyEval_cma_chtype is array(NATURAL range <>) of SIGNED(16 downto 0);
    signal prodXY_uid119_pT1_uid89_invPolyEval_cma_ch : prodXY_uid119_pT1_uid89_invPolyEval_cma_chtype(0 to 0);
    attribute preserve_syn_only of prodXY_uid119_pT1_uid89_invPolyEval_cma_ch : signal is true;
    signal prodXY_uid119_pT1_uid89_invPolyEval_cma_a0 : STD_LOGIC_VECTOR (16 downto 0);
    signal prodXY_uid119_pT1_uid89_invPolyEval_cma_c0 : STD_LOGIC_VECTOR (16 downto 0);
    signal prodXY_uid119_pT1_uid89_invPolyEval_cma_s0 : STD_LOGIC_VECTOR (33 downto 0);
    signal prodXY_uid119_pT1_uid89_invPolyEval_cma_qq : STD_LOGIC_VECTOR (33 downto 0);
    signal prodXY_uid119_pT1_uid89_invPolyEval_cma_q : STD_LOGIC_VECTOR (33 downto 0);
    signal prodXY_uid119_pT1_uid89_invPolyEval_cma_ena0 : std_logic;
    signal prodXY_uid119_pT1_uid89_invPolyEval_cma_ena1 : std_logic;
    signal prodXY_uid119_pT1_uid89_invPolyEval_cma_ena2 : std_logic;
    signal prodXY_uid122_pT2_uid95_invPolyEval_cma_reset : std_logic;
    type prodXY_uid122_pT2_uid95_invPolyEval_cma_ahtype is array(NATURAL range <>) of UNSIGNED(23 downto 0);
    signal prodXY_uid122_pT2_uid95_invPolyEval_cma_ah : prodXY_uid122_pT2_uid95_invPolyEval_cma_ahtype(0 to 0);
    attribute preserve_syn_only of prodXY_uid122_pT2_uid95_invPolyEval_cma_ah : signal is true;
    type prodXY_uid122_pT2_uid95_invPolyEval_cma_chtype is array(NATURAL range <>) of SIGNED(25 downto 0);
    signal prodXY_uid122_pT2_uid95_invPolyEval_cma_ch : prodXY_uid122_pT2_uid95_invPolyEval_cma_chtype(0 to 0);
    attribute preserve_syn_only of prodXY_uid122_pT2_uid95_invPolyEval_cma_ch : signal is true;
    signal prodXY_uid122_pT2_uid95_invPolyEval_cma_a0 : STD_LOGIC_VECTOR (23 downto 0);
    signal prodXY_uid122_pT2_uid95_invPolyEval_cma_c0 : STD_LOGIC_VECTOR (25 downto 0);
    signal prodXY_uid122_pT2_uid95_invPolyEval_cma_s0 : STD_LOGIC_VECTOR (49 downto 0);
    signal prodXY_uid122_pT2_uid95_invPolyEval_cma_qq : STD_LOGIC_VECTOR (49 downto 0);
    signal prodXY_uid122_pT2_uid95_invPolyEval_cma_q : STD_LOGIC_VECTOR (49 downto 0);
    signal prodXY_uid122_pT2_uid95_invPolyEval_cma_ena0 : std_logic;
    signal prodXY_uid122_pT2_uid95_invPolyEval_cma_ena1 : std_logic;
    signal prodXY_uid122_pT2_uid95_invPolyEval_cma_ena2 : std_logic;
    signal sm0_uid151_pT3_uid101_invPolyEval_cma_reset : std_logic;
    type sm0_uid151_pT3_uid101_invPolyEval_cma_ahtype is array(NATURAL range <>) of SIGNED(17 downto 0);
    signal sm0_uid151_pT3_uid101_invPolyEval_cma_ah : sm0_uid151_pT3_uid101_invPolyEval_cma_ahtype(0 to 0);
    attribute preserve_syn_only of sm0_uid151_pT3_uid101_invPolyEval_cma_ah : signal is true;
    signal sm0_uid151_pT3_uid101_invPolyEval_cma_ch : sm0_uid151_pT3_uid101_invPolyEval_cma_ahtype(0 to 0);
    attribute preserve_syn_only of sm0_uid151_pT3_uid101_invPolyEval_cma_ch : signal is true;
    signal sm0_uid151_pT3_uid101_invPolyEval_cma_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal sm0_uid151_pT3_uid101_invPolyEval_cma_c0 : STD_LOGIC_VECTOR (17 downto 0);
    signal sm0_uid151_pT3_uid101_invPolyEval_cma_s0 : STD_LOGIC_VECTOR (35 downto 0);
    signal sm0_uid151_pT3_uid101_invPolyEval_cma_qq : STD_LOGIC_VECTOR (35 downto 0);
    signal sm0_uid151_pT3_uid101_invPolyEval_cma_q : STD_LOGIC_VECTOR (35 downto 0);
    signal sm0_uid151_pT3_uid101_invPolyEval_cma_ena0 : std_logic;
    signal sm0_uid151_pT3_uid101_invPolyEval_cma_ena1 : std_logic;
    signal sm0_uid151_pT3_uid101_invPolyEval_cma_ena2 : std_logic;
    signal sm0_uid186_pT4_uid107_invPolyEval_cma_reset : std_logic;
    type sm0_uid186_pT4_uid107_invPolyEval_cma_ahtype is array(NATURAL range <>) of SIGNED(26 downto 0);
    signal sm0_uid186_pT4_uid107_invPolyEval_cma_ah : sm0_uid186_pT4_uid107_invPolyEval_cma_ahtype(0 to 0);
    attribute preserve_syn_only of sm0_uid186_pT4_uid107_invPolyEval_cma_ah : signal is true;
    signal sm0_uid186_pT4_uid107_invPolyEval_cma_ch : sm0_uid186_pT4_uid107_invPolyEval_cma_ahtype(0 to 0);
    attribute preserve_syn_only of sm0_uid186_pT4_uid107_invPolyEval_cma_ch : signal is true;
    signal sm0_uid186_pT4_uid107_invPolyEval_cma_a0 : STD_LOGIC_VECTOR (26 downto 0);
    signal sm0_uid186_pT4_uid107_invPolyEval_cma_c0 : STD_LOGIC_VECTOR (26 downto 0);
    signal sm0_uid186_pT4_uid107_invPolyEval_cma_s0 : STD_LOGIC_VECTOR (53 downto 0);
    signal sm0_uid186_pT4_uid107_invPolyEval_cma_qq : STD_LOGIC_VECTOR (53 downto 0);
    signal sm0_uid186_pT4_uid107_invPolyEval_cma_q : STD_LOGIC_VECTOR (53 downto 0);
    signal sm0_uid186_pT4_uid107_invPolyEval_cma_ena0 : std_logic;
    signal sm0_uid186_pT4_uid107_invPolyEval_cma_ena1 : std_logic;
    signal sm0_uid186_pT4_uid107_invPolyEval_cma_ena2 : std_logic;
    signal sm0_uid223_pT5_uid113_invPolyEval_cma_reset : std_logic;
    signal sm0_uid223_pT5_uid113_invPolyEval_cma_ah : sm0_uid186_pT4_uid107_invPolyEval_cma_ahtype(0 to 0);
    attribute preserve_syn_only of sm0_uid223_pT5_uid113_invPolyEval_cma_ah : signal is true;
    signal sm0_uid223_pT5_uid113_invPolyEval_cma_ch : sm0_uid186_pT4_uid107_invPolyEval_cma_ahtype(0 to 0);
    attribute preserve_syn_only of sm0_uid223_pT5_uid113_invPolyEval_cma_ch : signal is true;
    signal sm0_uid223_pT5_uid113_invPolyEval_cma_a0 : STD_LOGIC_VECTOR (26 downto 0);
    signal sm0_uid223_pT5_uid113_invPolyEval_cma_c0 : STD_LOGIC_VECTOR (26 downto 0);
    signal sm0_uid223_pT5_uid113_invPolyEval_cma_s0 : STD_LOGIC_VECTOR (53 downto 0);
    signal sm0_uid223_pT5_uid113_invPolyEval_cma_qq : STD_LOGIC_VECTOR (53 downto 0);
    signal sm0_uid223_pT5_uid113_invPolyEval_cma_q : STD_LOGIC_VECTOR (53 downto 0);
    signal sm0_uid223_pT5_uid113_invPolyEval_cma_ena0 : std_logic;
    signal sm0_uid223_pT5_uid113_invPolyEval_cma_ena1 : std_logic;
    signal sm0_uid223_pT5_uid113_invPolyEval_cma_ena2 : std_logic;
    signal multSumOfTwoTS_uid152_pT3_uid101_invPolyEval_cma_reset : std_logic;
    type multSumOfTwoTS_uid152_pT3_uid101_invPolyEval_cma_ahtype is array(NATURAL range <>) of UNSIGNED(17 downto 0);
    signal multSumOfTwoTS_uid152_pT3_uid101_invPolyEval_cma_ah : multSumOfTwoTS_uid152_pT3_uid101_invPolyEval_cma_ahtype(0 to 1);
    attribute preserve_syn_only of multSumOfTwoTS_uid152_pT3_uid101_invPolyEval_cma_ah : signal is true;
    signal multSumOfTwoTS_uid152_pT3_uid101_invPolyEval_cma_ch : sm0_uid151_pT3_uid101_invPolyEval_cma_ahtype(0 to 1);
    attribute preserve_syn_only of multSumOfTwoTS_uid152_pT3_uid101_invPolyEval_cma_ch : signal is true;
    signal multSumOfTwoTS_uid152_pT3_uid101_invPolyEval_cma_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal multSumOfTwoTS_uid152_pT3_uid101_invPolyEval_cma_c0 : STD_LOGIC_VECTOR (17 downto 0);
    signal multSumOfTwoTS_uid152_pT3_uid101_invPolyEval_cma_a1 : STD_LOGIC_VECTOR (17 downto 0);
    signal multSumOfTwoTS_uid152_pT3_uid101_invPolyEval_cma_c1 : STD_LOGIC_VECTOR (17 downto 0);
    signal multSumOfTwoTS_uid152_pT3_uid101_invPolyEval_cma_s0 : STD_LOGIC_VECTOR (36 downto 0);
    signal multSumOfTwoTS_uid152_pT3_uid101_invPolyEval_cma_qq : STD_LOGIC_VECTOR (36 downto 0);
    signal multSumOfTwoTS_uid152_pT3_uid101_invPolyEval_cma_q : STD_LOGIC_VECTOR (36 downto 0);
    signal multSumOfTwoTS_uid152_pT3_uid101_invPolyEval_cma_ena0 : std_logic;
    signal multSumOfTwoTS_uid152_pT3_uid101_invPolyEval_cma_ena1 : std_logic;
    signal multSumOfTwoTS_uid152_pT3_uid101_invPolyEval_cma_ena2 : std_logic;
    signal multSumOfTwoTS_uid187_pT4_uid107_invPolyEval_cma_reset : std_logic;
    signal multSumOfTwoTS_uid187_pT4_uid107_invPolyEval_cma_ah : multSumOfTwoTS_uid152_pT3_uid101_invPolyEval_cma_ahtype(0 to 1);
    attribute preserve_syn_only of multSumOfTwoTS_uid187_pT4_uid107_invPolyEval_cma_ah : signal is true;
    signal multSumOfTwoTS_uid187_pT4_uid107_invPolyEval_cma_ch : sm0_uid151_pT3_uid101_invPolyEval_cma_ahtype(0 to 1);
    attribute preserve_syn_only of multSumOfTwoTS_uid187_pT4_uid107_invPolyEval_cma_ch : signal is true;
    signal multSumOfTwoTS_uid187_pT4_uid107_invPolyEval_cma_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal multSumOfTwoTS_uid187_pT4_uid107_invPolyEval_cma_c0 : STD_LOGIC_VECTOR (17 downto 0);
    signal multSumOfTwoTS_uid187_pT4_uid107_invPolyEval_cma_a1 : STD_LOGIC_VECTOR (17 downto 0);
    signal multSumOfTwoTS_uid187_pT4_uid107_invPolyEval_cma_c1 : STD_LOGIC_VECTOR (17 downto 0);
    signal multSumOfTwoTS_uid187_pT4_uid107_invPolyEval_cma_s0 : STD_LOGIC_VECTOR (36 downto 0);
    signal multSumOfTwoTS_uid187_pT4_uid107_invPolyEval_cma_qq : STD_LOGIC_VECTOR (36 downto 0);
    signal multSumOfTwoTS_uid187_pT4_uid107_invPolyEval_cma_q : STD_LOGIC_VECTOR (36 downto 0);
    signal multSumOfTwoTS_uid187_pT4_uid107_invPolyEval_cma_ena0 : std_logic;
    signal multSumOfTwoTS_uid187_pT4_uid107_invPolyEval_cma_ena1 : std_logic;
    signal multSumOfTwoTS_uid187_pT4_uid107_invPolyEval_cma_ena2 : std_logic;
    signal multSumOfTwoTS_uid224_pT5_uid113_invPolyEval_cma_reset : std_logic;
    type multSumOfTwoTS_uid224_pT5_uid113_invPolyEval_cma_ahtype is array(NATURAL range <>) of UNSIGNED(26 downto 0);
    signal multSumOfTwoTS_uid224_pT5_uid113_invPolyEval_cma_ah : multSumOfTwoTS_uid224_pT5_uid113_invPolyEval_cma_ahtype(0 to 1);
    attribute preserve_syn_only of multSumOfTwoTS_uid224_pT5_uid113_invPolyEval_cma_ah : signal is true;
    signal multSumOfTwoTS_uid224_pT5_uid113_invPolyEval_cma_ch : sm0_uid186_pT4_uid107_invPolyEval_cma_ahtype(0 to 1);
    attribute preserve_syn_only of multSumOfTwoTS_uid224_pT5_uid113_invPolyEval_cma_ch : signal is true;
    signal multSumOfTwoTS_uid224_pT5_uid113_invPolyEval_cma_a0 : STD_LOGIC_VECTOR (26 downto 0);
    signal multSumOfTwoTS_uid224_pT5_uid113_invPolyEval_cma_c0 : STD_LOGIC_VECTOR (26 downto 0);
    signal multSumOfTwoTS_uid224_pT5_uid113_invPolyEval_cma_a1 : STD_LOGIC_VECTOR (26 downto 0);
    signal multSumOfTwoTS_uid224_pT5_uid113_invPolyEval_cma_c1 : STD_LOGIC_VECTOR (26 downto 0);
    signal multSumOfTwoTS_uid224_pT5_uid113_invPolyEval_cma_s0 : STD_LOGIC_VECTOR (54 downto 0);
    signal multSumOfTwoTS_uid224_pT5_uid113_invPolyEval_cma_s1 : STD_LOGIC_VECTOR (63 downto 0);
    signal multSumOfTwoTS_uid224_pT5_uid113_invPolyEval_cma_qq : STD_LOGIC_VECTOR (54 downto 0);
    signal multSumOfTwoTS_uid224_pT5_uid113_invPolyEval_cma_q : STD_LOGIC_VECTOR (54 downto 0);
    signal multSumOfTwoTS_uid224_pT5_uid113_invPolyEval_cma_ena0 : std_logic;
    signal multSumOfTwoTS_uid224_pT5_uid113_invPolyEval_cma_ena1 : std_logic;
    signal multSumOfTwoTS_uid224_pT5_uid113_invPolyEval_cma_ena2 : std_logic;
    signal c0_uid235_fracXIsZero_uid15_fpSqrtTest_merged_bit_select_b : STD_LOGIC_VECTOR (5 downto 0);
    signal c0_uid235_fracXIsZero_uid15_fpSqrtTest_merged_bit_select_c : STD_LOGIC_VECTOR (5 downto 0);
    signal c0_uid235_fracXIsZero_uid15_fpSqrtTest_merged_bit_select_d : STD_LOGIC_VECTOR (5 downto 0);
    signal c0_uid235_fracXIsZero_uid15_fpSqrtTest_merged_bit_select_e : STD_LOGIC_VECTOR (5 downto 0);
    signal c0_uid235_fracXIsZero_uid15_fpSqrtTest_merged_bit_select_f : STD_LOGIC_VECTOR (5 downto 0);
    signal c0_uid235_fracXIsZero_uid15_fpSqrtTest_merged_bit_select_g : STD_LOGIC_VECTOR (5 downto 0);
    signal c0_uid235_fracXIsZero_uid15_fpSqrtTest_merged_bit_select_h : STD_LOGIC_VECTOR (5 downto 0);
    signal c0_uid235_fracXIsZero_uid15_fpSqrtTest_merged_bit_select_i : STD_LOGIC_VECTOR (5 downto 0);
    signal c0_uid235_fracXIsZero_uid15_fpSqrtTest_merged_bit_select_j : STD_LOGIC_VECTOR (3 downto 0);
    signal topRangeY_uid140_pT3_uid101_invPolyEval_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal topRangeY_uid140_pT3_uid101_invPolyEval_merged_bit_select_c : STD_LOGIC_VECTOR (16 downto 0);
    signal topRangeX_uid139_pT3_uid101_invPolyEval_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal topRangeX_uid139_pT3_uid101_invPolyEval_merged_bit_select_c : STD_LOGIC_VECTOR (15 downto 0);
    signal redist0_multSumOfTwoTS_uid224_pT5_uid113_invPolyEval_cma_q_1_q : STD_LOGIC_VECTOR (54 downto 0);
    signal redist1_multSumOfTwoTS_uid187_pT4_uid107_invPolyEval_cma_q_1_q : STD_LOGIC_VECTOR (36 downto 0);
    signal redist2_multSumOfTwoTS_uid152_pT3_uid101_invPolyEval_cma_q_1_q : STD_LOGIC_VECTOR (36 downto 0);
    signal redist3_sm0_uid223_pT5_uid113_invPolyEval_cma_q_1_q : STD_LOGIC_VECTOR (53 downto 0);
    signal redist4_sm0_uid186_pT4_uid107_invPolyEval_cma_q_1_q : STD_LOGIC_VECTOR (53 downto 0);
    signal redist5_sm0_uid151_pT3_uid101_invPolyEval_cma_q_1_q : STD_LOGIC_VECTOR (35 downto 0);
    signal redist6_memoryC5_uid79_sqrtTables_lutmem_r_1_q : STD_LOGIC_VECTOR (16 downto 0);
    signal redist7_memoryC4_uid76_sqrtTables_lutmem_r_1_q : STD_LOGIC_VECTOR (23 downto 0);
    signal redist8_memoryC3_uid73_sqrtTables_lutmem_r_1_q : STD_LOGIC_VECTOR (32 downto 0);
    signal redist9_memoryC2_uid70_sqrtTables_lutmem_r_1_q : STD_LOGIC_VECTOR (39 downto 0);
    signal redist10_memoryC1_uid67_sqrtTables_lutmem_r_1_q : STD_LOGIC_VECTOR (8 downto 0);
    signal redist11_memoryC1_uid66_sqrtTables_lutmem_r_1_q : STD_LOGIC_VECTOR (39 downto 0);
    signal redist12_memoryC0_uid63_sqrtTables_lutmem_r_1_q : STD_LOGIC_VECTOR (16 downto 0);
    signal redist13_memoryC0_uid62_sqrtTables_lutmem_r_1_q : STD_LOGIC_VECTOR (39 downto 0);
    signal redist14_and_lev1_uid263_fracXIsZero_uid15_fpSqrtTest_q_41_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_os_uid232_pT5_uid113_invPolyEval_b_1_q : STD_LOGIC_VECTOR (51 downto 0);
    signal redist16_sm0_uid226_pT5_uid113_invPolyEval_q_1_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist17_aboveLeftY_uid222_pT5_uid113_invPolyEval_b_2_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist17_aboveLeftY_uid222_pT5_uid113_invPolyEval_b_2_delay_0 : STD_LOGIC_VECTOR (1 downto 0);
    signal redist18_aboveLeftX_uid221_pT5_uid113_invPolyEval_b_2_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist18_aboveLeftX_uid221_pT5_uid113_invPolyEval_b_2_delay_0 : STD_LOGIC_VECTOR (1 downto 0);
    signal redist19_rightBottomX_bottomRange_uid217_pT5_uid113_invPolyEval_b_1_q : STD_LOGIC_VECTOR (18 downto 0);
    signal redist20_topRangeY_uid210_pT5_uid113_invPolyEval_b_1_q : STD_LOGIC_VECTOR (26 downto 0);
    signal redist21_topRangeX_uid209_pT5_uid113_invPolyEval_b_1_q : STD_LOGIC_VECTOR (26 downto 0);
    signal redist22_os_uid158_pT3_uid101_invPolyEval_b_1_q : STD_LOGIC_VECTOR (33 downto 0);
    signal redist23_highBBits_uid109_invPolyEval_b_1_q : STD_LOGIC_VECTOR (40 downto 0);
    signal redist24_lowRangeB_uid108_invPolyEval_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist25_highBBits_uid97_invPolyEval_b_1_q : STD_LOGIC_VECTOR (25 downto 0);
    signal redist26_lowRangeB_uid96_invPolyEval_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist27_highBBits_uid91_invPolyEval_b_1_q : STD_LOGIC_VECTOR (16 downto 0);
    signal redist28_lowRangeB_uid90_invPolyEval_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist29_expRR_uid51_fpSqrtTest_b_1_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist30_fracRPostProcessings_uid39_fpSqrtTest_b_2_q : STD_LOGIC_VECTOR (51 downto 0);
    signal redist30_fracRPostProcessings_uid39_fpSqrtTest_b_2_delay_0 : STD_LOGIC_VECTOR (51 downto 0);
    signal redist31_expInc_uid38_fpSqrtTest_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist32_yForPe_uid36_fpSqrtTest_b_3_q : STD_LOGIC_VECTOR (44 downto 0);
    signal redist32_yForPe_uid36_fpSqrtTest_b_3_delay_0 : STD_LOGIC_VECTOR (44 downto 0);
    signal redist32_yForPe_uid36_fpSqrtTest_b_3_delay_1 : STD_LOGIC_VECTOR (44 downto 0);
    signal redist34_yForPe_uid36_fpSqrtTest_b_17_q : STD_LOGIC_VECTOR (44 downto 0);
    signal redist34_yForPe_uid36_fpSqrtTest_b_17_delay_0 : STD_LOGIC_VECTOR (44 downto 0);
    signal redist34_yForPe_uid36_fpSqrtTest_b_17_delay_1 : STD_LOGIC_VECTOR (44 downto 0);
    signal redist37_yAddr_uid35_fpSqrtTest_b_7_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist37_yAddr_uid35_fpSqrtTest_b_7_delay_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal redist37_yAddr_uid35_fpSqrtTest_b_7_delay_1 : STD_LOGIC_VECTOR (7 downto 0);
    signal redist37_yAddr_uid35_fpSqrtTest_b_7_delay_2 : STD_LOGIC_VECTOR (7 downto 0);
    signal redist37_yAddr_uid35_fpSqrtTest_b_7_delay_3 : STD_LOGIC_VECTOR (7 downto 0);
    signal redist38_yAddr_uid35_fpSqrtTest_b_14_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist38_yAddr_uid35_fpSqrtTest_b_14_delay_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal redist38_yAddr_uid35_fpSqrtTest_b_14_delay_1 : STD_LOGIC_VECTOR (7 downto 0);
    signal redist38_yAddr_uid35_fpSqrtTest_b_14_delay_2 : STD_LOGIC_VECTOR (7 downto 0);
    signal redist38_yAddr_uid35_fpSqrtTest_b_14_delay_3 : STD_LOGIC_VECTOR (7 downto 0);
    signal redist39_yAddr_uid35_fpSqrtTest_b_22_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist39_yAddr_uid35_fpSqrtTest_b_22_delay_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal redist39_yAddr_uid35_fpSqrtTest_b_22_delay_1 : STD_LOGIC_VECTOR (7 downto 0);
    signal redist39_yAddr_uid35_fpSqrtTest_b_22_delay_2 : STD_LOGIC_VECTOR (7 downto 0);
    signal redist39_yAddr_uid35_fpSqrtTest_b_22_delay_3 : STD_LOGIC_VECTOR (7 downto 0);
    signal redist40_yAddr_uid35_fpSqrtTest_b_30_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist40_yAddr_uid35_fpSqrtTest_b_30_delay_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal redist40_yAddr_uid35_fpSqrtTest_b_30_delay_1 : STD_LOGIC_VECTOR (7 downto 0);
    signal redist40_yAddr_uid35_fpSqrtTest_b_30_delay_2 : STD_LOGIC_VECTOR (7 downto 0);
    signal redist40_yAddr_uid35_fpSqrtTest_b_30_delay_3 : STD_LOGIC_VECTOR (7 downto 0);
    signal redist41_yAddr_uid35_fpSqrtTest_b_39_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist41_yAddr_uid35_fpSqrtTest_b_39_delay_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal redist41_yAddr_uid35_fpSqrtTest_b_39_delay_1 : STD_LOGIC_VECTOR (7 downto 0);
    signal redist41_yAddr_uid35_fpSqrtTest_b_39_delay_2 : STD_LOGIC_VECTOR (7 downto 0);
    signal redist41_yAddr_uid35_fpSqrtTest_b_39_delay_3 : STD_LOGIC_VECTOR (7 downto 0);
    signal redist42_expOddSelect_uid30_fpSqrtTest_q_42_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist43_expROdd_uid28_fpSqrtTest_b_1_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist44_expREven_uid25_fpSqrtTest_b_1_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist45_excI_x_uid17_fpSqrtTest_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist46_excZ_x_uid13_fpSqrtTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist47_signX_uid7_fpSqrtTest_b_42_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist48_signX_uid7_fpSqrtTest_b_43_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist33_yForPe_uid36_fpSqrtTest_b_10_outputreg1_q : STD_LOGIC_VECTOR (44 downto 0);
    signal redist33_yForPe_uid36_fpSqrtTest_b_10_outputreg0_q : STD_LOGIC_VECTOR (44 downto 0);
    signal redist33_yForPe_uid36_fpSqrtTest_b_10_mem_reset0 : std_logic;
    signal redist33_yForPe_uid36_fpSqrtTest_b_10_mem_ia : STD_LOGIC_VECTOR (44 downto 0);
    signal redist33_yForPe_uid36_fpSqrtTest_b_10_mem_aa : STD_LOGIC_VECTOR (1 downto 0);
    signal redist33_yForPe_uid36_fpSqrtTest_b_10_mem_ab : STD_LOGIC_VECTOR (1 downto 0);
    signal redist33_yForPe_uid36_fpSqrtTest_b_10_mem_iq : STD_LOGIC_VECTOR (44 downto 0);
    signal redist33_yForPe_uid36_fpSqrtTest_b_10_mem_q : STD_LOGIC_VECTOR (44 downto 0);
    signal redist33_yForPe_uid36_fpSqrtTest_b_10_rdcnt_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist33_yForPe_uid36_fpSqrtTest_b_10_rdcnt_i : UNSIGNED (1 downto 0);
    attribute preserve_syn_only of redist33_yForPe_uid36_fpSqrtTest_b_10_rdcnt_i : signal is true;
    signal redist33_yForPe_uid36_fpSqrtTest_b_10_wraddr_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist33_yForPe_uid36_fpSqrtTest_b_10_mem_last_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist33_yForPe_uid36_fpSqrtTest_b_10_cmp_b : STD_LOGIC_VECTOR (2 downto 0);
    signal redist33_yForPe_uid36_fpSqrtTest_b_10_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist33_yForPe_uid36_fpSqrtTest_b_10_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist33_yForPe_uid36_fpSqrtTest_b_10_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist33_yForPe_uid36_fpSqrtTest_b_10_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist33_yForPe_uid36_fpSqrtTest_b_10_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist33_yForPe_uid36_fpSqrtTest_b_10_sticky_ena_q : signal is true;
    signal redist33_yForPe_uid36_fpSqrtTest_b_10_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist34_yForPe_uid36_fpSqrtTest_b_17_inputreg1_q : STD_LOGIC_VECTOR (44 downto 0);
    signal redist34_yForPe_uid36_fpSqrtTest_b_17_outputreg1_q : STD_LOGIC_VECTOR (44 downto 0);
    signal redist34_yForPe_uid36_fpSqrtTest_b_17_inputreg0_q : STD_LOGIC_VECTOR (44 downto 0);
    signal redist34_yForPe_uid36_fpSqrtTest_b_17_outputreg0_q : STD_LOGIC_VECTOR (44 downto 0);
    signal redist35_yForPe_uid36_fpSqrtTest_b_25_inputreg1_q : STD_LOGIC_VECTOR (44 downto 0);
    signal redist35_yForPe_uid36_fpSqrtTest_b_25_outputreg1_q : STD_LOGIC_VECTOR (44 downto 0);
    signal redist35_yForPe_uid36_fpSqrtTest_b_25_inputreg0_q : STD_LOGIC_VECTOR (44 downto 0);
    signal redist35_yForPe_uid36_fpSqrtTest_b_25_outputreg0_q : STD_LOGIC_VECTOR (44 downto 0);
    signal redist35_yForPe_uid36_fpSqrtTest_b_25_mem_reset0 : std_logic;
    signal redist35_yForPe_uid36_fpSqrtTest_b_25_mem_ia : STD_LOGIC_VECTOR (44 downto 0);
    signal redist35_yForPe_uid36_fpSqrtTest_b_25_mem_aa : STD_LOGIC_VECTOR (1 downto 0);
    signal redist35_yForPe_uid36_fpSqrtTest_b_25_mem_ab : STD_LOGIC_VECTOR (1 downto 0);
    signal redist35_yForPe_uid36_fpSqrtTest_b_25_mem_iq : STD_LOGIC_VECTOR (44 downto 0);
    signal redist35_yForPe_uid36_fpSqrtTest_b_25_mem_q : STD_LOGIC_VECTOR (44 downto 0);
    signal redist35_yForPe_uid36_fpSqrtTest_b_25_rdcnt_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist35_yForPe_uid36_fpSqrtTest_b_25_rdcnt_i : UNSIGNED (1 downto 0);
    attribute preserve_syn_only of redist35_yForPe_uid36_fpSqrtTest_b_25_rdcnt_i : signal is true;
    signal redist35_yForPe_uid36_fpSqrtTest_b_25_rdcnt_eq : std_logic;
    attribute preserve_syn_only of redist35_yForPe_uid36_fpSqrtTest_b_25_rdcnt_eq : signal is true;
    signal redist35_yForPe_uid36_fpSqrtTest_b_25_wraddr_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist35_yForPe_uid36_fpSqrtTest_b_25_mem_last_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist35_yForPe_uid36_fpSqrtTest_b_25_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist35_yForPe_uid36_fpSqrtTest_b_25_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist35_yForPe_uid36_fpSqrtTest_b_25_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist35_yForPe_uid36_fpSqrtTest_b_25_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist35_yForPe_uid36_fpSqrtTest_b_25_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist35_yForPe_uid36_fpSqrtTest_b_25_sticky_ena_q : signal is true;
    signal redist35_yForPe_uid36_fpSqrtTest_b_25_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist36_yForPe_uid36_fpSqrtTest_b_33_inputreg1_q : STD_LOGIC_VECTOR (44 downto 0);
    signal redist36_yForPe_uid36_fpSqrtTest_b_33_outputreg1_q : STD_LOGIC_VECTOR (44 downto 0);
    signal redist36_yForPe_uid36_fpSqrtTest_b_33_inputreg0_q : STD_LOGIC_VECTOR (44 downto 0);
    signal redist36_yForPe_uid36_fpSqrtTest_b_33_outputreg0_q : STD_LOGIC_VECTOR (44 downto 0);
    signal redist36_yForPe_uid36_fpSqrtTest_b_33_mem_reset0 : std_logic;
    signal redist36_yForPe_uid36_fpSqrtTest_b_33_mem_ia : STD_LOGIC_VECTOR (44 downto 0);
    signal redist36_yForPe_uid36_fpSqrtTest_b_33_mem_aa : STD_LOGIC_VECTOR (1 downto 0);
    signal redist36_yForPe_uid36_fpSqrtTest_b_33_mem_ab : STD_LOGIC_VECTOR (1 downto 0);
    signal redist36_yForPe_uid36_fpSqrtTest_b_33_mem_iq : STD_LOGIC_VECTOR (44 downto 0);
    signal redist36_yForPe_uid36_fpSqrtTest_b_33_mem_q : STD_LOGIC_VECTOR (44 downto 0);
    signal redist36_yForPe_uid36_fpSqrtTest_b_33_rdcnt_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist36_yForPe_uid36_fpSqrtTest_b_33_rdcnt_i : UNSIGNED (1 downto 0);
    attribute preserve_syn_only of redist36_yForPe_uid36_fpSqrtTest_b_33_rdcnt_i : signal is true;
    signal redist36_yForPe_uid36_fpSqrtTest_b_33_rdcnt_eq : std_logic;
    attribute preserve_syn_only of redist36_yForPe_uid36_fpSqrtTest_b_33_rdcnt_eq : signal is true;
    signal redist36_yForPe_uid36_fpSqrtTest_b_33_wraddr_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist36_yForPe_uid36_fpSqrtTest_b_33_mem_last_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist36_yForPe_uid36_fpSqrtTest_b_33_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist36_yForPe_uid36_fpSqrtTest_b_33_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist36_yForPe_uid36_fpSqrtTest_b_33_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist36_yForPe_uid36_fpSqrtTest_b_33_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist36_yForPe_uid36_fpSqrtTest_b_33_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist36_yForPe_uid36_fpSqrtTest_b_33_sticky_ena_q : signal is true;
    signal redist36_yForPe_uid36_fpSqrtTest_b_33_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist37_yAddr_uid35_fpSqrtTest_b_7_outputreg1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist37_yAddr_uid35_fpSqrtTest_b_7_outputreg0_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist38_yAddr_uid35_fpSqrtTest_b_14_inputreg1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist38_yAddr_uid35_fpSqrtTest_b_14_outputreg1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist39_yAddr_uid35_fpSqrtTest_b_22_inputreg1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist39_yAddr_uid35_fpSqrtTest_b_22_outputreg1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist39_yAddr_uid35_fpSqrtTest_b_22_inputreg0_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist40_yAddr_uid35_fpSqrtTest_b_30_inputreg1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist40_yAddr_uid35_fpSqrtTest_b_30_outputreg1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist40_yAddr_uid35_fpSqrtTest_b_30_inputreg0_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist41_yAddr_uid35_fpSqrtTest_b_39_inputreg1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist41_yAddr_uid35_fpSqrtTest_b_39_outputreg1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist41_yAddr_uid35_fpSqrtTest_b_39_inputreg0_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist41_yAddr_uid35_fpSqrtTest_b_39_outputreg0_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist49_expX_uid6_fpSqrtTest_b_41_inputreg1_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist49_expX_uid6_fpSqrtTest_b_41_inputreg0_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist49_expX_uid6_fpSqrtTest_b_41_mem_reset0 : std_logic;
    signal redist49_expX_uid6_fpSqrtTest_b_41_mem_ia : STD_LOGIC_VECTOR (10 downto 0);
    signal redist49_expX_uid6_fpSqrtTest_b_41_mem_aa : STD_LOGIC_VECTOR (2 downto 0);
    signal redist49_expX_uid6_fpSqrtTest_b_41_mem_ab : STD_LOGIC_VECTOR (2 downto 0);
    signal redist49_expX_uid6_fpSqrtTest_b_41_mem_iq : STD_LOGIC_VECTOR (10 downto 0);
    signal redist49_expX_uid6_fpSqrtTest_b_41_mem_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist49_expX_uid6_fpSqrtTest_b_41_rdcnt_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist49_expX_uid6_fpSqrtTest_b_41_rdcnt_i : UNSIGNED (2 downto 0);
    attribute preserve_syn_only of redist49_expX_uid6_fpSqrtTest_b_41_rdcnt_i : signal is true;
    signal redist49_expX_uid6_fpSqrtTest_b_41_rdcnt_eq : std_logic;
    attribute preserve_syn_only of redist49_expX_uid6_fpSqrtTest_b_41_rdcnt_eq : signal is true;
    signal redist49_expX_uid6_fpSqrtTest_b_41_wraddr_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist49_expX_uid6_fpSqrtTest_b_41_mem_last_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist49_expX_uid6_fpSqrtTest_b_41_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist49_expX_uid6_fpSqrtTest_b_41_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist49_expX_uid6_fpSqrtTest_b_41_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist49_expX_uid6_fpSqrtTest_b_41_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist49_expX_uid6_fpSqrtTest_b_41_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist49_expX_uid6_fpSqrtTest_b_41_sticky_ena_q : signal is true;
    signal redist49_expX_uid6_fpSqrtTest_b_41_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist49_expX_uid6_fpSqrtTest_b_41_split_0_outputreg1_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist49_expX_uid6_fpSqrtTest_b_41_split_0_outputreg0_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist49_expX_uid6_fpSqrtTest_b_41_split_0_mem_reset0 : std_logic;
    signal redist49_expX_uid6_fpSqrtTest_b_41_split_0_mem_ia : STD_LOGIC_VECTOR (10 downto 0);
    signal redist49_expX_uid6_fpSqrtTest_b_41_split_0_mem_aa : STD_LOGIC_VECTOR (4 downto 0);
    signal redist49_expX_uid6_fpSqrtTest_b_41_split_0_mem_ab : STD_LOGIC_VECTOR (4 downto 0);
    signal redist49_expX_uid6_fpSqrtTest_b_41_split_0_mem_iq : STD_LOGIC_VECTOR (10 downto 0);
    signal redist49_expX_uid6_fpSqrtTest_b_41_split_0_mem_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist49_expX_uid6_fpSqrtTest_b_41_split_0_rdcnt_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist49_expX_uid6_fpSqrtTest_b_41_split_0_rdcnt_i : UNSIGNED (4 downto 0);
    attribute preserve_syn_only of redist49_expX_uid6_fpSqrtTest_b_41_split_0_rdcnt_i : signal is true;
    signal redist49_expX_uid6_fpSqrtTest_b_41_split_0_rdcnt_eq : std_logic;
    attribute preserve_syn_only of redist49_expX_uid6_fpSqrtTest_b_41_split_0_rdcnt_eq : signal is true;
    signal redist49_expX_uid6_fpSqrtTest_b_41_split_0_wraddr_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist49_expX_uid6_fpSqrtTest_b_41_split_0_mem_last_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist49_expX_uid6_fpSqrtTest_b_41_split_0_cmp_b : STD_LOGIC_VECTOR (5 downto 0);
    signal redist49_expX_uid6_fpSqrtTest_b_41_split_0_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist49_expX_uid6_fpSqrtTest_b_41_split_0_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist49_expX_uid6_fpSqrtTest_b_41_split_0_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist49_expX_uid6_fpSqrtTest_b_41_split_0_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist49_expX_uid6_fpSqrtTest_b_41_split_0_sticky_ena_q : signal is true;
    signal redist49_expX_uid6_fpSqrtTest_b_41_split_0_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- signX_uid7_fpSqrtTest(BITSELECT,6)@0
    signX_uid7_fpSqrtTest_b <= STD_LOGIC_VECTOR(a(63 downto 63));

    -- redist47_signX_uid7_fpSqrtTest_b_42(DELAY,329)
    redist47_signX_uid7_fpSqrtTest_b_42 : dspba_delay
    GENERIC MAP ( width => 1, depth => 42, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => signX_uid7_fpSqrtTest_b, xout => redist47_signX_uid7_fpSqrtTest_b_42_q, clk => clk, aclr => areset, ena => '1' );

    -- redist48_signX_uid7_fpSqrtTest_b_43(DELAY,330)
    redist48_signX_uid7_fpSqrtTest_b_43_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist48_signX_uid7_fpSqrtTest_b_43_q <= (others => '0');
            ELSE
                redist48_signX_uid7_fpSqrtTest_b_43_q <= STD_LOGIC_VECTOR(redist47_signX_uid7_fpSqrtTest_b_42_q);
            END IF;
        END IF;
    END PROCESS;

    -- cstAllZWE_uid10_fpSqrtTest(CONSTANT,9)
    cstAllZWE_uid10_fpSqrtTest_q <= "00000000000";

    -- redist49_expX_uid6_fpSqrtTest_b_41_notEnable(LOGICAL,399)
    redist49_expX_uid6_fpSqrtTest_b_41_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist49_expX_uid6_fpSqrtTest_b_41_nor(LOGICAL,400)
    redist49_expX_uid6_fpSqrtTest_b_41_nor_q <= not (redist49_expX_uid6_fpSqrtTest_b_41_notEnable_q or redist49_expX_uid6_fpSqrtTest_b_41_sticky_ena_q);

    -- redist49_expX_uid6_fpSqrtTest_b_41_mem_last(CONSTANT,396)
    redist49_expX_uid6_fpSqrtTest_b_41_mem_last_q <= "011";

    -- redist49_expX_uid6_fpSqrtTest_b_41_cmp(LOGICAL,397)
    redist49_expX_uid6_fpSqrtTest_b_41_cmp_q <= "1" WHEN redist49_expX_uid6_fpSqrtTest_b_41_mem_last_q = redist49_expX_uid6_fpSqrtTest_b_41_rdcnt_q ELSE "0";

    -- redist49_expX_uid6_fpSqrtTest_b_41_cmpReg(REG,398)
    redist49_expX_uid6_fpSqrtTest_b_41_cmpReg_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist49_expX_uid6_fpSqrtTest_b_41_cmpReg_q <= "0";
            ELSE
                redist49_expX_uid6_fpSqrtTest_b_41_cmpReg_q <= STD_LOGIC_VECTOR(redist49_expX_uid6_fpSqrtTest_b_41_cmp_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist49_expX_uid6_fpSqrtTest_b_41_sticky_ena(REG,401)
    redist49_expX_uid6_fpSqrtTest_b_41_sticky_ena_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist49_expX_uid6_fpSqrtTest_b_41_sticky_ena_q <= "0";
            ELSE
                IF (redist49_expX_uid6_fpSqrtTest_b_41_nor_q = "1") THEN
                    redist49_expX_uid6_fpSqrtTest_b_41_sticky_ena_q <= STD_LOGIC_VECTOR(redist49_expX_uid6_fpSqrtTest_b_41_cmpReg_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist49_expX_uid6_fpSqrtTest_b_41_enaAnd(LOGICAL,402)
    redist49_expX_uid6_fpSqrtTest_b_41_enaAnd_q <= redist49_expX_uid6_fpSqrtTest_b_41_sticky_ena_q and VCC_q;

    -- redist49_expX_uid6_fpSqrtTest_b_41_rdcnt(COUNTER,394)
    -- low=0, high=4, step=1, init=0
    redist49_expX_uid6_fpSqrtTest_b_41_rdcnt_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist49_expX_uid6_fpSqrtTest_b_41_rdcnt_i <= TO_UNSIGNED(0, 3);
                redist49_expX_uid6_fpSqrtTest_b_41_rdcnt_eq <= '0';
            ELSE
                IF (redist49_expX_uid6_fpSqrtTest_b_41_rdcnt_i = TO_UNSIGNED(3, 3)) THEN
                    redist49_expX_uid6_fpSqrtTest_b_41_rdcnt_eq <= '1';
                ELSE
                    redist49_expX_uid6_fpSqrtTest_b_41_rdcnt_eq <= '0';
                END IF;
                IF (redist49_expX_uid6_fpSqrtTest_b_41_rdcnt_eq = '1') THEN
                    redist49_expX_uid6_fpSqrtTest_b_41_rdcnt_i <= redist49_expX_uid6_fpSqrtTest_b_41_rdcnt_i + 4;
                ELSE
                    redist49_expX_uid6_fpSqrtTest_b_41_rdcnt_i <= redist49_expX_uid6_fpSqrtTest_b_41_rdcnt_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    redist49_expX_uid6_fpSqrtTest_b_41_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist49_expX_uid6_fpSqrtTest_b_41_rdcnt_i, 3)));

    -- redist49_expX_uid6_fpSqrtTest_b_41_split_0_nor(LOGICAL,412)
    redist49_expX_uid6_fpSqrtTest_b_41_split_0_nor_q <= not (redist49_expX_uid6_fpSqrtTest_b_41_notEnable_q or redist49_expX_uid6_fpSqrtTest_b_41_split_0_sticky_ena_q);

    -- redist49_expX_uid6_fpSqrtTest_b_41_split_0_mem_last(CONSTANT,408)
    redist49_expX_uid6_fpSqrtTest_b_41_split_0_mem_last_q <= "011100";

    -- redist49_expX_uid6_fpSqrtTest_b_41_split_0_cmp(LOGICAL,409)
    redist49_expX_uid6_fpSqrtTest_b_41_split_0_cmp_b <= STD_LOGIC_VECTOR("0" & redist49_expX_uid6_fpSqrtTest_b_41_split_0_rdcnt_q);
    redist49_expX_uid6_fpSqrtTest_b_41_split_0_cmp_q <= "1" WHEN redist49_expX_uid6_fpSqrtTest_b_41_split_0_mem_last_q = redist49_expX_uid6_fpSqrtTest_b_41_split_0_cmp_b ELSE "0";

    -- redist49_expX_uid6_fpSqrtTest_b_41_split_0_cmpReg(REG,410)
    redist49_expX_uid6_fpSqrtTest_b_41_split_0_cmpReg_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist49_expX_uid6_fpSqrtTest_b_41_split_0_cmpReg_q <= "0";
            ELSE
                redist49_expX_uid6_fpSqrtTest_b_41_split_0_cmpReg_q <= STD_LOGIC_VECTOR(redist49_expX_uid6_fpSqrtTest_b_41_split_0_cmp_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist49_expX_uid6_fpSqrtTest_b_41_split_0_sticky_ena(REG,413)
    redist49_expX_uid6_fpSqrtTest_b_41_split_0_sticky_ena_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist49_expX_uid6_fpSqrtTest_b_41_split_0_sticky_ena_q <= "0";
            ELSE
                IF (redist49_expX_uid6_fpSqrtTest_b_41_split_0_nor_q = "1") THEN
                    redist49_expX_uid6_fpSqrtTest_b_41_split_0_sticky_ena_q <= STD_LOGIC_VECTOR(redist49_expX_uid6_fpSqrtTest_b_41_split_0_cmpReg_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist49_expX_uid6_fpSqrtTest_b_41_split_0_enaAnd(LOGICAL,414)
    redist49_expX_uid6_fpSqrtTest_b_41_split_0_enaAnd_q <= redist49_expX_uid6_fpSqrtTest_b_41_split_0_sticky_ena_q and VCC_q;

    -- redist49_expX_uid6_fpSqrtTest_b_41_split_0_rdcnt(COUNTER,406)
    -- low=0, high=29, step=1, init=0
    redist49_expX_uid6_fpSqrtTest_b_41_split_0_rdcnt_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist49_expX_uid6_fpSqrtTest_b_41_split_0_rdcnt_i <= TO_UNSIGNED(0, 5);
                redist49_expX_uid6_fpSqrtTest_b_41_split_0_rdcnt_eq <= '0';
            ELSE
                IF (redist49_expX_uid6_fpSqrtTest_b_41_split_0_rdcnt_i = TO_UNSIGNED(28, 5)) THEN
                    redist49_expX_uid6_fpSqrtTest_b_41_split_0_rdcnt_eq <= '1';
                ELSE
                    redist49_expX_uid6_fpSqrtTest_b_41_split_0_rdcnt_eq <= '0';
                END IF;
                IF (redist49_expX_uid6_fpSqrtTest_b_41_split_0_rdcnt_eq = '1') THEN
                    redist49_expX_uid6_fpSqrtTest_b_41_split_0_rdcnt_i <= redist49_expX_uid6_fpSqrtTest_b_41_split_0_rdcnt_i + 3;
                ELSE
                    redist49_expX_uid6_fpSqrtTest_b_41_split_0_rdcnt_i <= redist49_expX_uid6_fpSqrtTest_b_41_split_0_rdcnt_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    redist49_expX_uid6_fpSqrtTest_b_41_split_0_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist49_expX_uid6_fpSqrtTest_b_41_split_0_rdcnt_i, 5)));

    -- expX_uid6_fpSqrtTest(BITSELECT,5)@0
    expX_uid6_fpSqrtTest_b <= a(62 downto 52);

    -- redist49_expX_uid6_fpSqrtTest_b_41_split_0_wraddr(REG,407)
    redist49_expX_uid6_fpSqrtTest_b_41_split_0_wraddr_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist49_expX_uid6_fpSqrtTest_b_41_split_0_wraddr_q <= "11101";
            ELSE
                redist49_expX_uid6_fpSqrtTest_b_41_split_0_wraddr_q <= STD_LOGIC_VECTOR(redist49_expX_uid6_fpSqrtTest_b_41_split_0_rdcnt_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist49_expX_uid6_fpSqrtTest_b_41_split_0_mem(DUALMEM,405)
    redist49_expX_uid6_fpSqrtTest_b_41_split_0_mem_ia <= STD_LOGIC_VECTOR(expX_uid6_fpSqrtTest_b);
    redist49_expX_uid6_fpSqrtTest_b_41_split_0_mem_aa <= redist49_expX_uid6_fpSqrtTest_b_41_split_0_wraddr_q;
    redist49_expX_uid6_fpSqrtTest_b_41_split_0_mem_ab <= redist49_expX_uid6_fpSqrtTest_b_41_split_0_rdcnt_q;
    redist49_expX_uid6_fpSqrtTest_b_41_split_0_mem_reset0 <= areset;
    redist49_expX_uid6_fpSqrtTest_b_41_split_0_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 11,
        widthad_a => 5,
        numwords_a => 30,
        width_b => 11,
        widthad_b => 5,
        numwords_b => 30,
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
        clocken1 => redist49_expX_uid6_fpSqrtTest_b_41_split_0_enaAnd_q(0),
        clocken0 => '1',
        clock0 => clk,
        sclr => redist49_expX_uid6_fpSqrtTest_b_41_split_0_mem_reset0,
        clock1 => clk,
        address_a => redist49_expX_uid6_fpSqrtTest_b_41_split_0_mem_aa,
        data_a => redist49_expX_uid6_fpSqrtTest_b_41_split_0_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist49_expX_uid6_fpSqrtTest_b_41_split_0_mem_ab,
        q_b => redist49_expX_uid6_fpSqrtTest_b_41_split_0_mem_iq
    );
    redist49_expX_uid6_fpSqrtTest_b_41_split_0_mem_q <= redist49_expX_uid6_fpSqrtTest_b_41_split_0_mem_iq(10 downto 0);

    -- redist49_expX_uid6_fpSqrtTest_b_41_split_0_outputreg0(DELAY,404)
    redist49_expX_uid6_fpSqrtTest_b_41_split_0_outputreg0_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist49_expX_uid6_fpSqrtTest_b_41_split_0_outputreg0_q <= (others => '0');
            ELSE
                redist49_expX_uid6_fpSqrtTest_b_41_split_0_outputreg0_q <= STD_LOGIC_VECTOR(redist49_expX_uid6_fpSqrtTest_b_41_split_0_mem_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist49_expX_uid6_fpSqrtTest_b_41_split_0_outputreg1(DELAY,403)
    redist49_expX_uid6_fpSqrtTest_b_41_split_0_outputreg1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist49_expX_uid6_fpSqrtTest_b_41_split_0_outputreg1_q <= (others => '0');
            ELSE
                redist49_expX_uid6_fpSqrtTest_b_41_split_0_outputreg1_q <= STD_LOGIC_VECTOR(redist49_expX_uid6_fpSqrtTest_b_41_split_0_outputreg0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist49_expX_uid6_fpSqrtTest_b_41_inputreg1(DELAY,391)
    redist49_expX_uid6_fpSqrtTest_b_41_inputreg1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist49_expX_uid6_fpSqrtTest_b_41_inputreg1_q <= (others => '0');
            ELSE
                redist49_expX_uid6_fpSqrtTest_b_41_inputreg1_q <= STD_LOGIC_VECTOR(redist49_expX_uid6_fpSqrtTest_b_41_split_0_outputreg1_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist49_expX_uid6_fpSqrtTest_b_41_inputreg0(DELAY,392)
    redist49_expX_uid6_fpSqrtTest_b_41_inputreg0_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist49_expX_uid6_fpSqrtTest_b_41_inputreg0_q <= (others => '0');
            ELSE
                redist49_expX_uid6_fpSqrtTest_b_41_inputreg0_q <= STD_LOGIC_VECTOR(redist49_expX_uid6_fpSqrtTest_b_41_inputreg1_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist49_expX_uid6_fpSqrtTest_b_41_wraddr(REG,395)
    redist49_expX_uid6_fpSqrtTest_b_41_wraddr_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist49_expX_uid6_fpSqrtTest_b_41_wraddr_q <= "100";
            ELSE
                redist49_expX_uid6_fpSqrtTest_b_41_wraddr_q <= STD_LOGIC_VECTOR(redist49_expX_uid6_fpSqrtTest_b_41_rdcnt_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist49_expX_uid6_fpSqrtTest_b_41_mem(DUALMEM,393)
    redist49_expX_uid6_fpSqrtTest_b_41_mem_ia <= STD_LOGIC_VECTOR(redist49_expX_uid6_fpSqrtTest_b_41_inputreg0_q);
    redist49_expX_uid6_fpSqrtTest_b_41_mem_aa <= redist49_expX_uid6_fpSqrtTest_b_41_wraddr_q;
    redist49_expX_uid6_fpSqrtTest_b_41_mem_ab <= redist49_expX_uid6_fpSqrtTest_b_41_rdcnt_q;
    redist49_expX_uid6_fpSqrtTest_b_41_mem_reset0 <= areset;
    redist49_expX_uid6_fpSqrtTest_b_41_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 11,
        widthad_a => 3,
        numwords_a => 5,
        width_b => 11,
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
        clocken1 => redist49_expX_uid6_fpSqrtTest_b_41_enaAnd_q(0),
        clocken0 => '1',
        clock0 => clk,
        sclr => redist49_expX_uid6_fpSqrtTest_b_41_mem_reset0,
        clock1 => clk,
        address_a => redist49_expX_uid6_fpSqrtTest_b_41_mem_aa,
        data_a => redist49_expX_uid6_fpSqrtTest_b_41_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist49_expX_uid6_fpSqrtTest_b_41_mem_ab,
        q_b => redist49_expX_uid6_fpSqrtTest_b_41_mem_iq
    );
    redist49_expX_uid6_fpSqrtTest_b_41_mem_q <= redist49_expX_uid6_fpSqrtTest_b_41_mem_iq(10 downto 0);

    -- excZ_x_uid13_fpSqrtTest(LOGICAL,12)@41 + 1
    excZ_x_uid13_fpSqrtTest_qi <= "1" WHEN redist49_expX_uid6_fpSqrtTest_b_41_mem_q = cstAllZWE_uid10_fpSqrtTest_q ELSE "0";
    excZ_x_uid13_fpSqrtTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => excZ_x_uid13_fpSqrtTest_qi, xout => excZ_x_uid13_fpSqrtTest_q, clk => clk, aclr => areset, ena => '1' );

    -- redist46_excZ_x_uid13_fpSqrtTest_q_2(DELAY,328)
    redist46_excZ_x_uid13_fpSqrtTest_q_2_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist46_excZ_x_uid13_fpSqrtTest_q_2_q <= (others => '0');
            ELSE
                redist46_excZ_x_uid13_fpSqrtTest_q_2_q <= STD_LOGIC_VECTOR(excZ_x_uid13_fpSqrtTest_q);
            END IF;
        END IF;
    END PROCESS;

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- negZero_uid59_fpSqrtTest(LOGICAL,58)@43 + 1
    negZero_uid59_fpSqrtTest_qi <= redist46_excZ_x_uid13_fpSqrtTest_q_2_q and redist48_signX_uid7_fpSqrtTest_b_43_q;
    negZero_uid59_fpSqrtTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => negZero_uid59_fpSqrtTest_qi, xout => negZero_uid59_fpSqrtTest_q, clk => clk, aclr => areset, ena => '1' );

    -- cstAllOWE_uid8_fpSqrtTest(CONSTANT,7)
    cstAllOWE_uid8_fpSqrtTest_q <= "11111111111";

    -- redist36_yForPe_uid36_fpSqrtTest_b_33_notEnable(LOGICAL,373)
    redist36_yForPe_uid36_fpSqrtTest_b_33_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist36_yForPe_uid36_fpSqrtTest_b_33_nor(LOGICAL,374)
    redist36_yForPe_uid36_fpSqrtTest_b_33_nor_q <= not (redist36_yForPe_uid36_fpSqrtTest_b_33_notEnable_q or redist36_yForPe_uid36_fpSqrtTest_b_33_sticky_ena_q);

    -- redist36_yForPe_uid36_fpSqrtTest_b_33_mem_last(CONSTANT,370)
    redist36_yForPe_uid36_fpSqrtTest_b_33_mem_last_q <= "01";

    -- redist36_yForPe_uid36_fpSqrtTest_b_33_cmp(LOGICAL,371)
    redist36_yForPe_uid36_fpSqrtTest_b_33_cmp_q <= "1" WHEN redist36_yForPe_uid36_fpSqrtTest_b_33_mem_last_q = redist36_yForPe_uid36_fpSqrtTest_b_33_rdcnt_q ELSE "0";

    -- redist36_yForPe_uid36_fpSqrtTest_b_33_cmpReg(REG,372)
    redist36_yForPe_uid36_fpSqrtTest_b_33_cmpReg_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist36_yForPe_uid36_fpSqrtTest_b_33_cmpReg_q <= "0";
            ELSE
                redist36_yForPe_uid36_fpSqrtTest_b_33_cmpReg_q <= STD_LOGIC_VECTOR(redist36_yForPe_uid36_fpSqrtTest_b_33_cmp_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist36_yForPe_uid36_fpSqrtTest_b_33_sticky_ena(REG,375)
    redist36_yForPe_uid36_fpSqrtTest_b_33_sticky_ena_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist36_yForPe_uid36_fpSqrtTest_b_33_sticky_ena_q <= "0";
            ELSE
                IF (redist36_yForPe_uid36_fpSqrtTest_b_33_nor_q = "1") THEN
                    redist36_yForPe_uid36_fpSqrtTest_b_33_sticky_ena_q <= STD_LOGIC_VECTOR(redist36_yForPe_uid36_fpSqrtTest_b_33_cmpReg_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist36_yForPe_uid36_fpSqrtTest_b_33_enaAnd(LOGICAL,376)
    redist36_yForPe_uid36_fpSqrtTest_b_33_enaAnd_q <= redist36_yForPe_uid36_fpSqrtTest_b_33_sticky_ena_q and VCC_q;

    -- redist36_yForPe_uid36_fpSqrtTest_b_33_rdcnt(COUNTER,368)
    -- low=0, high=2, step=1, init=0
    redist36_yForPe_uid36_fpSqrtTest_b_33_rdcnt_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist36_yForPe_uid36_fpSqrtTest_b_33_rdcnt_i <= TO_UNSIGNED(0, 2);
                redist36_yForPe_uid36_fpSqrtTest_b_33_rdcnt_eq <= '0';
            ELSE
                IF (redist36_yForPe_uid36_fpSqrtTest_b_33_rdcnt_i = TO_UNSIGNED(1, 2)) THEN
                    redist36_yForPe_uid36_fpSqrtTest_b_33_rdcnt_eq <= '1';
                ELSE
                    redist36_yForPe_uid36_fpSqrtTest_b_33_rdcnt_eq <= '0';
                END IF;
                IF (redist36_yForPe_uid36_fpSqrtTest_b_33_rdcnt_eq = '1') THEN
                    redist36_yForPe_uid36_fpSqrtTest_b_33_rdcnt_i <= redist36_yForPe_uid36_fpSqrtTest_b_33_rdcnt_i + 2;
                ELSE
                    redist36_yForPe_uid36_fpSqrtTest_b_33_rdcnt_i <= redist36_yForPe_uid36_fpSqrtTest_b_33_rdcnt_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    redist36_yForPe_uid36_fpSqrtTest_b_33_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist36_yForPe_uid36_fpSqrtTest_b_33_rdcnt_i, 2)));

    -- redist35_yForPe_uid36_fpSqrtTest_b_25_notEnable(LOGICAL,359)
    redist35_yForPe_uid36_fpSqrtTest_b_25_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist35_yForPe_uid36_fpSqrtTest_b_25_nor(LOGICAL,360)
    redist35_yForPe_uid36_fpSqrtTest_b_25_nor_q <= not (redist35_yForPe_uid36_fpSqrtTest_b_25_notEnable_q or redist35_yForPe_uid36_fpSqrtTest_b_25_sticky_ena_q);

    -- redist35_yForPe_uid36_fpSqrtTest_b_25_mem_last(CONSTANT,356)
    redist35_yForPe_uid36_fpSqrtTest_b_25_mem_last_q <= "01";

    -- redist35_yForPe_uid36_fpSqrtTest_b_25_cmp(LOGICAL,357)
    redist35_yForPe_uid36_fpSqrtTest_b_25_cmp_q <= "1" WHEN redist35_yForPe_uid36_fpSqrtTest_b_25_mem_last_q = redist35_yForPe_uid36_fpSqrtTest_b_25_rdcnt_q ELSE "0";

    -- redist35_yForPe_uid36_fpSqrtTest_b_25_cmpReg(REG,358)
    redist35_yForPe_uid36_fpSqrtTest_b_25_cmpReg_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist35_yForPe_uid36_fpSqrtTest_b_25_cmpReg_q <= "0";
            ELSE
                redist35_yForPe_uid36_fpSqrtTest_b_25_cmpReg_q <= STD_LOGIC_VECTOR(redist35_yForPe_uid36_fpSqrtTest_b_25_cmp_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist35_yForPe_uid36_fpSqrtTest_b_25_sticky_ena(REG,361)
    redist35_yForPe_uid36_fpSqrtTest_b_25_sticky_ena_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist35_yForPe_uid36_fpSqrtTest_b_25_sticky_ena_q <= "0";
            ELSE
                IF (redist35_yForPe_uid36_fpSqrtTest_b_25_nor_q = "1") THEN
                    redist35_yForPe_uid36_fpSqrtTest_b_25_sticky_ena_q <= STD_LOGIC_VECTOR(redist35_yForPe_uid36_fpSqrtTest_b_25_cmpReg_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist35_yForPe_uid36_fpSqrtTest_b_25_enaAnd(LOGICAL,362)
    redist35_yForPe_uid36_fpSqrtTest_b_25_enaAnd_q <= redist35_yForPe_uid36_fpSqrtTest_b_25_sticky_ena_q and VCC_q;

    -- redist35_yForPe_uid36_fpSqrtTest_b_25_rdcnt(COUNTER,354)
    -- low=0, high=2, step=1, init=0
    redist35_yForPe_uid36_fpSqrtTest_b_25_rdcnt_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist35_yForPe_uid36_fpSqrtTest_b_25_rdcnt_i <= TO_UNSIGNED(0, 2);
                redist35_yForPe_uid36_fpSqrtTest_b_25_rdcnt_eq <= '0';
            ELSE
                IF (redist35_yForPe_uid36_fpSqrtTest_b_25_rdcnt_i = TO_UNSIGNED(1, 2)) THEN
                    redist35_yForPe_uid36_fpSqrtTest_b_25_rdcnt_eq <= '1';
                ELSE
                    redist35_yForPe_uid36_fpSqrtTest_b_25_rdcnt_eq <= '0';
                END IF;
                IF (redist35_yForPe_uid36_fpSqrtTest_b_25_rdcnt_eq = '1') THEN
                    redist35_yForPe_uid36_fpSqrtTest_b_25_rdcnt_i <= redist35_yForPe_uid36_fpSqrtTest_b_25_rdcnt_i + 2;
                ELSE
                    redist35_yForPe_uid36_fpSqrtTest_b_25_rdcnt_i <= redist35_yForPe_uid36_fpSqrtTest_b_25_rdcnt_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    redist35_yForPe_uid36_fpSqrtTest_b_25_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist35_yForPe_uid36_fpSqrtTest_b_25_rdcnt_i, 2)));

    -- redist33_yForPe_uid36_fpSqrtTest_b_10_notEnable(LOGICAL,341)
    redist33_yForPe_uid36_fpSqrtTest_b_10_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist33_yForPe_uid36_fpSqrtTest_b_10_nor(LOGICAL,342)
    redist33_yForPe_uid36_fpSqrtTest_b_10_nor_q <= not (redist33_yForPe_uid36_fpSqrtTest_b_10_notEnable_q or redist33_yForPe_uid36_fpSqrtTest_b_10_sticky_ena_q);

    -- redist33_yForPe_uid36_fpSqrtTest_b_10_mem_last(CONSTANT,338)
    redist33_yForPe_uid36_fpSqrtTest_b_10_mem_last_q <= "010";

    -- redist33_yForPe_uid36_fpSqrtTest_b_10_cmp(LOGICAL,339)
    redist33_yForPe_uid36_fpSqrtTest_b_10_cmp_b <= STD_LOGIC_VECTOR("0" & redist33_yForPe_uid36_fpSqrtTest_b_10_rdcnt_q);
    redist33_yForPe_uid36_fpSqrtTest_b_10_cmp_q <= "1" WHEN redist33_yForPe_uid36_fpSqrtTest_b_10_mem_last_q = redist33_yForPe_uid36_fpSqrtTest_b_10_cmp_b ELSE "0";

    -- redist33_yForPe_uid36_fpSqrtTest_b_10_cmpReg(REG,340)
    redist33_yForPe_uid36_fpSqrtTest_b_10_cmpReg_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist33_yForPe_uid36_fpSqrtTest_b_10_cmpReg_q <= "0";
            ELSE
                redist33_yForPe_uid36_fpSqrtTest_b_10_cmpReg_q <= STD_LOGIC_VECTOR(redist33_yForPe_uid36_fpSqrtTest_b_10_cmp_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist33_yForPe_uid36_fpSqrtTest_b_10_sticky_ena(REG,343)
    redist33_yForPe_uid36_fpSqrtTest_b_10_sticky_ena_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist33_yForPe_uid36_fpSqrtTest_b_10_sticky_ena_q <= "0";
            ELSE
                IF (redist33_yForPe_uid36_fpSqrtTest_b_10_nor_q = "1") THEN
                    redist33_yForPe_uid36_fpSqrtTest_b_10_sticky_ena_q <= STD_LOGIC_VECTOR(redist33_yForPe_uid36_fpSqrtTest_b_10_cmpReg_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist33_yForPe_uid36_fpSqrtTest_b_10_enaAnd(LOGICAL,344)
    redist33_yForPe_uid36_fpSqrtTest_b_10_enaAnd_q <= redist33_yForPe_uid36_fpSqrtTest_b_10_sticky_ena_q and VCC_q;

    -- redist33_yForPe_uid36_fpSqrtTest_b_10_rdcnt(COUNTER,336)
    -- low=0, high=3, step=1, init=0
    redist33_yForPe_uid36_fpSqrtTest_b_10_rdcnt_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist33_yForPe_uid36_fpSqrtTest_b_10_rdcnt_i <= TO_UNSIGNED(0, 2);
            ELSE
                redist33_yForPe_uid36_fpSqrtTest_b_10_rdcnt_i <= redist33_yForPe_uid36_fpSqrtTest_b_10_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist33_yForPe_uid36_fpSqrtTest_b_10_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist33_yForPe_uid36_fpSqrtTest_b_10_rdcnt_i, 2)));

    -- frac_x_uid12_fpSqrtTest(BITSELECT,11)@0
    frac_x_uid12_fpSqrtTest_b <= a(51 downto 0);

    -- yForPe_uid36_fpSqrtTest(BITSELECT,35)@0
    yForPe_uid36_fpSqrtTest_in <= frac_x_uid12_fpSqrtTest_b(44 downto 0);
    yForPe_uid36_fpSqrtTest_b <= yForPe_uid36_fpSqrtTest_in(44 downto 0);

    -- redist32_yForPe_uid36_fpSqrtTest_b_3(DELAY,314)
    redist32_yForPe_uid36_fpSqrtTest_b_3_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist32_yForPe_uid36_fpSqrtTest_b_3_delay_0 <= (others => '0');
                redist32_yForPe_uid36_fpSqrtTest_b_3_delay_1 <= (others => '0');
                redist32_yForPe_uid36_fpSqrtTest_b_3_q <= (others => '0');
            ELSE
                redist32_yForPe_uid36_fpSqrtTest_b_3_delay_0 <= STD_LOGIC_VECTOR(yForPe_uid36_fpSqrtTest_b);
                redist32_yForPe_uid36_fpSqrtTest_b_3_delay_1 <= redist32_yForPe_uid36_fpSqrtTest_b_3_delay_0;
                redist32_yForPe_uid36_fpSqrtTest_b_3_q <= redist32_yForPe_uid36_fpSqrtTest_b_3_delay_1;
            END IF;
        END IF;
    END PROCESS;

    -- redist33_yForPe_uid36_fpSqrtTest_b_10_wraddr(REG,337)
    redist33_yForPe_uid36_fpSqrtTest_b_10_wraddr_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist33_yForPe_uid36_fpSqrtTest_b_10_wraddr_q <= "11";
            ELSE
                redist33_yForPe_uid36_fpSqrtTest_b_10_wraddr_q <= STD_LOGIC_VECTOR(redist33_yForPe_uid36_fpSqrtTest_b_10_rdcnt_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist33_yForPe_uid36_fpSqrtTest_b_10_mem(DUALMEM,335)
    redist33_yForPe_uid36_fpSqrtTest_b_10_mem_ia <= STD_LOGIC_VECTOR(redist32_yForPe_uid36_fpSqrtTest_b_3_q);
    redist33_yForPe_uid36_fpSqrtTest_b_10_mem_aa <= redist33_yForPe_uid36_fpSqrtTest_b_10_wraddr_q;
    redist33_yForPe_uid36_fpSqrtTest_b_10_mem_ab <= redist33_yForPe_uid36_fpSqrtTest_b_10_rdcnt_q;
    redist33_yForPe_uid36_fpSqrtTest_b_10_mem_reset0 <= areset;
    redist33_yForPe_uid36_fpSqrtTest_b_10_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 45,
        widthad_a => 2,
        numwords_a => 4,
        width_b => 45,
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
        clocken1 => redist33_yForPe_uid36_fpSqrtTest_b_10_enaAnd_q(0),
        clocken0 => '1',
        clock0 => clk,
        sclr => redist33_yForPe_uid36_fpSqrtTest_b_10_mem_reset0,
        clock1 => clk,
        address_a => redist33_yForPe_uid36_fpSqrtTest_b_10_mem_aa,
        data_a => redist33_yForPe_uid36_fpSqrtTest_b_10_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist33_yForPe_uid36_fpSqrtTest_b_10_mem_ab,
        q_b => redist33_yForPe_uid36_fpSqrtTest_b_10_mem_iq
    );
    redist33_yForPe_uid36_fpSqrtTest_b_10_mem_q <= redist33_yForPe_uid36_fpSqrtTest_b_10_mem_iq(44 downto 0);

    -- redist33_yForPe_uid36_fpSqrtTest_b_10_outputreg0(DELAY,334)
    redist33_yForPe_uid36_fpSqrtTest_b_10_outputreg0_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist33_yForPe_uid36_fpSqrtTest_b_10_outputreg0_q <= (others => '0');
            ELSE
                redist33_yForPe_uid36_fpSqrtTest_b_10_outputreg0_q <= STD_LOGIC_VECTOR(redist33_yForPe_uid36_fpSqrtTest_b_10_mem_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist33_yForPe_uid36_fpSqrtTest_b_10_outputreg1(DELAY,333)
    redist33_yForPe_uid36_fpSqrtTest_b_10_outputreg1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist33_yForPe_uid36_fpSqrtTest_b_10_outputreg1_q <= (others => '0');
            ELSE
                redist33_yForPe_uid36_fpSqrtTest_b_10_outputreg1_q <= STD_LOGIC_VECTOR(redist33_yForPe_uid36_fpSqrtTest_b_10_outputreg0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist34_yForPe_uid36_fpSqrtTest_b_17_inputreg1(DELAY,345)
    redist34_yForPe_uid36_fpSqrtTest_b_17_inputreg1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist34_yForPe_uid36_fpSqrtTest_b_17_inputreg1_q <= (others => '0');
            ELSE
                redist34_yForPe_uid36_fpSqrtTest_b_17_inputreg1_q <= STD_LOGIC_VECTOR(redist33_yForPe_uid36_fpSqrtTest_b_10_outputreg1_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist34_yForPe_uid36_fpSqrtTest_b_17_inputreg0(DELAY,347)
    redist34_yForPe_uid36_fpSqrtTest_b_17_inputreg0_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist34_yForPe_uid36_fpSqrtTest_b_17_inputreg0_q <= (others => '0');
            ELSE
                redist34_yForPe_uid36_fpSqrtTest_b_17_inputreg0_q <= STD_LOGIC_VECTOR(redist34_yForPe_uid36_fpSqrtTest_b_17_inputreg1_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist34_yForPe_uid36_fpSqrtTest_b_17(DELAY,316)
    redist34_yForPe_uid36_fpSqrtTest_b_17_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist34_yForPe_uid36_fpSqrtTest_b_17_delay_0 <= (others => '0');
                redist34_yForPe_uid36_fpSqrtTest_b_17_delay_1 <= (others => '0');
                redist34_yForPe_uid36_fpSqrtTest_b_17_q <= (others => '0');
            ELSE
                redist34_yForPe_uid36_fpSqrtTest_b_17_delay_0 <= STD_LOGIC_VECTOR(redist34_yForPe_uid36_fpSqrtTest_b_17_inputreg0_q);
                redist34_yForPe_uid36_fpSqrtTest_b_17_delay_1 <= redist34_yForPe_uid36_fpSqrtTest_b_17_delay_0;
                redist34_yForPe_uid36_fpSqrtTest_b_17_q <= redist34_yForPe_uid36_fpSqrtTest_b_17_delay_1;
            END IF;
        END IF;
    END PROCESS;

    -- redist34_yForPe_uid36_fpSqrtTest_b_17_outputreg0(DELAY,348)
    redist34_yForPe_uid36_fpSqrtTest_b_17_outputreg0_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist34_yForPe_uid36_fpSqrtTest_b_17_outputreg0_q <= (others => '0');
            ELSE
                redist34_yForPe_uid36_fpSqrtTest_b_17_outputreg0_q <= STD_LOGIC_VECTOR(redist34_yForPe_uid36_fpSqrtTest_b_17_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist34_yForPe_uid36_fpSqrtTest_b_17_outputreg1(DELAY,346)
    redist34_yForPe_uid36_fpSqrtTest_b_17_outputreg1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist34_yForPe_uid36_fpSqrtTest_b_17_outputreg1_q <= (others => '0');
            ELSE
                redist34_yForPe_uid36_fpSqrtTest_b_17_outputreg1_q <= STD_LOGIC_VECTOR(redist34_yForPe_uid36_fpSqrtTest_b_17_outputreg0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist35_yForPe_uid36_fpSqrtTest_b_25_inputreg1(DELAY,349)
    redist35_yForPe_uid36_fpSqrtTest_b_25_inputreg1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist35_yForPe_uid36_fpSqrtTest_b_25_inputreg1_q <= (others => '0');
            ELSE
                redist35_yForPe_uid36_fpSqrtTest_b_25_inputreg1_q <= STD_LOGIC_VECTOR(redist34_yForPe_uid36_fpSqrtTest_b_17_outputreg1_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist35_yForPe_uid36_fpSqrtTest_b_25_inputreg0(DELAY,351)
    redist35_yForPe_uid36_fpSqrtTest_b_25_inputreg0_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist35_yForPe_uid36_fpSqrtTest_b_25_inputreg0_q <= (others => '0');
            ELSE
                redist35_yForPe_uid36_fpSqrtTest_b_25_inputreg0_q <= STD_LOGIC_VECTOR(redist35_yForPe_uid36_fpSqrtTest_b_25_inputreg1_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist35_yForPe_uid36_fpSqrtTest_b_25_wraddr(REG,355)
    redist35_yForPe_uid36_fpSqrtTest_b_25_wraddr_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist35_yForPe_uid36_fpSqrtTest_b_25_wraddr_q <= "10";
            ELSE
                redist35_yForPe_uid36_fpSqrtTest_b_25_wraddr_q <= STD_LOGIC_VECTOR(redist35_yForPe_uid36_fpSqrtTest_b_25_rdcnt_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist35_yForPe_uid36_fpSqrtTest_b_25_mem(DUALMEM,353)
    redist35_yForPe_uid36_fpSqrtTest_b_25_mem_ia <= STD_LOGIC_VECTOR(redist35_yForPe_uid36_fpSqrtTest_b_25_inputreg0_q);
    redist35_yForPe_uid36_fpSqrtTest_b_25_mem_aa <= redist35_yForPe_uid36_fpSqrtTest_b_25_wraddr_q;
    redist35_yForPe_uid36_fpSqrtTest_b_25_mem_ab <= redist35_yForPe_uid36_fpSqrtTest_b_25_rdcnt_q;
    redist35_yForPe_uid36_fpSqrtTest_b_25_mem_reset0 <= areset;
    redist35_yForPe_uid36_fpSqrtTest_b_25_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 45,
        widthad_a => 2,
        numwords_a => 3,
        width_b => 45,
        widthad_b => 2,
        numwords_b => 3,
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
        clocken1 => redist35_yForPe_uid36_fpSqrtTest_b_25_enaAnd_q(0),
        clocken0 => '1',
        clock0 => clk,
        sclr => redist35_yForPe_uid36_fpSqrtTest_b_25_mem_reset0,
        clock1 => clk,
        address_a => redist35_yForPe_uid36_fpSqrtTest_b_25_mem_aa,
        data_a => redist35_yForPe_uid36_fpSqrtTest_b_25_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist35_yForPe_uid36_fpSqrtTest_b_25_mem_ab,
        q_b => redist35_yForPe_uid36_fpSqrtTest_b_25_mem_iq
    );
    redist35_yForPe_uid36_fpSqrtTest_b_25_mem_q <= redist35_yForPe_uid36_fpSqrtTest_b_25_mem_iq(44 downto 0);

    -- redist35_yForPe_uid36_fpSqrtTest_b_25_outputreg0(DELAY,352)
    redist35_yForPe_uid36_fpSqrtTest_b_25_outputreg0_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist35_yForPe_uid36_fpSqrtTest_b_25_outputreg0_q <= (others => '0');
            ELSE
                redist35_yForPe_uid36_fpSqrtTest_b_25_outputreg0_q <= STD_LOGIC_VECTOR(redist35_yForPe_uid36_fpSqrtTest_b_25_mem_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist35_yForPe_uid36_fpSqrtTest_b_25_outputreg1(DELAY,350)
    redist35_yForPe_uid36_fpSqrtTest_b_25_outputreg1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist35_yForPe_uid36_fpSqrtTest_b_25_outputreg1_q <= (others => '0');
            ELSE
                redist35_yForPe_uid36_fpSqrtTest_b_25_outputreg1_q <= STD_LOGIC_VECTOR(redist35_yForPe_uid36_fpSqrtTest_b_25_outputreg0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist36_yForPe_uid36_fpSqrtTest_b_33_inputreg1(DELAY,363)
    redist36_yForPe_uid36_fpSqrtTest_b_33_inputreg1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist36_yForPe_uid36_fpSqrtTest_b_33_inputreg1_q <= (others => '0');
            ELSE
                redist36_yForPe_uid36_fpSqrtTest_b_33_inputreg1_q <= STD_LOGIC_VECTOR(redist35_yForPe_uid36_fpSqrtTest_b_25_outputreg1_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist36_yForPe_uid36_fpSqrtTest_b_33_inputreg0(DELAY,365)
    redist36_yForPe_uid36_fpSqrtTest_b_33_inputreg0_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist36_yForPe_uid36_fpSqrtTest_b_33_inputreg0_q <= (others => '0');
            ELSE
                redist36_yForPe_uid36_fpSqrtTest_b_33_inputreg0_q <= STD_LOGIC_VECTOR(redist36_yForPe_uid36_fpSqrtTest_b_33_inputreg1_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist36_yForPe_uid36_fpSqrtTest_b_33_wraddr(REG,369)
    redist36_yForPe_uid36_fpSqrtTest_b_33_wraddr_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist36_yForPe_uid36_fpSqrtTest_b_33_wraddr_q <= "10";
            ELSE
                redist36_yForPe_uid36_fpSqrtTest_b_33_wraddr_q <= STD_LOGIC_VECTOR(redist36_yForPe_uid36_fpSqrtTest_b_33_rdcnt_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist36_yForPe_uid36_fpSqrtTest_b_33_mem(DUALMEM,367)
    redist36_yForPe_uid36_fpSqrtTest_b_33_mem_ia <= STD_LOGIC_VECTOR(redist36_yForPe_uid36_fpSqrtTest_b_33_inputreg0_q);
    redist36_yForPe_uid36_fpSqrtTest_b_33_mem_aa <= redist36_yForPe_uid36_fpSqrtTest_b_33_wraddr_q;
    redist36_yForPe_uid36_fpSqrtTest_b_33_mem_ab <= redist36_yForPe_uid36_fpSqrtTest_b_33_rdcnt_q;
    redist36_yForPe_uid36_fpSqrtTest_b_33_mem_reset0 <= areset;
    redist36_yForPe_uid36_fpSqrtTest_b_33_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 45,
        widthad_a => 2,
        numwords_a => 3,
        width_b => 45,
        widthad_b => 2,
        numwords_b => 3,
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
        clocken1 => redist36_yForPe_uid36_fpSqrtTest_b_33_enaAnd_q(0),
        clocken0 => '1',
        clock0 => clk,
        sclr => redist36_yForPe_uid36_fpSqrtTest_b_33_mem_reset0,
        clock1 => clk,
        address_a => redist36_yForPe_uid36_fpSqrtTest_b_33_mem_aa,
        data_a => redist36_yForPe_uid36_fpSqrtTest_b_33_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist36_yForPe_uid36_fpSqrtTest_b_33_mem_ab,
        q_b => redist36_yForPe_uid36_fpSqrtTest_b_33_mem_iq
    );
    redist36_yForPe_uid36_fpSqrtTest_b_33_mem_q <= redist36_yForPe_uid36_fpSqrtTest_b_33_mem_iq(44 downto 0);

    -- redist36_yForPe_uid36_fpSqrtTest_b_33_outputreg0(DELAY,366)
    redist36_yForPe_uid36_fpSqrtTest_b_33_outputreg0_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist36_yForPe_uid36_fpSqrtTest_b_33_outputreg0_q <= (others => '0');
            ELSE
                redist36_yForPe_uid36_fpSqrtTest_b_33_outputreg0_q <= STD_LOGIC_VECTOR(redist36_yForPe_uid36_fpSqrtTest_b_33_mem_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist36_yForPe_uid36_fpSqrtTest_b_33_outputreg1(DELAY,364)
    redist36_yForPe_uid36_fpSqrtTest_b_33_outputreg1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist36_yForPe_uid36_fpSqrtTest_b_33_outputreg1_q <= (others => '0');
            ELSE
                redist36_yForPe_uid36_fpSqrtTest_b_33_outputreg1_q <= STD_LOGIC_VECTOR(redist36_yForPe_uid36_fpSqrtTest_b_33_outputreg0_q);
            END IF;
        END IF;
    END PROCESS;

    -- nx_mergedSignalTM_uid207_pT5_uid113_invPolyEval(BITJOIN,206)@33
    nx_mergedSignalTM_uid207_pT5_uid113_invPolyEval_q <= GND_q & redist36_yForPe_uid36_fpSqrtTest_b_33_outputreg1_q;

    -- topRangeX_uid209_pT5_uid113_invPolyEval(BITSELECT,208)@33
    topRangeX_uid209_pT5_uid113_invPolyEval_b <= STD_LOGIC_VECTOR(nx_mergedSignalTM_uid207_pT5_uid113_invPolyEval_q(45 downto 19));

    -- yT4_uid106_invPolyEval(BITSELECT,105)@25
    yT4_uid106_invPolyEval_b <= redist35_yForPe_uid36_fpSqrtTest_b_25_outputreg1_q(44 downto 5);

    -- nx_mergedSignalTM_uid172_pT4_uid107_invPolyEval(BITJOIN,171)@25
    nx_mergedSignalTM_uid172_pT4_uid107_invPolyEval_q <= GND_q & yT4_uid106_invPolyEval_b;

    -- aboveLeftX_uid176_pT4_uid107_invPolyEval(BITSELECT,175)@25
    aboveLeftX_uid176_pT4_uid107_invPolyEval_b <= STD_LOGIC_VECTOR(nx_mergedSignalTM_uid172_pT4_uid107_invPolyEval_q(40 downto 23));

    -- yT3_uid100_invPolyEval(BITSELECT,99)@17
    yT3_uid100_invPolyEval_b <= redist34_yForPe_uid36_fpSqrtTest_b_17_outputreg1_q(44 downto 12);

    -- nx_mergedSignalTM_uid137_pT3_uid101_invPolyEval(BITJOIN,136)@17
    nx_mergedSignalTM_uid137_pT3_uid101_invPolyEval_q <= GND_q & yT3_uid100_invPolyEval_b;

    -- topRangeX_uid139_pT3_uid101_invPolyEval_merged_bit_select(BITSELECT,281)@17
    topRangeX_uid139_pT3_uid101_invPolyEval_merged_bit_select_b <= STD_LOGIC_VECTOR(nx_mergedSignalTM_uid137_pT3_uid101_invPolyEval_q(33 downto 16));
    topRangeX_uid139_pT3_uid101_invPolyEval_merged_bit_select_c <= STD_LOGIC_VECTOR(nx_mergedSignalTM_uid137_pT3_uid101_invPolyEval_q(15 downto 0));

    -- aboveLeftY_mergedSignalTM_uid144_pT3_uid101_invPolyEval(BITJOIN,143)@17
    aboveLeftY_mergedSignalTM_uid144_pT3_uid101_invPolyEval_q <= topRangeY_uid140_pT3_uid101_invPolyEval_merged_bit_select_c & GND_q;

    -- expX0PS_uid29_fpSqrtTest(BITSELECT,28)@0
    expX0PS_uid29_fpSqrtTest_in <= STD_LOGIC_VECTOR(expX_uid6_fpSqrtTest_b(0 downto 0));
    expX0PS_uid29_fpSqrtTest_b <= STD_LOGIC_VECTOR(expX0PS_uid29_fpSqrtTest_in(0 downto 0));

    -- expOddSelect_uid30_fpSqrtTest(LOGICAL,29)@0
    expOddSelect_uid30_fpSqrtTest_q <= not (expX0PS_uid29_fpSqrtTest_b);

    -- addrFull_uid33_fpSqrtTest(BITJOIN,32)@0
    addrFull_uid33_fpSqrtTest_q <= expOddSelect_uid30_fpSqrtTest_q & frac_x_uid12_fpSqrtTest_b;

    -- yAddr_uid35_fpSqrtTest(BITSELECT,34)@0
    yAddr_uid35_fpSqrtTest_b <= addrFull_uid33_fpSqrtTest_q(52 downto 45);

    -- memoryC5_uid79_sqrtTables_lutmem(DUALMEM,270)@0 + 2
    -- in j@20000000
    memoryC5_uid79_sqrtTables_lutmem_aa <= yAddr_uid35_fpSqrtTest_b;
    memoryC5_uid79_sqrtTables_lutmem_reset0 <= areset;
    memoryC5_uid79_sqrtTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "ROM",
        width_a => 17,
        widthad_a => 8,
        numwords_a => 256,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_sclr_a => "SCLEAR",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "float64_sqrt_altera_fp_functions_191_eshpdly_memoryC5_uid79_sqrtTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Stratix 10"
    )
    PORT MAP (
        clocken0 => '1',
        sclr => memoryC5_uid79_sqrtTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC5_uid79_sqrtTables_lutmem_aa,
        q_a => memoryC5_uid79_sqrtTables_lutmem_ir
    );
    memoryC5_uid79_sqrtTables_lutmem_r <= memoryC5_uid79_sqrtTables_lutmem_ir(16 downto 0);

    -- redist6_memoryC5_uid79_sqrtTables_lutmem_r_1(DELAY,288)
    redist6_memoryC5_uid79_sqrtTables_lutmem_r_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist6_memoryC5_uid79_sqrtTables_lutmem_r_1_q <= (others => '0');
            ELSE
                redist6_memoryC5_uid79_sqrtTables_lutmem_r_1_q <= STD_LOGIC_VECTOR(memoryC5_uid79_sqrtTables_lutmem_r);
            END IF;
        END IF;
    END PROCESS;

    -- yT1_uid88_invPolyEval(BITSELECT,87)@3
    yT1_uid88_invPolyEval_b <= redist32_yForPe_uid36_fpSqrtTest_b_3_q(44 downto 28);

    -- prodXY_uid119_pT1_uid89_invPolyEval_cma(CHAINMULTADD,271)@3 + 5
    -- out q@9
    prodXY_uid119_pT1_uid89_invPolyEval_cma_reset <= areset;
    prodXY_uid119_pT1_uid89_invPolyEval_cma_ena0 <= '1';
    prodXY_uid119_pT1_uid89_invPolyEval_cma_ena1 <= prodXY_uid119_pT1_uid89_invPolyEval_cma_ena0;
    prodXY_uid119_pT1_uid89_invPolyEval_cma_ena2 <= prodXY_uid119_pT1_uid89_invPolyEval_cma_ena0;
    prodXY_uid119_pT1_uid89_invPolyEval_cma_chainmultadd_hyper: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (false) THEN
            ELSE
                prodXY_uid119_pT1_uid89_invPolyEval_cma_ah(0) <= RESIZE(UNSIGNED(yT1_uid88_invPolyEval_b),17);
                prodXY_uid119_pT1_uid89_invPolyEval_cma_ch(0) <= RESIZE(SIGNED(redist6_memoryC5_uid79_sqrtTables_lutmem_r_1_q),17);
            END IF;
        END IF;
    END PROCESS;

    prodXY_uid119_pT1_uid89_invPolyEval_cma_a0 <= STD_LOGIC_VECTOR(prodXY_uid119_pT1_uid89_invPolyEval_cma_ah(0));
    prodXY_uid119_pT1_uid89_invPolyEval_cma_c0 <= STD_LOGIC_VECTOR(prodXY_uid119_pT1_uid89_invPolyEval_cma_ch(0));
    prodXY_uid119_pT1_uid89_invPolyEval_cma_DSP0 : fourteennm_mac
    GENERIC MAP (
        operation_mode => "m18x18_full",
        clear_type => "sclr",
        ay_scan_in_clock => "0",
        ay_scan_in_width => 17,
        ax_clock => "0",
        ax_width => 17,
        signed_may => "false",
        signed_max => "true",
        input_pipeline_clock => "2",
        second_pipeline_clock => "2",
        output_clock => "1",
        result_a_width => 34,
        bx_width => 0,
        by_width => 0,
        result_b_width => 0
    )
    PORT MAP (
        clk(0) => clk,
        clk(1) => clk,
        clk(2) => clk,
        ena(0) => prodXY_uid119_pT1_uid89_invPolyEval_cma_ena0,
        ena(1) => prodXY_uid119_pT1_uid89_invPolyEval_cma_ena1,
        ena(2) => prodXY_uid119_pT1_uid89_invPolyEval_cma_ena2,
        clr(0) => prodXY_uid119_pT1_uid89_invPolyEval_cma_reset,
        clr(1) => prodXY_uid119_pT1_uid89_invPolyEval_cma_reset,
        ay => prodXY_uid119_pT1_uid89_invPolyEval_cma_a0,
        ax => prodXY_uid119_pT1_uid89_invPolyEval_cma_c0,
        resulta => prodXY_uid119_pT1_uid89_invPolyEval_cma_s0
    );
    prodXY_uid119_pT1_uid89_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 34, depth => 1, reset_kind => "NONE", phase => 0, modulus => 1 )
    PORT MAP ( xin => prodXY_uid119_pT1_uid89_invPolyEval_cma_s0, xout => prodXY_uid119_pT1_uid89_invPolyEval_cma_qq, clk => clk, aclr => areset, ena => '1' );
    prodXY_uid119_pT1_uid89_invPolyEval_cma_q <= STD_LOGIC_VECTOR(prodXY_uid119_pT1_uid89_invPolyEval_cma_qq(33 downto 0));

    -- osig_uid120_pT1_uid89_invPolyEval(BITSELECT,119)@9
    osig_uid120_pT1_uid89_invPolyEval_b <= STD_LOGIC_VECTOR(prodXY_uid119_pT1_uid89_invPolyEval_cma_q(33 downto 16));

    -- highBBits_uid91_invPolyEval(BITSELECT,90)@9
    highBBits_uid91_invPolyEval_b <= STD_LOGIC_VECTOR(osig_uid120_pT1_uid89_invPolyEval_b(17 downto 1));

    -- redist27_highBBits_uid91_invPolyEval_b_1(DELAY,309)
    redist27_highBBits_uid91_invPolyEval_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist27_highBBits_uid91_invPolyEval_b_1_q <= (others => '0');
            ELSE
                redist27_highBBits_uid91_invPolyEval_b_1_q <= STD_LOGIC_VECTOR(highBBits_uid91_invPolyEval_b);
            END IF;
        END IF;
    END PROCESS;

    -- redist37_yAddr_uid35_fpSqrtTest_b_7(DELAY,319)
    redist37_yAddr_uid35_fpSqrtTest_b_7_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist37_yAddr_uid35_fpSqrtTest_b_7_delay_0 <= (others => '0');
                redist37_yAddr_uid35_fpSqrtTest_b_7_delay_1 <= (others => '0');
                redist37_yAddr_uid35_fpSqrtTest_b_7_delay_2 <= (others => '0');
                redist37_yAddr_uid35_fpSqrtTest_b_7_delay_3 <= (others => '0');
                redist37_yAddr_uid35_fpSqrtTest_b_7_q <= (others => '0');
            ELSE
                redist37_yAddr_uid35_fpSqrtTest_b_7_delay_0 <= STD_LOGIC_VECTOR(yAddr_uid35_fpSqrtTest_b);
                redist37_yAddr_uid35_fpSqrtTest_b_7_delay_1 <= redist37_yAddr_uid35_fpSqrtTest_b_7_delay_0;
                redist37_yAddr_uid35_fpSqrtTest_b_7_delay_2 <= redist37_yAddr_uid35_fpSqrtTest_b_7_delay_1;
                redist37_yAddr_uid35_fpSqrtTest_b_7_delay_3 <= redist37_yAddr_uid35_fpSqrtTest_b_7_delay_2;
                redist37_yAddr_uid35_fpSqrtTest_b_7_q <= redist37_yAddr_uid35_fpSqrtTest_b_7_delay_3;
            END IF;
        END IF;
    END PROCESS;

    -- redist37_yAddr_uid35_fpSqrtTest_b_7_outputreg0(DELAY,378)
    redist37_yAddr_uid35_fpSqrtTest_b_7_outputreg0_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist37_yAddr_uid35_fpSqrtTest_b_7_outputreg0_q <= (others => '0');
            ELSE
                redist37_yAddr_uid35_fpSqrtTest_b_7_outputreg0_q <= STD_LOGIC_VECTOR(redist37_yAddr_uid35_fpSqrtTest_b_7_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist37_yAddr_uid35_fpSqrtTest_b_7_outputreg1(DELAY,377)
    redist37_yAddr_uid35_fpSqrtTest_b_7_outputreg1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist37_yAddr_uid35_fpSqrtTest_b_7_outputreg1_q <= (others => '0');
            ELSE
                redist37_yAddr_uid35_fpSqrtTest_b_7_outputreg1_q <= STD_LOGIC_VECTOR(redist37_yAddr_uid35_fpSqrtTest_b_7_outputreg0_q);
            END IF;
        END IF;
    END PROCESS;

    -- memoryC4_uid76_sqrtTables_lutmem(DUALMEM,269)@7 + 2
    -- in j@20000000
    memoryC4_uid76_sqrtTables_lutmem_aa <= redist37_yAddr_uid35_fpSqrtTest_b_7_outputreg1_q;
    memoryC4_uid76_sqrtTables_lutmem_reset0 <= areset;
    memoryC4_uid76_sqrtTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "ROM",
        width_a => 24,
        widthad_a => 8,
        numwords_a => 256,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_sclr_a => "SCLEAR",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "float64_sqrt_altera_fp_functions_191_eshpdly_memoryC4_uid76_sqrtTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Stratix 10"
    )
    PORT MAP (
        clocken0 => '1',
        sclr => memoryC4_uid76_sqrtTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC4_uid76_sqrtTables_lutmem_aa,
        q_a => memoryC4_uid76_sqrtTables_lutmem_ir
    );
    memoryC4_uid76_sqrtTables_lutmem_r <= memoryC4_uid76_sqrtTables_lutmem_ir(23 downto 0);

    -- redist7_memoryC4_uid76_sqrtTables_lutmem_r_1(DELAY,289)
    redist7_memoryC4_uid76_sqrtTables_lutmem_r_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist7_memoryC4_uid76_sqrtTables_lutmem_r_1_q <= (others => '0');
            ELSE
                redist7_memoryC4_uid76_sqrtTables_lutmem_r_1_q <= STD_LOGIC_VECTOR(memoryC4_uid76_sqrtTables_lutmem_r);
            END IF;
        END IF;
    END PROCESS;

    -- s1sumAHighB_uid92_invPolyEval(ADD,91)@10
    s1sumAHighB_uid92_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 24 => redist7_memoryC4_uid76_sqrtTables_lutmem_r_1_q(23)) & redist7_memoryC4_uid76_sqrtTables_lutmem_r_1_q));
    s1sumAHighB_uid92_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 17 => redist27_highBBits_uid91_invPolyEval_b_1_q(16)) & redist27_highBBits_uid91_invPolyEval_b_1_q));
    s1sumAHighB_uid92_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(s1sumAHighB_uid92_invPolyEval_a) + SIGNED(s1sumAHighB_uid92_invPolyEval_b));
    s1sumAHighB_uid92_invPolyEval_q <= s1sumAHighB_uid92_invPolyEval_o(24 downto 0);

    -- lowRangeB_uid90_invPolyEval(BITSELECT,89)@9
    lowRangeB_uid90_invPolyEval_in <= osig_uid120_pT1_uid89_invPolyEval_b(0 downto 0);
    lowRangeB_uid90_invPolyEval_b <= lowRangeB_uid90_invPolyEval_in(0 downto 0);

    -- redist28_lowRangeB_uid90_invPolyEval_b_1(DELAY,310)
    redist28_lowRangeB_uid90_invPolyEval_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist28_lowRangeB_uid90_invPolyEval_b_1_q <= (others => '0');
            ELSE
                redist28_lowRangeB_uid90_invPolyEval_b_1_q <= STD_LOGIC_VECTOR(lowRangeB_uid90_invPolyEval_b);
            END IF;
        END IF;
    END PROCESS;

    -- s1_uid93_invPolyEval(BITJOIN,92)@10
    s1_uid93_invPolyEval_q <= s1sumAHighB_uid92_invPolyEval_q & redist28_lowRangeB_uid90_invPolyEval_b_1_q;

    -- yT2_uid94_invPolyEval(BITSELECT,93)@10
    yT2_uid94_invPolyEval_b <= redist33_yForPe_uid36_fpSqrtTest_b_10_outputreg1_q(44 downto 21);

    -- prodXY_uid122_pT2_uid95_invPolyEval_cma(CHAINMULTADD,272)@10 + 5
    -- out q@16
    prodXY_uid122_pT2_uid95_invPolyEval_cma_reset <= areset;
    prodXY_uid122_pT2_uid95_invPolyEval_cma_ena0 <= '1';
    prodXY_uid122_pT2_uid95_invPolyEval_cma_ena1 <= prodXY_uid122_pT2_uid95_invPolyEval_cma_ena0;
    prodXY_uid122_pT2_uid95_invPolyEval_cma_ena2 <= prodXY_uid122_pT2_uid95_invPolyEval_cma_ena0;
    prodXY_uid122_pT2_uid95_invPolyEval_cma_chainmultadd_hyper: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (false) THEN
            ELSE
                prodXY_uid122_pT2_uid95_invPolyEval_cma_ah(0) <= RESIZE(UNSIGNED(yT2_uid94_invPolyEval_b),24);
                prodXY_uid122_pT2_uid95_invPolyEval_cma_ch(0) <= RESIZE(SIGNED(s1_uid93_invPolyEval_q),26);
            END IF;
        END IF;
    END PROCESS;

    prodXY_uid122_pT2_uid95_invPolyEval_cma_a0 <= STD_LOGIC_VECTOR(prodXY_uid122_pT2_uid95_invPolyEval_cma_ah(0));
    prodXY_uid122_pT2_uid95_invPolyEval_cma_c0 <= STD_LOGIC_VECTOR(prodXY_uid122_pT2_uid95_invPolyEval_cma_ch(0));
    prodXY_uid122_pT2_uid95_invPolyEval_cma_DSP0 : fourteennm_mac
    GENERIC MAP (
        operation_mode => "m27x27",
        clear_type => "sclr",
        use_chainadder => "false",
        ay_scan_in_clock => "0",
        ay_scan_in_width => 24,
        ax_clock => "0",
        ax_width => 26,
        signed_may => "false",
        signed_max => "true",
        input_pipeline_clock => "2",
        second_pipeline_clock => "2",
        output_clock => "1",
        result_a_width => 50
    )
    PORT MAP (
        clk(0) => clk,
        clk(1) => clk,
        clk(2) => clk,
        ena(0) => prodXY_uid122_pT2_uid95_invPolyEval_cma_ena0,
        ena(1) => prodXY_uid122_pT2_uid95_invPolyEval_cma_ena1,
        ena(2) => prodXY_uid122_pT2_uid95_invPolyEval_cma_ena2,
        clr(0) => prodXY_uid122_pT2_uid95_invPolyEval_cma_reset,
        clr(1) => prodXY_uid122_pT2_uid95_invPolyEval_cma_reset,
        ay => prodXY_uid122_pT2_uid95_invPolyEval_cma_a0,
        ax => prodXY_uid122_pT2_uid95_invPolyEval_cma_c0,
        resulta => prodXY_uid122_pT2_uid95_invPolyEval_cma_s0
    );
    prodXY_uid122_pT2_uid95_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 50, depth => 1, reset_kind => "NONE", phase => 0, modulus => 1 )
    PORT MAP ( xin => prodXY_uid122_pT2_uid95_invPolyEval_cma_s0, xout => prodXY_uid122_pT2_uid95_invPolyEval_cma_qq, clk => clk, aclr => areset, ena => '1' );
    prodXY_uid122_pT2_uid95_invPolyEval_cma_q <= STD_LOGIC_VECTOR(prodXY_uid122_pT2_uid95_invPolyEval_cma_qq(49 downto 0));

    -- osig_uid123_pT2_uid95_invPolyEval(BITSELECT,122)@16
    osig_uid123_pT2_uid95_invPolyEval_b <= STD_LOGIC_VECTOR(prodXY_uid122_pT2_uid95_invPolyEval_cma_q(49 downto 23));

    -- highBBits_uid97_invPolyEval(BITSELECT,96)@16
    highBBits_uid97_invPolyEval_b <= STD_LOGIC_VECTOR(osig_uid123_pT2_uid95_invPolyEval_b(26 downto 1));

    -- redist25_highBBits_uid97_invPolyEval_b_1(DELAY,307)
    redist25_highBBits_uid97_invPolyEval_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist25_highBBits_uid97_invPolyEval_b_1_q <= (others => '0');
            ELSE
                redist25_highBBits_uid97_invPolyEval_b_1_q <= STD_LOGIC_VECTOR(highBBits_uid97_invPolyEval_b);
            END IF;
        END IF;
    END PROCESS;

    -- redist38_yAddr_uid35_fpSqrtTest_b_14_inputreg1(DELAY,379)
    redist38_yAddr_uid35_fpSqrtTest_b_14_inputreg1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist38_yAddr_uid35_fpSqrtTest_b_14_inputreg1_q <= (others => '0');
            ELSE
                redist38_yAddr_uid35_fpSqrtTest_b_14_inputreg1_q <= STD_LOGIC_VECTOR(redist37_yAddr_uid35_fpSqrtTest_b_7_outputreg1_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist38_yAddr_uid35_fpSqrtTest_b_14(DELAY,320)
    redist38_yAddr_uid35_fpSqrtTest_b_14_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist38_yAddr_uid35_fpSqrtTest_b_14_delay_0 <= (others => '0');
                redist38_yAddr_uid35_fpSqrtTest_b_14_delay_1 <= (others => '0');
                redist38_yAddr_uid35_fpSqrtTest_b_14_delay_2 <= (others => '0');
                redist38_yAddr_uid35_fpSqrtTest_b_14_delay_3 <= (others => '0');
                redist38_yAddr_uid35_fpSqrtTest_b_14_q <= (others => '0');
            ELSE
                redist38_yAddr_uid35_fpSqrtTest_b_14_delay_0 <= STD_LOGIC_VECTOR(redist38_yAddr_uid35_fpSqrtTest_b_14_inputreg1_q);
                redist38_yAddr_uid35_fpSqrtTest_b_14_delay_1 <= redist38_yAddr_uid35_fpSqrtTest_b_14_delay_0;
                redist38_yAddr_uid35_fpSqrtTest_b_14_delay_2 <= redist38_yAddr_uid35_fpSqrtTest_b_14_delay_1;
                redist38_yAddr_uid35_fpSqrtTest_b_14_delay_3 <= redist38_yAddr_uid35_fpSqrtTest_b_14_delay_2;
                redist38_yAddr_uid35_fpSqrtTest_b_14_q <= redist38_yAddr_uid35_fpSqrtTest_b_14_delay_3;
            END IF;
        END IF;
    END PROCESS;

    -- redist38_yAddr_uid35_fpSqrtTest_b_14_outputreg1(DELAY,380)
    redist38_yAddr_uid35_fpSqrtTest_b_14_outputreg1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist38_yAddr_uid35_fpSqrtTest_b_14_outputreg1_q <= (others => '0');
            ELSE
                redist38_yAddr_uid35_fpSqrtTest_b_14_outputreg1_q <= STD_LOGIC_VECTOR(redist38_yAddr_uid35_fpSqrtTest_b_14_q);
            END IF;
        END IF;
    END PROCESS;

    -- memoryC3_uid73_sqrtTables_lutmem(DUALMEM,268)@14 + 2
    -- in j@20000000
    memoryC3_uid73_sqrtTables_lutmem_aa <= redist38_yAddr_uid35_fpSqrtTest_b_14_outputreg1_q;
    memoryC3_uid73_sqrtTables_lutmem_reset0 <= areset;
    memoryC3_uid73_sqrtTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "ROM",
        width_a => 33,
        widthad_a => 8,
        numwords_a => 256,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_sclr_a => "SCLEAR",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "float64_sqrt_altera_fp_functions_191_eshpdly_memoryC3_uid73_sqrtTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Stratix 10"
    )
    PORT MAP (
        clocken0 => '1',
        sclr => memoryC3_uid73_sqrtTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC3_uid73_sqrtTables_lutmem_aa,
        q_a => memoryC3_uid73_sqrtTables_lutmem_ir
    );
    memoryC3_uid73_sqrtTables_lutmem_r <= memoryC3_uid73_sqrtTables_lutmem_ir(32 downto 0);

    -- redist8_memoryC3_uid73_sqrtTables_lutmem_r_1(DELAY,290)
    redist8_memoryC3_uid73_sqrtTables_lutmem_r_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist8_memoryC3_uid73_sqrtTables_lutmem_r_1_q <= (others => '0');
            ELSE
                redist8_memoryC3_uid73_sqrtTables_lutmem_r_1_q <= STD_LOGIC_VECTOR(memoryC3_uid73_sqrtTables_lutmem_r);
            END IF;
        END IF;
    END PROCESS;

    -- s2sumAHighB_uid98_invPolyEval(ADD,97)@17
    s2sumAHighB_uid98_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 33 => redist8_memoryC3_uid73_sqrtTables_lutmem_r_1_q(32)) & redist8_memoryC3_uid73_sqrtTables_lutmem_r_1_q));
    s2sumAHighB_uid98_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 26 => redist25_highBBits_uid97_invPolyEval_b_1_q(25)) & redist25_highBBits_uid97_invPolyEval_b_1_q));
    s2sumAHighB_uid98_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(s2sumAHighB_uid98_invPolyEval_a) + SIGNED(s2sumAHighB_uid98_invPolyEval_b));
    s2sumAHighB_uid98_invPolyEval_q <= s2sumAHighB_uid98_invPolyEval_o(33 downto 0);

    -- lowRangeB_uid96_invPolyEval(BITSELECT,95)@16
    lowRangeB_uid96_invPolyEval_in <= osig_uid123_pT2_uid95_invPolyEval_b(0 downto 0);
    lowRangeB_uid96_invPolyEval_b <= lowRangeB_uid96_invPolyEval_in(0 downto 0);

    -- redist26_lowRangeB_uid96_invPolyEval_b_1(DELAY,308)
    redist26_lowRangeB_uid96_invPolyEval_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist26_lowRangeB_uid96_invPolyEval_b_1_q <= (others => '0');
            ELSE
                redist26_lowRangeB_uid96_invPolyEval_b_1_q <= STD_LOGIC_VECTOR(lowRangeB_uid96_invPolyEval_b);
            END IF;
        END IF;
    END PROCESS;

    -- s2_uid99_invPolyEval(BITJOIN,98)@17
    s2_uid99_invPolyEval_q <= s2sumAHighB_uid98_invPolyEval_q & redist26_lowRangeB_uid96_invPolyEval_b_1_q;

    -- topRangeY_uid140_pT3_uid101_invPolyEval_merged_bit_select(BITSELECT,280)@17
    topRangeY_uid140_pT3_uid101_invPolyEval_merged_bit_select_b <= STD_LOGIC_VECTOR(s2_uid99_invPolyEval_q(34 downto 17));
    topRangeY_uid140_pT3_uid101_invPolyEval_merged_bit_select_c <= STD_LOGIC_VECTOR(s2_uid99_invPolyEval_q(16 downto 0));

    -- rightBottomX_bottomExtension_uid146_pT3_uid101_invPolyEval(CONSTANT,145)
    rightBottomX_bottomExtension_uid146_pT3_uid101_invPolyEval_q <= "00";

    -- rightBottomX_mergedSignalTM_uid148_pT3_uid101_invPolyEval(BITJOIN,147)@17
    rightBottomX_mergedSignalTM_uid148_pT3_uid101_invPolyEval_q <= topRangeX_uid139_pT3_uid101_invPolyEval_merged_bit_select_c & rightBottomX_bottomExtension_uid146_pT3_uid101_invPolyEval_q;

    -- multSumOfTwoTS_uid152_pT3_uid101_invPolyEval_cma(CHAINMULTADD,276)@17 + 5
    -- out q@23
    multSumOfTwoTS_uid152_pT3_uid101_invPolyEval_cma_reset <= areset;
    multSumOfTwoTS_uid152_pT3_uid101_invPolyEval_cma_ena0 <= '1';
    multSumOfTwoTS_uid152_pT3_uid101_invPolyEval_cma_ena1 <= multSumOfTwoTS_uid152_pT3_uid101_invPolyEval_cma_ena0;
    multSumOfTwoTS_uid152_pT3_uid101_invPolyEval_cma_ena2 <= multSumOfTwoTS_uid152_pT3_uid101_invPolyEval_cma_ena0;
    multSumOfTwoTS_uid152_pT3_uid101_invPolyEval_cma_chainmultadd_hyper: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (false) THEN
            ELSE
                multSumOfTwoTS_uid152_pT3_uid101_invPolyEval_cma_ah(0) <= RESIZE(UNSIGNED(rightBottomX_mergedSignalTM_uid148_pT3_uid101_invPolyEval_q),18);
                multSumOfTwoTS_uid152_pT3_uid101_invPolyEval_cma_ah(1) <= RESIZE(UNSIGNED(aboveLeftY_mergedSignalTM_uid144_pT3_uid101_invPolyEval_q),18);
                multSumOfTwoTS_uid152_pT3_uid101_invPolyEval_cma_ch(0) <= RESIZE(SIGNED(topRangeY_uid140_pT3_uid101_invPolyEval_merged_bit_select_b),18);
                multSumOfTwoTS_uid152_pT3_uid101_invPolyEval_cma_ch(1) <= RESIZE(SIGNED(topRangeX_uid139_pT3_uid101_invPolyEval_merged_bit_select_b),18);
            END IF;
        END IF;
    END PROCESS;

    multSumOfTwoTS_uid152_pT3_uid101_invPolyEval_cma_a0 <= STD_LOGIC_VECTOR(multSumOfTwoTS_uid152_pT3_uid101_invPolyEval_cma_ah(0));
    multSumOfTwoTS_uid152_pT3_uid101_invPolyEval_cma_c0 <= STD_LOGIC_VECTOR(multSumOfTwoTS_uid152_pT3_uid101_invPolyEval_cma_ch(0));
    multSumOfTwoTS_uid152_pT3_uid101_invPolyEval_cma_a1 <= STD_LOGIC_VECTOR(multSumOfTwoTS_uid152_pT3_uid101_invPolyEval_cma_ah(1));
    multSumOfTwoTS_uid152_pT3_uid101_invPolyEval_cma_c1 <= STD_LOGIC_VECTOR(multSumOfTwoTS_uid152_pT3_uid101_invPolyEval_cma_ch(1));
    multSumOfTwoTS_uid152_pT3_uid101_invPolyEval_cma_DSP0 : fourteennm_mac
    GENERIC MAP (
        operation_mode => "m18x18_sumof2",
        clear_type => "sclr",
        use_chainadder => "false",
        ay_scan_in_clock => "0",
        ay_scan_in_width => 18,
        by_clock => "0",
        by_width => 18,
        ax_clock => "0",
        bx_clock => "0",
        ax_width => 18,
        bx_width => 18,
        signed_may => "false",
        signed_mby => "false",
        signed_max => "true",
        signed_mbx => "true",
        input_pipeline_clock => "2",
        second_pipeline_clock => "2",
        output_clock => "1",
        result_a_width => 37
    )
    PORT MAP (
        clk(0) => clk,
        clk(1) => clk,
        clk(2) => clk,
        ena(0) => multSumOfTwoTS_uid152_pT3_uid101_invPolyEval_cma_ena0,
        ena(1) => multSumOfTwoTS_uid152_pT3_uid101_invPolyEval_cma_ena1,
        ena(2) => multSumOfTwoTS_uid152_pT3_uid101_invPolyEval_cma_ena2,
        clr(0) => multSumOfTwoTS_uid152_pT3_uid101_invPolyEval_cma_reset,
        clr(1) => multSumOfTwoTS_uid152_pT3_uid101_invPolyEval_cma_reset,
        ay => multSumOfTwoTS_uid152_pT3_uid101_invPolyEval_cma_a1,
        by => multSumOfTwoTS_uid152_pT3_uid101_invPolyEval_cma_a0,
        ax => multSumOfTwoTS_uid152_pT3_uid101_invPolyEval_cma_c1,
        bx => multSumOfTwoTS_uid152_pT3_uid101_invPolyEval_cma_c0,
        resulta => multSumOfTwoTS_uid152_pT3_uid101_invPolyEval_cma_s0
    );
    multSumOfTwoTS_uid152_pT3_uid101_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 37, depth => 1, reset_kind => "NONE", phase => 0, modulus => 1 )
    PORT MAP ( xin => multSumOfTwoTS_uid152_pT3_uid101_invPolyEval_cma_s0, xout => multSumOfTwoTS_uid152_pT3_uid101_invPolyEval_cma_qq, clk => clk, aclr => areset, ena => '1' );
    multSumOfTwoTS_uid152_pT3_uid101_invPolyEval_cma_q <= STD_LOGIC_VECTOR(multSumOfTwoTS_uid152_pT3_uid101_invPolyEval_cma_qq(36 downto 0));

    -- redist2_multSumOfTwoTS_uid152_pT3_uid101_invPolyEval_cma_q_1(DELAY,284)
    redist2_multSumOfTwoTS_uid152_pT3_uid101_invPolyEval_cma_q_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist2_multSumOfTwoTS_uid152_pT3_uid101_invPolyEval_cma_q_1_q <= (others => '0');
            ELSE
                redist2_multSumOfTwoTS_uid152_pT3_uid101_invPolyEval_cma_q_1_q <= STD_LOGIC_VECTOR(multSumOfTwoTS_uid152_pT3_uid101_invPolyEval_cma_q);
            END IF;
        END IF;
    END PROCESS;

    -- highBBits_uid155_pT3_uid101_invPolyEval(BITSELECT,154)@24
    highBBits_uid155_pT3_uid101_invPolyEval_b <= STD_LOGIC_VECTOR(redist2_multSumOfTwoTS_uid152_pT3_uid101_invPolyEval_cma_q_1_q(36 downto 18));

    -- sm0_uid151_pT3_uid101_invPolyEval_cma(CHAINMULTADD,273)@17 + 5
    -- out q@23
    sm0_uid151_pT3_uid101_invPolyEval_cma_reset <= areset;
    sm0_uid151_pT3_uid101_invPolyEval_cma_ena0 <= '1';
    sm0_uid151_pT3_uid101_invPolyEval_cma_ena1 <= sm0_uid151_pT3_uid101_invPolyEval_cma_ena0;
    sm0_uid151_pT3_uid101_invPolyEval_cma_ena2 <= sm0_uid151_pT3_uid101_invPolyEval_cma_ena0;
    sm0_uid151_pT3_uid101_invPolyEval_cma_chainmultadd_hyper: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (false) THEN
            ELSE
                sm0_uid151_pT3_uid101_invPolyEval_cma_ah(0) <= RESIZE(SIGNED(topRangeX_uid139_pT3_uid101_invPolyEval_merged_bit_select_b),18);
                sm0_uid151_pT3_uid101_invPolyEval_cma_ch(0) <= RESIZE(SIGNED(topRangeY_uid140_pT3_uid101_invPolyEval_merged_bit_select_b),18);
            END IF;
        END IF;
    END PROCESS;

    sm0_uid151_pT3_uid101_invPolyEval_cma_a0 <= STD_LOGIC_VECTOR(sm0_uid151_pT3_uid101_invPolyEval_cma_ah(0));
    sm0_uid151_pT3_uid101_invPolyEval_cma_c0 <= STD_LOGIC_VECTOR(sm0_uid151_pT3_uid101_invPolyEval_cma_ch(0));
    sm0_uid151_pT3_uid101_invPolyEval_cma_DSP0 : fourteennm_mac
    GENERIC MAP (
        operation_mode => "m18x18_full",
        clear_type => "sclr",
        ay_scan_in_clock => "0",
        ay_scan_in_width => 18,
        ax_clock => "0",
        ax_width => 18,
        signed_may => "true",
        signed_max => "true",
        input_pipeline_clock => "2",
        second_pipeline_clock => "2",
        output_clock => "1",
        result_a_width => 36,
        bx_width => 0,
        by_width => 0,
        result_b_width => 0
    )
    PORT MAP (
        clk(0) => clk,
        clk(1) => clk,
        clk(2) => clk,
        ena(0) => sm0_uid151_pT3_uid101_invPolyEval_cma_ena0,
        ena(1) => sm0_uid151_pT3_uid101_invPolyEval_cma_ena1,
        ena(2) => sm0_uid151_pT3_uid101_invPolyEval_cma_ena2,
        clr(0) => sm0_uid151_pT3_uid101_invPolyEval_cma_reset,
        clr(1) => sm0_uid151_pT3_uid101_invPolyEval_cma_reset,
        ay => sm0_uid151_pT3_uid101_invPolyEval_cma_a0,
        ax => sm0_uid151_pT3_uid101_invPolyEval_cma_c0,
        resulta => sm0_uid151_pT3_uid101_invPolyEval_cma_s0
    );
    sm0_uid151_pT3_uid101_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 36, depth => 1, reset_kind => "NONE", phase => 0, modulus => 1 )
    PORT MAP ( xin => sm0_uid151_pT3_uid101_invPolyEval_cma_s0, xout => sm0_uid151_pT3_uid101_invPolyEval_cma_qq, clk => clk, aclr => areset, ena => '1' );
    sm0_uid151_pT3_uid101_invPolyEval_cma_q <= STD_LOGIC_VECTOR(sm0_uid151_pT3_uid101_invPolyEval_cma_qq(35 downto 0));

    -- redist5_sm0_uid151_pT3_uid101_invPolyEval_cma_q_1(DELAY,287)
    redist5_sm0_uid151_pT3_uid101_invPolyEval_cma_q_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist5_sm0_uid151_pT3_uid101_invPolyEval_cma_q_1_q <= (others => '0');
            ELSE
                redist5_sm0_uid151_pT3_uid101_invPolyEval_cma_q_1_q <= STD_LOGIC_VECTOR(sm0_uid151_pT3_uid101_invPolyEval_cma_q);
            END IF;
        END IF;
    END PROCESS;

    -- lev1_a0sumAHighB_uid156_pT3_uid101_invPolyEval(ADD,155)@24
    lev1_a0sumAHighB_uid156_pT3_uid101_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((36 downto 36 => redist5_sm0_uid151_pT3_uid101_invPolyEval_cma_q_1_q(35)) & redist5_sm0_uid151_pT3_uid101_invPolyEval_cma_q_1_q));
    lev1_a0sumAHighB_uid156_pT3_uid101_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((36 downto 19 => highBBits_uid155_pT3_uid101_invPolyEval_b(18)) & highBBits_uid155_pT3_uid101_invPolyEval_b));
    lev1_a0sumAHighB_uid156_pT3_uid101_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(lev1_a0sumAHighB_uid156_pT3_uid101_invPolyEval_a) + SIGNED(lev1_a0sumAHighB_uid156_pT3_uid101_invPolyEval_b));
    lev1_a0sumAHighB_uid156_pT3_uid101_invPolyEval_q <= lev1_a0sumAHighB_uid156_pT3_uid101_invPolyEval_o(36 downto 0);

    -- lowRangeB_uid154_pT3_uid101_invPolyEval(BITSELECT,153)@24
    lowRangeB_uid154_pT3_uid101_invPolyEval_in <= redist2_multSumOfTwoTS_uid152_pT3_uid101_invPolyEval_cma_q_1_q(17 downto 0);
    lowRangeB_uid154_pT3_uid101_invPolyEval_b <= lowRangeB_uid154_pT3_uid101_invPolyEval_in(17 downto 0);

    -- lev1_a0_uid157_pT3_uid101_invPolyEval(BITJOIN,156)@24
    lev1_a0_uid157_pT3_uid101_invPolyEval_q <= lev1_a0sumAHighB_uid156_pT3_uid101_invPolyEval_q & lowRangeB_uid154_pT3_uid101_invPolyEval_b;

    -- os_uid158_pT3_uid101_invPolyEval(BITSELECT,157)@24
    os_uid158_pT3_uid101_invPolyEval_in <= STD_LOGIC_VECTOR(lev1_a0_uid157_pT3_uid101_invPolyEval_q(52 downto 0));
    os_uid158_pT3_uid101_invPolyEval_b <= STD_LOGIC_VECTOR(os_uid158_pT3_uid101_invPolyEval_in(52 downto 19));

    -- redist22_os_uid158_pT3_uid101_invPolyEval_b_1(DELAY,304)
    redist22_os_uid158_pT3_uid101_invPolyEval_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist22_os_uid158_pT3_uid101_invPolyEval_b_1_q <= (others => '0');
            ELSE
                redist22_os_uid158_pT3_uid101_invPolyEval_b_1_q <= STD_LOGIC_VECTOR(os_uid158_pT3_uid101_invPolyEval_b);
            END IF;
        END IF;
    END PROCESS;

    -- highBBits_uid103_invPolyEval(BITSELECT,102)@25
    highBBits_uid103_invPolyEval_b <= STD_LOGIC_VECTOR(redist22_os_uid158_pT3_uid101_invPolyEval_b_1_q(33 downto 1));

    -- redist39_yAddr_uid35_fpSqrtTest_b_22_inputreg1(DELAY,381)
    redist39_yAddr_uid35_fpSqrtTest_b_22_inputreg1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist39_yAddr_uid35_fpSqrtTest_b_22_inputreg1_q <= (others => '0');
            ELSE
                redist39_yAddr_uid35_fpSqrtTest_b_22_inputreg1_q <= STD_LOGIC_VECTOR(redist38_yAddr_uid35_fpSqrtTest_b_14_outputreg1_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist39_yAddr_uid35_fpSqrtTest_b_22_inputreg0(DELAY,383)
    redist39_yAddr_uid35_fpSqrtTest_b_22_inputreg0_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist39_yAddr_uid35_fpSqrtTest_b_22_inputreg0_q <= (others => '0');
            ELSE
                redist39_yAddr_uid35_fpSqrtTest_b_22_inputreg0_q <= STD_LOGIC_VECTOR(redist39_yAddr_uid35_fpSqrtTest_b_22_inputreg1_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist39_yAddr_uid35_fpSqrtTest_b_22(DELAY,321)
    redist39_yAddr_uid35_fpSqrtTest_b_22_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist39_yAddr_uid35_fpSqrtTest_b_22_delay_0 <= (others => '0');
                redist39_yAddr_uid35_fpSqrtTest_b_22_delay_1 <= (others => '0');
                redist39_yAddr_uid35_fpSqrtTest_b_22_delay_2 <= (others => '0');
                redist39_yAddr_uid35_fpSqrtTest_b_22_delay_3 <= (others => '0');
                redist39_yAddr_uid35_fpSqrtTest_b_22_q <= (others => '0');
            ELSE
                redist39_yAddr_uid35_fpSqrtTest_b_22_delay_0 <= STD_LOGIC_VECTOR(redist39_yAddr_uid35_fpSqrtTest_b_22_inputreg0_q);
                redist39_yAddr_uid35_fpSqrtTest_b_22_delay_1 <= redist39_yAddr_uid35_fpSqrtTest_b_22_delay_0;
                redist39_yAddr_uid35_fpSqrtTest_b_22_delay_2 <= redist39_yAddr_uid35_fpSqrtTest_b_22_delay_1;
                redist39_yAddr_uid35_fpSqrtTest_b_22_delay_3 <= redist39_yAddr_uid35_fpSqrtTest_b_22_delay_2;
                redist39_yAddr_uid35_fpSqrtTest_b_22_q <= redist39_yAddr_uid35_fpSqrtTest_b_22_delay_3;
            END IF;
        END IF;
    END PROCESS;

    -- redist39_yAddr_uid35_fpSqrtTest_b_22_outputreg1(DELAY,382)
    redist39_yAddr_uid35_fpSqrtTest_b_22_outputreg1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist39_yAddr_uid35_fpSqrtTest_b_22_outputreg1_q <= (others => '0');
            ELSE
                redist39_yAddr_uid35_fpSqrtTest_b_22_outputreg1_q <= STD_LOGIC_VECTOR(redist39_yAddr_uid35_fpSqrtTest_b_22_q);
            END IF;
        END IF;
    END PROCESS;

    -- memoryC2_uid70_sqrtTables_lutmem(DUALMEM,267)@22 + 2
    -- in j@20000000
    memoryC2_uid70_sqrtTables_lutmem_aa <= redist39_yAddr_uid35_fpSqrtTest_b_22_outputreg1_q;
    memoryC2_uid70_sqrtTables_lutmem_reset0 <= areset;
    memoryC2_uid70_sqrtTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "ROM",
        width_a => 40,
        widthad_a => 8,
        numwords_a => 256,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_sclr_a => "SCLEAR",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "float64_sqrt_altera_fp_functions_191_eshpdly_memoryC2_uid70_sqrtTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Stratix 10"
    )
    PORT MAP (
        clocken0 => '1',
        sclr => memoryC2_uid70_sqrtTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC2_uid70_sqrtTables_lutmem_aa,
        q_a => memoryC2_uid70_sqrtTables_lutmem_ir
    );
    memoryC2_uid70_sqrtTables_lutmem_r <= memoryC2_uid70_sqrtTables_lutmem_ir(39 downto 0);

    -- redist9_memoryC2_uid70_sqrtTables_lutmem_r_1(DELAY,291)
    redist9_memoryC2_uid70_sqrtTables_lutmem_r_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist9_memoryC2_uid70_sqrtTables_lutmem_r_1_q <= (others => '0');
            ELSE
                redist9_memoryC2_uid70_sqrtTables_lutmem_r_1_q <= STD_LOGIC_VECTOR(memoryC2_uid70_sqrtTables_lutmem_r);
            END IF;
        END IF;
    END PROCESS;

    -- s3sumAHighB_uid104_invPolyEval(ADD,103)@25
    s3sumAHighB_uid104_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 40 => redist9_memoryC2_uid70_sqrtTables_lutmem_r_1_q(39)) & redist9_memoryC2_uid70_sqrtTables_lutmem_r_1_q));
    s3sumAHighB_uid104_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 33 => highBBits_uid103_invPolyEval_b(32)) & highBBits_uid103_invPolyEval_b));
    s3sumAHighB_uid104_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(s3sumAHighB_uid104_invPolyEval_a) + SIGNED(s3sumAHighB_uid104_invPolyEval_b));
    s3sumAHighB_uid104_invPolyEval_q <= s3sumAHighB_uid104_invPolyEval_o(40 downto 0);

    -- lowRangeB_uid102_invPolyEval(BITSELECT,101)@25
    lowRangeB_uid102_invPolyEval_in <= redist22_os_uid158_pT3_uid101_invPolyEval_b_1_q(0 downto 0);
    lowRangeB_uid102_invPolyEval_b <= lowRangeB_uid102_invPolyEval_in(0 downto 0);

    -- s3_uid105_invPolyEval(BITJOIN,104)@25
    s3_uid105_invPolyEval_q <= s3sumAHighB_uid104_invPolyEval_q & lowRangeB_uid102_invPolyEval_b;

    -- aboveLeftY_bottomRange_uid178_pT4_uid107_invPolyEval(BITSELECT,177)@25
    aboveLeftY_bottomRange_uid178_pT4_uid107_invPolyEval_in <= STD_LOGIC_VECTOR(s3_uid105_invPolyEval_q(14 downto 0));
    aboveLeftY_bottomRange_uid178_pT4_uid107_invPolyEval_b <= STD_LOGIC_VECTOR(aboveLeftY_bottomRange_uid178_pT4_uid107_invPolyEval_in(14 downto 0));

    -- aboveLeftY_mergedSignalTM_uid179_pT4_uid107_invPolyEval(BITJOIN,178)@25
    aboveLeftY_mergedSignalTM_uid179_pT4_uid107_invPolyEval_q <= aboveLeftY_bottomRange_uid178_pT4_uid107_invPolyEval_b & aboveLeftY_bottomExtension_uid177_pT4_uid107_invPolyEval_q;

    -- rightBottomY_uid185_pT4_uid107_invPolyEval(BITSELECT,184)@25
    rightBottomY_uid185_pT4_uid107_invPolyEval_b <= STD_LOGIC_VECTOR(s3_uid105_invPolyEval_q(41 downto 24));

    -- rightBottomX_bottomRange_uid182_pT4_uid107_invPolyEval(BITSELECT,181)@25
    rightBottomX_bottomRange_uid182_pT4_uid107_invPolyEval_in <= STD_LOGIC_VECTOR(nx_mergedSignalTM_uid172_pT4_uid107_invPolyEval_q(13 downto 0));
    rightBottomX_bottomRange_uid182_pT4_uid107_invPolyEval_b <= STD_LOGIC_VECTOR(rightBottomX_bottomRange_uid182_pT4_uid107_invPolyEval_in(13 downto 0));

    -- rightBottomX_bottomExtension_uid181_pT4_uid107_invPolyEval(CONSTANT,180)
    rightBottomX_bottomExtension_uid181_pT4_uid107_invPolyEval_q <= "0000";

    -- rightBottomX_mergedSignalTM_uid183_pT4_uid107_invPolyEval(BITJOIN,182)@25
    rightBottomX_mergedSignalTM_uid183_pT4_uid107_invPolyEval_q <= rightBottomX_bottomRange_uid182_pT4_uid107_invPolyEval_b & rightBottomX_bottomExtension_uid181_pT4_uid107_invPolyEval_q;

    -- multSumOfTwoTS_uid187_pT4_uid107_invPolyEval_cma(CHAINMULTADD,277)@25 + 5
    -- out q@31
    multSumOfTwoTS_uid187_pT4_uid107_invPolyEval_cma_reset <= areset;
    multSumOfTwoTS_uid187_pT4_uid107_invPolyEval_cma_ena0 <= '1';
    multSumOfTwoTS_uid187_pT4_uid107_invPolyEval_cma_ena1 <= multSumOfTwoTS_uid187_pT4_uid107_invPolyEval_cma_ena0;
    multSumOfTwoTS_uid187_pT4_uid107_invPolyEval_cma_ena2 <= multSumOfTwoTS_uid187_pT4_uid107_invPolyEval_cma_ena0;
    multSumOfTwoTS_uid187_pT4_uid107_invPolyEval_cma_chainmultadd_hyper: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (false) THEN
            ELSE
                multSumOfTwoTS_uid187_pT4_uid107_invPolyEval_cma_ah(0) <= RESIZE(UNSIGNED(rightBottomX_mergedSignalTM_uid183_pT4_uid107_invPolyEval_q),18);
                multSumOfTwoTS_uid187_pT4_uid107_invPolyEval_cma_ah(1) <= RESIZE(UNSIGNED(aboveLeftY_mergedSignalTM_uid179_pT4_uid107_invPolyEval_q),18);
                multSumOfTwoTS_uid187_pT4_uid107_invPolyEval_cma_ch(0) <= RESIZE(SIGNED(rightBottomY_uid185_pT4_uid107_invPolyEval_b),18);
                multSumOfTwoTS_uid187_pT4_uid107_invPolyEval_cma_ch(1) <= RESIZE(SIGNED(aboveLeftX_uid176_pT4_uid107_invPolyEval_b),18);
            END IF;
        END IF;
    END PROCESS;

    multSumOfTwoTS_uid187_pT4_uid107_invPolyEval_cma_a0 <= STD_LOGIC_VECTOR(multSumOfTwoTS_uid187_pT4_uid107_invPolyEval_cma_ah(0));
    multSumOfTwoTS_uid187_pT4_uid107_invPolyEval_cma_c0 <= STD_LOGIC_VECTOR(multSumOfTwoTS_uid187_pT4_uid107_invPolyEval_cma_ch(0));
    multSumOfTwoTS_uid187_pT4_uid107_invPolyEval_cma_a1 <= STD_LOGIC_VECTOR(multSumOfTwoTS_uid187_pT4_uid107_invPolyEval_cma_ah(1));
    multSumOfTwoTS_uid187_pT4_uid107_invPolyEval_cma_c1 <= STD_LOGIC_VECTOR(multSumOfTwoTS_uid187_pT4_uid107_invPolyEval_cma_ch(1));
    multSumOfTwoTS_uid187_pT4_uid107_invPolyEval_cma_DSP0 : fourteennm_mac
    GENERIC MAP (
        operation_mode => "m18x18_sumof2",
        clear_type => "sclr",
        use_chainadder => "false",
        ay_scan_in_clock => "0",
        ay_scan_in_width => 18,
        by_clock => "0",
        by_width => 18,
        ax_clock => "0",
        bx_clock => "0",
        ax_width => 18,
        bx_width => 18,
        signed_may => "false",
        signed_mby => "false",
        signed_max => "true",
        signed_mbx => "true",
        input_pipeline_clock => "2",
        second_pipeline_clock => "2",
        output_clock => "1",
        result_a_width => 37
    )
    PORT MAP (
        clk(0) => clk,
        clk(1) => clk,
        clk(2) => clk,
        ena(0) => multSumOfTwoTS_uid187_pT4_uid107_invPolyEval_cma_ena0,
        ena(1) => multSumOfTwoTS_uid187_pT4_uid107_invPolyEval_cma_ena1,
        ena(2) => multSumOfTwoTS_uid187_pT4_uid107_invPolyEval_cma_ena2,
        clr(0) => multSumOfTwoTS_uid187_pT4_uid107_invPolyEval_cma_reset,
        clr(1) => multSumOfTwoTS_uid187_pT4_uid107_invPolyEval_cma_reset,
        ay => multSumOfTwoTS_uid187_pT4_uid107_invPolyEval_cma_a1,
        by => multSumOfTwoTS_uid187_pT4_uid107_invPolyEval_cma_a0,
        ax => multSumOfTwoTS_uid187_pT4_uid107_invPolyEval_cma_c1,
        bx => multSumOfTwoTS_uid187_pT4_uid107_invPolyEval_cma_c0,
        resulta => multSumOfTwoTS_uid187_pT4_uid107_invPolyEval_cma_s0
    );
    multSumOfTwoTS_uid187_pT4_uid107_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 37, depth => 1, reset_kind => "NONE", phase => 0, modulus => 1 )
    PORT MAP ( xin => multSumOfTwoTS_uid187_pT4_uid107_invPolyEval_cma_s0, xout => multSumOfTwoTS_uid187_pT4_uid107_invPolyEval_cma_qq, clk => clk, aclr => areset, ena => '1' );
    multSumOfTwoTS_uid187_pT4_uid107_invPolyEval_cma_q <= STD_LOGIC_VECTOR(multSumOfTwoTS_uid187_pT4_uid107_invPolyEval_cma_qq(36 downto 0));

    -- redist1_multSumOfTwoTS_uid187_pT4_uid107_invPolyEval_cma_q_1(DELAY,283)
    redist1_multSumOfTwoTS_uid187_pT4_uid107_invPolyEval_cma_q_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist1_multSumOfTwoTS_uid187_pT4_uid107_invPolyEval_cma_q_1_q <= (others => '0');
            ELSE
                redist1_multSumOfTwoTS_uid187_pT4_uid107_invPolyEval_cma_q_1_q <= STD_LOGIC_VECTOR(multSumOfTwoTS_uid187_pT4_uid107_invPolyEval_cma_q);
            END IF;
        END IF;
    END PROCESS;

    -- highBBits_uid190_pT4_uid107_invPolyEval(BITSELECT,189)@32
    highBBits_uid190_pT4_uid107_invPolyEval_b <= STD_LOGIC_VECTOR(redist1_multSumOfTwoTS_uid187_pT4_uid107_invPolyEval_cma_q_1_q(36 downto 9));

    -- topRangeY_uid175_pT4_uid107_invPolyEval(BITSELECT,174)@25
    topRangeY_uid175_pT4_uid107_invPolyEval_b <= STD_LOGIC_VECTOR(s3_uid105_invPolyEval_q(41 downto 15));

    -- topRangeX_uid174_pT4_uid107_invPolyEval(BITSELECT,173)@25
    topRangeX_uid174_pT4_uid107_invPolyEval_b <= STD_LOGIC_VECTOR(nx_mergedSignalTM_uid172_pT4_uid107_invPolyEval_q(40 downto 14));

    -- sm0_uid186_pT4_uid107_invPolyEval_cma(CHAINMULTADD,274)@25 + 5
    -- out q@31
    sm0_uid186_pT4_uid107_invPolyEval_cma_reset <= areset;
    sm0_uid186_pT4_uid107_invPolyEval_cma_ena0 <= '1';
    sm0_uid186_pT4_uid107_invPolyEval_cma_ena1 <= sm0_uid186_pT4_uid107_invPolyEval_cma_ena0;
    sm0_uid186_pT4_uid107_invPolyEval_cma_ena2 <= sm0_uid186_pT4_uid107_invPolyEval_cma_ena0;
    sm0_uid186_pT4_uid107_invPolyEval_cma_chainmultadd_hyper: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (false) THEN
            ELSE
                sm0_uid186_pT4_uid107_invPolyEval_cma_ah(0) <= RESIZE(SIGNED(topRangeX_uid174_pT4_uid107_invPolyEval_b),27);
                sm0_uid186_pT4_uid107_invPolyEval_cma_ch(0) <= RESIZE(SIGNED(topRangeY_uid175_pT4_uid107_invPolyEval_b),27);
            END IF;
        END IF;
    END PROCESS;

    sm0_uid186_pT4_uid107_invPolyEval_cma_a0 <= STD_LOGIC_VECTOR(sm0_uid186_pT4_uid107_invPolyEval_cma_ah(0));
    sm0_uid186_pT4_uid107_invPolyEval_cma_c0 <= STD_LOGIC_VECTOR(sm0_uid186_pT4_uid107_invPolyEval_cma_ch(0));
    sm0_uid186_pT4_uid107_invPolyEval_cma_DSP0 : fourteennm_mac
    GENERIC MAP (
        operation_mode => "m27x27",
        clear_type => "sclr",
        use_chainadder => "false",
        ay_scan_in_clock => "0",
        ay_scan_in_width => 27,
        ax_clock => "0",
        ax_width => 27,
        signed_may => "true",
        signed_max => "true",
        input_pipeline_clock => "2",
        second_pipeline_clock => "2",
        output_clock => "1",
        result_a_width => 54
    )
    PORT MAP (
        clk(0) => clk,
        clk(1) => clk,
        clk(2) => clk,
        ena(0) => sm0_uid186_pT4_uid107_invPolyEval_cma_ena0,
        ena(1) => sm0_uid186_pT4_uid107_invPolyEval_cma_ena1,
        ena(2) => sm0_uid186_pT4_uid107_invPolyEval_cma_ena2,
        clr(0) => sm0_uid186_pT4_uid107_invPolyEval_cma_reset,
        clr(1) => sm0_uid186_pT4_uid107_invPolyEval_cma_reset,
        ay => sm0_uid186_pT4_uid107_invPolyEval_cma_a0,
        ax => sm0_uid186_pT4_uid107_invPolyEval_cma_c0,
        resulta => sm0_uid186_pT4_uid107_invPolyEval_cma_s0
    );
    sm0_uid186_pT4_uid107_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 54, depth => 1, reset_kind => "NONE", phase => 0, modulus => 1 )
    PORT MAP ( xin => sm0_uid186_pT4_uid107_invPolyEval_cma_s0, xout => sm0_uid186_pT4_uid107_invPolyEval_cma_qq, clk => clk, aclr => areset, ena => '1' );
    sm0_uid186_pT4_uid107_invPolyEval_cma_q <= STD_LOGIC_VECTOR(sm0_uid186_pT4_uid107_invPolyEval_cma_qq(53 downto 0));

    -- redist4_sm0_uid186_pT4_uid107_invPolyEval_cma_q_1(DELAY,286)
    redist4_sm0_uid186_pT4_uid107_invPolyEval_cma_q_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist4_sm0_uid186_pT4_uid107_invPolyEval_cma_q_1_q <= (others => '0');
            ELSE
                redist4_sm0_uid186_pT4_uid107_invPolyEval_cma_q_1_q <= STD_LOGIC_VECTOR(sm0_uid186_pT4_uid107_invPolyEval_cma_q);
            END IF;
        END IF;
    END PROCESS;

    -- lev1_a0sumAHighB_uid191_pT4_uid107_invPolyEval(ADD,190)@32
    lev1_a0sumAHighB_uid191_pT4_uid107_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((54 downto 54 => redist4_sm0_uid186_pT4_uid107_invPolyEval_cma_q_1_q(53)) & redist4_sm0_uid186_pT4_uid107_invPolyEval_cma_q_1_q));
    lev1_a0sumAHighB_uid191_pT4_uid107_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((54 downto 28 => highBBits_uid190_pT4_uid107_invPolyEval_b(27)) & highBBits_uid190_pT4_uid107_invPolyEval_b));
    lev1_a0sumAHighB_uid191_pT4_uid107_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(lev1_a0sumAHighB_uid191_pT4_uid107_invPolyEval_a) + SIGNED(lev1_a0sumAHighB_uid191_pT4_uid107_invPolyEval_b));
    lev1_a0sumAHighB_uid191_pT4_uid107_invPolyEval_q <= lev1_a0sumAHighB_uid191_pT4_uid107_invPolyEval_o(54 downto 0);

    -- lowRangeB_uid189_pT4_uid107_invPolyEval(BITSELECT,188)@32
    lowRangeB_uid189_pT4_uid107_invPolyEval_in <= redist1_multSumOfTwoTS_uid187_pT4_uid107_invPolyEval_cma_q_1_q(8 downto 0);
    lowRangeB_uid189_pT4_uid107_invPolyEval_b <= lowRangeB_uid189_pT4_uid107_invPolyEval_in(8 downto 0);

    -- lev1_a0_uid192_pT4_uid107_invPolyEval(BITJOIN,191)@32
    lev1_a0_uid192_pT4_uid107_invPolyEval_q <= lev1_a0sumAHighB_uid191_pT4_uid107_invPolyEval_q & lowRangeB_uid189_pT4_uid107_invPolyEval_b;

    -- os_uid193_pT4_uid107_invPolyEval(BITSELECT,192)@32
    os_uid193_pT4_uid107_invPolyEval_in <= STD_LOGIC_VECTOR(lev1_a0_uid192_pT4_uid107_invPolyEval_q(61 downto 0));
    os_uid193_pT4_uid107_invPolyEval_b <= STD_LOGIC_VECTOR(os_uid193_pT4_uid107_invPolyEval_in(61 downto 20));

    -- highBBits_uid109_invPolyEval(BITSELECT,108)@32
    highBBits_uid109_invPolyEval_b <= STD_LOGIC_VECTOR(os_uid193_pT4_uid107_invPolyEval_b(41 downto 1));

    -- redist23_highBBits_uid109_invPolyEval_b_1(DELAY,305)
    redist23_highBBits_uid109_invPolyEval_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist23_highBBits_uid109_invPolyEval_b_1_q <= (others => '0');
            ELSE
                redist23_highBBits_uid109_invPolyEval_b_1_q <= STD_LOGIC_VECTOR(highBBits_uid109_invPolyEval_b);
            END IF;
        END IF;
    END PROCESS;

    -- redist40_yAddr_uid35_fpSqrtTest_b_30_inputreg1(DELAY,384)
    redist40_yAddr_uid35_fpSqrtTest_b_30_inputreg1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist40_yAddr_uid35_fpSqrtTest_b_30_inputreg1_q <= (others => '0');
            ELSE
                redist40_yAddr_uid35_fpSqrtTest_b_30_inputreg1_q <= STD_LOGIC_VECTOR(redist39_yAddr_uid35_fpSqrtTest_b_22_outputreg1_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist40_yAddr_uid35_fpSqrtTest_b_30_inputreg0(DELAY,386)
    redist40_yAddr_uid35_fpSqrtTest_b_30_inputreg0_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist40_yAddr_uid35_fpSqrtTest_b_30_inputreg0_q <= (others => '0');
            ELSE
                redist40_yAddr_uid35_fpSqrtTest_b_30_inputreg0_q <= STD_LOGIC_VECTOR(redist40_yAddr_uid35_fpSqrtTest_b_30_inputreg1_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist40_yAddr_uid35_fpSqrtTest_b_30(DELAY,322)
    redist40_yAddr_uid35_fpSqrtTest_b_30_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist40_yAddr_uid35_fpSqrtTest_b_30_delay_0 <= (others => '0');
                redist40_yAddr_uid35_fpSqrtTest_b_30_delay_1 <= (others => '0');
                redist40_yAddr_uid35_fpSqrtTest_b_30_delay_2 <= (others => '0');
                redist40_yAddr_uid35_fpSqrtTest_b_30_delay_3 <= (others => '0');
                redist40_yAddr_uid35_fpSqrtTest_b_30_q <= (others => '0');
            ELSE
                redist40_yAddr_uid35_fpSqrtTest_b_30_delay_0 <= STD_LOGIC_VECTOR(redist40_yAddr_uid35_fpSqrtTest_b_30_inputreg0_q);
                redist40_yAddr_uid35_fpSqrtTest_b_30_delay_1 <= redist40_yAddr_uid35_fpSqrtTest_b_30_delay_0;
                redist40_yAddr_uid35_fpSqrtTest_b_30_delay_2 <= redist40_yAddr_uid35_fpSqrtTest_b_30_delay_1;
                redist40_yAddr_uid35_fpSqrtTest_b_30_delay_3 <= redist40_yAddr_uid35_fpSqrtTest_b_30_delay_2;
                redist40_yAddr_uid35_fpSqrtTest_b_30_q <= redist40_yAddr_uid35_fpSqrtTest_b_30_delay_3;
            END IF;
        END IF;
    END PROCESS;

    -- redist40_yAddr_uid35_fpSqrtTest_b_30_outputreg1(DELAY,385)
    redist40_yAddr_uid35_fpSqrtTest_b_30_outputreg1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist40_yAddr_uid35_fpSqrtTest_b_30_outputreg1_q <= (others => '0');
            ELSE
                redist40_yAddr_uid35_fpSqrtTest_b_30_outputreg1_q <= STD_LOGIC_VECTOR(redist40_yAddr_uid35_fpSqrtTest_b_30_q);
            END IF;
        END IF;
    END PROCESS;

    -- memoryC1_uid67_sqrtTables_lutmem(DUALMEM,266)@30 + 2
    -- in j@20000000
    memoryC1_uid67_sqrtTables_lutmem_aa <= redist40_yAddr_uid35_fpSqrtTest_b_30_outputreg1_q;
    memoryC1_uid67_sqrtTables_lutmem_reset0 <= areset;
    memoryC1_uid67_sqrtTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "ROM",
        width_a => 9,
        widthad_a => 8,
        numwords_a => 256,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_sclr_a => "SCLEAR",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "float64_sqrt_altera_fp_functions_191_eshpdly_memoryC1_uid67_sqrtTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Stratix 10"
    )
    PORT MAP (
        clocken0 => '1',
        sclr => memoryC1_uid67_sqrtTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC1_uid67_sqrtTables_lutmem_aa,
        q_a => memoryC1_uid67_sqrtTables_lutmem_ir
    );
    memoryC1_uid67_sqrtTables_lutmem_r <= memoryC1_uid67_sqrtTables_lutmem_ir(8 downto 0);

    -- redist10_memoryC1_uid67_sqrtTables_lutmem_r_1(DELAY,292)
    redist10_memoryC1_uid67_sqrtTables_lutmem_r_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist10_memoryC1_uid67_sqrtTables_lutmem_r_1_q <= (others => '0');
            ELSE
                redist10_memoryC1_uid67_sqrtTables_lutmem_r_1_q <= STD_LOGIC_VECTOR(memoryC1_uid67_sqrtTables_lutmem_r);
            END IF;
        END IF;
    END PROCESS;

    -- memoryC1_uid66_sqrtTables_lutmem(DUALMEM,265)@30 + 2
    -- in j@20000000
    memoryC1_uid66_sqrtTables_lutmem_aa <= redist40_yAddr_uid35_fpSqrtTest_b_30_outputreg1_q;
    memoryC1_uid66_sqrtTables_lutmem_reset0 <= areset;
    memoryC1_uid66_sqrtTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "ROM",
        width_a => 40,
        widthad_a => 8,
        numwords_a => 256,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_sclr_a => "SCLEAR",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "float64_sqrt_altera_fp_functions_191_eshpdly_memoryC1_uid66_sqrtTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Stratix 10"
    )
    PORT MAP (
        clocken0 => '1',
        sclr => memoryC1_uid66_sqrtTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC1_uid66_sqrtTables_lutmem_aa,
        q_a => memoryC1_uid66_sqrtTables_lutmem_ir
    );
    memoryC1_uid66_sqrtTables_lutmem_r <= memoryC1_uid66_sqrtTables_lutmem_ir(39 downto 0);

    -- redist11_memoryC1_uid66_sqrtTables_lutmem_r_1(DELAY,293)
    redist11_memoryC1_uid66_sqrtTables_lutmem_r_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist11_memoryC1_uid66_sqrtTables_lutmem_r_1_q <= (others => '0');
            ELSE
                redist11_memoryC1_uid66_sqrtTables_lutmem_r_1_q <= STD_LOGIC_VECTOR(memoryC1_uid66_sqrtTables_lutmem_r);
            END IF;
        END IF;
    END PROCESS;

    -- os_uid68_sqrtTables(BITJOIN,67)@33
    os_uid68_sqrtTables_q <= redist10_memoryC1_uid67_sqrtTables_lutmem_r_1_q & redist11_memoryC1_uid66_sqrtTables_lutmem_r_1_q;

    -- s4sumAHighB_uid110_invPolyEval(ADD,109)@33
    s4sumAHighB_uid110_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((49 downto 49 => os_uid68_sqrtTables_q(48)) & os_uid68_sqrtTables_q));
    s4sumAHighB_uid110_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((49 downto 41 => redist23_highBBits_uid109_invPolyEval_b_1_q(40)) & redist23_highBBits_uid109_invPolyEval_b_1_q));
    s4sumAHighB_uid110_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(s4sumAHighB_uid110_invPolyEval_a) + SIGNED(s4sumAHighB_uid110_invPolyEval_b));
    s4sumAHighB_uid110_invPolyEval_q <= s4sumAHighB_uid110_invPolyEval_o(49 downto 0);

    -- lowRangeB_uid108_invPolyEval(BITSELECT,107)@32
    lowRangeB_uid108_invPolyEval_in <= os_uid193_pT4_uid107_invPolyEval_b(0 downto 0);
    lowRangeB_uid108_invPolyEval_b <= lowRangeB_uid108_invPolyEval_in(0 downto 0);

    -- redist24_lowRangeB_uid108_invPolyEval_b_1(DELAY,306)
    redist24_lowRangeB_uid108_invPolyEval_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist24_lowRangeB_uid108_invPolyEval_b_1_q <= (others => '0');
            ELSE
                redist24_lowRangeB_uid108_invPolyEval_b_1_q <= STD_LOGIC_VECTOR(lowRangeB_uid108_invPolyEval_b);
            END IF;
        END IF;
    END PROCESS;

    -- s4_uid111_invPolyEval(BITJOIN,110)@33
    s4_uid111_invPolyEval_q <= s4sumAHighB_uid110_invPolyEval_q & redist24_lowRangeB_uid108_invPolyEval_b_1_q;

    -- aboveLeftY_bottomRange_uid213_pT5_uid113_invPolyEval(BITSELECT,212)@33
    aboveLeftY_bottomRange_uid213_pT5_uid113_invPolyEval_in <= STD_LOGIC_VECTOR(s4_uid111_invPolyEval_q(23 downto 0));
    aboveLeftY_bottomRange_uid213_pT5_uid113_invPolyEval_b <= STD_LOGIC_VECTOR(aboveLeftY_bottomRange_uid213_pT5_uid113_invPolyEval_in(23 downto 0));

    -- aboveLeftY_bottomExtension_uid177_pT4_uid107_invPolyEval(CONSTANT,176)
    aboveLeftY_bottomExtension_uid177_pT4_uid107_invPolyEval_q <= "000";

    -- aboveLeftY_mergedSignalTM_uid214_pT5_uid113_invPolyEval(BITJOIN,213)@33
    aboveLeftY_mergedSignalTM_uid214_pT5_uid113_invPolyEval_q <= aboveLeftY_bottomRange_uid213_pT5_uid113_invPolyEval_b & aboveLeftY_bottomExtension_uid177_pT4_uid107_invPolyEval_q;

    -- topRangeY_uid210_pT5_uid113_invPolyEval(BITSELECT,209)@33
    topRangeY_uid210_pT5_uid113_invPolyEval_b <= STD_LOGIC_VECTOR(s4_uid111_invPolyEval_q(50 downto 24));

    -- redist20_topRangeY_uid210_pT5_uid113_invPolyEval_b_1(DELAY,302)
    redist20_topRangeY_uid210_pT5_uid113_invPolyEval_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist20_topRangeY_uid210_pT5_uid113_invPolyEval_b_1_q <= (others => '0');
            ELSE
                redist20_topRangeY_uid210_pT5_uid113_invPolyEval_b_1_q <= STD_LOGIC_VECTOR(topRangeY_uid210_pT5_uid113_invPolyEval_b);
            END IF;
        END IF;
    END PROCESS;

    -- rightBottomX_bottomRange_uid217_pT5_uid113_invPolyEval(BITSELECT,216)@33
    rightBottomX_bottomRange_uid217_pT5_uid113_invPolyEval_in <= STD_LOGIC_VECTOR(nx_mergedSignalTM_uid207_pT5_uid113_invPolyEval_q(18 downto 0));
    rightBottomX_bottomRange_uid217_pT5_uid113_invPolyEval_b <= STD_LOGIC_VECTOR(rightBottomX_bottomRange_uid217_pT5_uid113_invPolyEval_in(18 downto 0));

    -- redist19_rightBottomX_bottomRange_uid217_pT5_uid113_invPolyEval_b_1(DELAY,301)
    redist19_rightBottomX_bottomRange_uid217_pT5_uid113_invPolyEval_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist19_rightBottomX_bottomRange_uid217_pT5_uid113_invPolyEval_b_1_q <= (others => '0');
            ELSE
                redist19_rightBottomX_bottomRange_uid217_pT5_uid113_invPolyEval_b_1_q <= STD_LOGIC_VECTOR(rightBottomX_bottomRange_uid217_pT5_uid113_invPolyEval_b);
            END IF;
        END IF;
    END PROCESS;

    -- rightBottomX_bottomExtension_uid216_pT5_uid113_invPolyEval(CONSTANT,215)
    rightBottomX_bottomExtension_uid216_pT5_uid113_invPolyEval_q <= "00000000";

    -- rightBottomX_mergedSignalTM_uid218_pT5_uid113_invPolyEval(BITJOIN,217)@34
    rightBottomX_mergedSignalTM_uid218_pT5_uid113_invPolyEval_q <= redist19_rightBottomX_bottomRange_uid217_pT5_uid113_invPolyEval_b_1_q & rightBottomX_bottomExtension_uid216_pT5_uid113_invPolyEval_q;

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- multSumOfTwoTS_uid224_pT5_uid113_invPolyEval_cma(CHAINMULTADD,278)@33 + 5
    -- in e@34
    -- in g@34
    -- out q@40
    multSumOfTwoTS_uid224_pT5_uid113_invPolyEval_cma_reset <= areset;
    multSumOfTwoTS_uid224_pT5_uid113_invPolyEval_cma_ena0 <= '1';
    multSumOfTwoTS_uid224_pT5_uid113_invPolyEval_cma_ena1 <= multSumOfTwoTS_uid224_pT5_uid113_invPolyEval_cma_ena0;
    multSumOfTwoTS_uid224_pT5_uid113_invPolyEval_cma_ena2 <= multSumOfTwoTS_uid224_pT5_uid113_invPolyEval_cma_ena0;
    multSumOfTwoTS_uid224_pT5_uid113_invPolyEval_cma_chainmultadd_hyper: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (false) THEN
            ELSE
                multSumOfTwoTS_uid224_pT5_uid113_invPolyEval_cma_ah(0) <= RESIZE(UNSIGNED(rightBottomX_mergedSignalTM_uid218_pT5_uid113_invPolyEval_q),27);
                multSumOfTwoTS_uid224_pT5_uid113_invPolyEval_cma_ah(1) <= RESIZE(UNSIGNED(aboveLeftY_mergedSignalTM_uid214_pT5_uid113_invPolyEval_q),27);
                multSumOfTwoTS_uid224_pT5_uid113_invPolyEval_cma_ch(0) <= RESIZE(SIGNED(redist20_topRangeY_uid210_pT5_uid113_invPolyEval_b_1_q),27);
                multSumOfTwoTS_uid224_pT5_uid113_invPolyEval_cma_ch(1) <= RESIZE(SIGNED(topRangeX_uid209_pT5_uid113_invPolyEval_b),27);
            END IF;
        END IF;
    END PROCESS;

    multSumOfTwoTS_uid224_pT5_uid113_invPolyEval_cma_a0 <= STD_LOGIC_VECTOR(multSumOfTwoTS_uid224_pT5_uid113_invPolyEval_cma_ah(0));
    multSumOfTwoTS_uid224_pT5_uid113_invPolyEval_cma_c0 <= STD_LOGIC_VECTOR(multSumOfTwoTS_uid224_pT5_uid113_invPolyEval_cma_ch(0));
    multSumOfTwoTS_uid224_pT5_uid113_invPolyEval_cma_a1 <= STD_LOGIC_VECTOR(multSumOfTwoTS_uid224_pT5_uid113_invPolyEval_cma_ah(1));
    multSumOfTwoTS_uid224_pT5_uid113_invPolyEval_cma_c1 <= STD_LOGIC_VECTOR(multSumOfTwoTS_uid224_pT5_uid113_invPolyEval_cma_ch(1));
    multSumOfTwoTS_uid224_pT5_uid113_invPolyEval_cma_DSP1 : fourteennm_mac
    GENERIC MAP (
        operation_mode => "m27x27",
        clear_type => "sclr",
        use_chainadder => "false",
        ay_scan_in_clock => "0",
        ay_scan_in_width => 27,
        ax_clock => "0",
        ax_width => 27,
        signed_may => "false",
        signed_max => "true",
        input_pipeline_clock => "2",
        second_pipeline_clock => "2",
        output_clock => "1"
    )
    PORT MAP (
        clk(0) => clk,
        clk(1) => clk,
        clk(2) => clk,
        ena(0) => multSumOfTwoTS_uid224_pT5_uid113_invPolyEval_cma_ena0,
        ena(1) => multSumOfTwoTS_uid224_pT5_uid113_invPolyEval_cma_ena1,
        ena(2) => multSumOfTwoTS_uid224_pT5_uid113_invPolyEval_cma_ena2,
        clr(0) => multSumOfTwoTS_uid224_pT5_uid113_invPolyEval_cma_reset,
        clr(1) => multSumOfTwoTS_uid224_pT5_uid113_invPolyEval_cma_reset,
        ay => multSumOfTwoTS_uid224_pT5_uid113_invPolyEval_cma_a1,
        ax => multSumOfTwoTS_uid224_pT5_uid113_invPolyEval_cma_c1,
        chainout => multSumOfTwoTS_uid224_pT5_uid113_invPolyEval_cma_s1
    );
    multSumOfTwoTS_uid224_pT5_uid113_invPolyEval_cma_DSP0 : fourteennm_mac
    GENERIC MAP (
        operation_mode => "m27x27",
        clear_type => "sclr",
        use_chainadder => "true",
        ay_scan_in_clock => "0",
        ay_scan_in_width => 27,
        ax_clock => "0",
        ax_width => 27,
        signed_may => "false",
        signed_max => "true",
        input_pipeline_clock => "2",
        second_pipeline_clock => "2",
        output_clock => "1",
        result_a_width => 55
    )
    PORT MAP (
        clk(0) => clk,
        clk(1) => clk,
        clk(2) => clk,
        ena(0) => multSumOfTwoTS_uid224_pT5_uid113_invPolyEval_cma_ena0,
        ena(1) => multSumOfTwoTS_uid224_pT5_uid113_invPolyEval_cma_ena1,
        ena(2) => multSumOfTwoTS_uid224_pT5_uid113_invPolyEval_cma_ena2,
        clr(0) => multSumOfTwoTS_uid224_pT5_uid113_invPolyEval_cma_reset,
        clr(1) => multSumOfTwoTS_uid224_pT5_uid113_invPolyEval_cma_reset,
        ay => multSumOfTwoTS_uid224_pT5_uid113_invPolyEval_cma_a0,
        ax => multSumOfTwoTS_uid224_pT5_uid113_invPolyEval_cma_c0,
        chainin => multSumOfTwoTS_uid224_pT5_uid113_invPolyEval_cma_s1,
        resulta => multSumOfTwoTS_uid224_pT5_uid113_invPolyEval_cma_s0
    );
    multSumOfTwoTS_uid224_pT5_uid113_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 55, depth => 1, reset_kind => "NONE", phase => 0, modulus => 1 )
    PORT MAP ( xin => multSumOfTwoTS_uid224_pT5_uid113_invPolyEval_cma_s0, xout => multSumOfTwoTS_uid224_pT5_uid113_invPolyEval_cma_qq, clk => clk, aclr => areset, ena => '1' );
    multSumOfTwoTS_uid224_pT5_uid113_invPolyEval_cma_q <= STD_LOGIC_VECTOR(multSumOfTwoTS_uid224_pT5_uid113_invPolyEval_cma_qq(54 downto 0));

    -- redist0_multSumOfTwoTS_uid224_pT5_uid113_invPolyEval_cma_q_1(DELAY,282)
    redist0_multSumOfTwoTS_uid224_pT5_uid113_invPolyEval_cma_q_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist0_multSumOfTwoTS_uid224_pT5_uid113_invPolyEval_cma_q_1_q <= (others => '0');
            ELSE
                redist0_multSumOfTwoTS_uid224_pT5_uid113_invPolyEval_cma_q_1_q <= STD_LOGIC_VECTOR(multSumOfTwoTS_uid224_pT5_uid113_invPolyEval_cma_q);
            END IF;
        END IF;
    END PROCESS;

    -- highBBits_uid229_pT5_uid113_invPolyEval(BITSELECT,228)@41
    highBBits_uid229_pT5_uid113_invPolyEval_b <= STD_LOGIC_VECTOR(redist0_multSumOfTwoTS_uid224_pT5_uid113_invPolyEval_cma_q_1_q(54 downto 23));

    -- redist21_topRangeX_uid209_pT5_uid113_invPolyEval_b_1(DELAY,303)
    redist21_topRangeX_uid209_pT5_uid113_invPolyEval_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist21_topRangeX_uid209_pT5_uid113_invPolyEval_b_1_q <= (others => '0');
            ELSE
                redist21_topRangeX_uid209_pT5_uid113_invPolyEval_b_1_q <= STD_LOGIC_VECTOR(topRangeX_uid209_pT5_uid113_invPolyEval_b);
            END IF;
        END IF;
    END PROCESS;

    -- sm0_uid223_pT5_uid113_invPolyEval_cma(CHAINMULTADD,275)@34 + 5
    -- out q@40
    sm0_uid223_pT5_uid113_invPolyEval_cma_reset <= areset;
    sm0_uid223_pT5_uid113_invPolyEval_cma_ena0 <= '1';
    sm0_uid223_pT5_uid113_invPolyEval_cma_ena1 <= sm0_uid223_pT5_uid113_invPolyEval_cma_ena0;
    sm0_uid223_pT5_uid113_invPolyEval_cma_ena2 <= sm0_uid223_pT5_uid113_invPolyEval_cma_ena0;
    sm0_uid223_pT5_uid113_invPolyEval_cma_chainmultadd_hyper: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (false) THEN
            ELSE
                sm0_uid223_pT5_uid113_invPolyEval_cma_ah(0) <= RESIZE(SIGNED(redist21_topRangeX_uid209_pT5_uid113_invPolyEval_b_1_q),27);
                sm0_uid223_pT5_uid113_invPolyEval_cma_ch(0) <= RESIZE(SIGNED(redist20_topRangeY_uid210_pT5_uid113_invPolyEval_b_1_q),27);
            END IF;
        END IF;
    END PROCESS;

    sm0_uid223_pT5_uid113_invPolyEval_cma_a0 <= STD_LOGIC_VECTOR(sm0_uid223_pT5_uid113_invPolyEval_cma_ah(0));
    sm0_uid223_pT5_uid113_invPolyEval_cma_c0 <= STD_LOGIC_VECTOR(sm0_uid223_pT5_uid113_invPolyEval_cma_ch(0));
    sm0_uid223_pT5_uid113_invPolyEval_cma_DSP0 : fourteennm_mac
    GENERIC MAP (
        operation_mode => "m27x27",
        clear_type => "sclr",
        use_chainadder => "false",
        ay_scan_in_clock => "0",
        ay_scan_in_width => 27,
        ax_clock => "0",
        ax_width => 27,
        signed_may => "true",
        signed_max => "true",
        input_pipeline_clock => "2",
        second_pipeline_clock => "2",
        output_clock => "1",
        result_a_width => 54
    )
    PORT MAP (
        clk(0) => clk,
        clk(1) => clk,
        clk(2) => clk,
        ena(0) => sm0_uid223_pT5_uid113_invPolyEval_cma_ena0,
        ena(1) => sm0_uid223_pT5_uid113_invPolyEval_cma_ena1,
        ena(2) => sm0_uid223_pT5_uid113_invPolyEval_cma_ena2,
        clr(0) => sm0_uid223_pT5_uid113_invPolyEval_cma_reset,
        clr(1) => sm0_uid223_pT5_uid113_invPolyEval_cma_reset,
        ay => sm0_uid223_pT5_uid113_invPolyEval_cma_a0,
        ax => sm0_uid223_pT5_uid113_invPolyEval_cma_c0,
        resulta => sm0_uid223_pT5_uid113_invPolyEval_cma_s0
    );
    sm0_uid223_pT5_uid113_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 54, depth => 1, reset_kind => "NONE", phase => 0, modulus => 1 )
    PORT MAP ( xin => sm0_uid223_pT5_uid113_invPolyEval_cma_s0, xout => sm0_uid223_pT5_uid113_invPolyEval_cma_qq, clk => clk, aclr => areset, ena => '1' );
    sm0_uid223_pT5_uid113_invPolyEval_cma_q <= STD_LOGIC_VECTOR(sm0_uid223_pT5_uid113_invPolyEval_cma_qq(53 downto 0));

    -- redist3_sm0_uid223_pT5_uid113_invPolyEval_cma_q_1(DELAY,285)
    redist3_sm0_uid223_pT5_uid113_invPolyEval_cma_q_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist3_sm0_uid223_pT5_uid113_invPolyEval_cma_q_1_q <= (others => '0');
            ELSE
                redist3_sm0_uid223_pT5_uid113_invPolyEval_cma_q_1_q <= STD_LOGIC_VECTOR(sm0_uid223_pT5_uid113_invPolyEval_cma_q);
            END IF;
        END IF;
    END PROCESS;

    -- aboveLeftY_uid222_pT5_uid113_invPolyEval(BITSELECT,221)@33
    aboveLeftY_uid222_pT5_uid113_invPolyEval_in <= s4_uid111_invPolyEval_q(23 downto 0);
    aboveLeftY_uid222_pT5_uid113_invPolyEval_b <= aboveLeftY_uid222_pT5_uid113_invPolyEval_in(23 downto 22);

    -- redist17_aboveLeftY_uid222_pT5_uid113_invPolyEval_b_2(DELAY,299)
    redist17_aboveLeftY_uid222_pT5_uid113_invPolyEval_b_2_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist17_aboveLeftY_uid222_pT5_uid113_invPolyEval_b_2_delay_0 <= (others => '0');
                redist17_aboveLeftY_uid222_pT5_uid113_invPolyEval_b_2_q <= (others => '0');
            ELSE
                redist17_aboveLeftY_uid222_pT5_uid113_invPolyEval_b_2_delay_0 <= STD_LOGIC_VECTOR(aboveLeftY_uid222_pT5_uid113_invPolyEval_b);
                redist17_aboveLeftY_uid222_pT5_uid113_invPolyEval_b_2_q <= redist17_aboveLeftY_uid222_pT5_uid113_invPolyEval_b_2_delay_0;
            END IF;
        END IF;
    END PROCESS;

    -- aboveLeftX_uid221_pT5_uid113_invPolyEval(BITSELECT,220)@33
    aboveLeftX_uid221_pT5_uid113_invPolyEval_in <= nx_mergedSignalTM_uid207_pT5_uid113_invPolyEval_q(18 downto 0);
    aboveLeftX_uid221_pT5_uid113_invPolyEval_b <= aboveLeftX_uid221_pT5_uid113_invPolyEval_in(18 downto 17);

    -- redist18_aboveLeftX_uid221_pT5_uid113_invPolyEval_b_2(DELAY,300)
    redist18_aboveLeftX_uid221_pT5_uid113_invPolyEval_b_2_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist18_aboveLeftX_uid221_pT5_uid113_invPolyEval_b_2_delay_0 <= (others => '0');
                redist18_aboveLeftX_uid221_pT5_uid113_invPolyEval_b_2_q <= (others => '0');
            ELSE
                redist18_aboveLeftX_uid221_pT5_uid113_invPolyEval_b_2_delay_0 <= STD_LOGIC_VECTOR(aboveLeftX_uid221_pT5_uid113_invPolyEval_b);
                redist18_aboveLeftX_uid221_pT5_uid113_invPolyEval_b_2_q <= redist18_aboveLeftX_uid221_pT5_uid113_invPolyEval_b_2_delay_0;
            END IF;
        END IF;
    END PROCESS;

    -- sm0_uid226_pT5_uid113_invPolyEval(MULT,225)@35 + 5
    sm0_uid226_pT5_uid113_invPolyEval_pr <= UNSIGNED(sm0_uid226_pT5_uid113_invPolyEval_a2) * UNSIGNED(sm0_uid226_pT5_uid113_invPolyEval_b2);
    sm0_uid226_pT5_uid113_invPolyEval_component: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                sm0_uid226_pT5_uid113_invPolyEval_a0 <= (others => '0');
                sm0_uid226_pT5_uid113_invPolyEval_b0 <= (others => '0');
                sm0_uid226_pT5_uid113_invPolyEval_a1 <= (others => '0');
                sm0_uid226_pT5_uid113_invPolyEval_b1 <= (others => '0');
                sm0_uid226_pT5_uid113_invPolyEval_a2 <= (others => '0');
                sm0_uid226_pT5_uid113_invPolyEval_b2 <= (others => '0');
                sm0_uid226_pT5_uid113_invPolyEval_s1 <= (others => '0');
            ELSE
                sm0_uid226_pT5_uid113_invPolyEval_a0 <= redist18_aboveLeftX_uid221_pT5_uid113_invPolyEval_b_2_q;
                sm0_uid226_pT5_uid113_invPolyEval_b0 <= redist17_aboveLeftY_uid222_pT5_uid113_invPolyEval_b_2_q;
                sm0_uid226_pT5_uid113_invPolyEval_a1 <= sm0_uid226_pT5_uid113_invPolyEval_a0;
                sm0_uid226_pT5_uid113_invPolyEval_b1 <= sm0_uid226_pT5_uid113_invPolyEval_b0;
                sm0_uid226_pT5_uid113_invPolyEval_a2 <= sm0_uid226_pT5_uid113_invPolyEval_a1;
                sm0_uid226_pT5_uid113_invPolyEval_b2 <= sm0_uid226_pT5_uid113_invPolyEval_b1;
                sm0_uid226_pT5_uid113_invPolyEval_s1 <= STD_LOGIC_VECTOR(sm0_uid226_pT5_uid113_invPolyEval_pr);
            END IF;
        END IF;
    END PROCESS;
    sm0_uid226_pT5_uid113_invPolyEval: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                sm0_uid226_pT5_uid113_invPolyEval_q <= (others => '0');
            ELSE
                sm0_uid226_pT5_uid113_invPolyEval_q <= sm0_uid226_pT5_uid113_invPolyEval_s1;
            END IF;
        END IF;
    END PROCESS;

    -- redist16_sm0_uid226_pT5_uid113_invPolyEval_q_1(DELAY,298)
    redist16_sm0_uid226_pT5_uid113_invPolyEval_q_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist16_sm0_uid226_pT5_uid113_invPolyEval_q_1_q <= (others => '0');
            ELSE
                redist16_sm0_uid226_pT5_uid113_invPolyEval_q_1_q <= STD_LOGIC_VECTOR(sm0_uid226_pT5_uid113_invPolyEval_q);
            END IF;
        END IF;
    END PROCESS;

    -- sumAb_uid227_pT5_uid113_invPolyEval(BITJOIN,226)@41
    sumAb_uid227_pT5_uid113_invPolyEval_q <= redist3_sm0_uid223_pT5_uid113_invPolyEval_cma_q_1_q & redist16_sm0_uid226_pT5_uid113_invPolyEval_q_1_q;

    -- lev1_a0sumAHighB_uid230_pT5_uid113_invPolyEval(ADD,229)@41
    lev1_a0sumAHighB_uid230_pT5_uid113_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((58 downto 58 => sumAb_uid227_pT5_uid113_invPolyEval_q(57)) & sumAb_uid227_pT5_uid113_invPolyEval_q));
    lev1_a0sumAHighB_uid230_pT5_uid113_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((58 downto 32 => highBBits_uid229_pT5_uid113_invPolyEval_b(31)) & highBBits_uid229_pT5_uid113_invPolyEval_b));
    lev1_a0sumAHighB_uid230_pT5_uid113_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(lev1_a0sumAHighB_uid230_pT5_uid113_invPolyEval_a) + SIGNED(lev1_a0sumAHighB_uid230_pT5_uid113_invPolyEval_b));
    lev1_a0sumAHighB_uid230_pT5_uid113_invPolyEval_q <= lev1_a0sumAHighB_uid230_pT5_uid113_invPolyEval_o(58 downto 0);

    -- lowRangeB_uid228_pT5_uid113_invPolyEval(BITSELECT,227)@41
    lowRangeB_uid228_pT5_uid113_invPolyEval_in <= redist0_multSumOfTwoTS_uid224_pT5_uid113_invPolyEval_cma_q_1_q(22 downto 0);
    lowRangeB_uid228_pT5_uid113_invPolyEval_b <= lowRangeB_uid228_pT5_uid113_invPolyEval_in(22 downto 0);

    -- lev1_a0_uid231_pT5_uid113_invPolyEval(BITJOIN,230)@41
    lev1_a0_uid231_pT5_uid113_invPolyEval_q <= lev1_a0sumAHighB_uid230_pT5_uid113_invPolyEval_q & lowRangeB_uid228_pT5_uid113_invPolyEval_b;

    -- os_uid232_pT5_uid113_invPolyEval(BITSELECT,231)@41
    os_uid232_pT5_uid113_invPolyEval_in <= STD_LOGIC_VECTOR(lev1_a0_uid231_pT5_uid113_invPolyEval_q(79 downto 0));
    os_uid232_pT5_uid113_invPolyEval_b <= STD_LOGIC_VECTOR(os_uid232_pT5_uid113_invPolyEval_in(79 downto 28));

    -- redist15_os_uid232_pT5_uid113_invPolyEval_b_1(DELAY,297)
    redist15_os_uid232_pT5_uid113_invPolyEval_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist15_os_uid232_pT5_uid113_invPolyEval_b_1_q <= (others => '0');
            ELSE
                redist15_os_uid232_pT5_uid113_invPolyEval_b_1_q <= STD_LOGIC_VECTOR(os_uid232_pT5_uid113_invPolyEval_b);
            END IF;
        END IF;
    END PROCESS;

    -- highBBits_uid115_invPolyEval(BITSELECT,114)@42
    highBBits_uid115_invPolyEval_b <= STD_LOGIC_VECTOR(redist15_os_uid232_pT5_uid113_invPolyEval_b_1_q(51 downto 2));

    -- redist41_yAddr_uid35_fpSqrtTest_b_39_inputreg1(DELAY,387)
    redist41_yAddr_uid35_fpSqrtTest_b_39_inputreg1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist41_yAddr_uid35_fpSqrtTest_b_39_inputreg1_q <= (others => '0');
            ELSE
                redist41_yAddr_uid35_fpSqrtTest_b_39_inputreg1_q <= STD_LOGIC_VECTOR(redist40_yAddr_uid35_fpSqrtTest_b_30_outputreg1_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist41_yAddr_uid35_fpSqrtTest_b_39_inputreg0(DELAY,389)
    redist41_yAddr_uid35_fpSqrtTest_b_39_inputreg0_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist41_yAddr_uid35_fpSqrtTest_b_39_inputreg0_q <= (others => '0');
            ELSE
                redist41_yAddr_uid35_fpSqrtTest_b_39_inputreg0_q <= STD_LOGIC_VECTOR(redist41_yAddr_uid35_fpSqrtTest_b_39_inputreg1_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist41_yAddr_uid35_fpSqrtTest_b_39(DELAY,323)
    redist41_yAddr_uid35_fpSqrtTest_b_39_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist41_yAddr_uid35_fpSqrtTest_b_39_delay_0 <= (others => '0');
                redist41_yAddr_uid35_fpSqrtTest_b_39_delay_1 <= (others => '0');
                redist41_yAddr_uid35_fpSqrtTest_b_39_delay_2 <= (others => '0');
                redist41_yAddr_uid35_fpSqrtTest_b_39_delay_3 <= (others => '0');
                redist41_yAddr_uid35_fpSqrtTest_b_39_q <= (others => '0');
            ELSE
                redist41_yAddr_uid35_fpSqrtTest_b_39_delay_0 <= STD_LOGIC_VECTOR(redist41_yAddr_uid35_fpSqrtTest_b_39_inputreg0_q);
                redist41_yAddr_uid35_fpSqrtTest_b_39_delay_1 <= redist41_yAddr_uid35_fpSqrtTest_b_39_delay_0;
                redist41_yAddr_uid35_fpSqrtTest_b_39_delay_2 <= redist41_yAddr_uid35_fpSqrtTest_b_39_delay_1;
                redist41_yAddr_uid35_fpSqrtTest_b_39_delay_3 <= redist41_yAddr_uid35_fpSqrtTest_b_39_delay_2;
                redist41_yAddr_uid35_fpSqrtTest_b_39_q <= redist41_yAddr_uid35_fpSqrtTest_b_39_delay_3;
            END IF;
        END IF;
    END PROCESS;

    -- redist41_yAddr_uid35_fpSqrtTest_b_39_outputreg0(DELAY,390)
    redist41_yAddr_uid35_fpSqrtTest_b_39_outputreg0_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist41_yAddr_uid35_fpSqrtTest_b_39_outputreg0_q <= (others => '0');
            ELSE
                redist41_yAddr_uid35_fpSqrtTest_b_39_outputreg0_q <= STD_LOGIC_VECTOR(redist41_yAddr_uid35_fpSqrtTest_b_39_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist41_yAddr_uid35_fpSqrtTest_b_39_outputreg1(DELAY,388)
    redist41_yAddr_uid35_fpSqrtTest_b_39_outputreg1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist41_yAddr_uid35_fpSqrtTest_b_39_outputreg1_q <= (others => '0');
            ELSE
                redist41_yAddr_uid35_fpSqrtTest_b_39_outputreg1_q <= STD_LOGIC_VECTOR(redist41_yAddr_uid35_fpSqrtTest_b_39_outputreg0_q);
            END IF;
        END IF;
    END PROCESS;

    -- memoryC0_uid63_sqrtTables_lutmem(DUALMEM,264)@39 + 2
    -- in j@20000000
    memoryC0_uid63_sqrtTables_lutmem_aa <= redist41_yAddr_uid35_fpSqrtTest_b_39_outputreg1_q;
    memoryC0_uid63_sqrtTables_lutmem_reset0 <= areset;
    memoryC0_uid63_sqrtTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "ROM",
        width_a => 17,
        widthad_a => 8,
        numwords_a => 256,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_sclr_a => "SCLEAR",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "float64_sqrt_altera_fp_functions_191_eshpdly_memoryC0_uid63_sqrtTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Stratix 10"
    )
    PORT MAP (
        clocken0 => '1',
        sclr => memoryC0_uid63_sqrtTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC0_uid63_sqrtTables_lutmem_aa,
        q_a => memoryC0_uid63_sqrtTables_lutmem_ir
    );
    memoryC0_uid63_sqrtTables_lutmem_r <= memoryC0_uid63_sqrtTables_lutmem_ir(16 downto 0);

    -- redist12_memoryC0_uid63_sqrtTables_lutmem_r_1(DELAY,294)
    redist12_memoryC0_uid63_sqrtTables_lutmem_r_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist12_memoryC0_uid63_sqrtTables_lutmem_r_1_q <= (others => '0');
            ELSE
                redist12_memoryC0_uid63_sqrtTables_lutmem_r_1_q <= STD_LOGIC_VECTOR(memoryC0_uid63_sqrtTables_lutmem_r);
            END IF;
        END IF;
    END PROCESS;

    -- memoryC0_uid62_sqrtTables_lutmem(DUALMEM,263)@39 + 2
    -- in j@20000000
    memoryC0_uid62_sqrtTables_lutmem_aa <= redist41_yAddr_uid35_fpSqrtTest_b_39_outputreg1_q;
    memoryC0_uid62_sqrtTables_lutmem_reset0 <= areset;
    memoryC0_uid62_sqrtTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "ROM",
        width_a => 40,
        widthad_a => 8,
        numwords_a => 256,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_sclr_a => "SCLEAR",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "float64_sqrt_altera_fp_functions_191_eshpdly_memoryC0_uid62_sqrtTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Stratix 10"
    )
    PORT MAP (
        clocken0 => '1',
        sclr => memoryC0_uid62_sqrtTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC0_uid62_sqrtTables_lutmem_aa,
        q_a => memoryC0_uid62_sqrtTables_lutmem_ir
    );
    memoryC0_uid62_sqrtTables_lutmem_r <= memoryC0_uid62_sqrtTables_lutmem_ir(39 downto 0);

    -- redist13_memoryC0_uid62_sqrtTables_lutmem_r_1(DELAY,295)
    redist13_memoryC0_uid62_sqrtTables_lutmem_r_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist13_memoryC0_uid62_sqrtTables_lutmem_r_1_q <= (others => '0');
            ELSE
                redist13_memoryC0_uid62_sqrtTables_lutmem_r_1_q <= STD_LOGIC_VECTOR(memoryC0_uid62_sqrtTables_lutmem_r);
            END IF;
        END IF;
    END PROCESS;

    -- os_uid64_sqrtTables(BITJOIN,63)@42
    os_uid64_sqrtTables_q <= redist12_memoryC0_uid63_sqrtTables_lutmem_r_1_q & redist13_memoryC0_uid62_sqrtTables_lutmem_r_1_q;

    -- s5sumAHighB_uid116_invPolyEval(ADD,115)@42
    s5sumAHighB_uid116_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((57 downto 57 => os_uid64_sqrtTables_q(56)) & os_uid64_sqrtTables_q));
    s5sumAHighB_uid116_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((57 downto 50 => highBBits_uid115_invPolyEval_b(49)) & highBBits_uid115_invPolyEval_b));
    s5sumAHighB_uid116_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(s5sumAHighB_uid116_invPolyEval_a) + SIGNED(s5sumAHighB_uid116_invPolyEval_b));
    s5sumAHighB_uid116_invPolyEval_q <= s5sumAHighB_uid116_invPolyEval_o(57 downto 0);

    -- lowRangeB_uid114_invPolyEval(BITSELECT,113)@42
    lowRangeB_uid114_invPolyEval_in <= redist15_os_uid232_pT5_uid113_invPolyEval_b_1_q(1 downto 0);
    lowRangeB_uid114_invPolyEval_b <= lowRangeB_uid114_invPolyEval_in(1 downto 0);

    -- s5_uid117_invPolyEval(BITJOIN,116)@42
    s5_uid117_invPolyEval_q <= s5sumAHighB_uid116_invPolyEval_q & lowRangeB_uid114_invPolyEval_b;

    -- expInc_uid38_fpSqrtTest(BITSELECT,37)@42
    expInc_uid38_fpSqrtTest_in <= STD_LOGIC_VECTOR(s5_uid117_invPolyEval_q(58 downto 0));
    expInc_uid38_fpSqrtTest_b <= STD_LOGIC_VECTOR(expInc_uid38_fpSqrtTest_in(58 downto 58));

    -- redist31_expInc_uid38_fpSqrtTest_b_1(DELAY,313)
    redist31_expInc_uid38_fpSqrtTest_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist31_expInc_uid38_fpSqrtTest_b_1_q <= (others => '0');
            ELSE
                redist31_expInc_uid38_fpSqrtTest_b_1_q <= STD_LOGIC_VECTOR(expInc_uid38_fpSqrtTest_b);
            END IF;
        END IF;
    END PROCESS;

    -- sBiasM1_uid26_fpSqrtTest(CONSTANT,25)
    sBiasM1_uid26_fpSqrtTest_q <= "01111111110";

    -- expOddSig_uid27_fpSqrtTest(ADD,26)@41
    expOddSig_uid27_fpSqrtTest_a <= STD_LOGIC_VECTOR("0" & redist49_expX_uid6_fpSqrtTest_b_41_mem_q);
    expOddSig_uid27_fpSqrtTest_b <= STD_LOGIC_VECTOR("0" & sBiasM1_uid26_fpSqrtTest_q);
    expOddSig_uid27_fpSqrtTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expOddSig_uid27_fpSqrtTest_a) + UNSIGNED(expOddSig_uid27_fpSqrtTest_b));
    expOddSig_uid27_fpSqrtTest_q <= expOddSig_uid27_fpSqrtTest_o(11 downto 0);

    -- expROdd_uid28_fpSqrtTest(BITSELECT,27)@41
    expROdd_uid28_fpSqrtTest_b <= expOddSig_uid27_fpSqrtTest_q(11 downto 1);

    -- redist43_expROdd_uid28_fpSqrtTest_b_1(DELAY,325)
    redist43_expROdd_uid28_fpSqrtTest_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist43_expROdd_uid28_fpSqrtTest_b_1_q <= (others => '0');
            ELSE
                redist43_expROdd_uid28_fpSqrtTest_b_1_q <= STD_LOGIC_VECTOR(expROdd_uid28_fpSqrtTest_b);
            END IF;
        END IF;
    END PROCESS;

    -- sBias_uid22_fpSqrtTest(CONSTANT,21)
    sBias_uid22_fpSqrtTest_q <= "01111111111";

    -- expEvenSig_uid24_fpSqrtTest(ADD,23)@41
    expEvenSig_uid24_fpSqrtTest_a <= STD_LOGIC_VECTOR("0" & redist49_expX_uid6_fpSqrtTest_b_41_mem_q);
    expEvenSig_uid24_fpSqrtTest_b <= STD_LOGIC_VECTOR("0" & sBias_uid22_fpSqrtTest_q);
    expEvenSig_uid24_fpSqrtTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expEvenSig_uid24_fpSqrtTest_a) + UNSIGNED(expEvenSig_uid24_fpSqrtTest_b));
    expEvenSig_uid24_fpSqrtTest_q <= expEvenSig_uid24_fpSqrtTest_o(11 downto 0);

    -- expREven_uid25_fpSqrtTest(BITSELECT,24)@41
    expREven_uid25_fpSqrtTest_b <= expEvenSig_uid24_fpSqrtTest_q(11 downto 1);

    -- redist44_expREven_uid25_fpSqrtTest_b_1(DELAY,326)
    redist44_expREven_uid25_fpSqrtTest_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist44_expREven_uid25_fpSqrtTest_b_1_q <= (others => '0');
            ELSE
                redist44_expREven_uid25_fpSqrtTest_b_1_q <= STD_LOGIC_VECTOR(expREven_uid25_fpSqrtTest_b);
            END IF;
        END IF;
    END PROCESS;

    -- redist42_expOddSelect_uid30_fpSqrtTest_q_42(DELAY,324)
    redist42_expOddSelect_uid30_fpSqrtTest_q_42 : dspba_delay
    GENERIC MAP ( width => 1, depth => 42, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => expOddSelect_uid30_fpSqrtTest_q, xout => redist42_expOddSelect_uid30_fpSqrtTest_q_42_q, clk => clk, aclr => areset, ena => '1' );

    -- expRMux_uid31_fpSqrtTest(MUX,30)@42 + 1
    expRMux_uid31_fpSqrtTest_s <= redist42_expOddSelect_uid30_fpSqrtTest_q_42_q;
    expRMux_uid31_fpSqrtTest_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                expRMux_uid31_fpSqrtTest_q <= (others => '0');
            ELSE
                CASE (expRMux_uid31_fpSqrtTest_s) IS
                    WHEN "0" => expRMux_uid31_fpSqrtTest_q <= redist44_expREven_uid25_fpSqrtTest_b_1_q;
                    WHEN "1" => expRMux_uid31_fpSqrtTest_q <= redist43_expROdd_uid28_fpSqrtTest_b_1_q;
                    WHEN OTHERS => expRMux_uid31_fpSqrtTest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;

    -- expR_uid40_fpSqrtTest(ADD,39)@43
    expR_uid40_fpSqrtTest_a <= STD_LOGIC_VECTOR("0" & expRMux_uid31_fpSqrtTest_q);
    expR_uid40_fpSqrtTest_b <= STD_LOGIC_VECTOR("00000000000" & redist31_expInc_uid38_fpSqrtTest_b_1_q);
    expR_uid40_fpSqrtTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expR_uid40_fpSqrtTest_a) + UNSIGNED(expR_uid40_fpSqrtTest_b));
    expR_uid40_fpSqrtTest_q <= expR_uid40_fpSqrtTest_o(11 downto 0);

    -- expRR_uid51_fpSqrtTest(BITSELECT,50)@43
    expRR_uid51_fpSqrtTest_in <= expR_uid40_fpSqrtTest_q(10 downto 0);
    expRR_uid51_fpSqrtTest_b <= expRR_uid51_fpSqrtTest_in(10 downto 0);

    -- redist29_expRR_uid51_fpSqrtTest_b_1(DELAY,311)
    redist29_expRR_uid51_fpSqrtTest_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist29_expRR_uid51_fpSqrtTest_b_1_q <= (others => '0');
            ELSE
                redist29_expRR_uid51_fpSqrtTest_b_1_q <= STD_LOGIC_VECTOR(expRR_uid51_fpSqrtTest_b);
            END IF;
        END IF;
    END PROCESS;

    -- expXIsMax_uid14_fpSqrtTest(LOGICAL,13)@41 + 1
    expXIsMax_uid14_fpSqrtTest_qi <= "1" WHEN redist49_expX_uid6_fpSqrtTest_b_41_mem_q = cstAllOWE_uid8_fpSqrtTest_q ELSE "0";
    expXIsMax_uid14_fpSqrtTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => expXIsMax_uid14_fpSqrtTest_qi, xout => expXIsMax_uid14_fpSqrtTest_q, clk => clk, aclr => areset, ena => '1' );

    -- invExpXIsMax_uid19_fpSqrtTest(LOGICAL,18)@42
    invExpXIsMax_uid19_fpSqrtTest_q <= not (expXIsMax_uid14_fpSqrtTest_q);

    -- InvExpXIsZero_uid20_fpSqrtTest(LOGICAL,19)@42
    InvExpXIsZero_uid20_fpSqrtTest_q <= not (excZ_x_uid13_fpSqrtTest_q);

    -- excR_x_uid21_fpSqrtTest(LOGICAL,20)@42
    excR_x_uid21_fpSqrtTest_q <= InvExpXIsZero_uid20_fpSqrtTest_q and invExpXIsMax_uid19_fpSqrtTest_q;

    -- minReg_uid43_fpSqrtTest(LOGICAL,42)@42
    minReg_uid43_fpSqrtTest_q <= excR_x_uid21_fpSqrtTest_q and redist47_signX_uid7_fpSqrtTest_b_42_q;

    -- cstZeroWF_uid9_fpSqrtTest(CONSTANT,8)
    cstZeroWF_uid9_fpSqrtTest_q <= "0000000000000000000000000000000000000000000000000000";

    -- c0_uid235_fracXIsZero_uid15_fpSqrtTest_merged_bit_select(BITSELECT,279)
    c0_uid235_fracXIsZero_uid15_fpSqrtTest_merged_bit_select_b <= cstZeroWF_uid9_fpSqrtTest_q(5 downto 0);
    c0_uid235_fracXIsZero_uid15_fpSqrtTest_merged_bit_select_c <= cstZeroWF_uid9_fpSqrtTest_q(11 downto 6);
    c0_uid235_fracXIsZero_uid15_fpSqrtTest_merged_bit_select_d <= cstZeroWF_uid9_fpSqrtTest_q(17 downto 12);
    c0_uid235_fracXIsZero_uid15_fpSqrtTest_merged_bit_select_e <= cstZeroWF_uid9_fpSqrtTest_q(23 downto 18);
    c0_uid235_fracXIsZero_uid15_fpSqrtTest_merged_bit_select_f <= cstZeroWF_uid9_fpSqrtTest_q(29 downto 24);
    c0_uid235_fracXIsZero_uid15_fpSqrtTest_merged_bit_select_g <= cstZeroWF_uid9_fpSqrtTest_q(35 downto 30);
    c0_uid235_fracXIsZero_uid15_fpSqrtTest_merged_bit_select_h <= cstZeroWF_uid9_fpSqrtTest_q(41 downto 36);
    c0_uid235_fracXIsZero_uid15_fpSqrtTest_merged_bit_select_i <= cstZeroWF_uid9_fpSqrtTest_q(47 downto 42);
    c0_uid235_fracXIsZero_uid15_fpSqrtTest_merged_bit_select_j <= cstZeroWF_uid9_fpSqrtTest_q(51 downto 48);

    -- z8_uid258_fracXIsZero_uid15_fpSqrtTest(BITSELECT,257)@0
    z8_uid258_fracXIsZero_uid15_fpSqrtTest_b <= frac_x_uid12_fpSqrtTest_b(51 downto 48);

    -- eq8_uid260_fracXIsZero_uid15_fpSqrtTest(LOGICAL,259)@0
    eq8_uid260_fracXIsZero_uid15_fpSqrtTest_q <= "1" WHEN z8_uid258_fracXIsZero_uid15_fpSqrtTest_b = c0_uid235_fracXIsZero_uid15_fpSqrtTest_merged_bit_select_j ELSE "0";

    -- z7_uid255_fracXIsZero_uid15_fpSqrtTest(BITSELECT,254)@0
    z7_uid255_fracXIsZero_uid15_fpSqrtTest_in <= frac_x_uid12_fpSqrtTest_b(47 downto 0);
    z7_uid255_fracXIsZero_uid15_fpSqrtTest_b <= z7_uid255_fracXIsZero_uid15_fpSqrtTest_in(47 downto 42);

    -- eq7_uid257_fracXIsZero_uid15_fpSqrtTest(LOGICAL,256)@0
    eq7_uid257_fracXIsZero_uid15_fpSqrtTest_q <= "1" WHEN z7_uid255_fracXIsZero_uid15_fpSqrtTest_b = c0_uid235_fracXIsZero_uid15_fpSqrtTest_merged_bit_select_i ELSE "0";

    -- z6_uid252_fracXIsZero_uid15_fpSqrtTest(BITSELECT,251)@0
    z6_uid252_fracXIsZero_uid15_fpSqrtTest_in <= frac_x_uid12_fpSqrtTest_b(41 downto 0);
    z6_uid252_fracXIsZero_uid15_fpSqrtTest_b <= z6_uid252_fracXIsZero_uid15_fpSqrtTest_in(41 downto 36);

    -- eq6_uid254_fracXIsZero_uid15_fpSqrtTest(LOGICAL,253)@0
    eq6_uid254_fracXIsZero_uid15_fpSqrtTest_q <= "1" WHEN z6_uid252_fracXIsZero_uid15_fpSqrtTest_b = c0_uid235_fracXIsZero_uid15_fpSqrtTest_merged_bit_select_h ELSE "0";

    -- and_lev0_uid262_fracXIsZero_uid15_fpSqrtTest(LOGICAL,261)@0 + 1
    and_lev0_uid262_fracXIsZero_uid15_fpSqrtTest_qi <= eq6_uid254_fracXIsZero_uid15_fpSqrtTest_q and eq7_uid257_fracXIsZero_uid15_fpSqrtTest_q and eq8_uid260_fracXIsZero_uid15_fpSqrtTest_q;
    and_lev0_uid262_fracXIsZero_uid15_fpSqrtTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => and_lev0_uid262_fracXIsZero_uid15_fpSqrtTest_qi, xout => and_lev0_uid262_fracXIsZero_uid15_fpSqrtTest_q, clk => clk, aclr => areset, ena => '1' );

    -- z5_uid249_fracXIsZero_uid15_fpSqrtTest(BITSELECT,248)@0
    z5_uid249_fracXIsZero_uid15_fpSqrtTest_in <= frac_x_uid12_fpSqrtTest_b(35 downto 0);
    z5_uid249_fracXIsZero_uid15_fpSqrtTest_b <= z5_uid249_fracXIsZero_uid15_fpSqrtTest_in(35 downto 30);

    -- eq5_uid251_fracXIsZero_uid15_fpSqrtTest(LOGICAL,250)@0
    eq5_uid251_fracXIsZero_uid15_fpSqrtTest_q <= "1" WHEN z5_uid249_fracXIsZero_uid15_fpSqrtTest_b = c0_uid235_fracXIsZero_uid15_fpSqrtTest_merged_bit_select_g ELSE "0";

    -- z4_uid246_fracXIsZero_uid15_fpSqrtTest(BITSELECT,245)@0
    z4_uid246_fracXIsZero_uid15_fpSqrtTest_in <= frac_x_uid12_fpSqrtTest_b(29 downto 0);
    z4_uid246_fracXIsZero_uid15_fpSqrtTest_b <= z4_uid246_fracXIsZero_uid15_fpSqrtTest_in(29 downto 24);

    -- eq4_uid248_fracXIsZero_uid15_fpSqrtTest(LOGICAL,247)@0
    eq4_uid248_fracXIsZero_uid15_fpSqrtTest_q <= "1" WHEN z4_uid246_fracXIsZero_uid15_fpSqrtTest_b = c0_uid235_fracXIsZero_uid15_fpSqrtTest_merged_bit_select_f ELSE "0";

    -- z3_uid243_fracXIsZero_uid15_fpSqrtTest(BITSELECT,242)@0
    z3_uid243_fracXIsZero_uid15_fpSqrtTest_in <= frac_x_uid12_fpSqrtTest_b(23 downto 0);
    z3_uid243_fracXIsZero_uid15_fpSqrtTest_b <= z3_uid243_fracXIsZero_uid15_fpSqrtTest_in(23 downto 18);

    -- eq3_uid245_fracXIsZero_uid15_fpSqrtTest(LOGICAL,244)@0
    eq3_uid245_fracXIsZero_uid15_fpSqrtTest_q <= "1" WHEN z3_uid243_fracXIsZero_uid15_fpSqrtTest_b = c0_uid235_fracXIsZero_uid15_fpSqrtTest_merged_bit_select_e ELSE "0";

    -- z2_uid240_fracXIsZero_uid15_fpSqrtTest(BITSELECT,239)@0
    z2_uid240_fracXIsZero_uid15_fpSqrtTest_in <= frac_x_uid12_fpSqrtTest_b(17 downto 0);
    z2_uid240_fracXIsZero_uid15_fpSqrtTest_b <= z2_uid240_fracXIsZero_uid15_fpSqrtTest_in(17 downto 12);

    -- eq2_uid242_fracXIsZero_uid15_fpSqrtTest(LOGICAL,241)@0
    eq2_uid242_fracXIsZero_uid15_fpSqrtTest_q <= "1" WHEN z2_uid240_fracXIsZero_uid15_fpSqrtTest_b = c0_uid235_fracXIsZero_uid15_fpSqrtTest_merged_bit_select_d ELSE "0";

    -- z1_uid237_fracXIsZero_uid15_fpSqrtTest(BITSELECT,236)@0
    z1_uid237_fracXIsZero_uid15_fpSqrtTest_in <= frac_x_uid12_fpSqrtTest_b(11 downto 0);
    z1_uid237_fracXIsZero_uid15_fpSqrtTest_b <= z1_uid237_fracXIsZero_uid15_fpSqrtTest_in(11 downto 6);

    -- eq1_uid239_fracXIsZero_uid15_fpSqrtTest(LOGICAL,238)@0
    eq1_uid239_fracXIsZero_uid15_fpSqrtTest_q <= "1" WHEN z1_uid237_fracXIsZero_uid15_fpSqrtTest_b = c0_uid235_fracXIsZero_uid15_fpSqrtTest_merged_bit_select_c ELSE "0";

    -- z0_uid234_fracXIsZero_uid15_fpSqrtTest(BITSELECT,233)@0
    z0_uid234_fracXIsZero_uid15_fpSqrtTest_in <= frac_x_uid12_fpSqrtTest_b(5 downto 0);
    z0_uid234_fracXIsZero_uid15_fpSqrtTest_b <= z0_uid234_fracXIsZero_uid15_fpSqrtTest_in(5 downto 0);

    -- eq0_uid236_fracXIsZero_uid15_fpSqrtTest(LOGICAL,235)@0
    eq0_uid236_fracXIsZero_uid15_fpSqrtTest_q <= "1" WHEN z0_uid234_fracXIsZero_uid15_fpSqrtTest_b = c0_uid235_fracXIsZero_uid15_fpSqrtTest_merged_bit_select_b ELSE "0";

    -- and_lev0_uid261_fracXIsZero_uid15_fpSqrtTest(LOGICAL,260)@0 + 1
    and_lev0_uid261_fracXIsZero_uid15_fpSqrtTest_qi <= eq0_uid236_fracXIsZero_uid15_fpSqrtTest_q and eq1_uid239_fracXIsZero_uid15_fpSqrtTest_q and eq2_uid242_fracXIsZero_uid15_fpSqrtTest_q and eq3_uid245_fracXIsZero_uid15_fpSqrtTest_q and eq4_uid248_fracXIsZero_uid15_fpSqrtTest_q and eq5_uid251_fracXIsZero_uid15_fpSqrtTest_q;
    and_lev0_uid261_fracXIsZero_uid15_fpSqrtTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => and_lev0_uid261_fracXIsZero_uid15_fpSqrtTest_qi, xout => and_lev0_uid261_fracXIsZero_uid15_fpSqrtTest_q, clk => clk, aclr => areset, ena => '1' );

    -- and_lev1_uid263_fracXIsZero_uid15_fpSqrtTest(LOGICAL,262)@1 + 1
    and_lev1_uid263_fracXIsZero_uid15_fpSqrtTest_qi <= and_lev0_uid261_fracXIsZero_uid15_fpSqrtTest_q and and_lev0_uid262_fracXIsZero_uid15_fpSqrtTest_q;
    and_lev1_uid263_fracXIsZero_uid15_fpSqrtTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => and_lev1_uid263_fracXIsZero_uid15_fpSqrtTest_qi, xout => and_lev1_uid263_fracXIsZero_uid15_fpSqrtTest_q, clk => clk, aclr => areset, ena => '1' );

    -- redist14_and_lev1_uid263_fracXIsZero_uid15_fpSqrtTest_q_41(DELAY,296)
    redist14_and_lev1_uid263_fracXIsZero_uid15_fpSqrtTest_q_41 : dspba_delay
    GENERIC MAP ( width => 1, depth => 40, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => and_lev1_uid263_fracXIsZero_uid15_fpSqrtTest_q, xout => redist14_and_lev1_uid263_fracXIsZero_uid15_fpSqrtTest_q_41_q, clk => clk, aclr => areset, ena => '1' );

    -- excI_x_uid17_fpSqrtTest(LOGICAL,16)@42
    excI_x_uid17_fpSqrtTest_q <= expXIsMax_uid14_fpSqrtTest_q and redist14_and_lev1_uid263_fracXIsZero_uid15_fpSqrtTest_q_41_q;

    -- minInf_uid44_fpSqrtTest(LOGICAL,43)@42
    minInf_uid44_fpSqrtTest_q <= excI_x_uid17_fpSqrtTest_q and redist47_signX_uid7_fpSqrtTest_b_42_q;

    -- fracXIsNotZero_uid16_fpSqrtTest(LOGICAL,15)@42
    fracXIsNotZero_uid16_fpSqrtTest_q <= not (redist14_and_lev1_uid263_fracXIsZero_uid15_fpSqrtTest_q_41_q);

    -- excN_x_uid18_fpSqrtTest(LOGICAL,17)@42
    excN_x_uid18_fpSqrtTest_q <= expXIsMax_uid14_fpSqrtTest_q and fracXIsNotZero_uid16_fpSqrtTest_q;

    -- excRNaN_uid45_fpSqrtTest(LOGICAL,44)@42 + 1
    excRNaN_uid45_fpSqrtTest_qi <= excN_x_uid18_fpSqrtTest_q or minInf_uid44_fpSqrtTest_q or minReg_uid43_fpSqrtTest_q;
    excRNaN_uid45_fpSqrtTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => excRNaN_uid45_fpSqrtTest_qi, xout => excRNaN_uid45_fpSqrtTest_q, clk => clk, aclr => areset, ena => '1' );

    -- invSignX_uid41_fpSqrtTest(LOGICAL,40)@43
    invSignX_uid41_fpSqrtTest_q <= not (redist48_signX_uid7_fpSqrtTest_b_43_q);

    -- redist45_excI_x_uid17_fpSqrtTest_q_1(DELAY,327)
    redist45_excI_x_uid17_fpSqrtTest_q_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist45_excI_x_uid17_fpSqrtTest_q_1_q <= (others => '0');
            ELSE
                redist45_excI_x_uid17_fpSqrtTest_q_1_q <= STD_LOGIC_VECTOR(excI_x_uid17_fpSqrtTest_q);
            END IF;
        END IF;
    END PROCESS;

    -- inInfAndNotNeg_uid42_fpSqrtTest(LOGICAL,41)@43
    inInfAndNotNeg_uid42_fpSqrtTest_q <= redist45_excI_x_uid17_fpSqrtTest_q_1_q and invSignX_uid41_fpSqrtTest_q;

    -- excConc_uid46_fpSqrtTest(BITJOIN,45)@43
    excConc_uid46_fpSqrtTest_q <= excRNaN_uid45_fpSqrtTest_q & inInfAndNotNeg_uid42_fpSqrtTest_q & redist46_excZ_x_uid13_fpSqrtTest_q_2_q;

    -- fracSelIn_uid47_fpSqrtTest(BITJOIN,46)@43
    fracSelIn_uid47_fpSqrtTest_q <= redist48_signX_uid7_fpSqrtTest_b_43_q & excConc_uid46_fpSqrtTest_q;

    -- fracSel_uid48_fpSqrtTest(LOOKUP,47)@43 + 1
    fracSel_uid48_fpSqrtTest_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                fracSel_uid48_fpSqrtTest_q <= "01";
            ELSE
                CASE (fracSelIn_uid47_fpSqrtTest_q) IS
                    WHEN "0000" => fracSel_uid48_fpSqrtTest_q <= "01";
                    WHEN "0001" => fracSel_uid48_fpSqrtTest_q <= "00";
                    WHEN "0010" => fracSel_uid48_fpSqrtTest_q <= "10";
                    WHEN "0011" => fracSel_uid48_fpSqrtTest_q <= "00";
                    WHEN "0100" => fracSel_uid48_fpSqrtTest_q <= "11";
                    WHEN "0101" => fracSel_uid48_fpSqrtTest_q <= "00";
                    WHEN "0110" => fracSel_uid48_fpSqrtTest_q <= "10";
                    WHEN "0111" => fracSel_uid48_fpSqrtTest_q <= "00";
                    WHEN "1000" => fracSel_uid48_fpSqrtTest_q <= "11";
                    WHEN "1001" => fracSel_uid48_fpSqrtTest_q <= "00";
                    WHEN "1010" => fracSel_uid48_fpSqrtTest_q <= "11";
                    WHEN "1011" => fracSel_uid48_fpSqrtTest_q <= "11";
                    WHEN "1100" => fracSel_uid48_fpSqrtTest_q <= "11";
                    WHEN "1101" => fracSel_uid48_fpSqrtTest_q <= "11";
                    WHEN "1110" => fracSel_uid48_fpSqrtTest_q <= "11";
                    WHEN "1111" => fracSel_uid48_fpSqrtTest_q <= "11";
                    WHEN OTHERS => -- unreachable
                                   fracSel_uid48_fpSqrtTest_q <= (others => '-');
                END CASE;
            END IF;
        END IF;
    END PROCESS;

    -- expRPostExc_uid53_fpSqrtTest(MUX,52)@44
    expRPostExc_uid53_fpSqrtTest_s <= fracSel_uid48_fpSqrtTest_q;
    expRPostExc_uid53_fpSqrtTest_combproc: PROCESS (expRPostExc_uid53_fpSqrtTest_s, cstAllZWE_uid10_fpSqrtTest_q, redist29_expRR_uid51_fpSqrtTest_b_1_q, cstAllOWE_uid8_fpSqrtTest_q)
    BEGIN
        CASE (expRPostExc_uid53_fpSqrtTest_s) IS
            WHEN "00" => expRPostExc_uid53_fpSqrtTest_q <= cstAllZWE_uid10_fpSqrtTest_q;
            WHEN "01" => expRPostExc_uid53_fpSqrtTest_q <= redist29_expRR_uid51_fpSqrtTest_b_1_q;
            WHEN "10" => expRPostExc_uid53_fpSqrtTest_q <= cstAllOWE_uid8_fpSqrtTest_q;
            WHEN "11" => expRPostExc_uid53_fpSqrtTest_q <= cstAllOWE_uid8_fpSqrtTest_q;
            WHEN OTHERS => expRPostExc_uid53_fpSqrtTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- fracNaN_uid54_fpSqrtTest(CONSTANT,53)
    fracNaN_uid54_fpSqrtTest_q <= "0000000000000000000000000000000000000000000000000001";

    -- fracRPostProcessings_uid39_fpSqrtTest(BITSELECT,38)@42
    fracRPostProcessings_uid39_fpSqrtTest_in <= s5_uid117_invPolyEval_q(56 downto 0);
    fracRPostProcessings_uid39_fpSqrtTest_b <= fracRPostProcessings_uid39_fpSqrtTest_in(56 downto 5);

    -- redist30_fracRPostProcessings_uid39_fpSqrtTest_b_2(DELAY,312)
    redist30_fracRPostProcessings_uid39_fpSqrtTest_b_2_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist30_fracRPostProcessings_uid39_fpSqrtTest_b_2_delay_0 <= (others => '0');
                redist30_fracRPostProcessings_uid39_fpSqrtTest_b_2_q <= (others => '0');
            ELSE
                redist30_fracRPostProcessings_uid39_fpSqrtTest_b_2_delay_0 <= STD_LOGIC_VECTOR(fracRPostProcessings_uid39_fpSqrtTest_b);
                redist30_fracRPostProcessings_uid39_fpSqrtTest_b_2_q <= redist30_fracRPostProcessings_uid39_fpSqrtTest_b_2_delay_0;
            END IF;
        END IF;
    END PROCESS;

    -- fracRPostExc_uid58_fpSqrtTest(MUX,57)@44
    fracRPostExc_uid58_fpSqrtTest_s <= fracSel_uid48_fpSqrtTest_q;
    fracRPostExc_uid58_fpSqrtTest_combproc: PROCESS (fracRPostExc_uid58_fpSqrtTest_s, cstZeroWF_uid9_fpSqrtTest_q, redist30_fracRPostProcessings_uid39_fpSqrtTest_b_2_q, fracNaN_uid54_fpSqrtTest_q)
    BEGIN
        CASE (fracRPostExc_uid58_fpSqrtTest_s) IS
            WHEN "00" => fracRPostExc_uid58_fpSqrtTest_q <= cstZeroWF_uid9_fpSqrtTest_q;
            WHEN "01" => fracRPostExc_uid58_fpSqrtTest_q <= redist30_fracRPostProcessings_uid39_fpSqrtTest_b_2_q;
            WHEN "10" => fracRPostExc_uid58_fpSqrtTest_q <= cstZeroWF_uid9_fpSqrtTest_q;
            WHEN "11" => fracRPostExc_uid58_fpSqrtTest_q <= fracNaN_uid54_fpSqrtTest_q;
            WHEN OTHERS => fracRPostExc_uid58_fpSqrtTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- RSqrt_uid60_fpSqrtTest(BITJOIN,59)@44
    RSqrt_uid60_fpSqrtTest_q <= negZero_uid59_fpSqrtTest_q & expRPostExc_uid53_fpSqrtTest_q & fracRPostExc_uid58_fpSqrtTest_q;

    -- xOut(GPOUT,4)@44
    q <= RSqrt_uid60_fpSqrtTest_q;

END normal;
