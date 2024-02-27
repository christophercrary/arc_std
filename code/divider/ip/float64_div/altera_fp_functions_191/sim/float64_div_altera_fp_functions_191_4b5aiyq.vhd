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

-- VHDL created from float64_div_altera_fp_functions_191_4b5aiyq
-- VHDL created on Mon Sep 26 21:08:49 2022


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

entity float64_div_altera_fp_functions_191_4b5aiyq is
    port (
        a : in std_logic_vector(63 downto 0);  -- float64_m52
        b : in std_logic_vector(63 downto 0);  -- float64_m52
        q : out std_logic_vector(63 downto 0);  -- float64_m52
        clk : in std_logic;
        areset : in std_logic
    );
end float64_div_altera_fp_functions_191_4b5aiyq;

architecture normal of float64_div_altera_fp_functions_191_4b5aiyq is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cstBiasM1_uid6_fpDivTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal cstBias_uid7_fpDivTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal expX_uid9_fpDivTest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal fracX_uid10_fpDivTest_b : STD_LOGIC_VECTOR (51 downto 0);
    signal signX_uid11_fpDivTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal expY_uid12_fpDivTest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal fracY_uid13_fpDivTest_b : STD_LOGIC_VECTOR (51 downto 0);
    signal signY_uid14_fpDivTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal paddingY_uid15_fpDivTest_q : STD_LOGIC_VECTOR (51 downto 0);
    signal updatedY_uid16_fpDivTest_q : STD_LOGIC_VECTOR (52 downto 0);
    signal cstAllOWE_uid18_fpDivTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal cstAllZWE_uid20_fpDivTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal excZ_x_uid23_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid24_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
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
    signal fracXIsNotZero_uid40_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_y_uid41_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_y_uid42_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid43_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid44_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_y_uid45_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signR_uid46_fpDivTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal signR_uid46_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXmY_uid47_fpDivTest_a : STD_LOGIC_VECTOR (11 downto 0);
    signal expXmY_uid47_fpDivTest_b : STD_LOGIC_VECTOR (11 downto 0);
    signal expXmY_uid47_fpDivTest_o : STD_LOGIC_VECTOR (11 downto 0);
    signal expXmY_uid47_fpDivTest_q : STD_LOGIC_VECTOR (11 downto 0);
    signal expR_uid48_fpDivTest_a : STD_LOGIC_VECTOR (13 downto 0);
    signal expR_uid48_fpDivTest_b : STD_LOGIC_VECTOR (13 downto 0);
    signal expR_uid48_fpDivTest_o : STD_LOGIC_VECTOR (13 downto 0);
    signal expR_uid48_fpDivTest_q : STD_LOGIC_VECTOR (12 downto 0);
    signal yAddr_uid51_fpDivTest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal yPE_uid52_fpDivTest_b : STD_LOGIC_VECTOR (40 downto 0);
    signal invY_uid54_fpDivTest_in : STD_LOGIC_VECTOR (60 downto 0);
    signal invY_uid54_fpDivTest_b : STD_LOGIC_VECTOR (55 downto 0);
    signal invYO_uid55_fpDivTest_in : STD_LOGIC_VECTOR (61 downto 0);
    signal invYO_uid55_fpDivTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal lOAdded_uid57_fpDivTest_q : STD_LOGIC_VECTOR (52 downto 0);
    signal z4_uid60_fpDivTest_q : STD_LOGIC_VECTOR (3 downto 0);
    signal oFracXZ4_uid61_fpDivTest_q : STD_LOGIC_VECTOR (56 downto 0);
    signal divValPreNormYPow2Exc_uid63_fpDivTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal divValPreNormYPow2Exc_uid63_fpDivTest_q : STD_LOGIC_VECTOR (56 downto 0);
    signal norm_uid64_fpDivTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal divValPreNormHigh_uid65_fpDivTest_in : STD_LOGIC_VECTOR (55 downto 0);
    signal divValPreNormHigh_uid65_fpDivTest_b : STD_LOGIC_VECTOR (53 downto 0);
    signal divValPreNormLow_uid66_fpDivTest_in : STD_LOGIC_VECTOR (54 downto 0);
    signal divValPreNormLow_uid66_fpDivTest_b : STD_LOGIC_VECTOR (53 downto 0);
    signal normFracRnd_uid67_fpDivTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal normFracRnd_uid67_fpDivTest_q : STD_LOGIC_VECTOR (53 downto 0);
    signal expFracRnd_uid68_fpDivTest_q : STD_LOGIC_VECTOR (66 downto 0);
    signal zeroPaddingInAddition_uid74_fpDivTest_q : STD_LOGIC_VECTOR (52 downto 0);
    signal expFracPostRnd_uid75_fpDivTest_q : STD_LOGIC_VECTOR (54 downto 0);
    signal expFracPostRnd_uid76_fpDivTest_a : STD_LOGIC_VECTOR (68 downto 0);
    signal expFracPostRnd_uid76_fpDivTest_b : STD_LOGIC_VECTOR (68 downto 0);
    signal expFracPostRnd_uid76_fpDivTest_o : STD_LOGIC_VECTOR (68 downto 0);
    signal expFracPostRnd_uid76_fpDivTest_q : STD_LOGIC_VECTOR (67 downto 0);
    signal fracXExt_uid77_fpDivTest_q : STD_LOGIC_VECTOR (52 downto 0);
    signal fracPostRndF_uid79_fpDivTest_in : STD_LOGIC_VECTOR (53 downto 0);
    signal fracPostRndF_uid79_fpDivTest_b : STD_LOGIC_VECTOR (52 downto 0);
    signal fracPostRndF_uid80_fpDivTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fracPostRndF_uid80_fpDivTest_q : STD_LOGIC_VECTOR (52 downto 0);
    signal expPostRndFR_uid81_fpDivTest_in : STD_LOGIC_VECTOR (64 downto 0);
    signal expPostRndFR_uid81_fpDivTest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal expPostRndF_uid82_fpDivTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal expPostRndF_uid82_fpDivTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal lOAdded_uid84_fpDivTest_q : STD_LOGIC_VECTOR (53 downto 0);
    signal lOAdded_uid87_fpDivTest_q : STD_LOGIC_VECTOR (52 downto 0);
    signal qDivProdNorm_uid90_fpDivTest_in : STD_LOGIC_VECTOR (106 downto 0);
    signal qDivProdNorm_uid90_fpDivTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal qDivProdFracHigh_uid91_fpDivTest_in : STD_LOGIC_VECTOR (105 downto 0);
    signal qDivProdFracHigh_uid91_fpDivTest_b : STD_LOGIC_VECTOR (52 downto 0);
    signal qDivProdFracLow_uid92_fpDivTest_in : STD_LOGIC_VECTOR (104 downto 0);
    signal qDivProdFracLow_uid92_fpDivTest_b : STD_LOGIC_VECTOR (52 downto 0);
    signal qDivProdFrac_uid93_fpDivTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal qDivProdFrac_uid93_fpDivTest_q : STD_LOGIC_VECTOR (52 downto 0);
    signal qDivProdExp_opA_uid94_fpDivTest_a : STD_LOGIC_VECTOR (11 downto 0);
    signal qDivProdExp_opA_uid94_fpDivTest_b : STD_LOGIC_VECTOR (11 downto 0);
    signal qDivProdExp_opA_uid94_fpDivTest_o : STD_LOGIC_VECTOR (11 downto 0);
    signal qDivProdExp_opA_uid94_fpDivTest_q : STD_LOGIC_VECTOR (11 downto 0);
    signal qDivProdExp_opBs_uid95_fpDivTest_a : STD_LOGIC_VECTOR (11 downto 0);
    signal qDivProdExp_opBs_uid95_fpDivTest_b : STD_LOGIC_VECTOR (11 downto 0);
    signal qDivProdExp_opBs_uid95_fpDivTest_o : STD_LOGIC_VECTOR (11 downto 0);
    signal qDivProdExp_opBs_uid95_fpDivTest_q : STD_LOGIC_VECTOR (11 downto 0);
    signal qDivProdExp_uid96_fpDivTest_a : STD_LOGIC_VECTOR (14 downto 0);
    signal qDivProdExp_uid96_fpDivTest_b : STD_LOGIC_VECTOR (14 downto 0);
    signal qDivProdExp_uid96_fpDivTest_o : STD_LOGIC_VECTOR (14 downto 0);
    signal qDivProdExp_uid96_fpDivTest_q : STD_LOGIC_VECTOR (13 downto 0);
    signal qDivProdFracWF_uid97_fpDivTest_b : STD_LOGIC_VECTOR (51 downto 0);
    signal qDivProdLTX_opA_uid98_fpDivTest_in : STD_LOGIC_VECTOR (10 downto 0);
    signal qDivProdLTX_opA_uid98_fpDivTest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal qDivProdLTX_opA_uid99_fpDivTest_q : STD_LOGIC_VECTOR (62 downto 0);
    signal qDivProdLTX_opB_uid100_fpDivTest_q : STD_LOGIC_VECTOR (62 downto 0);
    signal qDividerProdLTX_uid101_fpDivTest_a : STD_LOGIC_VECTOR (64 downto 0);
    signal qDividerProdLTX_uid101_fpDivTest_b : STD_LOGIC_VECTOR (64 downto 0);
    signal qDividerProdLTX_uid101_fpDivTest_o : STD_LOGIC_VECTOR (64 downto 0);
    signal qDividerProdLTX_uid101_fpDivTest_c : STD_LOGIC_VECTOR (0 downto 0);
    signal betweenFPwF_uid102_fpDivTest_in : STD_LOGIC_VECTOR (0 downto 0);
    signal betweenFPwF_uid102_fpDivTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal extraUlp_uid103_fpDivTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal extraUlp_uid103_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracPostRndFT_uid104_fpDivTest_b : STD_LOGIC_VECTOR (51 downto 0);
    signal fracRPreExcExt_uid105_fpDivTest_a : STD_LOGIC_VECTOR (52 downto 0);
    signal fracRPreExcExt_uid105_fpDivTest_b : STD_LOGIC_VECTOR (52 downto 0);
    signal fracRPreExcExt_uid105_fpDivTest_o : STD_LOGIC_VECTOR (52 downto 0);
    signal fracRPreExcExt_uid105_fpDivTest_q : STD_LOGIC_VECTOR (52 downto 0);
    signal fracPostRndFPostUlp_uid106_fpDivTest_in : STD_LOGIC_VECTOR (51 downto 0);
    signal fracPostRndFPostUlp_uid106_fpDivTest_b : STD_LOGIC_VECTOR (51 downto 0);
    signal fracRPreExc_uid107_fpDivTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPreExc_uid107_fpDivTest_q : STD_LOGIC_VECTOR (51 downto 0);
    signal ovfIncRnd_uid109_fpDivTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal expRExt_uid114_fpDivTest_b : STD_LOGIC_VECTOR (13 downto 0);
    signal expUdf_uid115_fpDivTest_a : STD_LOGIC_VECTOR (15 downto 0);
    signal expUdf_uid115_fpDivTest_b : STD_LOGIC_VECTOR (15 downto 0);
    signal expUdf_uid115_fpDivTest_o : STD_LOGIC_VECTOR (15 downto 0);
    signal expUdf_uid115_fpDivTest_n : STD_LOGIC_VECTOR (0 downto 0);
    signal expOvf_uid118_fpDivTest_a : STD_LOGIC_VECTOR (15 downto 0);
    signal expOvf_uid118_fpDivTest_b : STD_LOGIC_VECTOR (15 downto 0);
    signal expOvf_uid118_fpDivTest_o : STD_LOGIC_VECTOR (15 downto 0);
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
    signal oneFracRPostExc2_uid134_fpDivTest_q : STD_LOGIC_VECTOR (51 downto 0);
    signal fracRPostExc_uid137_fpDivTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid137_fpDivTest_q : STD_LOGIC_VECTOR (51 downto 0);
    signal expRPostExc_uid141_fpDivTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal expRPostExc_uid141_fpDivTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal invExcRNaN_uid142_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sRPostExc_uid143_fpDivTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal sRPostExc_uid143_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal divR_uid144_fpDivTest_q : STD_LOGIC_VECTOR (63 downto 0);
    signal os_uid153_invTables_q : STD_LOGIC_VECTOR (60 downto 0);
    signal os_uid160_invTables_q : STD_LOGIC_VECTOR (48 downto 0);
    signal os_uid166_invTables_q : STD_LOGIC_VECTOR (37 downto 0);
    signal os_uid171_invTables_q : STD_LOGIC_VECTOR (27 downto 0);
    signal os_uid175_invTables_q : STD_LOGIC_VECTOR (15 downto 0);
    signal yT1_uid182_invPolyEval_b : STD_LOGIC_VECTOR (15 downto 0);
    signal lowRangeB_uid184_invPolyEval_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeB_uid184_invPolyEval_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highBBits_uid185_invPolyEval_b : STD_LOGIC_VECTOR (16 downto 0);
    signal s1sumAHighB_uid186_invPolyEval_a : STD_LOGIC_VECTOR (28 downto 0);
    signal s1sumAHighB_uid186_invPolyEval_b : STD_LOGIC_VECTOR (28 downto 0);
    signal s1sumAHighB_uid186_invPolyEval_o : STD_LOGIC_VECTOR (28 downto 0);
    signal s1sumAHighB_uid186_invPolyEval_q : STD_LOGIC_VECTOR (28 downto 0);
    signal s1_uid187_invPolyEval_q : STD_LOGIC_VECTOR (29 downto 0);
    signal yT2_uid188_invPolyEval_b : STD_LOGIC_VECTOR (27 downto 0);
    signal lowRangeB_uid190_invPolyEval_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeB_uid190_invPolyEval_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highBBits_uid191_invPolyEval_b : STD_LOGIC_VECTOR (27 downto 0);
    signal s2sumAHighB_uid192_invPolyEval_a : STD_LOGIC_VECTOR (38 downto 0);
    signal s2sumAHighB_uid192_invPolyEval_b : STD_LOGIC_VECTOR (38 downto 0);
    signal s2sumAHighB_uid192_invPolyEval_o : STD_LOGIC_VECTOR (38 downto 0);
    signal s2sumAHighB_uid192_invPolyEval_q : STD_LOGIC_VECTOR (38 downto 0);
    signal s2_uid193_invPolyEval_q : STD_LOGIC_VECTOR (39 downto 0);
    signal yT3_uid194_invPolyEval_b : STD_LOGIC_VECTOR (37 downto 0);
    signal lowRangeB_uid196_invPolyEval_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeB_uid196_invPolyEval_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highBBits_uid197_invPolyEval_b : STD_LOGIC_VECTOR (38 downto 0);
    signal s3sumAHighB_uid198_invPolyEval_a : STD_LOGIC_VECTOR (49 downto 0);
    signal s3sumAHighB_uid198_invPolyEval_b : STD_LOGIC_VECTOR (49 downto 0);
    signal s3sumAHighB_uid198_invPolyEval_o : STD_LOGIC_VECTOR (49 downto 0);
    signal s3sumAHighB_uid198_invPolyEval_q : STD_LOGIC_VECTOR (49 downto 0);
    signal s3_uid199_invPolyEval_q : STD_LOGIC_VECTOR (50 downto 0);
    signal lowRangeB_uid202_invPolyEval_in : STD_LOGIC_VECTOR (1 downto 0);
    signal lowRangeB_uid202_invPolyEval_b : STD_LOGIC_VECTOR (1 downto 0);
    signal highBBits_uid203_invPolyEval_b : STD_LOGIC_VECTOR (49 downto 0);
    signal s4sumAHighB_uid204_invPolyEval_a : STD_LOGIC_VECTOR (61 downto 0);
    signal s4sumAHighB_uid204_invPolyEval_b : STD_LOGIC_VECTOR (61 downto 0);
    signal s4sumAHighB_uid204_invPolyEval_o : STD_LOGIC_VECTOR (61 downto 0);
    signal s4sumAHighB_uid204_invPolyEval_q : STD_LOGIC_VECTOR (61 downto 0);
    signal s4_uid205_invPolyEval_q : STD_LOGIC_VECTOR (63 downto 0);
    signal topRangeX_uid217_divValPreNorm_uid59_fpDivTest_b : STD_LOGIC_VECTOR (26 downto 0);
    signal topRangeY_uid218_divValPreNorm_uid59_fpDivTest_b : STD_LOGIC_VECTOR (26 downto 0);
    signal aboveLeftY_bottomRange_uid221_divValPreNorm_uid59_fpDivTest_in : STD_LOGIC_VECTOR (25 downto 0);
    signal aboveLeftY_bottomRange_uid221_divValPreNorm_uid59_fpDivTest_b : STD_LOGIC_VECTOR (25 downto 0);
    signal aboveLeftY_mergedSignalTM_uid222_divValPreNorm_uid59_fpDivTest_q : STD_LOGIC_VECTOR (26 downto 0);
    signal rightBottomX_uid224_divValPreNorm_uid59_fpDivTest_in : STD_LOGIC_VECTOR (28 downto 0);
    signal rightBottomX_uid224_divValPreNorm_uid59_fpDivTest_b : STD_LOGIC_VECTOR (26 downto 0);
    signal aboveLeftX_uid226_divValPreNorm_uid59_fpDivTest_in : STD_LOGIC_VECTOR (28 downto 0);
    signal aboveLeftX_uid226_divValPreNorm_uid59_fpDivTest_b : STD_LOGIC_VECTOR (6 downto 0);
    signal aboveLeftY_uid227_divValPreNorm_uid59_fpDivTest_in : STD_LOGIC_VECTOR (25 downto 0);
    signal aboveLeftY_uid227_divValPreNorm_uid59_fpDivTest_b : STD_LOGIC_VECTOR (6 downto 0);
    signal rightBottomX_uid228_divValPreNorm_uid59_fpDivTest_in : STD_LOGIC_VECTOR (1 downto 0);
    signal rightBottomX_uid228_divValPreNorm_uid59_fpDivTest_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rightBottomY_uid229_divValPreNorm_uid59_fpDivTest_b : STD_LOGIC_VECTOR (4 downto 0);
    signal sm0_uid234_divValPreNorm_uid59_fpDivTest_a0 : STD_LOGIC_VECTOR (1 downto 0);
    signal sm0_uid234_divValPreNorm_uid59_fpDivTest_b0 : STD_LOGIC_VECTOR (4 downto 0);
    signal sm0_uid234_divValPreNorm_uid59_fpDivTest_a1 : STD_LOGIC_VECTOR (1 downto 0);
    signal sm0_uid234_divValPreNorm_uid59_fpDivTest_b1 : STD_LOGIC_VECTOR (4 downto 0);
    signal sm0_uid234_divValPreNorm_uid59_fpDivTest_a2 : STD_LOGIC_VECTOR (1 downto 0);
    signal sm0_uid234_divValPreNorm_uid59_fpDivTest_b2 : STD_LOGIC_VECTOR (4 downto 0);
    signal sm0_uid234_divValPreNorm_uid59_fpDivTest_s1 : STD_LOGIC_VECTOR (6 downto 0);
    signal sm0_uid234_divValPreNorm_uid59_fpDivTest_pr : UNSIGNED (6 downto 0);
    attribute multstyle : string;
    attribute multstyle of sm0_uid234_divValPreNorm_uid59_fpDivTest_pr : signal is "logic";
    signal sm0_uid234_divValPreNorm_uid59_fpDivTest_q : STD_LOGIC_VECTOR (6 downto 0);
    signal sumAb_uid235_divValPreNorm_uid59_fpDivTest_q : STD_LOGIC_VECTOR (67 downto 0);
    signal lev1_a0sumAHighB_uid238_divValPreNorm_uid59_fpDivTest_a : STD_LOGIC_VECTOR (68 downto 0);
    signal lev1_a0sumAHighB_uid238_divValPreNorm_uid59_fpDivTest_b : STD_LOGIC_VECTOR (68 downto 0);
    signal lev1_a0sumAHighB_uid238_divValPreNorm_uid59_fpDivTest_o : STD_LOGIC_VECTOR (68 downto 0);
    signal lev1_a0sumAHighB_uid238_divValPreNorm_uid59_fpDivTest_q : STD_LOGIC_VECTOR (68 downto 0);
    signal lev1_a0_uid239_divValPreNorm_uid59_fpDivTest_q : STD_LOGIC_VECTOR (81 downto 0);
    signal lev2_a0high_uid242_divValPreNorm_uid59_fpDivTest_a : STD_LOGIC_VECTOR (62 downto 0);
    signal lev2_a0high_uid242_divValPreNorm_uid59_fpDivTest_b : STD_LOGIC_VECTOR (62 downto 0);
    signal lev2_a0high_uid242_divValPreNorm_uid59_fpDivTest_o : STD_LOGIC_VECTOR (62 downto 0);
    signal lev2_a0high_uid242_divValPreNorm_uid59_fpDivTest_q : STD_LOGIC_VECTOR (62 downto 0);
    signal lev2_a0_uid243_divValPreNorm_uid59_fpDivTest_q : STD_LOGIC_VECTOR (82 downto 0);
    signal os_uid244_divValPreNorm_uid59_fpDivTest_in : STD_LOGIC_VECTOR (80 downto 0);
    signal os_uid244_divValPreNorm_uid59_fpDivTest_b : STD_LOGIC_VECTOR (56 downto 0);
    signal osig_uid247_pT1_uid183_invPolyEval_b : STD_LOGIC_VECTOR (17 downto 0);
    signal aboveLeftX_uid255_pT2_uid189_invPolyEval_b : STD_LOGIC_VECTOR (3 downto 0);
    signal aboveLeftY_uid256_pT2_uid189_invPolyEval_in : STD_LOGIC_VECTOR (2 downto 0);
    signal aboveLeftY_uid256_pT2_uid189_invPolyEval_b : STD_LOGIC_VECTOR (2 downto 0);
    signal rightBottomX_uid257_pT2_uid189_invPolyEval_in : STD_LOGIC_VECTOR (0 downto 0);
    signal rightBottomX_uid257_pT2_uid189_invPolyEval_b : STD_LOGIC_VECTOR (0 downto 0);
    signal rightBottomY_uid258_pT2_uid189_invPolyEval_b : STD_LOGIC_VECTOR (5 downto 0);
    signal topRangeX_uid259_pT2_uid189_invPolyEval_b : STD_LOGIC_VECTOR (26 downto 0);
    signal topRangeY_uid260_pT2_uid189_invPolyEval_b : STD_LOGIC_VECTOR (26 downto 0);
    signal sm0_uid262_pT2_uid189_invPolyEval_a0 : STD_LOGIC_VECTOR (3 downto 0);
    signal sm0_uid262_pT2_uid189_invPolyEval_b0 : STD_LOGIC_VECTOR (2 downto 0);
    signal sm0_uid262_pT2_uid189_invPolyEval_a1 : STD_LOGIC_VECTOR (3 downto 0);
    signal sm0_uid262_pT2_uid189_invPolyEval_b1 : STD_LOGIC_VECTOR (2 downto 0);
    signal sm0_uid262_pT2_uid189_invPolyEval_a2 : STD_LOGIC_VECTOR (3 downto 0);
    signal sm0_uid262_pT2_uid189_invPolyEval_b2 : STD_LOGIC_VECTOR (2 downto 0);
    signal sm0_uid262_pT2_uid189_invPolyEval_s1 : STD_LOGIC_VECTOR (6 downto 0);
    signal sm0_uid262_pT2_uid189_invPolyEval_pr : UNSIGNED (6 downto 0);
    attribute multstyle of sm0_uid262_pT2_uid189_invPolyEval_pr : signal is "logic";
    signal sm0_uid262_pT2_uid189_invPolyEval_q : STD_LOGIC_VECTOR (6 downto 0);
    signal sm0_uid263_pT2_uid189_invPolyEval_a0 : STD_LOGIC_VECTOR (0 downto 0);
    signal sm0_uid263_pT2_uid189_invPolyEval_b0 : STD_LOGIC_VECTOR (5 downto 0);
    signal sm0_uid263_pT2_uid189_invPolyEval_a1 : STD_LOGIC_VECTOR (0 downto 0);
    signal sm0_uid263_pT2_uid189_invPolyEval_b1 : STD_LOGIC_VECTOR (5 downto 0);
    signal sm0_uid263_pT2_uid189_invPolyEval_a2 : STD_LOGIC_VECTOR (0 downto 0);
    signal sm0_uid263_pT2_uid189_invPolyEval_b2 : STD_LOGIC_VECTOR (5 downto 0);
    signal sm0_uid263_pT2_uid189_invPolyEval_s1 : STD_LOGIC_VECTOR (6 downto 0);
    signal sm0_uid263_pT2_uid189_invPolyEval_pr : SIGNED (7 downto 0);
    attribute multstyle of sm0_uid263_pT2_uid189_invPolyEval_pr : signal is "logic";
    signal sm0_uid263_pT2_uid189_invPolyEval_q : STD_LOGIC_VECTOR (6 downto 0);
    signal lowRangeA_uid264_pT2_uid189_invPolyEval_in : STD_LOGIC_VECTOR (19 downto 0);
    signal lowRangeA_uid264_pT2_uid189_invPolyEval_b : STD_LOGIC_VECTOR (19 downto 0);
    signal highABits_uid265_pT2_uid189_invPolyEval_b : STD_LOGIC_VECTOR (33 downto 0);
    signal lev1_a0high_uid266_pT2_uid189_invPolyEval_a : STD_LOGIC_VECTOR (35 downto 0);
    signal lev1_a0high_uid266_pT2_uid189_invPolyEval_b : STD_LOGIC_VECTOR (35 downto 0);
    signal lev1_a0high_uid266_pT2_uid189_invPolyEval_o : STD_LOGIC_VECTOR (35 downto 0);
    signal lev1_a0high_uid266_pT2_uid189_invPolyEval_q : STD_LOGIC_VECTOR (34 downto 0);
    signal lev1_a0_uid267_pT2_uid189_invPolyEval_q : STD_LOGIC_VECTOR (54 downto 0);
    signal lowRangeA_uid268_pT2_uid189_invPolyEval_in : STD_LOGIC_VECTOR (19 downto 0);
    signal lowRangeA_uid268_pT2_uid189_invPolyEval_b : STD_LOGIC_VECTOR (19 downto 0);
    signal highABits_uid269_pT2_uid189_invPolyEval_b : STD_LOGIC_VECTOR (34 downto 0);
    signal lev2_a0high_uid270_pT2_uid189_invPolyEval_a : STD_LOGIC_VECTOR (35 downto 0);
    signal lev2_a0high_uid270_pT2_uid189_invPolyEval_b : STD_LOGIC_VECTOR (35 downto 0);
    signal lev2_a0high_uid270_pT2_uid189_invPolyEval_o : STD_LOGIC_VECTOR (35 downto 0);
    signal lev2_a0high_uid270_pT2_uid189_invPolyEval_q : STD_LOGIC_VECTOR (35 downto 0);
    signal lev2_a0_uid271_pT2_uid189_invPolyEval_q : STD_LOGIC_VECTOR (55 downto 0);
    signal os_uid272_pT2_uid189_invPolyEval_in : STD_LOGIC_VECTOR (53 downto 0);
    signal os_uid272_pT2_uid189_invPolyEval_b : STD_LOGIC_VECTOR (28 downto 0);
    signal nx_mergedSignalTM_uid286_pT3_uid195_invPolyEval_q : STD_LOGIC_VECTOR (38 downto 0);
    signal topRangeX_uid288_pT3_uid195_invPolyEval_b : STD_LOGIC_VECTOR (26 downto 0);
    signal topRangeY_uid289_pT3_uid195_invPolyEval_b : STD_LOGIC_VECTOR (26 downto 0);
    signal aboveLeftX_uid290_pT3_uid195_invPolyEval_b : STD_LOGIC_VECTOR (17 downto 0);
    signal aboveLeftY_bottomExtension_uid291_pT3_uid195_invPolyEval_q : STD_LOGIC_VECTOR (4 downto 0);
    signal aboveLeftY_bottomRange_uid292_pT3_uid195_invPolyEval_in : STD_LOGIC_VECTOR (12 downto 0);
    signal aboveLeftY_bottomRange_uid292_pT3_uid195_invPolyEval_b : STD_LOGIC_VECTOR (12 downto 0);
    signal aboveLeftY_mergedSignalTM_uid293_pT3_uid195_invPolyEval_q : STD_LOGIC_VECTOR (17 downto 0);
    signal rightBottomX_bottomExtension_uid295_pT3_uid195_invPolyEval_q : STD_LOGIC_VECTOR (5 downto 0);
    signal rightBottomX_bottomRange_uid296_pT3_uid195_invPolyEval_in : STD_LOGIC_VECTOR (11 downto 0);
    signal rightBottomX_bottomRange_uid296_pT3_uid195_invPolyEval_b : STD_LOGIC_VECTOR (11 downto 0);
    signal rightBottomX_mergedSignalTM_uid297_pT3_uid195_invPolyEval_q : STD_LOGIC_VECTOR (17 downto 0);
    signal rightBottomY_uid299_pT3_uid195_invPolyEval_b : STD_LOGIC_VECTOR (17 downto 0);
    signal lowRangeB_uid303_pT3_uid195_invPolyEval_in : STD_LOGIC_VECTOR (8 downto 0);
    signal lowRangeB_uid303_pT3_uid195_invPolyEval_b : STD_LOGIC_VECTOR (8 downto 0);
    signal highBBits_uid304_pT3_uid195_invPolyEval_b : STD_LOGIC_VECTOR (27 downto 0);
    signal lev1_a0sumAHighB_uid305_pT3_uid195_invPolyEval_a : STD_LOGIC_VECTOR (54 downto 0);
    signal lev1_a0sumAHighB_uid305_pT3_uid195_invPolyEval_b : STD_LOGIC_VECTOR (54 downto 0);
    signal lev1_a0sumAHighB_uid305_pT3_uid195_invPolyEval_o : STD_LOGIC_VECTOR (54 downto 0);
    signal lev1_a0sumAHighB_uid305_pT3_uid195_invPolyEval_q : STD_LOGIC_VECTOR (54 downto 0);
    signal lev1_a0_uid306_pT3_uid195_invPolyEval_q : STD_LOGIC_VECTOR (63 downto 0);
    signal os_uid307_pT3_uid195_invPolyEval_in : STD_LOGIC_VECTOR (61 downto 0);
    signal os_uid307_pT3_uid195_invPolyEval_b : STD_LOGIC_VECTOR (39 downto 0);
    signal nx_mergedSignalTM_uid321_pT4_uid201_invPolyEval_q : STD_LOGIC_VECTOR (41 downto 0);
    signal topRangeX_uid323_pT4_uid201_invPolyEval_b : STD_LOGIC_VECTOR (26 downto 0);
    signal topRangeY_uid324_pT4_uid201_invPolyEval_b : STD_LOGIC_VECTOR (26 downto 0);
    signal aboveLeftY_bottomExtension_uid326_pT4_uid201_invPolyEval_q : STD_LOGIC_VECTOR (2 downto 0);
    signal aboveLeftY_bottomRange_uid327_pT4_uid201_invPolyEval_in : STD_LOGIC_VECTOR (23 downto 0);
    signal aboveLeftY_bottomRange_uid327_pT4_uid201_invPolyEval_b : STD_LOGIC_VECTOR (23 downto 0);
    signal aboveLeftY_mergedSignalTM_uid328_pT4_uid201_invPolyEval_q : STD_LOGIC_VECTOR (26 downto 0);
    signal rightBottomX_bottomExtension_uid330_pT4_uid201_invPolyEval_q : STD_LOGIC_VECTOR (11 downto 0);
    signal rightBottomX_bottomRange_uid331_pT4_uid201_invPolyEval_in : STD_LOGIC_VECTOR (14 downto 0);
    signal rightBottomX_bottomRange_uid331_pT4_uid201_invPolyEval_b : STD_LOGIC_VECTOR (14 downto 0);
    signal rightBottomX_mergedSignalTM_uid332_pT4_uid201_invPolyEval_q : STD_LOGIC_VECTOR (26 downto 0);
    signal aboveLeftX_uid335_pT4_uid201_invPolyEval_in : STD_LOGIC_VECTOR (14 downto 0);
    signal aboveLeftX_uid335_pT4_uid201_invPolyEval_b : STD_LOGIC_VECTOR (1 downto 0);
    signal aboveLeftY_uid336_pT4_uid201_invPolyEval_in : STD_LOGIC_VECTOR (23 downto 0);
    signal aboveLeftY_uid336_pT4_uid201_invPolyEval_b : STD_LOGIC_VECTOR (1 downto 0);
    signal sm0_uid340_pT4_uid201_invPolyEval_a0 : STD_LOGIC_VECTOR (1 downto 0);
    signal sm0_uid340_pT4_uid201_invPolyEval_b0 : STD_LOGIC_VECTOR (1 downto 0);
    signal sm0_uid340_pT4_uid201_invPolyEval_a1 : STD_LOGIC_VECTOR (1 downto 0);
    signal sm0_uid340_pT4_uid201_invPolyEval_b1 : STD_LOGIC_VECTOR (1 downto 0);
    signal sm0_uid340_pT4_uid201_invPolyEval_a2 : STD_LOGIC_VECTOR (1 downto 0);
    signal sm0_uid340_pT4_uid201_invPolyEval_b2 : STD_LOGIC_VECTOR (1 downto 0);
    signal sm0_uid340_pT4_uid201_invPolyEval_s1 : STD_LOGIC_VECTOR (3 downto 0);
    signal sm0_uid340_pT4_uid201_invPolyEval_pr : UNSIGNED (3 downto 0);
    attribute multstyle of sm0_uid340_pT4_uid201_invPolyEval_pr : signal is "logic";
    signal sm0_uid340_pT4_uid201_invPolyEval_q : STD_LOGIC_VECTOR (3 downto 0);
    signal sumAb_uid341_pT4_uid201_invPolyEval_q : STD_LOGIC_VECTOR (57 downto 0);
    signal lowRangeB_uid342_pT4_uid201_invPolyEval_in : STD_LOGIC_VECTOR (22 downto 0);
    signal lowRangeB_uid342_pT4_uid201_invPolyEval_b : STD_LOGIC_VECTOR (22 downto 0);
    signal highBBits_uid343_pT4_uid201_invPolyEval_b : STD_LOGIC_VECTOR (31 downto 0);
    signal lev1_a0sumAHighB_uid344_pT4_uid201_invPolyEval_a : STD_LOGIC_VECTOR (58 downto 0);
    signal lev1_a0sumAHighB_uid344_pT4_uid201_invPolyEval_b : STD_LOGIC_VECTOR (58 downto 0);
    signal lev1_a0sumAHighB_uid344_pT4_uid201_invPolyEval_o : STD_LOGIC_VECTOR (58 downto 0);
    signal lev1_a0sumAHighB_uid344_pT4_uid201_invPolyEval_q : STD_LOGIC_VECTOR (58 downto 0);
    signal lev1_a0_uid345_pT4_uid201_invPolyEval_q : STD_LOGIC_VECTOR (81 downto 0);
    signal os_uid346_pT4_uid201_invPolyEval_in : STD_LOGIC_VECTOR (79 downto 0);
    signal os_uid346_pT4_uid201_invPolyEval_b : STD_LOGIC_VECTOR (51 downto 0);
    signal x0_uid349_fracYZero_uid15_fpDivTest_in : STD_LOGIC_VECTOR (25 downto 0);
    signal x0_uid349_fracYZero_uid15_fpDivTest_b : STD_LOGIC_VECTOR (25 downto 0);
    signal x1_uid352_fracYZero_uid15_fpDivTest_b : STD_LOGIC_VECTOR (25 downto 0);
    signal andEq_uid355_fracYZero_uid15_fpDivTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid355_fracYZero_uid15_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid358_fracXIsZero_uid25_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid361_fracXIsZero_uid25_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq2_uid364_fracXIsZero_uid25_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq3_uid367_fracXIsZero_uid25_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq4_uid370_fracXIsZero_uid25_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq5_uid373_fracXIsZero_uid25_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq6_uid376_fracXIsZero_uid25_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq7_uid379_fracXIsZero_uid25_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq8_uid382_fracXIsZero_uid25_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid383_fracXIsZero_uid25_fpDivTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid383_fracXIsZero_uid25_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid384_fracXIsZero_uid25_fpDivTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid384_fracXIsZero_uid25_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev1_uid385_fracXIsZero_uid25_fpDivTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev1_uid385_fracXIsZero_uid25_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal z0_uid386_fracXIsZero_uid39_fpDivTest_in : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid386_fracXIsZero_uid39_fpDivTest_b : STD_LOGIC_VECTOR (5 downto 0);
    signal eq0_uid388_fracXIsZero_uid39_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal z1_uid389_fracXIsZero_uid39_fpDivTest_in : STD_LOGIC_VECTOR (11 downto 0);
    signal z1_uid389_fracXIsZero_uid39_fpDivTest_b : STD_LOGIC_VECTOR (5 downto 0);
    signal eq1_uid391_fracXIsZero_uid39_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal z2_uid392_fracXIsZero_uid39_fpDivTest_in : STD_LOGIC_VECTOR (17 downto 0);
    signal z2_uid392_fracXIsZero_uid39_fpDivTest_b : STD_LOGIC_VECTOR (5 downto 0);
    signal eq2_uid394_fracXIsZero_uid39_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal z3_uid395_fracXIsZero_uid39_fpDivTest_in : STD_LOGIC_VECTOR (23 downto 0);
    signal z3_uid395_fracXIsZero_uid39_fpDivTest_b : STD_LOGIC_VECTOR (5 downto 0);
    signal eq3_uid397_fracXIsZero_uid39_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal z4_uid398_fracXIsZero_uid39_fpDivTest_in : STD_LOGIC_VECTOR (29 downto 0);
    signal z4_uid398_fracXIsZero_uid39_fpDivTest_b : STD_LOGIC_VECTOR (5 downto 0);
    signal eq4_uid400_fracXIsZero_uid39_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal z5_uid401_fracXIsZero_uid39_fpDivTest_in : STD_LOGIC_VECTOR (35 downto 0);
    signal z5_uid401_fracXIsZero_uid39_fpDivTest_b : STD_LOGIC_VECTOR (5 downto 0);
    signal eq5_uid403_fracXIsZero_uid39_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal z6_uid404_fracXIsZero_uid39_fpDivTest_in : STD_LOGIC_VECTOR (41 downto 0);
    signal z6_uid404_fracXIsZero_uid39_fpDivTest_b : STD_LOGIC_VECTOR (5 downto 0);
    signal eq6_uid406_fracXIsZero_uid39_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal z7_uid407_fracXIsZero_uid39_fpDivTest_in : STD_LOGIC_VECTOR (47 downto 0);
    signal z7_uid407_fracXIsZero_uid39_fpDivTest_b : STD_LOGIC_VECTOR (5 downto 0);
    signal eq7_uid409_fracXIsZero_uid39_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal z8_uid410_fracXIsZero_uid39_fpDivTest_b : STD_LOGIC_VECTOR (3 downto 0);
    signal eq8_uid412_fracXIsZero_uid39_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid413_fracXIsZero_uid39_fpDivTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid413_fracXIsZero_uid39_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid414_fracXIsZero_uid39_fpDivTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid414_fracXIsZero_uid39_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev1_uid415_fracXIsZero_uid39_fpDivTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev1_uid415_fracXIsZero_uid39_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal qDivProd_uid89_fpDivTest_sums_align_1_q : STD_LOGIC_VECTOR (81 downto 0);
    signal qDivProd_uid89_fpDivTest_sums_align_1_qint : STD_LOGIC_VECTOR (81 downto 0);
    signal expFracPostRndInc_uid110_fpDivTest_expRPreExc_uid112_fpDivTest_merged_a : STD_LOGIC_VECTOR (11 downto 0);
    signal expFracPostRndInc_uid110_fpDivTest_expRPreExc_uid112_fpDivTest_merged_b : STD_LOGIC_VECTOR (11 downto 0);
    signal expFracPostRndInc_uid110_fpDivTest_expRPreExc_uid112_fpDivTest_merged_i : STD_LOGIC_VECTOR (11 downto 0);
    signal expFracPostRndInc_uid110_fpDivTest_expRPreExc_uid112_fpDivTest_merged_a1 : STD_LOGIC_VECTOR (11 downto 0);
    signal expFracPostRndInc_uid110_fpDivTest_expRPreExc_uid112_fpDivTest_merged_b1 : STD_LOGIC_VECTOR (11 downto 0);
    signal expFracPostRndInc_uid110_fpDivTest_expRPreExc_uid112_fpDivTest_merged_o : STD_LOGIC_VECTOR (11 downto 0);
    signal expFracPostRndInc_uid110_fpDivTest_expRPreExc_uid112_fpDivTest_merged_q : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC0_uid146_invTables_lutmem_reset0 : std_logic;
    signal memoryC0_uid146_invTables_lutmem_ia : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC0_uid146_invTables_lutmem_aa : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC0_uid146_invTables_lutmem_ab : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC0_uid146_invTables_lutmem_ir : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC0_uid146_invTables_lutmem_r : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC0_uid147_invTables_lutmem_reset0 : std_logic;
    signal memoryC0_uid147_invTables_lutmem_ia : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC0_uid147_invTables_lutmem_aa : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC0_uid147_invTables_lutmem_ab : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC0_uid147_invTables_lutmem_ir : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC0_uid147_invTables_lutmem_r : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC0_uid148_invTables_lutmem_reset0 : std_logic;
    signal memoryC0_uid148_invTables_lutmem_ia : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC0_uid148_invTables_lutmem_aa : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC0_uid148_invTables_lutmem_ab : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC0_uid148_invTables_lutmem_ir : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC0_uid148_invTables_lutmem_r : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC0_uid149_invTables_lutmem_reset0 : std_logic;
    signal memoryC0_uid149_invTables_lutmem_ia : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC0_uid149_invTables_lutmem_aa : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC0_uid149_invTables_lutmem_ab : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC0_uid149_invTables_lutmem_ir : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC0_uid149_invTables_lutmem_r : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC0_uid150_invTables_lutmem_reset0 : std_logic;
    signal memoryC0_uid150_invTables_lutmem_ia : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC0_uid150_invTables_lutmem_aa : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC0_uid150_invTables_lutmem_ab : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC0_uid150_invTables_lutmem_ir : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC0_uid150_invTables_lutmem_r : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC0_uid151_invTables_lutmem_reset0 : std_logic;
    signal memoryC0_uid151_invTables_lutmem_ia : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC0_uid151_invTables_lutmem_aa : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC0_uid151_invTables_lutmem_ab : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC0_uid151_invTables_lutmem_ir : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC0_uid151_invTables_lutmem_r : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC1_uid155_invTables_lutmem_reset0 : std_logic;
    signal memoryC1_uid155_invTables_lutmem_ia : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC1_uid155_invTables_lutmem_aa : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC1_uid155_invTables_lutmem_ab : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC1_uid155_invTables_lutmem_ir : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC1_uid155_invTables_lutmem_r : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC1_uid156_invTables_lutmem_reset0 : std_logic;
    signal memoryC1_uid156_invTables_lutmem_ia : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC1_uid156_invTables_lutmem_aa : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC1_uid156_invTables_lutmem_ab : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC1_uid156_invTables_lutmem_ir : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC1_uid156_invTables_lutmem_r : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC1_uid157_invTables_lutmem_reset0 : std_logic;
    signal memoryC1_uid157_invTables_lutmem_ia : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC1_uid157_invTables_lutmem_aa : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC1_uid157_invTables_lutmem_ab : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC1_uid157_invTables_lutmem_ir : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC1_uid157_invTables_lutmem_r : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC1_uid158_invTables_lutmem_reset0 : std_logic;
    signal memoryC1_uid158_invTables_lutmem_ia : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC1_uid158_invTables_lutmem_aa : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC1_uid158_invTables_lutmem_ab : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC1_uid158_invTables_lutmem_ir : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC1_uid158_invTables_lutmem_r : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC1_uid159_invTables_lutmem_reset0 : std_logic;
    signal memoryC1_uid159_invTables_lutmem_ia : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC1_uid159_invTables_lutmem_aa : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC1_uid159_invTables_lutmem_ab : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC1_uid159_invTables_lutmem_ir : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC1_uid159_invTables_lutmem_r : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC2_uid162_invTables_lutmem_reset0 : std_logic;
    signal memoryC2_uid162_invTables_lutmem_ia : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC2_uid162_invTables_lutmem_aa : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC2_uid162_invTables_lutmem_ab : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC2_uid162_invTables_lutmem_ir : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC2_uid162_invTables_lutmem_r : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC2_uid163_invTables_lutmem_reset0 : std_logic;
    signal memoryC2_uid163_invTables_lutmem_ia : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC2_uid163_invTables_lutmem_aa : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC2_uid163_invTables_lutmem_ab : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC2_uid163_invTables_lutmem_ir : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC2_uid163_invTables_lutmem_r : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC2_uid164_invTables_lutmem_reset0 : std_logic;
    signal memoryC2_uid164_invTables_lutmem_ia : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC2_uid164_invTables_lutmem_aa : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC2_uid164_invTables_lutmem_ab : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC2_uid164_invTables_lutmem_ir : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC2_uid164_invTables_lutmem_r : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC2_uid165_invTables_lutmem_reset0 : std_logic;
    signal memoryC2_uid165_invTables_lutmem_ia : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC2_uid165_invTables_lutmem_aa : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC2_uid165_invTables_lutmem_ab : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC2_uid165_invTables_lutmem_ir : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC2_uid165_invTables_lutmem_r : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC3_uid168_invTables_lutmem_reset0 : std_logic;
    signal memoryC3_uid168_invTables_lutmem_ia : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC3_uid168_invTables_lutmem_aa : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC3_uid168_invTables_lutmem_ab : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC3_uid168_invTables_lutmem_ir : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC3_uid168_invTables_lutmem_r : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC3_uid169_invTables_lutmem_reset0 : std_logic;
    signal memoryC3_uid169_invTables_lutmem_ia : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC3_uid169_invTables_lutmem_aa : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC3_uid169_invTables_lutmem_ab : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC3_uid169_invTables_lutmem_ir : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC3_uid169_invTables_lutmem_r : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC3_uid170_invTables_lutmem_reset0 : std_logic;
    signal memoryC3_uid170_invTables_lutmem_ia : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC3_uid170_invTables_lutmem_aa : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC3_uid170_invTables_lutmem_ab : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC3_uid170_invTables_lutmem_ir : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC3_uid170_invTables_lutmem_r : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC4_uid173_invTables_lutmem_reset0 : std_logic;
    signal memoryC4_uid173_invTables_lutmem_ia : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC4_uid173_invTables_lutmem_aa : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC4_uid173_invTables_lutmem_ab : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC4_uid173_invTables_lutmem_ir : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC4_uid173_invTables_lutmem_r : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC4_uid174_invTables_lutmem_reset0 : std_logic;
    signal memoryC4_uid174_invTables_lutmem_ia : STD_LOGIC_VECTOR (5 downto 0);
    signal memoryC4_uid174_invTables_lutmem_aa : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC4_uid174_invTables_lutmem_ab : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC4_uid174_invTables_lutmem_ir : STD_LOGIC_VECTOR (5 downto 0);
    signal memoryC4_uid174_invTables_lutmem_r : STD_LOGIC_VECTOR (5 downto 0);
    signal eq0_uid454_eq0_uid351_fracYZero_uid15_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid457_eq0_uid351_fracYZero_uid15_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid458_eq0_uid351_fracYZero_uid15_fpDivTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid458_eq0_uid351_fracYZero_uid15_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid461_eq1_uid354_fracYZero_uid15_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid464_eq1_uid354_fracYZero_uid15_fpDivTest_a : STD_LOGIC_VECTOR (13 downto 0);
    signal eq1_uid464_eq1_uid354_fracYZero_uid15_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid465_eq1_uid354_fracYZero_uid15_fpDivTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid465_eq1_uid354_fracYZero_uid15_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sm0_uid230_divValPreNorm_uid59_fpDivTest_cma_reset : std_logic;
    type sm0_uid230_divValPreNorm_uid59_fpDivTest_cma_ahtype is array(NATURAL range <>) of UNSIGNED(26 downto 0);
    signal sm0_uid230_divValPreNorm_uid59_fpDivTest_cma_ah : sm0_uid230_divValPreNorm_uid59_fpDivTest_cma_ahtype(0 to 0);
    attribute preserve_syn_only : boolean;
    attribute preserve_syn_only of sm0_uid230_divValPreNorm_uid59_fpDivTest_cma_ah : signal is true;
    signal sm0_uid230_divValPreNorm_uid59_fpDivTest_cma_ch : sm0_uid230_divValPreNorm_uid59_fpDivTest_cma_ahtype(0 to 0);
    attribute preserve_syn_only of sm0_uid230_divValPreNorm_uid59_fpDivTest_cma_ch : signal is true;
    signal sm0_uid230_divValPreNorm_uid59_fpDivTest_cma_a0 : STD_LOGIC_VECTOR (26 downto 0);
    signal sm0_uid230_divValPreNorm_uid59_fpDivTest_cma_c0 : STD_LOGIC_VECTOR (26 downto 0);
    signal sm0_uid230_divValPreNorm_uid59_fpDivTest_cma_s0 : STD_LOGIC_VECTOR (53 downto 0);
    signal sm0_uid230_divValPreNorm_uid59_fpDivTest_cma_qq : STD_LOGIC_VECTOR (53 downto 0);
    signal sm0_uid230_divValPreNorm_uid59_fpDivTest_cma_q : STD_LOGIC_VECTOR (53 downto 0);
    signal sm0_uid230_divValPreNorm_uid59_fpDivTest_cma_ena0 : std_logic;
    signal sm0_uid230_divValPreNorm_uid59_fpDivTest_cma_ena1 : std_logic;
    signal sm0_uid230_divValPreNorm_uid59_fpDivTest_cma_ena2 : std_logic;
    signal sm0_uid233_divValPreNorm_uid59_fpDivTest_cma_reset : std_logic;
    type sm0_uid233_divValPreNorm_uid59_fpDivTest_cma_ahtype is array(NATURAL range <>) of UNSIGNED(6 downto 0);
    signal sm0_uid233_divValPreNorm_uid59_fpDivTest_cma_ah : sm0_uid233_divValPreNorm_uid59_fpDivTest_cma_ahtype(0 to 0);
    attribute preserve_syn_only of sm0_uid233_divValPreNorm_uid59_fpDivTest_cma_ah : signal is true;
    type sm0_uid233_divValPreNorm_uid59_fpDivTest_cma_chtype is array(NATURAL range <>) of UNSIGNED(9 downto 0);
    signal sm0_uid233_divValPreNorm_uid59_fpDivTest_cma_ch : sm0_uid233_divValPreNorm_uid59_fpDivTest_cma_chtype(0 to 0);
    attribute preserve_syn_only of sm0_uid233_divValPreNorm_uid59_fpDivTest_cma_ch : signal is true;
    signal sm0_uid233_divValPreNorm_uid59_fpDivTest_cma_a0 : STD_LOGIC_VECTOR (6 downto 0);
    signal sm0_uid233_divValPreNorm_uid59_fpDivTest_cma_c0 : STD_LOGIC_VECTOR (9 downto 0);
    signal sm0_uid233_divValPreNorm_uid59_fpDivTest_cma_s0 : STD_LOGIC_VECTOR (16 downto 0);
    signal sm0_uid233_divValPreNorm_uid59_fpDivTest_cma_qq : STD_LOGIC_VECTOR (16 downto 0);
    signal sm0_uid233_divValPreNorm_uid59_fpDivTest_cma_q : STD_LOGIC_VECTOR (13 downto 0);
    signal sm0_uid233_divValPreNorm_uid59_fpDivTest_cma_ena0 : std_logic;
    signal sm0_uid233_divValPreNorm_uid59_fpDivTest_cma_ena1 : std_logic;
    signal sm0_uid233_divValPreNorm_uid59_fpDivTest_cma_ena2 : std_logic;
    signal prodXY_uid246_pT1_uid183_invPolyEval_cma_reset : std_logic;
    type prodXY_uid246_pT1_uid183_invPolyEval_cma_ahtype is array(NATURAL range <>) of UNSIGNED(15 downto 0);
    signal prodXY_uid246_pT1_uid183_invPolyEval_cma_ah : prodXY_uid246_pT1_uid183_invPolyEval_cma_ahtype(0 to 0);
    attribute preserve_syn_only of prodXY_uid246_pT1_uid183_invPolyEval_cma_ah : signal is true;
    type prodXY_uid246_pT1_uid183_invPolyEval_cma_chtype is array(NATURAL range <>) of SIGNED(15 downto 0);
    signal prodXY_uid246_pT1_uid183_invPolyEval_cma_ch : prodXY_uid246_pT1_uid183_invPolyEval_cma_chtype(0 to 0);
    attribute preserve_syn_only of prodXY_uid246_pT1_uid183_invPolyEval_cma_ch : signal is true;
    signal prodXY_uid246_pT1_uid183_invPolyEval_cma_a0 : STD_LOGIC_VECTOR (15 downto 0);
    signal prodXY_uid246_pT1_uid183_invPolyEval_cma_c0 : STD_LOGIC_VECTOR (15 downto 0);
    signal prodXY_uid246_pT1_uid183_invPolyEval_cma_s0 : STD_LOGIC_VECTOR (31 downto 0);
    signal prodXY_uid246_pT1_uid183_invPolyEval_cma_qq : STD_LOGIC_VECTOR (31 downto 0);
    signal prodXY_uid246_pT1_uid183_invPolyEval_cma_q : STD_LOGIC_VECTOR (31 downto 0);
    signal prodXY_uid246_pT1_uid183_invPolyEval_cma_ena0 : std_logic;
    signal prodXY_uid246_pT1_uid183_invPolyEval_cma_ena1 : std_logic;
    signal prodXY_uid246_pT1_uid183_invPolyEval_cma_ena2 : std_logic;
    signal sm0_uid261_pT2_uid189_invPolyEval_cma_reset : std_logic;
    signal sm0_uid261_pT2_uid189_invPolyEval_cma_ah : sm0_uid230_divValPreNorm_uid59_fpDivTest_cma_ahtype(0 to 0);
    attribute preserve_syn_only of sm0_uid261_pT2_uid189_invPolyEval_cma_ah : signal is true;
    type sm0_uid261_pT2_uid189_invPolyEval_cma_chtype is array(NATURAL range <>) of SIGNED(26 downto 0);
    signal sm0_uid261_pT2_uid189_invPolyEval_cma_ch : sm0_uid261_pT2_uid189_invPolyEval_cma_chtype(0 to 0);
    attribute preserve_syn_only of sm0_uid261_pT2_uid189_invPolyEval_cma_ch : signal is true;
    signal sm0_uid261_pT2_uid189_invPolyEval_cma_a0 : STD_LOGIC_VECTOR (26 downto 0);
    signal sm0_uid261_pT2_uid189_invPolyEval_cma_c0 : STD_LOGIC_VECTOR (26 downto 0);
    signal sm0_uid261_pT2_uid189_invPolyEval_cma_s0 : STD_LOGIC_VECTOR (53 downto 0);
    signal sm0_uid261_pT2_uid189_invPolyEval_cma_qq : STD_LOGIC_VECTOR (53 downto 0);
    signal sm0_uid261_pT2_uid189_invPolyEval_cma_q : STD_LOGIC_VECTOR (53 downto 0);
    signal sm0_uid261_pT2_uid189_invPolyEval_cma_ena0 : std_logic;
    signal sm0_uid261_pT2_uid189_invPolyEval_cma_ena1 : std_logic;
    signal sm0_uid261_pT2_uid189_invPolyEval_cma_ena2 : std_logic;
    signal sm0_uid300_pT3_uid195_invPolyEval_cma_reset : std_logic;
    signal sm0_uid300_pT3_uid195_invPolyEval_cma_ah : sm0_uid261_pT2_uid189_invPolyEval_cma_chtype(0 to 0);
    attribute preserve_syn_only of sm0_uid300_pT3_uid195_invPolyEval_cma_ah : signal is true;
    signal sm0_uid300_pT3_uid195_invPolyEval_cma_ch : sm0_uid261_pT2_uid189_invPolyEval_cma_chtype(0 to 0);
    attribute preserve_syn_only of sm0_uid300_pT3_uid195_invPolyEval_cma_ch : signal is true;
    signal sm0_uid300_pT3_uid195_invPolyEval_cma_a0 : STD_LOGIC_VECTOR (26 downto 0);
    signal sm0_uid300_pT3_uid195_invPolyEval_cma_c0 : STD_LOGIC_VECTOR (26 downto 0);
    signal sm0_uid300_pT3_uid195_invPolyEval_cma_s0 : STD_LOGIC_VECTOR (53 downto 0);
    signal sm0_uid300_pT3_uid195_invPolyEval_cma_qq : STD_LOGIC_VECTOR (53 downto 0);
    signal sm0_uid300_pT3_uid195_invPolyEval_cma_q : STD_LOGIC_VECTOR (53 downto 0);
    signal sm0_uid300_pT3_uid195_invPolyEval_cma_ena0 : std_logic;
    signal sm0_uid300_pT3_uid195_invPolyEval_cma_ena1 : std_logic;
    signal sm0_uid300_pT3_uid195_invPolyEval_cma_ena2 : std_logic;
    signal sm0_uid337_pT4_uid201_invPolyEval_cma_reset : std_logic;
    signal sm0_uid337_pT4_uid201_invPolyEval_cma_ah : sm0_uid261_pT2_uid189_invPolyEval_cma_chtype(0 to 0);
    attribute preserve_syn_only of sm0_uid337_pT4_uid201_invPolyEval_cma_ah : signal is true;
    signal sm0_uid337_pT4_uid201_invPolyEval_cma_ch : sm0_uid261_pT2_uid189_invPolyEval_cma_chtype(0 to 0);
    attribute preserve_syn_only of sm0_uid337_pT4_uid201_invPolyEval_cma_ch : signal is true;
    signal sm0_uid337_pT4_uid201_invPolyEval_cma_a0 : STD_LOGIC_VECTOR (26 downto 0);
    signal sm0_uid337_pT4_uid201_invPolyEval_cma_c0 : STD_LOGIC_VECTOR (26 downto 0);
    signal sm0_uid337_pT4_uid201_invPolyEval_cma_s0 : STD_LOGIC_VECTOR (53 downto 0);
    signal sm0_uid337_pT4_uid201_invPolyEval_cma_qq : STD_LOGIC_VECTOR (53 downto 0);
    signal sm0_uid337_pT4_uid201_invPolyEval_cma_q : STD_LOGIC_VECTOR (53 downto 0);
    signal sm0_uid337_pT4_uid201_invPolyEval_cma_ena0 : std_logic;
    signal sm0_uid337_pT4_uid201_invPolyEval_cma_ena1 : std_logic;
    signal sm0_uid337_pT4_uid201_invPolyEval_cma_ena2 : std_logic;
    signal qDivProd_uid89_fpDivTest_im0_cma_reset : std_logic;
    signal qDivProd_uid89_fpDivTest_im0_cma_ah : sm0_uid230_divValPreNorm_uid59_fpDivTest_cma_ahtype(0 to 0);
    attribute preserve_syn_only of qDivProd_uid89_fpDivTest_im0_cma_ah : signal is true;
    type qDivProd_uid89_fpDivTest_im0_cma_chtype is array(NATURAL range <>) of UNSIGNED(25 downto 0);
    signal qDivProd_uid89_fpDivTest_im0_cma_ch : qDivProd_uid89_fpDivTest_im0_cma_chtype(0 to 0);
    attribute preserve_syn_only of qDivProd_uid89_fpDivTest_im0_cma_ch : signal is true;
    signal qDivProd_uid89_fpDivTest_im0_cma_a0 : STD_LOGIC_VECTOR (26 downto 0);
    signal qDivProd_uid89_fpDivTest_im0_cma_c0 : STD_LOGIC_VECTOR (25 downto 0);
    signal qDivProd_uid89_fpDivTest_im0_cma_s0 : STD_LOGIC_VECTOR (52 downto 0);
    signal qDivProd_uid89_fpDivTest_im0_cma_qq : STD_LOGIC_VECTOR (52 downto 0);
    signal qDivProd_uid89_fpDivTest_im0_cma_q : STD_LOGIC_VECTOR (52 downto 0);
    signal qDivProd_uid89_fpDivTest_im0_cma_ena0 : std_logic;
    signal qDivProd_uid89_fpDivTest_im0_cma_ena1 : std_logic;
    signal qDivProd_uid89_fpDivTest_im0_cma_ena2 : std_logic;
    signal qDivProd_uid89_fpDivTest_im8_cma_reset : std_logic;
    signal qDivProd_uid89_fpDivTest_im8_cma_ah : sm0_uid230_divValPreNorm_uid59_fpDivTest_cma_ahtype(0 to 0);
    attribute preserve_syn_only of qDivProd_uid89_fpDivTest_im8_cma_ah : signal is true;
    signal qDivProd_uid89_fpDivTest_im8_cma_ch : sm0_uid230_divValPreNorm_uid59_fpDivTest_cma_ahtype(0 to 0);
    attribute preserve_syn_only of qDivProd_uid89_fpDivTest_im8_cma_ch : signal is true;
    signal qDivProd_uid89_fpDivTest_im8_cma_a0 : STD_LOGIC_VECTOR (26 downto 0);
    signal qDivProd_uid89_fpDivTest_im8_cma_c0 : STD_LOGIC_VECTOR (26 downto 0);
    signal qDivProd_uid89_fpDivTest_im8_cma_s0 : STD_LOGIC_VECTOR (53 downto 0);
    signal qDivProd_uid89_fpDivTest_im8_cma_qq : STD_LOGIC_VECTOR (53 downto 0);
    signal qDivProd_uid89_fpDivTest_im8_cma_q : STD_LOGIC_VECTOR (53 downto 0);
    signal qDivProd_uid89_fpDivTest_im8_cma_ena0 : std_logic;
    signal qDivProd_uid89_fpDivTest_im8_cma_ena1 : std_logic;
    signal qDivProd_uid89_fpDivTest_im8_cma_ena2 : std_logic;
    signal multSumOfTwoTS_uid231_divValPreNorm_uid59_fpDivTest_cma_reset : std_logic;
    signal multSumOfTwoTS_uid231_divValPreNorm_uid59_fpDivTest_cma_ah : sm0_uid230_divValPreNorm_uid59_fpDivTest_cma_ahtype(0 to 1);
    attribute preserve_syn_only of multSumOfTwoTS_uid231_divValPreNorm_uid59_fpDivTest_cma_ah : signal is true;
    signal multSumOfTwoTS_uid231_divValPreNorm_uid59_fpDivTest_cma_ch : sm0_uid230_divValPreNorm_uid59_fpDivTest_cma_ahtype(0 to 1);
    attribute preserve_syn_only of multSumOfTwoTS_uid231_divValPreNorm_uid59_fpDivTest_cma_ch : signal is true;
    signal multSumOfTwoTS_uid231_divValPreNorm_uid59_fpDivTest_cma_a0 : STD_LOGIC_VECTOR (26 downto 0);
    signal multSumOfTwoTS_uid231_divValPreNorm_uid59_fpDivTest_cma_c0 : STD_LOGIC_VECTOR (26 downto 0);
    signal multSumOfTwoTS_uid231_divValPreNorm_uid59_fpDivTest_cma_a1 : STD_LOGIC_VECTOR (26 downto 0);
    signal multSumOfTwoTS_uid231_divValPreNorm_uid59_fpDivTest_cma_c1 : STD_LOGIC_VECTOR (26 downto 0);
    signal multSumOfTwoTS_uid231_divValPreNorm_uid59_fpDivTest_cma_s0 : STD_LOGIC_VECTOR (54 downto 0);
    signal multSumOfTwoTS_uid231_divValPreNorm_uid59_fpDivTest_cma_s1 : STD_LOGIC_VECTOR (63 downto 0);
    signal multSumOfTwoTS_uid231_divValPreNorm_uid59_fpDivTest_cma_qq : STD_LOGIC_VECTOR (54 downto 0);
    signal multSumOfTwoTS_uid231_divValPreNorm_uid59_fpDivTest_cma_q : STD_LOGIC_VECTOR (54 downto 0);
    signal multSumOfTwoTS_uid231_divValPreNorm_uid59_fpDivTest_cma_ena0 : std_logic;
    signal multSumOfTwoTS_uid231_divValPreNorm_uid59_fpDivTest_cma_ena1 : std_logic;
    signal multSumOfTwoTS_uid231_divValPreNorm_uid59_fpDivTest_cma_ena2 : std_logic;
    signal multSumOfTwoTS_uid301_pT3_uid195_invPolyEval_cma_reset : std_logic;
    type multSumOfTwoTS_uid301_pT3_uid195_invPolyEval_cma_ahtype is array(NATURAL range <>) of UNSIGNED(17 downto 0);
    signal multSumOfTwoTS_uid301_pT3_uid195_invPolyEval_cma_ah : multSumOfTwoTS_uid301_pT3_uid195_invPolyEval_cma_ahtype(0 to 1);
    attribute preserve_syn_only of multSumOfTwoTS_uid301_pT3_uid195_invPolyEval_cma_ah : signal is true;
    type multSumOfTwoTS_uid301_pT3_uid195_invPolyEval_cma_chtype is array(NATURAL range <>) of SIGNED(17 downto 0);
    signal multSumOfTwoTS_uid301_pT3_uid195_invPolyEval_cma_ch : multSumOfTwoTS_uid301_pT3_uid195_invPolyEval_cma_chtype(0 to 1);
    attribute preserve_syn_only of multSumOfTwoTS_uid301_pT3_uid195_invPolyEval_cma_ch : signal is true;
    signal multSumOfTwoTS_uid301_pT3_uid195_invPolyEval_cma_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal multSumOfTwoTS_uid301_pT3_uid195_invPolyEval_cma_c0 : STD_LOGIC_VECTOR (17 downto 0);
    signal multSumOfTwoTS_uid301_pT3_uid195_invPolyEval_cma_a1 : STD_LOGIC_VECTOR (17 downto 0);
    signal multSumOfTwoTS_uid301_pT3_uid195_invPolyEval_cma_c1 : STD_LOGIC_VECTOR (17 downto 0);
    signal multSumOfTwoTS_uid301_pT3_uid195_invPolyEval_cma_s0 : STD_LOGIC_VECTOR (36 downto 0);
    signal multSumOfTwoTS_uid301_pT3_uid195_invPolyEval_cma_qq : STD_LOGIC_VECTOR (36 downto 0);
    signal multSumOfTwoTS_uid301_pT3_uid195_invPolyEval_cma_q : STD_LOGIC_VECTOR (36 downto 0);
    signal multSumOfTwoTS_uid301_pT3_uid195_invPolyEval_cma_ena0 : std_logic;
    signal multSumOfTwoTS_uid301_pT3_uid195_invPolyEval_cma_ena1 : std_logic;
    signal multSumOfTwoTS_uid301_pT3_uid195_invPolyEval_cma_ena2 : std_logic;
    signal multSumOfTwoTS_uid338_pT4_uid201_invPolyEval_cma_reset : std_logic;
    signal multSumOfTwoTS_uid338_pT4_uid201_invPolyEval_cma_ah : sm0_uid230_divValPreNorm_uid59_fpDivTest_cma_ahtype(0 to 1);
    attribute preserve_syn_only of multSumOfTwoTS_uid338_pT4_uid201_invPolyEval_cma_ah : signal is true;
    signal multSumOfTwoTS_uid338_pT4_uid201_invPolyEval_cma_ch : sm0_uid261_pT2_uid189_invPolyEval_cma_chtype(0 to 1);
    attribute preserve_syn_only of multSumOfTwoTS_uid338_pT4_uid201_invPolyEval_cma_ch : signal is true;
    signal multSumOfTwoTS_uid338_pT4_uid201_invPolyEval_cma_a0 : STD_LOGIC_VECTOR (26 downto 0);
    signal multSumOfTwoTS_uid338_pT4_uid201_invPolyEval_cma_c0 : STD_LOGIC_VECTOR (26 downto 0);
    signal multSumOfTwoTS_uid338_pT4_uid201_invPolyEval_cma_a1 : STD_LOGIC_VECTOR (26 downto 0);
    signal multSumOfTwoTS_uid338_pT4_uid201_invPolyEval_cma_c1 : STD_LOGIC_VECTOR (26 downto 0);
    signal multSumOfTwoTS_uid338_pT4_uid201_invPolyEval_cma_s0 : STD_LOGIC_VECTOR (54 downto 0);
    signal multSumOfTwoTS_uid338_pT4_uid201_invPolyEval_cma_s1 : STD_LOGIC_VECTOR (63 downto 0);
    signal multSumOfTwoTS_uid338_pT4_uid201_invPolyEval_cma_qq : STD_LOGIC_VECTOR (54 downto 0);
    signal multSumOfTwoTS_uid338_pT4_uid201_invPolyEval_cma_q : STD_LOGIC_VECTOR (54 downto 0);
    signal multSumOfTwoTS_uid338_pT4_uid201_invPolyEval_cma_ena0 : std_logic;
    signal multSumOfTwoTS_uid338_pT4_uid201_invPolyEval_cma_ena1 : std_logic;
    signal multSumOfTwoTS_uid338_pT4_uid201_invPolyEval_cma_ena2 : std_logic;
    signal qDivProd_uid89_fpDivTest_ma3_cma_reset : std_logic;
    signal qDivProd_uid89_fpDivTest_ma3_cma_ah : sm0_uid230_divValPreNorm_uid59_fpDivTest_cma_ahtype(0 to 1);
    attribute preserve_syn_only of qDivProd_uid89_fpDivTest_ma3_cma_ah : signal is true;
    signal qDivProd_uid89_fpDivTest_ma3_cma_ch : sm0_uid230_divValPreNorm_uid59_fpDivTest_cma_ahtype(0 to 1);
    attribute preserve_syn_only of qDivProd_uid89_fpDivTest_ma3_cma_ch : signal is true;
    signal qDivProd_uid89_fpDivTest_ma3_cma_a0 : STD_LOGIC_VECTOR (26 downto 0);
    signal qDivProd_uid89_fpDivTest_ma3_cma_c0 : STD_LOGIC_VECTOR (26 downto 0);
    signal qDivProd_uid89_fpDivTest_ma3_cma_a1 : STD_LOGIC_VECTOR (26 downto 0);
    signal qDivProd_uid89_fpDivTest_ma3_cma_c1 : STD_LOGIC_VECTOR (26 downto 0);
    signal qDivProd_uid89_fpDivTest_ma3_cma_s0 : STD_LOGIC_VECTOR (54 downto 0);
    signal qDivProd_uid89_fpDivTest_ma3_cma_s1 : STD_LOGIC_VECTOR (63 downto 0);
    signal qDivProd_uid89_fpDivTest_ma3_cma_qq : STD_LOGIC_VECTOR (54 downto 0);
    signal qDivProd_uid89_fpDivTest_ma3_cma_q : STD_LOGIC_VECTOR (54 downto 0);
    signal qDivProd_uid89_fpDivTest_ma3_cma_ena0 : std_logic;
    signal qDivProd_uid89_fpDivTest_ma3_cma_ena1 : std_logic;
    signal qDivProd_uid89_fpDivTest_ma3_cma_ena2 : std_logic;
    signal qDivProd_uid89_fpDivTest_sums_result_add_0_0_UpperBits_for_b_q : STD_LOGIC_VECTOR (25 downto 0);
    signal qDivProd_uid89_fpDivTest_sums_result_add_0_0_p1_of_2_a : STD_LOGIC_VECTOR (78 downto 0);
    signal qDivProd_uid89_fpDivTest_sums_result_add_0_0_p1_of_2_b : STD_LOGIC_VECTOR (78 downto 0);
    signal qDivProd_uid89_fpDivTest_sums_result_add_0_0_p1_of_2_o : STD_LOGIC_VECTOR (78 downto 0);
    signal qDivProd_uid89_fpDivTest_sums_result_add_0_0_p1_of_2_c : STD_LOGIC_VECTOR (0 downto 0);
    signal qDivProd_uid89_fpDivTest_sums_result_add_0_0_p1_of_2_q : STD_LOGIC_VECTOR (77 downto 0);
    signal qDivProd_uid89_fpDivTest_sums_result_add_0_0_p2_of_2_a : STD_LOGIC_VECTOR (31 downto 0);
    signal qDivProd_uid89_fpDivTest_sums_result_add_0_0_p2_of_2_b : STD_LOGIC_VECTOR (31 downto 0);
    signal qDivProd_uid89_fpDivTest_sums_result_add_0_0_p2_of_2_o : STD_LOGIC_VECTOR (31 downto 0);
    signal qDivProd_uid89_fpDivTest_sums_result_add_0_0_p2_of_2_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal qDivProd_uid89_fpDivTest_sums_result_add_0_0_p2_of_2_q : STD_LOGIC_VECTOR (29 downto 0);
    signal qDivProd_uid89_fpDivTest_sums_result_add_0_0_BitJoin_for_q_q : STD_LOGIC_VECTOR (107 downto 0);
    signal qDivProd_uid89_fpDivTest_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_b_q : STD_LOGIC_VECTOR (77 downto 0);
    signal qDivProd_uid89_fpDivTest_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_c_q : STD_LOGIC_VECTOR (29 downto 0);
    signal qDivProd_uid89_fpDivTest_sums_result_add_0_0_BitSelect_for_b_BitJoin_for_c_q : STD_LOGIC_VECTOR (29 downto 0);
    signal z0_uid356_fracXIsZero_uid25_fpDivTest_merged_bit_select_b : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid356_fracXIsZero_uid25_fpDivTest_merged_bit_select_c : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid356_fracXIsZero_uid25_fpDivTest_merged_bit_select_d : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid356_fracXIsZero_uid25_fpDivTest_merged_bit_select_e : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid356_fracXIsZero_uid25_fpDivTest_merged_bit_select_f : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid356_fracXIsZero_uid25_fpDivTest_merged_bit_select_g : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid356_fracXIsZero_uid25_fpDivTest_merged_bit_select_h : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid356_fracXIsZero_uid25_fpDivTest_merged_bit_select_i : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid356_fracXIsZero_uid25_fpDivTest_merged_bit_select_j : STD_LOGIC_VECTOR (3 downto 0);
    signal c0_uid357_fracXIsZero_uid25_fpDivTest_merged_bit_select_b : STD_LOGIC_VECTOR (5 downto 0);
    signal c0_uid357_fracXIsZero_uid25_fpDivTest_merged_bit_select_c : STD_LOGIC_VECTOR (5 downto 0);
    signal c0_uid357_fracXIsZero_uid25_fpDivTest_merged_bit_select_d : STD_LOGIC_VECTOR (5 downto 0);
    signal c0_uid357_fracXIsZero_uid25_fpDivTest_merged_bit_select_e : STD_LOGIC_VECTOR (5 downto 0);
    signal c0_uid357_fracXIsZero_uid25_fpDivTest_merged_bit_select_f : STD_LOGIC_VECTOR (5 downto 0);
    signal c0_uid357_fracXIsZero_uid25_fpDivTest_merged_bit_select_g : STD_LOGIC_VECTOR (5 downto 0);
    signal c0_uid357_fracXIsZero_uid25_fpDivTest_merged_bit_select_h : STD_LOGIC_VECTOR (5 downto 0);
    signal c0_uid357_fracXIsZero_uid25_fpDivTest_merged_bit_select_i : STD_LOGIC_VECTOR (5 downto 0);
    signal c0_uid357_fracXIsZero_uid25_fpDivTest_merged_bit_select_j : STD_LOGIC_VECTOR (3 downto 0);
    signal y0_uid350_fracYZero_uid15_fpDivTest_merged_bit_select_b : STD_LOGIC_VECTOR (25 downto 0);
    signal y0_uid350_fracYZero_uid15_fpDivTest_merged_bit_select_c : STD_LOGIC_VECTOR (26 downto 0);
    signal qDivProd_uid89_fpDivTest_bs1_merged_bit_select_b : STD_LOGIC_VECTOR (26 downto 0);
    signal qDivProd_uid89_fpDivTest_bs1_merged_bit_select_c : STD_LOGIC_VECTOR (26 downto 0);
    signal qDivProd_uid89_fpDivTest_bs2_merged_bit_select_b : STD_LOGIC_VECTOR (25 downto 0);
    signal qDivProd_uid89_fpDivTest_bs2_merged_bit_select_c : STD_LOGIC_VECTOR (26 downto 0);
    signal lowRangeA_uid240_divValPreNorm_uid59_fpDivTest_merged_bit_select_b : STD_LOGIC_VECTOR (19 downto 0);
    signal lowRangeA_uid240_divValPreNorm_uid59_fpDivTest_merged_bit_select_c : STD_LOGIC_VECTOR (61 downto 0);
    signal x0_uid452_eq0_uid351_fracYZero_uid15_fpDivTest_merged_bit_select_b : STD_LOGIC_VECTOR (12 downto 0);
    signal x0_uid452_eq0_uid351_fracYZero_uid15_fpDivTest_merged_bit_select_c : STD_LOGIC_VECTOR (12 downto 0);
    signal x0_uid459_eq1_uid354_fracYZero_uid15_fpDivTest_merged_bit_select_b : STD_LOGIC_VECTOR (12 downto 0);
    signal x0_uid459_eq1_uid354_fracYZero_uid15_fpDivTest_merged_bit_select_c : STD_LOGIC_VECTOR (12 downto 0);
    signal qDivProd_uid89_fpDivTest_sums_result_add_0_0_BitSelect_for_b_tessel0_0_merged_bit_select_b : STD_LOGIC_VECTOR (77 downto 0);
    signal qDivProd_uid89_fpDivTest_sums_result_add_0_0_BitSelect_for_b_tessel0_0_merged_bit_select_c : STD_LOGIC_VECTOR (3 downto 0);
    signal qDivProd_uid89_fpDivTest_sums_result_add_0_0_BitSelect_for_a_tessel0_1_merged_bit_select_b : STD_LOGIC_VECTOR (23 downto 0);
    signal qDivProd_uid89_fpDivTest_sums_result_add_0_0_BitSelect_for_a_tessel0_1_merged_bit_select_c : STD_LOGIC_VECTOR (28 downto 0);
    signal lowRangeB_uid236_divValPreNorm_uid59_fpDivTest_merged_bit_select_b : STD_LOGIC_VECTOR (12 downto 0);
    signal lowRangeB_uid236_divValPreNorm_uid59_fpDivTest_merged_bit_select_c : STD_LOGIC_VECTOR (41 downto 0);
    signal y0_uid453_eq0_uid351_fracYZero_uid15_fpDivTest_merged_bit_select_b : STD_LOGIC_VECTOR (12 downto 0);
    signal y0_uid453_eq0_uid351_fracYZero_uid15_fpDivTest_merged_bit_select_c : STD_LOGIC_VECTOR (12 downto 0);
    signal y0_uid460_eq1_uid354_fracYZero_uid15_fpDivTest_merged_bit_select_b : STD_LOGIC_VECTOR (12 downto 0);
    signal y0_uid460_eq1_uid354_fracYZero_uid15_fpDivTest_merged_bit_select_c : STD_LOGIC_VECTOR (13 downto 0);
    signal redist0_lowRangeB_uid236_divValPreNorm_uid59_fpDivTest_merged_bit_select_b_1_q : STD_LOGIC_VECTOR (12 downto 0);
    signal redist1_qDivProd_uid89_fpDivTest_sums_result_add_0_0_BitSelect_for_a_tessel0_1_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (28 downto 0);
    signal redist2_qDivProd_uid89_fpDivTest_sums_result_add_0_0_BitSelect_for_b_tessel0_0_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist3_qDivProd_uid89_fpDivTest_bs2_merged_bit_select_b_1_q : STD_LOGIC_VECTOR (25 downto 0);
    signal redist4_qDivProd_uid89_fpDivTest_bs2_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (26 downto 0);
    signal redist5_qDivProd_uid89_fpDivTest_bs1_merged_bit_select_b_1_q : STD_LOGIC_VECTOR (26 downto 0);
    signal redist6_qDivProd_uid89_fpDivTest_bs1_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (26 downto 0);
    signal redist7_qDivProd_uid89_fpDivTest_sums_result_add_0_0_p1_of_2_q_1_q : STD_LOGIC_VECTOR (77 downto 0);
    signal redist8_qDivProd_uid89_fpDivTest_ma3_cma_q_1_q : STD_LOGIC_VECTOR (54 downto 0);
    signal redist9_multSumOfTwoTS_uid338_pT4_uid201_invPolyEval_cma_q_1_q : STD_LOGIC_VECTOR (54 downto 0);
    signal redist10_multSumOfTwoTS_uid301_pT3_uid195_invPolyEval_cma_q_1_q : STD_LOGIC_VECTOR (36 downto 0);
    signal redist11_multSumOfTwoTS_uid231_divValPreNorm_uid59_fpDivTest_cma_q_1_q : STD_LOGIC_VECTOR (54 downto 0);
    signal redist12_qDivProd_uid89_fpDivTest_im8_cma_q_1_q : STD_LOGIC_VECTOR (53 downto 0);
    signal redist13_qDivProd_uid89_fpDivTest_im0_cma_q_1_q : STD_LOGIC_VECTOR (52 downto 0);
    signal redist14_sm0_uid337_pT4_uid201_invPolyEval_cma_q_1_q : STD_LOGIC_VECTOR (53 downto 0);
    signal redist15_sm0_uid300_pT3_uid195_invPolyEval_cma_q_1_q : STD_LOGIC_VECTOR (53 downto 0);
    signal redist16_sm0_uid261_pT2_uid189_invPolyEval_cma_q_1_q : STD_LOGIC_VECTOR (53 downto 0);
    signal redist17_sm0_uid233_divValPreNorm_uid59_fpDivTest_cma_q_1_q : STD_LOGIC_VECTOR (13 downto 0);
    signal redist18_sm0_uid230_divValPreNorm_uid59_fpDivTest_cma_q_1_q : STD_LOGIC_VECTOR (53 downto 0);
    signal redist19_memoryC3_uid170_invTables_lutmem_r_1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist20_memoryC3_uid169_invTables_lutmem_r_1_q : STD_LOGIC_VECTOR (9 downto 0);
    signal redist21_memoryC3_uid168_invTables_lutmem_r_1_q : STD_LOGIC_VECTOR (9 downto 0);
    signal redist22_memoryC2_uid165_invTables_lutmem_r_1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist23_memoryC2_uid164_invTables_lutmem_r_1_q : STD_LOGIC_VECTOR (9 downto 0);
    signal redist24_memoryC2_uid163_invTables_lutmem_r_1_q : STD_LOGIC_VECTOR (9 downto 0);
    signal redist25_memoryC2_uid162_invTables_lutmem_r_1_q : STD_LOGIC_VECTOR (9 downto 0);
    signal redist26_memoryC1_uid159_invTables_lutmem_r_1_q : STD_LOGIC_VECTOR (8 downto 0);
    signal redist27_memoryC1_uid158_invTables_lutmem_r_1_q : STD_LOGIC_VECTOR (9 downto 0);
    signal redist28_memoryC1_uid157_invTables_lutmem_r_1_q : STD_LOGIC_VECTOR (9 downto 0);
    signal redist29_memoryC1_uid156_invTables_lutmem_r_1_q : STD_LOGIC_VECTOR (9 downto 0);
    signal redist30_memoryC1_uid155_invTables_lutmem_r_1_q : STD_LOGIC_VECTOR (9 downto 0);
    signal redist31_memoryC0_uid151_invTables_lutmem_r_1_q : STD_LOGIC_VECTOR (9 downto 0);
    signal redist32_memoryC0_uid150_invTables_lutmem_r_1_q : STD_LOGIC_VECTOR (9 downto 0);
    signal redist33_memoryC0_uid149_invTables_lutmem_r_1_q : STD_LOGIC_VECTOR (9 downto 0);
    signal redist34_memoryC0_uid148_invTables_lutmem_r_1_q : STD_LOGIC_VECTOR (9 downto 0);
    signal redist35_memoryC0_uid147_invTables_lutmem_r_1_q : STD_LOGIC_VECTOR (9 downto 0);
    signal redist36_memoryC0_uid146_invTables_lutmem_r_1_q : STD_LOGIC_VECTOR (9 downto 0);
    signal redist37_os_uid346_pT4_uid201_invPolyEval_b_1_q : STD_LOGIC_VECTOR (51 downto 0);
    signal redist38_sm0_uid340_pT4_uid201_invPolyEval_q_1_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist39_aboveLeftY_uid336_pT4_uid201_invPolyEval_b_2_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist39_aboveLeftY_uid336_pT4_uid201_invPolyEval_b_2_delay_0 : STD_LOGIC_VECTOR (1 downto 0);
    signal redist40_aboveLeftX_uid335_pT4_uid201_invPolyEval_b_2_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist40_aboveLeftX_uid335_pT4_uid201_invPolyEval_b_2_delay_0 : STD_LOGIC_VECTOR (1 downto 0);
    signal redist41_rightBottomX_bottomRange_uid331_pT4_uid201_invPolyEval_b_1_q : STD_LOGIC_VECTOR (14 downto 0);
    signal redist42_topRangeY_uid324_pT4_uid201_invPolyEval_b_1_q : STD_LOGIC_VECTOR (26 downto 0);
    signal redist43_topRangeX_uid323_pT4_uid201_invPolyEval_b_1_q : STD_LOGIC_VECTOR (26 downto 0);
    signal redist44_highABits_uid269_pT2_uid189_invPolyEval_b_1_q : STD_LOGIC_VECTOR (34 downto 0);
    signal redist45_lowRangeA_uid268_pT2_uid189_invPolyEval_b_1_q : STD_LOGIC_VECTOR (19 downto 0);
    signal redist46_sm0_uid263_pT2_uid189_invPolyEval_q_1_q : STD_LOGIC_VECTOR (6 downto 0);
    signal redist47_sm0_uid262_pT2_uid189_invPolyEval_q_1_q : STD_LOGIC_VECTOR (6 downto 0);
    signal redist48_rightBottomY_uid258_pT2_uid189_invPolyEval_b_2_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist48_rightBottomY_uid258_pT2_uid189_invPolyEval_b_2_delay_0 : STD_LOGIC_VECTOR (5 downto 0);
    signal redist49_rightBottomX_uid257_pT2_uid189_invPolyEval_b_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist49_rightBottomX_uid257_pT2_uid189_invPolyEval_b_2_delay_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal redist50_aboveLeftY_uid256_pT2_uid189_invPolyEval_b_1_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist51_aboveLeftX_uid255_pT2_uid189_invPolyEval_b_1_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist52_os_uid244_divValPreNorm_uid59_fpDivTest_b_1_q : STD_LOGIC_VECTOR (56 downto 0);
    signal redist53_sm0_uid234_divValPreNorm_uid59_fpDivTest_q_1_q : STD_LOGIC_VECTOR (6 downto 0);
    signal redist54_rightBottomX_uid228_divValPreNorm_uid59_fpDivTest_b_3_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist54_rightBottomX_uid228_divValPreNorm_uid59_fpDivTest_b_3_delay_0 : STD_LOGIC_VECTOR (1 downto 0);
    signal redist54_rightBottomX_uid228_divValPreNorm_uid59_fpDivTest_b_3_delay_1 : STD_LOGIC_VECTOR (1 downto 0);
    signal redist55_aboveLeftX_uid226_divValPreNorm_uid59_fpDivTest_b_1_q : STD_LOGIC_VECTOR (6 downto 0);
    signal redist56_rightBottomX_uid224_divValPreNorm_uid59_fpDivTest_b_1_q : STD_LOGIC_VECTOR (26 downto 0);
    signal redist57_topRangeX_uid217_divValPreNorm_uid59_fpDivTest_b_1_q : STD_LOGIC_VECTOR (26 downto 0);
    signal redist58_highBBits_uid197_invPolyEval_b_1_q : STD_LOGIC_VECTOR (38 downto 0);
    signal redist59_lowRangeB_uid196_invPolyEval_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist60_highBBits_uid191_invPolyEval_b_1_q : STD_LOGIC_VECTOR (27 downto 0);
    signal redist61_lowRangeB_uid190_invPolyEval_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist62_highBBits_uid185_invPolyEval_b_1_q : STD_LOGIC_VECTOR (16 downto 0);
    signal redist63_lowRangeB_uid184_invPolyEval_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist64_sRPostExc_uid143_fpDivTest_q_13_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist65_excREnc_uid133_fpDivTest_q_13_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist66_ovfIncRnd_uid109_fpDivTest_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist67_fracPostRndFPostUlp_uid106_fpDivTest_b_1_q : STD_LOGIC_VECTOR (51 downto 0);
    signal redist68_fracPostRndFT_uid104_fpDivTest_b_1_q : STD_LOGIC_VECTOR (51 downto 0);
    signal redist69_fracPostRndFT_uid104_fpDivTest_b_2_q : STD_LOGIC_VECTOR (51 downto 0);
    signal redist70_extraUlp_uid103_fpDivTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist72_qDivProdLTX_opA_uid98_fpDivTest_b_1_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist73_qDivProdFracWF_uid97_fpDivTest_b_2_q : STD_LOGIC_VECTOR (51 downto 0);
    signal redist73_qDivProdFracWF_uid97_fpDivTest_b_2_delay_0 : STD_LOGIC_VECTOR (51 downto 0);
    signal redist77_norm_uid64_fpDivTest_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist78_lOAdded_uid57_fpDivTest_q_1_q : STD_LOGIC_VECTOR (52 downto 0);
    signal redist79_lOAdded_uid57_fpDivTest_q_3_q : STD_LOGIC_VECTOR (52 downto 0);
    signal redist79_lOAdded_uid57_fpDivTest_q_3_delay_0 : STD_LOGIC_VECTOR (52 downto 0);
    signal redist81_invYO_uid55_fpDivTest_b_12_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist82_yPE_uid52_fpDivTest_b_2_q : STD_LOGIC_VECTOR (40 downto 0);
    signal redist82_yPE_uid52_fpDivTest_b_2_delay_0 : STD_LOGIC_VECTOR (40 downto 0);
    signal redist86_yAddr_uid51_fpDivTest_b_6_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist86_yAddr_uid51_fpDivTest_b_6_delay_0 : STD_LOGIC_VECTOR (10 downto 0);
    signal redist86_yAddr_uid51_fpDivTest_b_6_delay_1 : STD_LOGIC_VECTOR (10 downto 0);
    signal redist86_yAddr_uid51_fpDivTest_b_6_delay_2 : STD_LOGIC_VECTOR (10 downto 0);
    signal redist88_yAddr_uid51_fpDivTest_b_23_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist88_yAddr_uid51_fpDivTest_b_23_delay_0 : STD_LOGIC_VECTOR (10 downto 0);
    signal redist88_yAddr_uid51_fpDivTest_b_23_delay_1 : STD_LOGIC_VECTOR (10 downto 0);
    signal redist88_yAddr_uid51_fpDivTest_b_23_delay_2 : STD_LOGIC_VECTOR (10 downto 0);
    signal redist90_signR_uid46_fpDivTest_q_49_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist91_expXIsMax_uid24_fpDivTest_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist92_excZ_x_uid23_fpDivTest_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist94_fracY_uid13_fpDivTest_b_46_q : STD_LOGIC_VECTOR (51 downto 0);
    signal redist94_fracY_uid13_fpDivTest_b_46_delay_0 : STD_LOGIC_VECTOR (51 downto 0);
    signal redist94_fracY_uid13_fpDivTest_b_46_delay_1 : STD_LOGIC_VECTOR (51 downto 0);
    signal redist95_fracY_uid13_fpDivTest_b_47_q : STD_LOGIC_VECTOR (51 downto 0);
    signal redist97_expY_uid12_fpDivTest_b_47_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist97_expY_uid12_fpDivTest_b_47_delay_0 : STD_LOGIC_VECTOR (10 downto 0);
    signal redist97_expY_uid12_fpDivTest_b_47_delay_1 : STD_LOGIC_VECTOR (10 downto 0);
    signal redist98_expY_uid12_fpDivTest_b_48_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist99_fracX_uid10_fpDivTest_b_35_q : STD_LOGIC_VECTOR (51 downto 0);
    signal redist99_fracX_uid10_fpDivTest_b_35_delay_0 : STD_LOGIC_VECTOR (51 downto 0);
    signal redist101_fracX_uid10_fpDivTest_b_47_q : STD_LOGIC_VECTOR (51 downto 0);
    signal redist103_expX_uid9_fpDivTest_b_47_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist103_expX_uid9_fpDivTest_b_47_delay_0 : STD_LOGIC_VECTOR (10 downto 0);
    signal redist103_expX_uid9_fpDivTest_b_47_delay_1 : STD_LOGIC_VECTOR (10 downto 0);
    signal redist71_qDivProdLTX_opB_uid100_fpDivTest_q_12_inputreg0_q : STD_LOGIC_VECTOR (62 downto 0);
    signal redist71_qDivProdLTX_opB_uid100_fpDivTest_q_12_mem_reset0 : std_logic;
    signal redist71_qDivProdLTX_opB_uid100_fpDivTest_q_12_mem_ia : STD_LOGIC_VECTOR (62 downto 0);
    signal redist71_qDivProdLTX_opB_uid100_fpDivTest_q_12_mem_aa : STD_LOGIC_VECTOR (3 downto 0);
    signal redist71_qDivProdLTX_opB_uid100_fpDivTest_q_12_mem_ab : STD_LOGIC_VECTOR (3 downto 0);
    signal redist71_qDivProdLTX_opB_uid100_fpDivTest_q_12_mem_iq : STD_LOGIC_VECTOR (62 downto 0);
    signal redist71_qDivProdLTX_opB_uid100_fpDivTest_q_12_mem_q : STD_LOGIC_VECTOR (62 downto 0);
    signal redist71_qDivProdLTX_opB_uid100_fpDivTest_q_12_rdcnt_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist71_qDivProdLTX_opB_uid100_fpDivTest_q_12_rdcnt_i : UNSIGNED (3 downto 0);
    attribute preserve_syn_only of redist71_qDivProdLTX_opB_uid100_fpDivTest_q_12_rdcnt_i : signal is true;
    signal redist71_qDivProdLTX_opB_uid100_fpDivTest_q_12_rdcnt_eq : std_logic;
    attribute preserve_syn_only of redist71_qDivProdLTX_opB_uid100_fpDivTest_q_12_rdcnt_eq : signal is true;
    signal redist71_qDivProdLTX_opB_uid100_fpDivTest_q_12_wraddr_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist71_qDivProdLTX_opB_uid100_fpDivTest_q_12_mem_last_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist71_qDivProdLTX_opB_uid100_fpDivTest_q_12_cmp_b : STD_LOGIC_VECTOR (4 downto 0);
    signal redist71_qDivProdLTX_opB_uid100_fpDivTest_q_12_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist71_qDivProdLTX_opB_uid100_fpDivTest_q_12_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist71_qDivProdLTX_opB_uid100_fpDivTest_q_12_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist71_qDivProdLTX_opB_uid100_fpDivTest_q_12_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist71_qDivProdLTX_opB_uid100_fpDivTest_q_12_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist71_qDivProdLTX_opB_uid100_fpDivTest_q_12_sticky_ena_q : signal is true;
    signal redist71_qDivProdLTX_opB_uid100_fpDivTest_q_12_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist74_qDivProdExp_opA_uid94_fpDivTest_q_10_outputreg0_q : STD_LOGIC_VECTOR (11 downto 0);
    signal redist74_qDivProdExp_opA_uid94_fpDivTest_q_10_mem_reset0 : std_logic;
    signal redist74_qDivProdExp_opA_uid94_fpDivTest_q_10_mem_ia : STD_LOGIC_VECTOR (11 downto 0);
    signal redist74_qDivProdExp_opA_uid94_fpDivTest_q_10_mem_aa : STD_LOGIC_VECTOR (2 downto 0);
    signal redist74_qDivProdExp_opA_uid94_fpDivTest_q_10_mem_ab : STD_LOGIC_VECTOR (2 downto 0);
    signal redist74_qDivProdExp_opA_uid94_fpDivTest_q_10_mem_iq : STD_LOGIC_VECTOR (11 downto 0);
    signal redist74_qDivProdExp_opA_uid94_fpDivTest_q_10_mem_q : STD_LOGIC_VECTOR (11 downto 0);
    signal redist74_qDivProdExp_opA_uid94_fpDivTest_q_10_rdcnt_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist74_qDivProdExp_opA_uid94_fpDivTest_q_10_rdcnt_i : UNSIGNED (2 downto 0);
    attribute preserve_syn_only of redist74_qDivProdExp_opA_uid94_fpDivTest_q_10_rdcnt_i : signal is true;
    signal redist74_qDivProdExp_opA_uid94_fpDivTest_q_10_rdcnt_eq : std_logic;
    attribute preserve_syn_only of redist74_qDivProdExp_opA_uid94_fpDivTest_q_10_rdcnt_eq : signal is true;
    signal redist74_qDivProdExp_opA_uid94_fpDivTest_q_10_wraddr_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist74_qDivProdExp_opA_uid94_fpDivTest_q_10_mem_last_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist74_qDivProdExp_opA_uid94_fpDivTest_q_10_cmp_b : STD_LOGIC_VECTOR (3 downto 0);
    signal redist74_qDivProdExp_opA_uid94_fpDivTest_q_10_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist74_qDivProdExp_opA_uid94_fpDivTest_q_10_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist74_qDivProdExp_opA_uid94_fpDivTest_q_10_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist74_qDivProdExp_opA_uid94_fpDivTest_q_10_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist74_qDivProdExp_opA_uid94_fpDivTest_q_10_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist74_qDivProdExp_opA_uid94_fpDivTest_q_10_sticky_ena_q : signal is true;
    signal redist74_qDivProdExp_opA_uid94_fpDivTest_q_10_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist75_expPostRndFR_uid81_fpDivTest_b_15_inputreg0_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist75_expPostRndFR_uid81_fpDivTest_b_15_outputreg0_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist75_expPostRndFR_uid81_fpDivTest_b_15_mem_reset0 : std_logic;
    signal redist75_expPostRndFR_uid81_fpDivTest_b_15_mem_ia : STD_LOGIC_VECTOR (10 downto 0);
    signal redist75_expPostRndFR_uid81_fpDivTest_b_15_mem_aa : STD_LOGIC_VECTOR (3 downto 0);
    signal redist75_expPostRndFR_uid81_fpDivTest_b_15_mem_ab : STD_LOGIC_VECTOR (3 downto 0);
    signal redist75_expPostRndFR_uid81_fpDivTest_b_15_mem_iq : STD_LOGIC_VECTOR (10 downto 0);
    signal redist75_expPostRndFR_uid81_fpDivTest_b_15_mem_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist75_expPostRndFR_uid81_fpDivTest_b_15_rdcnt_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist75_expPostRndFR_uid81_fpDivTest_b_15_rdcnt_i : UNSIGNED (3 downto 0);
    attribute preserve_syn_only of redist75_expPostRndFR_uid81_fpDivTest_b_15_rdcnt_i : signal is true;
    signal redist75_expPostRndFR_uid81_fpDivTest_b_15_rdcnt_eq : std_logic;
    attribute preserve_syn_only of redist75_expPostRndFR_uid81_fpDivTest_b_15_rdcnt_eq : signal is true;
    signal redist75_expPostRndFR_uid81_fpDivTest_b_15_wraddr_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist75_expPostRndFR_uid81_fpDivTest_b_15_mem_last_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist75_expPostRndFR_uid81_fpDivTest_b_15_cmp_b : STD_LOGIC_VECTOR (4 downto 0);
    signal redist75_expPostRndFR_uid81_fpDivTest_b_15_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist75_expPostRndFR_uid81_fpDivTest_b_15_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist75_expPostRndFR_uid81_fpDivTest_b_15_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist75_expPostRndFR_uid81_fpDivTest_b_15_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist75_expPostRndFR_uid81_fpDivTest_b_15_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist75_expPostRndFR_uid81_fpDivTest_b_15_sticky_ena_q : signal is true;
    signal redist75_expPostRndFR_uid81_fpDivTest_b_15_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist76_fracPostRndF_uid80_fpDivTest_q_13_inputreg1_q : STD_LOGIC_VECTOR (52 downto 0);
    signal redist76_fracPostRndF_uid80_fpDivTest_q_13_outputreg0_q : STD_LOGIC_VECTOR (52 downto 0);
    signal redist76_fracPostRndF_uid80_fpDivTest_q_13_inputreg0_q : STD_LOGIC_VECTOR (52 downto 0);
    signal redist76_fracPostRndF_uid80_fpDivTest_q_13_mem_reset0 : std_logic;
    signal redist76_fracPostRndF_uid80_fpDivTest_q_13_mem_ia : STD_LOGIC_VECTOR (52 downto 0);
    signal redist76_fracPostRndF_uid80_fpDivTest_q_13_mem_aa : STD_LOGIC_VECTOR (3 downto 0);
    signal redist76_fracPostRndF_uid80_fpDivTest_q_13_mem_ab : STD_LOGIC_VECTOR (3 downto 0);
    signal redist76_fracPostRndF_uid80_fpDivTest_q_13_mem_iq : STD_LOGIC_VECTOR (52 downto 0);
    signal redist76_fracPostRndF_uid80_fpDivTest_q_13_mem_q : STD_LOGIC_VECTOR (52 downto 0);
    signal redist76_fracPostRndF_uid80_fpDivTest_q_13_rdcnt_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist76_fracPostRndF_uid80_fpDivTest_q_13_rdcnt_i : UNSIGNED (3 downto 0);
    attribute preserve_syn_only of redist76_fracPostRndF_uid80_fpDivTest_q_13_rdcnt_i : signal is true;
    signal redist76_fracPostRndF_uid80_fpDivTest_q_13_rdcnt_eq : std_logic;
    attribute preserve_syn_only of redist76_fracPostRndF_uid80_fpDivTest_q_13_rdcnt_eq : signal is true;
    signal redist76_fracPostRndF_uid80_fpDivTest_q_13_wraddr_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist76_fracPostRndF_uid80_fpDivTest_q_13_mem_last_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist76_fracPostRndF_uid80_fpDivTest_q_13_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist76_fracPostRndF_uid80_fpDivTest_q_13_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist76_fracPostRndF_uid80_fpDivTest_q_13_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist76_fracPostRndF_uid80_fpDivTest_q_13_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist76_fracPostRndF_uid80_fpDivTest_q_13_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist76_fracPostRndF_uid80_fpDivTest_q_13_sticky_ena_q : signal is true;
    signal redist76_fracPostRndF_uid80_fpDivTest_q_13_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist80_lOAdded_uid57_fpDivTest_q_10_outputreg1_q : STD_LOGIC_VECTOR (52 downto 0);
    signal redist80_lOAdded_uid57_fpDivTest_q_10_outputreg0_q : STD_LOGIC_VECTOR (52 downto 0);
    signal redist80_lOAdded_uid57_fpDivTest_q_10_mem_reset0 : std_logic;
    signal redist80_lOAdded_uid57_fpDivTest_q_10_mem_ia : STD_LOGIC_VECTOR (52 downto 0);
    signal redist80_lOAdded_uid57_fpDivTest_q_10_mem_aa : STD_LOGIC_VECTOR (1 downto 0);
    signal redist80_lOAdded_uid57_fpDivTest_q_10_mem_ab : STD_LOGIC_VECTOR (1 downto 0);
    signal redist80_lOAdded_uid57_fpDivTest_q_10_mem_iq : STD_LOGIC_VECTOR (52 downto 0);
    signal redist80_lOAdded_uid57_fpDivTest_q_10_mem_q : STD_LOGIC_VECTOR (52 downto 0);
    signal redist80_lOAdded_uid57_fpDivTest_q_10_rdcnt_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist80_lOAdded_uid57_fpDivTest_q_10_rdcnt_i : UNSIGNED (1 downto 0);
    attribute preserve_syn_only of redist80_lOAdded_uid57_fpDivTest_q_10_rdcnt_i : signal is true;
    signal redist80_lOAdded_uid57_fpDivTest_q_10_wraddr_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist80_lOAdded_uid57_fpDivTest_q_10_mem_last_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist80_lOAdded_uid57_fpDivTest_q_10_cmp_b : STD_LOGIC_VECTOR (2 downto 0);
    signal redist80_lOAdded_uid57_fpDivTest_q_10_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist80_lOAdded_uid57_fpDivTest_q_10_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist80_lOAdded_uid57_fpDivTest_q_10_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist80_lOAdded_uid57_fpDivTest_q_10_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist80_lOAdded_uid57_fpDivTest_q_10_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist80_lOAdded_uid57_fpDivTest_q_10_sticky_ena_q : signal is true;
    signal redist80_lOAdded_uid57_fpDivTest_q_10_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist83_yPE_uid52_fpDivTest_b_9_outputreg1_q : STD_LOGIC_VECTOR (40 downto 0);
    signal redist83_yPE_uid52_fpDivTest_b_9_outputreg0_q : STD_LOGIC_VECTOR (40 downto 0);
    signal redist83_yPE_uid52_fpDivTest_b_9_mem_reset0 : std_logic;
    signal redist83_yPE_uid52_fpDivTest_b_9_mem_ia : STD_LOGIC_VECTOR (40 downto 0);
    signal redist83_yPE_uid52_fpDivTest_b_9_mem_aa : STD_LOGIC_VECTOR (1 downto 0);
    signal redist83_yPE_uid52_fpDivTest_b_9_mem_ab : STD_LOGIC_VECTOR (1 downto 0);
    signal redist83_yPE_uid52_fpDivTest_b_9_mem_iq : STD_LOGIC_VECTOR (40 downto 0);
    signal redist83_yPE_uid52_fpDivTest_b_9_mem_q : STD_LOGIC_VECTOR (40 downto 0);
    signal redist83_yPE_uid52_fpDivTest_b_9_rdcnt_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist83_yPE_uid52_fpDivTest_b_9_rdcnt_i : UNSIGNED (1 downto 0);
    attribute preserve_syn_only of redist83_yPE_uid52_fpDivTest_b_9_rdcnt_i : signal is true;
    signal redist83_yPE_uid52_fpDivTest_b_9_wraddr_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist83_yPE_uid52_fpDivTest_b_9_mem_last_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist83_yPE_uid52_fpDivTest_b_9_cmp_b : STD_LOGIC_VECTOR (2 downto 0);
    signal redist83_yPE_uid52_fpDivTest_b_9_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist83_yPE_uid52_fpDivTest_b_9_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist83_yPE_uid52_fpDivTest_b_9_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist83_yPE_uid52_fpDivTest_b_9_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist83_yPE_uid52_fpDivTest_b_9_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist83_yPE_uid52_fpDivTest_b_9_sticky_ena_q : signal is true;
    signal redist83_yPE_uid52_fpDivTest_b_9_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist84_yPE_uid52_fpDivTest_b_18_inputreg1_q : STD_LOGIC_VECTOR (40 downto 0);
    signal redist84_yPE_uid52_fpDivTest_b_18_outputreg1_q : STD_LOGIC_VECTOR (40 downto 0);
    signal redist84_yPE_uid52_fpDivTest_b_18_inputreg0_q : STD_LOGIC_VECTOR (40 downto 0);
    signal redist84_yPE_uid52_fpDivTest_b_18_outputreg0_q : STD_LOGIC_VECTOR (40 downto 0);
    signal redist84_yPE_uid52_fpDivTest_b_18_mem_reset0 : std_logic;
    signal redist84_yPE_uid52_fpDivTest_b_18_mem_ia : STD_LOGIC_VECTOR (40 downto 0);
    signal redist84_yPE_uid52_fpDivTest_b_18_mem_aa : STD_LOGIC_VECTOR (1 downto 0);
    signal redist84_yPE_uid52_fpDivTest_b_18_mem_ab : STD_LOGIC_VECTOR (1 downto 0);
    signal redist84_yPE_uid52_fpDivTest_b_18_mem_iq : STD_LOGIC_VECTOR (40 downto 0);
    signal redist84_yPE_uid52_fpDivTest_b_18_mem_q : STD_LOGIC_VECTOR (40 downto 0);
    signal redist84_yPE_uid52_fpDivTest_b_18_rdcnt_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist84_yPE_uid52_fpDivTest_b_18_rdcnt_i : UNSIGNED (1 downto 0);
    attribute preserve_syn_only of redist84_yPE_uid52_fpDivTest_b_18_rdcnt_i : signal is true;
    signal redist84_yPE_uid52_fpDivTest_b_18_wraddr_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist84_yPE_uid52_fpDivTest_b_18_mem_last_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist84_yPE_uid52_fpDivTest_b_18_cmp_b : STD_LOGIC_VECTOR (2 downto 0);
    signal redist84_yPE_uid52_fpDivTest_b_18_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist84_yPE_uid52_fpDivTest_b_18_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist84_yPE_uid52_fpDivTest_b_18_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist84_yPE_uid52_fpDivTest_b_18_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist84_yPE_uid52_fpDivTest_b_18_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist84_yPE_uid52_fpDivTest_b_18_sticky_ena_q : signal is true;
    signal redist84_yPE_uid52_fpDivTest_b_18_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist85_yPE_uid52_fpDivTest_b_26_inputreg1_q : STD_LOGIC_VECTOR (40 downto 0);
    signal redist85_yPE_uid52_fpDivTest_b_26_outputreg1_q : STD_LOGIC_VECTOR (40 downto 0);
    signal redist85_yPE_uid52_fpDivTest_b_26_inputreg0_q : STD_LOGIC_VECTOR (40 downto 0);
    signal redist85_yPE_uid52_fpDivTest_b_26_outputreg0_q : STD_LOGIC_VECTOR (40 downto 0);
    signal redist85_yPE_uid52_fpDivTest_b_26_mem_reset0 : std_logic;
    signal redist85_yPE_uid52_fpDivTest_b_26_mem_ia : STD_LOGIC_VECTOR (40 downto 0);
    signal redist85_yPE_uid52_fpDivTest_b_26_mem_aa : STD_LOGIC_VECTOR (1 downto 0);
    signal redist85_yPE_uid52_fpDivTest_b_26_mem_ab : STD_LOGIC_VECTOR (1 downto 0);
    signal redist85_yPE_uid52_fpDivTest_b_26_mem_iq : STD_LOGIC_VECTOR (40 downto 0);
    signal redist85_yPE_uid52_fpDivTest_b_26_mem_q : STD_LOGIC_VECTOR (40 downto 0);
    signal redist85_yPE_uid52_fpDivTest_b_26_rdcnt_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist85_yPE_uid52_fpDivTest_b_26_rdcnt_i : UNSIGNED (1 downto 0);
    attribute preserve_syn_only of redist85_yPE_uid52_fpDivTest_b_26_rdcnt_i : signal is true;
    signal redist85_yPE_uid52_fpDivTest_b_26_rdcnt_eq : std_logic;
    attribute preserve_syn_only of redist85_yPE_uid52_fpDivTest_b_26_rdcnt_eq : signal is true;
    signal redist85_yPE_uid52_fpDivTest_b_26_wraddr_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist85_yPE_uid52_fpDivTest_b_26_mem_last_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist85_yPE_uid52_fpDivTest_b_26_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist85_yPE_uid52_fpDivTest_b_26_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist85_yPE_uid52_fpDivTest_b_26_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist85_yPE_uid52_fpDivTest_b_26_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist85_yPE_uid52_fpDivTest_b_26_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist85_yPE_uid52_fpDivTest_b_26_sticky_ena_q : signal is true;
    signal redist85_yPE_uid52_fpDivTest_b_26_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist86_yAddr_uid51_fpDivTest_b_6_outputreg1_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist86_yAddr_uid51_fpDivTest_b_6_outputreg0_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist87_yAddr_uid51_fpDivTest_b_15_inputreg1_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist87_yAddr_uid51_fpDivTest_b_15_outputreg1_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist87_yAddr_uid51_fpDivTest_b_15_inputreg0_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist87_yAddr_uid51_fpDivTest_b_15_outputreg0_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist87_yAddr_uid51_fpDivTest_b_15_mem_reset0 : std_logic;
    signal redist87_yAddr_uid51_fpDivTest_b_15_mem_ia : STD_LOGIC_VECTOR (10 downto 0);
    signal redist87_yAddr_uid51_fpDivTest_b_15_mem_aa : STD_LOGIC_VECTOR (1 downto 0);
    signal redist87_yAddr_uid51_fpDivTest_b_15_mem_ab : STD_LOGIC_VECTOR (1 downto 0);
    signal redist87_yAddr_uid51_fpDivTest_b_15_mem_iq : STD_LOGIC_VECTOR (10 downto 0);
    signal redist87_yAddr_uid51_fpDivTest_b_15_mem_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist87_yAddr_uid51_fpDivTest_b_15_rdcnt_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist87_yAddr_uid51_fpDivTest_b_15_rdcnt_i : UNSIGNED (1 downto 0);
    attribute preserve_syn_only of redist87_yAddr_uid51_fpDivTest_b_15_rdcnt_i : signal is true;
    signal redist87_yAddr_uid51_fpDivTest_b_15_wraddr_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist87_yAddr_uid51_fpDivTest_b_15_mem_last_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist87_yAddr_uid51_fpDivTest_b_15_cmp_b : STD_LOGIC_VECTOR (2 downto 0);
    signal redist87_yAddr_uid51_fpDivTest_b_15_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist87_yAddr_uid51_fpDivTest_b_15_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist87_yAddr_uid51_fpDivTest_b_15_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist87_yAddr_uid51_fpDivTest_b_15_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist87_yAddr_uid51_fpDivTest_b_15_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist87_yAddr_uid51_fpDivTest_b_15_sticky_ena_q : signal is true;
    signal redist87_yAddr_uid51_fpDivTest_b_15_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist88_yAddr_uid51_fpDivTest_b_23_inputreg1_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist88_yAddr_uid51_fpDivTest_b_23_outputreg1_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist88_yAddr_uid51_fpDivTest_b_23_inputreg0_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist88_yAddr_uid51_fpDivTest_b_23_outputreg0_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist89_yAddr_uid51_fpDivTest_b_32_inputreg1_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist89_yAddr_uid51_fpDivTest_b_32_outputreg1_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist89_yAddr_uid51_fpDivTest_b_32_inputreg0_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist89_yAddr_uid51_fpDivTest_b_32_outputreg0_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist89_yAddr_uid51_fpDivTest_b_32_mem_reset0 : std_logic;
    signal redist89_yAddr_uid51_fpDivTest_b_32_mem_ia : STD_LOGIC_VECTOR (10 downto 0);
    signal redist89_yAddr_uid51_fpDivTest_b_32_mem_aa : STD_LOGIC_VECTOR (1 downto 0);
    signal redist89_yAddr_uid51_fpDivTest_b_32_mem_ab : STD_LOGIC_VECTOR (1 downto 0);
    signal redist89_yAddr_uid51_fpDivTest_b_32_mem_iq : STD_LOGIC_VECTOR (10 downto 0);
    signal redist89_yAddr_uid51_fpDivTest_b_32_mem_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist89_yAddr_uid51_fpDivTest_b_32_rdcnt_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist89_yAddr_uid51_fpDivTest_b_32_rdcnt_i : UNSIGNED (1 downto 0);
    attribute preserve_syn_only of redist89_yAddr_uid51_fpDivTest_b_32_rdcnt_i : signal is true;
    signal redist89_yAddr_uid51_fpDivTest_b_32_wraddr_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist89_yAddr_uid51_fpDivTest_b_32_mem_last_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist89_yAddr_uid51_fpDivTest_b_32_cmp_b : STD_LOGIC_VECTOR (2 downto 0);
    signal redist89_yAddr_uid51_fpDivTest_b_32_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist89_yAddr_uid51_fpDivTest_b_32_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist89_yAddr_uid51_fpDivTest_b_32_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist89_yAddr_uid51_fpDivTest_b_32_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist89_yAddr_uid51_fpDivTest_b_32_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist89_yAddr_uid51_fpDivTest_b_32_sticky_ena_q : signal is true;
    signal redist89_yAddr_uid51_fpDivTest_b_32_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist93_fracY_uid13_fpDivTest_b_43_inputreg1_q : STD_LOGIC_VECTOR (51 downto 0);
    signal redist93_fracY_uid13_fpDivTest_b_43_outputreg0_q : STD_LOGIC_VECTOR (51 downto 0);
    signal redist93_fracY_uid13_fpDivTest_b_43_inputreg0_q : STD_LOGIC_VECTOR (51 downto 0);
    signal redist93_fracY_uid13_fpDivTest_b_43_mem_reset0 : std_logic;
    signal redist93_fracY_uid13_fpDivTest_b_43_mem_ia : STD_LOGIC_VECTOR (51 downto 0);
    signal redist93_fracY_uid13_fpDivTest_b_43_mem_aa : STD_LOGIC_VECTOR (2 downto 0);
    signal redist93_fracY_uid13_fpDivTest_b_43_mem_ab : STD_LOGIC_VECTOR (2 downto 0);
    signal redist93_fracY_uid13_fpDivTest_b_43_mem_iq : STD_LOGIC_VECTOR (51 downto 0);
    signal redist93_fracY_uid13_fpDivTest_b_43_mem_q : STD_LOGIC_VECTOR (51 downto 0);
    signal redist93_fracY_uid13_fpDivTest_b_43_rdcnt_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist93_fracY_uid13_fpDivTest_b_43_rdcnt_i : UNSIGNED (2 downto 0);
    attribute preserve_syn_only of redist93_fracY_uid13_fpDivTest_b_43_rdcnt_i : signal is true;
    signal redist93_fracY_uid13_fpDivTest_b_43_rdcnt_eq : std_logic;
    attribute preserve_syn_only of redist93_fracY_uid13_fpDivTest_b_43_rdcnt_eq : signal is true;
    signal redist93_fracY_uid13_fpDivTest_b_43_wraddr_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist93_fracY_uid13_fpDivTest_b_43_mem_last_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist93_fracY_uid13_fpDivTest_b_43_cmp_b : STD_LOGIC_VECTOR (3 downto 0);
    signal redist93_fracY_uid13_fpDivTest_b_43_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist93_fracY_uid13_fpDivTest_b_43_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist93_fracY_uid13_fpDivTest_b_43_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist93_fracY_uid13_fpDivTest_b_43_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist93_fracY_uid13_fpDivTest_b_43_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist93_fracY_uid13_fpDivTest_b_43_sticky_ena_q : signal is true;
    signal redist93_fracY_uid13_fpDivTest_b_43_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist96_expY_uid12_fpDivTest_b_44_inputreg1_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist96_expY_uid12_fpDivTest_b_44_outputreg0_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist96_expY_uid12_fpDivTest_b_44_inputreg0_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist96_expY_uid12_fpDivTest_b_44_mem_reset0 : std_logic;
    signal redist96_expY_uid12_fpDivTest_b_44_mem_ia : STD_LOGIC_VECTOR (10 downto 0);
    signal redist96_expY_uid12_fpDivTest_b_44_mem_aa : STD_LOGIC_VECTOR (2 downto 0);
    signal redist96_expY_uid12_fpDivTest_b_44_mem_ab : STD_LOGIC_VECTOR (2 downto 0);
    signal redist96_expY_uid12_fpDivTest_b_44_mem_iq : STD_LOGIC_VECTOR (10 downto 0);
    signal redist96_expY_uid12_fpDivTest_b_44_mem_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist96_expY_uid12_fpDivTest_b_44_rdcnt_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist96_expY_uid12_fpDivTest_b_44_rdcnt_i : UNSIGNED (2 downto 0);
    attribute preserve_syn_only of redist96_expY_uid12_fpDivTest_b_44_rdcnt_i : signal is true;
    signal redist96_expY_uid12_fpDivTest_b_44_rdcnt_eq : std_logic;
    attribute preserve_syn_only of redist96_expY_uid12_fpDivTest_b_44_rdcnt_eq : signal is true;
    signal redist96_expY_uid12_fpDivTest_b_44_wraddr_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist96_expY_uid12_fpDivTest_b_44_mem_last_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist96_expY_uid12_fpDivTest_b_44_cmp_b : STD_LOGIC_VECTOR (3 downto 0);
    signal redist96_expY_uid12_fpDivTest_b_44_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist96_expY_uid12_fpDivTest_b_44_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist96_expY_uid12_fpDivTest_b_44_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist96_expY_uid12_fpDivTest_b_44_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist96_expY_uid12_fpDivTest_b_44_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist96_expY_uid12_fpDivTest_b_44_sticky_ena_q : signal is true;
    signal redist96_expY_uid12_fpDivTest_b_44_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist100_fracX_uid10_fpDivTest_b_46_inputreg0_q : STD_LOGIC_VECTOR (51 downto 0);
    signal redist100_fracX_uid10_fpDivTest_b_46_outputreg1_q : STD_LOGIC_VECTOR (51 downto 0);
    signal redist100_fracX_uid10_fpDivTest_b_46_outputreg0_q : STD_LOGIC_VECTOR (51 downto 0);
    signal redist100_fracX_uid10_fpDivTest_b_46_mem_reset0 : std_logic;
    signal redist100_fracX_uid10_fpDivTest_b_46_mem_ia : STD_LOGIC_VECTOR (51 downto 0);
    signal redist100_fracX_uid10_fpDivTest_b_46_mem_aa : STD_LOGIC_VECTOR (2 downto 0);
    signal redist100_fracX_uid10_fpDivTest_b_46_mem_ab : STD_LOGIC_VECTOR (2 downto 0);
    signal redist100_fracX_uid10_fpDivTest_b_46_mem_iq : STD_LOGIC_VECTOR (51 downto 0);
    signal redist100_fracX_uid10_fpDivTest_b_46_mem_q : STD_LOGIC_VECTOR (51 downto 0);
    signal redist100_fracX_uid10_fpDivTest_b_46_rdcnt_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist100_fracX_uid10_fpDivTest_b_46_rdcnt_i : UNSIGNED (2 downto 0);
    attribute preserve_syn_only of redist100_fracX_uid10_fpDivTest_b_46_rdcnt_i : signal is true;
    signal redist100_fracX_uid10_fpDivTest_b_46_rdcnt_eq : std_logic;
    attribute preserve_syn_only of redist100_fracX_uid10_fpDivTest_b_46_rdcnt_eq : signal is true;
    signal redist100_fracX_uid10_fpDivTest_b_46_wraddr_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist100_fracX_uid10_fpDivTest_b_46_mem_last_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist100_fracX_uid10_fpDivTest_b_46_cmp_b : STD_LOGIC_VECTOR (3 downto 0);
    signal redist100_fracX_uid10_fpDivTest_b_46_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist100_fracX_uid10_fpDivTest_b_46_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist100_fracX_uid10_fpDivTest_b_46_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist100_fracX_uid10_fpDivTest_b_46_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist100_fracX_uid10_fpDivTest_b_46_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist100_fracX_uid10_fpDivTest_b_46_sticky_ena_q : signal is true;
    signal redist100_fracX_uid10_fpDivTest_b_46_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist102_expX_uid9_fpDivTest_b_44_inputreg1_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist102_expX_uid9_fpDivTest_b_44_outputreg0_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist102_expX_uid9_fpDivTest_b_44_inputreg0_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist102_expX_uid9_fpDivTest_b_44_mem_reset0 : std_logic;
    signal redist102_expX_uid9_fpDivTest_b_44_mem_ia : STD_LOGIC_VECTOR (10 downto 0);
    signal redist102_expX_uid9_fpDivTest_b_44_mem_aa : STD_LOGIC_VECTOR (2 downto 0);
    signal redist102_expX_uid9_fpDivTest_b_44_mem_ab : STD_LOGIC_VECTOR (2 downto 0);
    signal redist102_expX_uid9_fpDivTest_b_44_mem_iq : STD_LOGIC_VECTOR (10 downto 0);
    signal redist102_expX_uid9_fpDivTest_b_44_mem_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist102_expX_uid9_fpDivTest_b_44_rdcnt_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist102_expX_uid9_fpDivTest_b_44_rdcnt_i : UNSIGNED (2 downto 0);
    attribute preserve_syn_only of redist102_expX_uid9_fpDivTest_b_44_rdcnt_i : signal is true;
    signal redist102_expX_uid9_fpDivTest_b_44_rdcnt_eq : std_logic;
    attribute preserve_syn_only of redist102_expX_uid9_fpDivTest_b_44_rdcnt_eq : signal is true;
    signal redist102_expX_uid9_fpDivTest_b_44_wraddr_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist102_expX_uid9_fpDivTest_b_44_mem_last_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist102_expX_uid9_fpDivTest_b_44_cmp_b : STD_LOGIC_VECTOR (3 downto 0);
    signal redist102_expX_uid9_fpDivTest_b_44_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist102_expX_uid9_fpDivTest_b_44_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist102_expX_uid9_fpDivTest_b_44_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist102_expX_uid9_fpDivTest_b_44_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist102_expX_uid9_fpDivTest_b_44_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist102_expX_uid9_fpDivTest_b_44_sticky_ena_q : signal is true;
    signal redist102_expX_uid9_fpDivTest_b_44_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist93_fracY_uid13_fpDivTest_b_43_split_0_outputreg1_q : STD_LOGIC_VECTOR (51 downto 0);
    signal redist93_fracY_uid13_fpDivTest_b_43_split_0_outputreg0_q : STD_LOGIC_VECTOR (51 downto 0);
    signal redist93_fracY_uid13_fpDivTest_b_43_split_0_mem_reset0 : std_logic;
    signal redist93_fracY_uid13_fpDivTest_b_43_split_0_mem_ia : STD_LOGIC_VECTOR (51 downto 0);
    signal redist93_fracY_uid13_fpDivTest_b_43_split_0_mem_aa : STD_LOGIC_VECTOR (4 downto 0);
    signal redist93_fracY_uid13_fpDivTest_b_43_split_0_mem_ab : STD_LOGIC_VECTOR (4 downto 0);
    signal redist93_fracY_uid13_fpDivTest_b_43_split_0_mem_iq : STD_LOGIC_VECTOR (51 downto 0);
    signal redist93_fracY_uid13_fpDivTest_b_43_split_0_mem_q : STD_LOGIC_VECTOR (51 downto 0);
    signal redist93_fracY_uid13_fpDivTest_b_43_split_0_rdcnt_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist93_fracY_uid13_fpDivTest_b_43_split_0_rdcnt_i : UNSIGNED (4 downto 0);
    attribute preserve_syn_only of redist93_fracY_uid13_fpDivTest_b_43_split_0_rdcnt_i : signal is true;
    signal redist93_fracY_uid13_fpDivTest_b_43_split_0_rdcnt_eq : std_logic;
    attribute preserve_syn_only of redist93_fracY_uid13_fpDivTest_b_43_split_0_rdcnt_eq : signal is true;
    signal redist93_fracY_uid13_fpDivTest_b_43_split_0_wraddr_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist93_fracY_uid13_fpDivTest_b_43_split_0_mem_last_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist93_fracY_uid13_fpDivTest_b_43_split_0_cmp_b : STD_LOGIC_VECTOR (5 downto 0);
    signal redist93_fracY_uid13_fpDivTest_b_43_split_0_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist93_fracY_uid13_fpDivTest_b_43_split_0_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist93_fracY_uid13_fpDivTest_b_43_split_0_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist93_fracY_uid13_fpDivTest_b_43_split_0_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist93_fracY_uid13_fpDivTest_b_43_split_0_sticky_ena_q : signal is true;
    signal redist93_fracY_uid13_fpDivTest_b_43_split_0_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist96_expY_uid12_fpDivTest_b_44_split_0_outputreg1_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist96_expY_uid12_fpDivTest_b_44_split_0_outputreg0_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist96_expY_uid12_fpDivTest_b_44_split_0_mem_reset0 : std_logic;
    signal redist96_expY_uid12_fpDivTest_b_44_split_0_mem_ia : STD_LOGIC_VECTOR (10 downto 0);
    signal redist96_expY_uid12_fpDivTest_b_44_split_0_mem_aa : STD_LOGIC_VECTOR (4 downto 0);
    signal redist96_expY_uid12_fpDivTest_b_44_split_0_mem_ab : STD_LOGIC_VECTOR (4 downto 0);
    signal redist96_expY_uid12_fpDivTest_b_44_split_0_mem_iq : STD_LOGIC_VECTOR (10 downto 0);
    signal redist96_expY_uid12_fpDivTest_b_44_split_0_mem_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist96_expY_uid12_fpDivTest_b_44_split_0_rdcnt_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist96_expY_uid12_fpDivTest_b_44_split_0_rdcnt_i : UNSIGNED (4 downto 0);
    attribute preserve_syn_only of redist96_expY_uid12_fpDivTest_b_44_split_0_rdcnt_i : signal is true;
    signal redist96_expY_uid12_fpDivTest_b_44_split_0_rdcnt_eq : std_logic;
    attribute preserve_syn_only of redist96_expY_uid12_fpDivTest_b_44_split_0_rdcnt_eq : signal is true;
    signal redist96_expY_uid12_fpDivTest_b_44_split_0_wraddr_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist96_expY_uid12_fpDivTest_b_44_split_0_mem_last_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist96_expY_uid12_fpDivTest_b_44_split_0_cmp_b : STD_LOGIC_VECTOR (5 downto 0);
    signal redist96_expY_uid12_fpDivTest_b_44_split_0_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist96_expY_uid12_fpDivTest_b_44_split_0_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist96_expY_uid12_fpDivTest_b_44_split_0_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist96_expY_uid12_fpDivTest_b_44_split_0_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist96_expY_uid12_fpDivTest_b_44_split_0_sticky_ena_q : signal is true;
    signal redist96_expY_uid12_fpDivTest_b_44_split_0_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist99_fracX_uid10_fpDivTest_b_35_split_0_outputreg1_q : STD_LOGIC_VECTOR (51 downto 0);
    signal redist99_fracX_uid10_fpDivTest_b_35_split_0_outputreg0_q : STD_LOGIC_VECTOR (51 downto 0);
    signal redist99_fracX_uid10_fpDivTest_b_35_split_0_mem_reset0 : std_logic;
    signal redist99_fracX_uid10_fpDivTest_b_35_split_0_mem_ia : STD_LOGIC_VECTOR (51 downto 0);
    signal redist99_fracX_uid10_fpDivTest_b_35_split_0_mem_aa : STD_LOGIC_VECTOR (4 downto 0);
    signal redist99_fracX_uid10_fpDivTest_b_35_split_0_mem_ab : STD_LOGIC_VECTOR (4 downto 0);
    signal redist99_fracX_uid10_fpDivTest_b_35_split_0_mem_iq : STD_LOGIC_VECTOR (51 downto 0);
    signal redist99_fracX_uid10_fpDivTest_b_35_split_0_mem_q : STD_LOGIC_VECTOR (51 downto 0);
    signal redist99_fracX_uid10_fpDivTest_b_35_split_0_rdcnt_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist99_fracX_uid10_fpDivTest_b_35_split_0_rdcnt_i : UNSIGNED (4 downto 0);
    attribute preserve_syn_only of redist99_fracX_uid10_fpDivTest_b_35_split_0_rdcnt_i : signal is true;
    signal redist99_fracX_uid10_fpDivTest_b_35_split_0_rdcnt_eq : std_logic;
    attribute preserve_syn_only of redist99_fracX_uid10_fpDivTest_b_35_split_0_rdcnt_eq : signal is true;
    signal redist99_fracX_uid10_fpDivTest_b_35_split_0_wraddr_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist99_fracX_uid10_fpDivTest_b_35_split_0_mem_last_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist99_fracX_uid10_fpDivTest_b_35_split_0_cmp_b : STD_LOGIC_VECTOR (5 downto 0);
    signal redist99_fracX_uid10_fpDivTest_b_35_split_0_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist99_fracX_uid10_fpDivTest_b_35_split_0_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist99_fracX_uid10_fpDivTest_b_35_split_0_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist99_fracX_uid10_fpDivTest_b_35_split_0_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist99_fracX_uid10_fpDivTest_b_35_split_0_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist99_fracX_uid10_fpDivTest_b_35_split_0_sticky_ena_q : signal is true;
    signal redist99_fracX_uid10_fpDivTest_b_35_split_0_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist102_expX_uid9_fpDivTest_b_44_split_0_outputreg1_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist102_expX_uid9_fpDivTest_b_44_split_0_outputreg0_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist102_expX_uid9_fpDivTest_b_44_split_0_mem_reset0 : std_logic;
    signal redist102_expX_uid9_fpDivTest_b_44_split_0_mem_ia : STD_LOGIC_VECTOR (10 downto 0);
    signal redist102_expX_uid9_fpDivTest_b_44_split_0_mem_aa : STD_LOGIC_VECTOR (4 downto 0);
    signal redist102_expX_uid9_fpDivTest_b_44_split_0_mem_ab : STD_LOGIC_VECTOR (4 downto 0);
    signal redist102_expX_uid9_fpDivTest_b_44_split_0_mem_iq : STD_LOGIC_VECTOR (10 downto 0);
    signal redist102_expX_uid9_fpDivTest_b_44_split_0_mem_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist102_expX_uid9_fpDivTest_b_44_split_0_rdcnt_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist102_expX_uid9_fpDivTest_b_44_split_0_rdcnt_i : UNSIGNED (4 downto 0);
    attribute preserve_syn_only of redist102_expX_uid9_fpDivTest_b_44_split_0_rdcnt_i : signal is true;
    signal redist102_expX_uid9_fpDivTest_b_44_split_0_rdcnt_eq : std_logic;
    attribute preserve_syn_only of redist102_expX_uid9_fpDivTest_b_44_split_0_rdcnt_eq : signal is true;
    signal redist102_expX_uid9_fpDivTest_b_44_split_0_wraddr_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist102_expX_uid9_fpDivTest_b_44_split_0_mem_last_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist102_expX_uid9_fpDivTest_b_44_split_0_cmp_b : STD_LOGIC_VECTOR (5 downto 0);
    signal redist102_expX_uid9_fpDivTest_b_44_split_0_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist102_expX_uid9_fpDivTest_b_44_split_0_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist102_expX_uid9_fpDivTest_b_44_split_0_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist102_expX_uid9_fpDivTest_b_44_split_0_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist102_expX_uid9_fpDivTest_b_44_split_0_sticky_ena_q : signal is true;
    signal redist102_expX_uid9_fpDivTest_b_44_split_0_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- paddingY_uid15_fpDivTest(CONSTANT,14)
    paddingY_uid15_fpDivTest_q <= "0000000000000000000000000000000000000000000000000000";

    -- c0_uid357_fracXIsZero_uid25_fpDivTest_merged_bit_select(BITSELECT,498)
    c0_uid357_fracXIsZero_uid25_fpDivTest_merged_bit_select_b <= paddingY_uid15_fpDivTest_q(5 downto 0);
    c0_uid357_fracXIsZero_uid25_fpDivTest_merged_bit_select_c <= paddingY_uid15_fpDivTest_q(11 downto 6);
    c0_uid357_fracXIsZero_uid25_fpDivTest_merged_bit_select_d <= paddingY_uid15_fpDivTest_q(17 downto 12);
    c0_uid357_fracXIsZero_uid25_fpDivTest_merged_bit_select_e <= paddingY_uid15_fpDivTest_q(23 downto 18);
    c0_uid357_fracXIsZero_uid25_fpDivTest_merged_bit_select_f <= paddingY_uid15_fpDivTest_q(29 downto 24);
    c0_uid357_fracXIsZero_uid25_fpDivTest_merged_bit_select_g <= paddingY_uid15_fpDivTest_q(35 downto 30);
    c0_uid357_fracXIsZero_uid25_fpDivTest_merged_bit_select_h <= paddingY_uid15_fpDivTest_q(41 downto 36);
    c0_uid357_fracXIsZero_uid25_fpDivTest_merged_bit_select_i <= paddingY_uid15_fpDivTest_q(47 downto 42);
    c0_uid357_fracXIsZero_uid25_fpDivTest_merged_bit_select_j <= paddingY_uid15_fpDivTest_q(51 downto 48);

    -- redist93_fracY_uid13_fpDivTest_b_43_notEnable(LOGICAL,760)
    redist93_fracY_uid13_fpDivTest_b_43_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist93_fracY_uid13_fpDivTest_b_43_nor(LOGICAL,761)
    redist93_fracY_uid13_fpDivTest_b_43_nor_q <= not (redist93_fracY_uid13_fpDivTest_b_43_notEnable_q or redist93_fracY_uid13_fpDivTest_b_43_sticky_ena_q);

    -- redist93_fracY_uid13_fpDivTest_b_43_mem_last(CONSTANT,757)
    redist93_fracY_uid13_fpDivTest_b_43_mem_last_q <= "0100";

    -- redist93_fracY_uid13_fpDivTest_b_43_cmp(LOGICAL,758)
    redist93_fracY_uid13_fpDivTest_b_43_cmp_b <= STD_LOGIC_VECTOR("0" & redist93_fracY_uid13_fpDivTest_b_43_rdcnt_q);
    redist93_fracY_uid13_fpDivTest_b_43_cmp_q <= "1" WHEN redist93_fracY_uid13_fpDivTest_b_43_mem_last_q = redist93_fracY_uid13_fpDivTest_b_43_cmp_b ELSE "0";

    -- redist93_fracY_uid13_fpDivTest_b_43_cmpReg(REG,759)
    redist93_fracY_uid13_fpDivTest_b_43_cmpReg_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist93_fracY_uid13_fpDivTest_b_43_cmpReg_q <= "0";
            ELSE
                redist93_fracY_uid13_fpDivTest_b_43_cmpReg_q <= STD_LOGIC_VECTOR(redist93_fracY_uid13_fpDivTest_b_43_cmp_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist93_fracY_uid13_fpDivTest_b_43_sticky_ena(REG,762)
    redist93_fracY_uid13_fpDivTest_b_43_sticky_ena_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist93_fracY_uid13_fpDivTest_b_43_sticky_ena_q <= "0";
            ELSE
                IF (redist93_fracY_uid13_fpDivTest_b_43_nor_q = "1") THEN
                    redist93_fracY_uid13_fpDivTest_b_43_sticky_ena_q <= STD_LOGIC_VECTOR(redist93_fracY_uid13_fpDivTest_b_43_cmpReg_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist93_fracY_uid13_fpDivTest_b_43_enaAnd(LOGICAL,763)
    redist93_fracY_uid13_fpDivTest_b_43_enaAnd_q <= redist93_fracY_uid13_fpDivTest_b_43_sticky_ena_q and VCC_q;

    -- redist93_fracY_uid13_fpDivTest_b_43_rdcnt(COUNTER,755)
    -- low=0, high=5, step=1, init=0
    redist93_fracY_uid13_fpDivTest_b_43_rdcnt_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist93_fracY_uid13_fpDivTest_b_43_rdcnt_i <= TO_UNSIGNED(0, 3);
                redist93_fracY_uid13_fpDivTest_b_43_rdcnt_eq <= '0';
            ELSE
                IF (redist93_fracY_uid13_fpDivTest_b_43_rdcnt_i = TO_UNSIGNED(4, 3)) THEN
                    redist93_fracY_uid13_fpDivTest_b_43_rdcnt_eq <= '1';
                ELSE
                    redist93_fracY_uid13_fpDivTest_b_43_rdcnt_eq <= '0';
                END IF;
                IF (redist93_fracY_uid13_fpDivTest_b_43_rdcnt_eq = '1') THEN
                    redist93_fracY_uid13_fpDivTest_b_43_rdcnt_i <= redist93_fracY_uid13_fpDivTest_b_43_rdcnt_i + 3;
                ELSE
                    redist93_fracY_uid13_fpDivTest_b_43_rdcnt_i <= redist93_fracY_uid13_fpDivTest_b_43_rdcnt_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    redist93_fracY_uid13_fpDivTest_b_43_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist93_fracY_uid13_fpDivTest_b_43_rdcnt_i, 3)));

    -- redist93_fracY_uid13_fpDivTest_b_43_split_0_nor(LOGICAL,812)
    redist93_fracY_uid13_fpDivTest_b_43_split_0_nor_q <= not (redist93_fracY_uid13_fpDivTest_b_43_notEnable_q or redist93_fracY_uid13_fpDivTest_b_43_split_0_sticky_ena_q);

    -- redist93_fracY_uid13_fpDivTest_b_43_split_0_mem_last(CONSTANT,808)
    redist93_fracY_uid13_fpDivTest_b_43_split_0_mem_last_q <= "011100";

    -- redist93_fracY_uid13_fpDivTest_b_43_split_0_cmp(LOGICAL,809)
    redist93_fracY_uid13_fpDivTest_b_43_split_0_cmp_b <= STD_LOGIC_VECTOR("0" & redist93_fracY_uid13_fpDivTest_b_43_split_0_rdcnt_q);
    redist93_fracY_uid13_fpDivTest_b_43_split_0_cmp_q <= "1" WHEN redist93_fracY_uid13_fpDivTest_b_43_split_0_mem_last_q = redist93_fracY_uid13_fpDivTest_b_43_split_0_cmp_b ELSE "0";

    -- redist93_fracY_uid13_fpDivTest_b_43_split_0_cmpReg(REG,810)
    redist93_fracY_uid13_fpDivTest_b_43_split_0_cmpReg_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist93_fracY_uid13_fpDivTest_b_43_split_0_cmpReg_q <= "0";
            ELSE
                redist93_fracY_uid13_fpDivTest_b_43_split_0_cmpReg_q <= STD_LOGIC_VECTOR(redist93_fracY_uid13_fpDivTest_b_43_split_0_cmp_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist93_fracY_uid13_fpDivTest_b_43_split_0_sticky_ena(REG,813)
    redist93_fracY_uid13_fpDivTest_b_43_split_0_sticky_ena_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist93_fracY_uid13_fpDivTest_b_43_split_0_sticky_ena_q <= "0";
            ELSE
                IF (redist93_fracY_uid13_fpDivTest_b_43_split_0_nor_q = "1") THEN
                    redist93_fracY_uid13_fpDivTest_b_43_split_0_sticky_ena_q <= STD_LOGIC_VECTOR(redist93_fracY_uid13_fpDivTest_b_43_split_0_cmpReg_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist93_fracY_uid13_fpDivTest_b_43_split_0_enaAnd(LOGICAL,814)
    redist93_fracY_uid13_fpDivTest_b_43_split_0_enaAnd_q <= redist93_fracY_uid13_fpDivTest_b_43_split_0_sticky_ena_q and VCC_q;

    -- redist93_fracY_uid13_fpDivTest_b_43_split_0_rdcnt(COUNTER,806)
    -- low=0, high=29, step=1, init=0
    redist93_fracY_uid13_fpDivTest_b_43_split_0_rdcnt_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist93_fracY_uid13_fpDivTest_b_43_split_0_rdcnt_i <= TO_UNSIGNED(0, 5);
                redist93_fracY_uid13_fpDivTest_b_43_split_0_rdcnt_eq <= '0';
            ELSE
                IF (redist93_fracY_uid13_fpDivTest_b_43_split_0_rdcnt_i = TO_UNSIGNED(28, 5)) THEN
                    redist93_fracY_uid13_fpDivTest_b_43_split_0_rdcnt_eq <= '1';
                ELSE
                    redist93_fracY_uid13_fpDivTest_b_43_split_0_rdcnt_eq <= '0';
                END IF;
                IF (redist93_fracY_uid13_fpDivTest_b_43_split_0_rdcnt_eq = '1') THEN
                    redist93_fracY_uid13_fpDivTest_b_43_split_0_rdcnt_i <= redist93_fracY_uid13_fpDivTest_b_43_split_0_rdcnt_i + 3;
                ELSE
                    redist93_fracY_uid13_fpDivTest_b_43_split_0_rdcnt_i <= redist93_fracY_uid13_fpDivTest_b_43_split_0_rdcnt_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    redist93_fracY_uid13_fpDivTest_b_43_split_0_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist93_fracY_uid13_fpDivTest_b_43_split_0_rdcnt_i, 5)));

    -- fracY_uid13_fpDivTest(BITSELECT,12)@0
    fracY_uid13_fpDivTest_b <= b(51 downto 0);

    -- redist93_fracY_uid13_fpDivTest_b_43_split_0_wraddr(REG,807)
    redist93_fracY_uid13_fpDivTest_b_43_split_0_wraddr_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist93_fracY_uid13_fpDivTest_b_43_split_0_wraddr_q <= "11101";
            ELSE
                redist93_fracY_uid13_fpDivTest_b_43_split_0_wraddr_q <= STD_LOGIC_VECTOR(redist93_fracY_uid13_fpDivTest_b_43_split_0_rdcnt_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist93_fracY_uid13_fpDivTest_b_43_split_0_mem(DUALMEM,805)
    redist93_fracY_uid13_fpDivTest_b_43_split_0_mem_ia <= STD_LOGIC_VECTOR(fracY_uid13_fpDivTest_b);
    redist93_fracY_uid13_fpDivTest_b_43_split_0_mem_aa <= redist93_fracY_uid13_fpDivTest_b_43_split_0_wraddr_q;
    redist93_fracY_uid13_fpDivTest_b_43_split_0_mem_ab <= redist93_fracY_uid13_fpDivTest_b_43_split_0_rdcnt_q;
    redist93_fracY_uid13_fpDivTest_b_43_split_0_mem_reset0 <= areset;
    redist93_fracY_uid13_fpDivTest_b_43_split_0_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 52,
        widthad_a => 5,
        numwords_a => 30,
        width_b => 52,
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
        clocken1 => redist93_fracY_uid13_fpDivTest_b_43_split_0_enaAnd_q(0),
        clocken0 => '1',
        clock0 => clk,
        sclr => redist93_fracY_uid13_fpDivTest_b_43_split_0_mem_reset0,
        clock1 => clk,
        address_a => redist93_fracY_uid13_fpDivTest_b_43_split_0_mem_aa,
        data_a => redist93_fracY_uid13_fpDivTest_b_43_split_0_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist93_fracY_uid13_fpDivTest_b_43_split_0_mem_ab,
        q_b => redist93_fracY_uid13_fpDivTest_b_43_split_0_mem_iq
    );
    redist93_fracY_uid13_fpDivTest_b_43_split_0_mem_q <= redist93_fracY_uid13_fpDivTest_b_43_split_0_mem_iq(51 downto 0);

    -- redist93_fracY_uid13_fpDivTest_b_43_split_0_outputreg0(DELAY,804)
    redist93_fracY_uid13_fpDivTest_b_43_split_0_outputreg0_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist93_fracY_uid13_fpDivTest_b_43_split_0_outputreg0_q <= (others => '0');
            ELSE
                redist93_fracY_uid13_fpDivTest_b_43_split_0_outputreg0_q <= STD_LOGIC_VECTOR(redist93_fracY_uid13_fpDivTest_b_43_split_0_mem_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist93_fracY_uid13_fpDivTest_b_43_split_0_outputreg1(DELAY,803)
    redist93_fracY_uid13_fpDivTest_b_43_split_0_outputreg1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist93_fracY_uid13_fpDivTest_b_43_split_0_outputreg1_q <= (others => '0');
            ELSE
                redist93_fracY_uid13_fpDivTest_b_43_split_0_outputreg1_q <= STD_LOGIC_VECTOR(redist93_fracY_uid13_fpDivTest_b_43_split_0_outputreg0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist93_fracY_uid13_fpDivTest_b_43_inputreg1(DELAY,751)
    redist93_fracY_uid13_fpDivTest_b_43_inputreg1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist93_fracY_uid13_fpDivTest_b_43_inputreg1_q <= (others => '0');
            ELSE
                redist93_fracY_uid13_fpDivTest_b_43_inputreg1_q <= STD_LOGIC_VECTOR(redist93_fracY_uid13_fpDivTest_b_43_split_0_outputreg1_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist93_fracY_uid13_fpDivTest_b_43_inputreg0(DELAY,753)
    redist93_fracY_uid13_fpDivTest_b_43_inputreg0_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist93_fracY_uid13_fpDivTest_b_43_inputreg0_q <= (others => '0');
            ELSE
                redist93_fracY_uid13_fpDivTest_b_43_inputreg0_q <= STD_LOGIC_VECTOR(redist93_fracY_uid13_fpDivTest_b_43_inputreg1_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist93_fracY_uid13_fpDivTest_b_43_wraddr(REG,756)
    redist93_fracY_uid13_fpDivTest_b_43_wraddr_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist93_fracY_uid13_fpDivTest_b_43_wraddr_q <= "101";
            ELSE
                redist93_fracY_uid13_fpDivTest_b_43_wraddr_q <= STD_LOGIC_VECTOR(redist93_fracY_uid13_fpDivTest_b_43_rdcnt_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist93_fracY_uid13_fpDivTest_b_43_mem(DUALMEM,754)
    redist93_fracY_uid13_fpDivTest_b_43_mem_ia <= STD_LOGIC_VECTOR(redist93_fracY_uid13_fpDivTest_b_43_inputreg0_q);
    redist93_fracY_uid13_fpDivTest_b_43_mem_aa <= redist93_fracY_uid13_fpDivTest_b_43_wraddr_q;
    redist93_fracY_uid13_fpDivTest_b_43_mem_ab <= redist93_fracY_uid13_fpDivTest_b_43_rdcnt_q;
    redist93_fracY_uid13_fpDivTest_b_43_mem_reset0 <= areset;
    redist93_fracY_uid13_fpDivTest_b_43_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 52,
        widthad_a => 3,
        numwords_a => 6,
        width_b => 52,
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
        clocken1 => redist93_fracY_uid13_fpDivTest_b_43_enaAnd_q(0),
        clocken0 => '1',
        clock0 => clk,
        sclr => redist93_fracY_uid13_fpDivTest_b_43_mem_reset0,
        clock1 => clk,
        address_a => redist93_fracY_uid13_fpDivTest_b_43_mem_aa,
        data_a => redist93_fracY_uid13_fpDivTest_b_43_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist93_fracY_uid13_fpDivTest_b_43_mem_ab,
        q_b => redist93_fracY_uid13_fpDivTest_b_43_mem_iq
    );
    redist93_fracY_uid13_fpDivTest_b_43_mem_q <= redist93_fracY_uid13_fpDivTest_b_43_mem_iq(51 downto 0);

    -- redist93_fracY_uid13_fpDivTest_b_43_outputreg0(DELAY,752)
    redist93_fracY_uid13_fpDivTest_b_43_outputreg0_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist93_fracY_uid13_fpDivTest_b_43_outputreg0_q <= (others => '0');
            ELSE
                redist93_fracY_uid13_fpDivTest_b_43_outputreg0_q <= STD_LOGIC_VECTOR(redist93_fracY_uid13_fpDivTest_b_43_mem_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist94_fracY_uid13_fpDivTest_b_46(DELAY,604)
    redist94_fracY_uid13_fpDivTest_b_46_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist94_fracY_uid13_fpDivTest_b_46_delay_0 <= (others => '0');
                redist94_fracY_uid13_fpDivTest_b_46_delay_1 <= (others => '0');
                redist94_fracY_uid13_fpDivTest_b_46_q <= (others => '0');
            ELSE
                redist94_fracY_uid13_fpDivTest_b_46_delay_0 <= STD_LOGIC_VECTOR(redist93_fracY_uid13_fpDivTest_b_43_outputreg0_q);
                redist94_fracY_uid13_fpDivTest_b_46_delay_1 <= redist94_fracY_uid13_fpDivTest_b_46_delay_0;
                redist94_fracY_uid13_fpDivTest_b_46_q <= redist94_fracY_uid13_fpDivTest_b_46_delay_1;
            END IF;
        END IF;
    END PROCESS;

    -- z8_uid410_fracXIsZero_uid39_fpDivTest(BITSELECT,409)@46
    z8_uid410_fracXIsZero_uid39_fpDivTest_b <= redist94_fracY_uid13_fpDivTest_b_46_q(51 downto 48);

    -- eq8_uid412_fracXIsZero_uid39_fpDivTest(LOGICAL,411)@46
    eq8_uid412_fracXIsZero_uid39_fpDivTest_q <= "1" WHEN z8_uid410_fracXIsZero_uid39_fpDivTest_b = c0_uid357_fracXIsZero_uid25_fpDivTest_merged_bit_select_j ELSE "0";

    -- z7_uid407_fracXIsZero_uid39_fpDivTest(BITSELECT,406)@46
    z7_uid407_fracXIsZero_uid39_fpDivTest_in <= redist94_fracY_uid13_fpDivTest_b_46_q(47 downto 0);
    z7_uid407_fracXIsZero_uid39_fpDivTest_b <= z7_uid407_fracXIsZero_uid39_fpDivTest_in(47 downto 42);

    -- eq7_uid409_fracXIsZero_uid39_fpDivTest(LOGICAL,408)@46
    eq7_uid409_fracXIsZero_uid39_fpDivTest_q <= "1" WHEN z7_uid407_fracXIsZero_uid39_fpDivTest_b = c0_uid357_fracXIsZero_uid25_fpDivTest_merged_bit_select_i ELSE "0";

    -- z6_uid404_fracXIsZero_uid39_fpDivTest(BITSELECT,403)@46
    z6_uid404_fracXIsZero_uid39_fpDivTest_in <= redist94_fracY_uid13_fpDivTest_b_46_q(41 downto 0);
    z6_uid404_fracXIsZero_uid39_fpDivTest_b <= z6_uid404_fracXIsZero_uid39_fpDivTest_in(41 downto 36);

    -- eq6_uid406_fracXIsZero_uid39_fpDivTest(LOGICAL,405)@46
    eq6_uid406_fracXIsZero_uid39_fpDivTest_q <= "1" WHEN z6_uid404_fracXIsZero_uid39_fpDivTest_b = c0_uid357_fracXIsZero_uid25_fpDivTest_merged_bit_select_h ELSE "0";

    -- and_lev0_uid414_fracXIsZero_uid39_fpDivTest(LOGICAL,413)@46 + 1
    and_lev0_uid414_fracXIsZero_uid39_fpDivTest_qi <= eq6_uid406_fracXIsZero_uid39_fpDivTest_q and eq7_uid409_fracXIsZero_uid39_fpDivTest_q and eq8_uid412_fracXIsZero_uid39_fpDivTest_q;
    and_lev0_uid414_fracXIsZero_uid39_fpDivTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => and_lev0_uid414_fracXIsZero_uid39_fpDivTest_qi, xout => and_lev0_uid414_fracXIsZero_uid39_fpDivTest_q, clk => clk, aclr => areset, ena => '1' );

    -- z5_uid401_fracXIsZero_uid39_fpDivTest(BITSELECT,400)@46
    z5_uid401_fracXIsZero_uid39_fpDivTest_in <= redist94_fracY_uid13_fpDivTest_b_46_q(35 downto 0);
    z5_uid401_fracXIsZero_uid39_fpDivTest_b <= z5_uid401_fracXIsZero_uid39_fpDivTest_in(35 downto 30);

    -- eq5_uid403_fracXIsZero_uid39_fpDivTest(LOGICAL,402)@46
    eq5_uid403_fracXIsZero_uid39_fpDivTest_q <= "1" WHEN z5_uid401_fracXIsZero_uid39_fpDivTest_b = c0_uid357_fracXIsZero_uid25_fpDivTest_merged_bit_select_g ELSE "0";

    -- z4_uid398_fracXIsZero_uid39_fpDivTest(BITSELECT,397)@46
    z4_uid398_fracXIsZero_uid39_fpDivTest_in <= redist94_fracY_uid13_fpDivTest_b_46_q(29 downto 0);
    z4_uid398_fracXIsZero_uid39_fpDivTest_b <= z4_uid398_fracXIsZero_uid39_fpDivTest_in(29 downto 24);

    -- eq4_uid400_fracXIsZero_uid39_fpDivTest(LOGICAL,399)@46
    eq4_uid400_fracXIsZero_uid39_fpDivTest_q <= "1" WHEN z4_uid398_fracXIsZero_uid39_fpDivTest_b = c0_uid357_fracXIsZero_uid25_fpDivTest_merged_bit_select_f ELSE "0";

    -- z3_uid395_fracXIsZero_uid39_fpDivTest(BITSELECT,394)@46
    z3_uid395_fracXIsZero_uid39_fpDivTest_in <= redist94_fracY_uid13_fpDivTest_b_46_q(23 downto 0);
    z3_uid395_fracXIsZero_uid39_fpDivTest_b <= z3_uid395_fracXIsZero_uid39_fpDivTest_in(23 downto 18);

    -- eq3_uid397_fracXIsZero_uid39_fpDivTest(LOGICAL,396)@46
    eq3_uid397_fracXIsZero_uid39_fpDivTest_q <= "1" WHEN z3_uid395_fracXIsZero_uid39_fpDivTest_b = c0_uid357_fracXIsZero_uid25_fpDivTest_merged_bit_select_e ELSE "0";

    -- z2_uid392_fracXIsZero_uid39_fpDivTest(BITSELECT,391)@46
    z2_uid392_fracXIsZero_uid39_fpDivTest_in <= redist94_fracY_uid13_fpDivTest_b_46_q(17 downto 0);
    z2_uid392_fracXIsZero_uid39_fpDivTest_b <= z2_uid392_fracXIsZero_uid39_fpDivTest_in(17 downto 12);

    -- eq2_uid394_fracXIsZero_uid39_fpDivTest(LOGICAL,393)@46
    eq2_uid394_fracXIsZero_uid39_fpDivTest_q <= "1" WHEN z2_uid392_fracXIsZero_uid39_fpDivTest_b = c0_uid357_fracXIsZero_uid25_fpDivTest_merged_bit_select_d ELSE "0";

    -- z1_uid389_fracXIsZero_uid39_fpDivTest(BITSELECT,388)@46
    z1_uid389_fracXIsZero_uid39_fpDivTest_in <= redist94_fracY_uid13_fpDivTest_b_46_q(11 downto 0);
    z1_uid389_fracXIsZero_uid39_fpDivTest_b <= z1_uid389_fracXIsZero_uid39_fpDivTest_in(11 downto 6);

    -- eq1_uid391_fracXIsZero_uid39_fpDivTest(LOGICAL,390)@46
    eq1_uid391_fracXIsZero_uid39_fpDivTest_q <= "1" WHEN z1_uid389_fracXIsZero_uid39_fpDivTest_b = c0_uid357_fracXIsZero_uid25_fpDivTest_merged_bit_select_c ELSE "0";

    -- z0_uid386_fracXIsZero_uid39_fpDivTest(BITSELECT,385)@46
    z0_uid386_fracXIsZero_uid39_fpDivTest_in <= redist94_fracY_uid13_fpDivTest_b_46_q(5 downto 0);
    z0_uid386_fracXIsZero_uid39_fpDivTest_b <= z0_uid386_fracXIsZero_uid39_fpDivTest_in(5 downto 0);

    -- eq0_uid388_fracXIsZero_uid39_fpDivTest(LOGICAL,387)@46
    eq0_uid388_fracXIsZero_uid39_fpDivTest_q <= "1" WHEN z0_uid386_fracXIsZero_uid39_fpDivTest_b = c0_uid357_fracXIsZero_uid25_fpDivTest_merged_bit_select_b ELSE "0";

    -- and_lev0_uid413_fracXIsZero_uid39_fpDivTest(LOGICAL,412)@46 + 1
    and_lev0_uid413_fracXIsZero_uid39_fpDivTest_qi <= eq0_uid388_fracXIsZero_uid39_fpDivTest_q and eq1_uid391_fracXIsZero_uid39_fpDivTest_q and eq2_uid394_fracXIsZero_uid39_fpDivTest_q and eq3_uid397_fracXIsZero_uid39_fpDivTest_q and eq4_uid400_fracXIsZero_uid39_fpDivTest_q and eq5_uid403_fracXIsZero_uid39_fpDivTest_q;
    and_lev0_uid413_fracXIsZero_uid39_fpDivTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => and_lev0_uid413_fracXIsZero_uid39_fpDivTest_qi, xout => and_lev0_uid413_fracXIsZero_uid39_fpDivTest_q, clk => clk, aclr => areset, ena => '1' );

    -- and_lev1_uid415_fracXIsZero_uid39_fpDivTest(LOGICAL,414)@47 + 1
    and_lev1_uid415_fracXIsZero_uid39_fpDivTest_qi <= and_lev0_uid413_fracXIsZero_uid39_fpDivTest_q and and_lev0_uid414_fracXIsZero_uid39_fpDivTest_q;
    and_lev1_uid415_fracXIsZero_uid39_fpDivTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => and_lev1_uid415_fracXIsZero_uid39_fpDivTest_qi, xout => and_lev1_uid415_fracXIsZero_uid39_fpDivTest_q, clk => clk, aclr => areset, ena => '1' );

    -- cstAllOWE_uid18_fpDivTest(CONSTANT,17)
    cstAllOWE_uid18_fpDivTest_q <= "11111111111";

    -- redist96_expY_uid12_fpDivTest_b_44_notEnable(LOGICAL,773)
    redist96_expY_uid12_fpDivTest_b_44_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist96_expY_uid12_fpDivTest_b_44_nor(LOGICAL,774)
    redist96_expY_uid12_fpDivTest_b_44_nor_q <= not (redist96_expY_uid12_fpDivTest_b_44_notEnable_q or redist96_expY_uid12_fpDivTest_b_44_sticky_ena_q);

    -- redist96_expY_uid12_fpDivTest_b_44_mem_last(CONSTANT,770)
    redist96_expY_uid12_fpDivTest_b_44_mem_last_q <= "0101";

    -- redist96_expY_uid12_fpDivTest_b_44_cmp(LOGICAL,771)
    redist96_expY_uid12_fpDivTest_b_44_cmp_b <= STD_LOGIC_VECTOR("0" & redist96_expY_uid12_fpDivTest_b_44_rdcnt_q);
    redist96_expY_uid12_fpDivTest_b_44_cmp_q <= "1" WHEN redist96_expY_uid12_fpDivTest_b_44_mem_last_q = redist96_expY_uid12_fpDivTest_b_44_cmp_b ELSE "0";

    -- redist96_expY_uid12_fpDivTest_b_44_cmpReg(REG,772)
    redist96_expY_uid12_fpDivTest_b_44_cmpReg_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist96_expY_uid12_fpDivTest_b_44_cmpReg_q <= "0";
            ELSE
                redist96_expY_uid12_fpDivTest_b_44_cmpReg_q <= STD_LOGIC_VECTOR(redist96_expY_uid12_fpDivTest_b_44_cmp_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist96_expY_uid12_fpDivTest_b_44_sticky_ena(REG,775)
    redist96_expY_uid12_fpDivTest_b_44_sticky_ena_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist96_expY_uid12_fpDivTest_b_44_sticky_ena_q <= "0";
            ELSE
                IF (redist96_expY_uid12_fpDivTest_b_44_nor_q = "1") THEN
                    redist96_expY_uid12_fpDivTest_b_44_sticky_ena_q <= STD_LOGIC_VECTOR(redist96_expY_uid12_fpDivTest_b_44_cmpReg_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist96_expY_uid12_fpDivTest_b_44_enaAnd(LOGICAL,776)
    redist96_expY_uid12_fpDivTest_b_44_enaAnd_q <= redist96_expY_uid12_fpDivTest_b_44_sticky_ena_q and VCC_q;

    -- redist96_expY_uid12_fpDivTest_b_44_rdcnt(COUNTER,768)
    -- low=0, high=6, step=1, init=0
    redist96_expY_uid12_fpDivTest_b_44_rdcnt_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist96_expY_uid12_fpDivTest_b_44_rdcnt_i <= TO_UNSIGNED(0, 3);
                redist96_expY_uid12_fpDivTest_b_44_rdcnt_eq <= '0';
            ELSE
                IF (redist96_expY_uid12_fpDivTest_b_44_rdcnt_i = TO_UNSIGNED(5, 3)) THEN
                    redist96_expY_uid12_fpDivTest_b_44_rdcnt_eq <= '1';
                ELSE
                    redist96_expY_uid12_fpDivTest_b_44_rdcnt_eq <= '0';
                END IF;
                IF (redist96_expY_uid12_fpDivTest_b_44_rdcnt_eq = '1') THEN
                    redist96_expY_uid12_fpDivTest_b_44_rdcnt_i <= redist96_expY_uid12_fpDivTest_b_44_rdcnt_i + 2;
                ELSE
                    redist96_expY_uid12_fpDivTest_b_44_rdcnt_i <= redist96_expY_uid12_fpDivTest_b_44_rdcnt_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    redist96_expY_uid12_fpDivTest_b_44_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist96_expY_uid12_fpDivTest_b_44_rdcnt_i, 3)));

    -- redist96_expY_uid12_fpDivTest_b_44_split_0_nor(LOGICAL,824)
    redist96_expY_uid12_fpDivTest_b_44_split_0_nor_q <= not (redist96_expY_uid12_fpDivTest_b_44_notEnable_q or redist96_expY_uid12_fpDivTest_b_44_split_0_sticky_ena_q);

    -- redist96_expY_uid12_fpDivTest_b_44_split_0_mem_last(CONSTANT,820)
    redist96_expY_uid12_fpDivTest_b_44_split_0_mem_last_q <= "011100";

    -- redist96_expY_uid12_fpDivTest_b_44_split_0_cmp(LOGICAL,821)
    redist96_expY_uid12_fpDivTest_b_44_split_0_cmp_b <= STD_LOGIC_VECTOR("0" & redist96_expY_uid12_fpDivTest_b_44_split_0_rdcnt_q);
    redist96_expY_uid12_fpDivTest_b_44_split_0_cmp_q <= "1" WHEN redist96_expY_uid12_fpDivTest_b_44_split_0_mem_last_q = redist96_expY_uid12_fpDivTest_b_44_split_0_cmp_b ELSE "0";

    -- redist96_expY_uid12_fpDivTest_b_44_split_0_cmpReg(REG,822)
    redist96_expY_uid12_fpDivTest_b_44_split_0_cmpReg_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist96_expY_uid12_fpDivTest_b_44_split_0_cmpReg_q <= "0";
            ELSE
                redist96_expY_uid12_fpDivTest_b_44_split_0_cmpReg_q <= STD_LOGIC_VECTOR(redist96_expY_uid12_fpDivTest_b_44_split_0_cmp_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist96_expY_uid12_fpDivTest_b_44_split_0_sticky_ena(REG,825)
    redist96_expY_uid12_fpDivTest_b_44_split_0_sticky_ena_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist96_expY_uid12_fpDivTest_b_44_split_0_sticky_ena_q <= "0";
            ELSE
                IF (redist96_expY_uid12_fpDivTest_b_44_split_0_nor_q = "1") THEN
                    redist96_expY_uid12_fpDivTest_b_44_split_0_sticky_ena_q <= STD_LOGIC_VECTOR(redist96_expY_uid12_fpDivTest_b_44_split_0_cmpReg_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist96_expY_uid12_fpDivTest_b_44_split_0_enaAnd(LOGICAL,826)
    redist96_expY_uid12_fpDivTest_b_44_split_0_enaAnd_q <= redist96_expY_uid12_fpDivTest_b_44_split_0_sticky_ena_q and VCC_q;

    -- redist96_expY_uid12_fpDivTest_b_44_split_0_rdcnt(COUNTER,818)
    -- low=0, high=29, step=1, init=0
    redist96_expY_uid12_fpDivTest_b_44_split_0_rdcnt_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist96_expY_uid12_fpDivTest_b_44_split_0_rdcnt_i <= TO_UNSIGNED(0, 5);
                redist96_expY_uid12_fpDivTest_b_44_split_0_rdcnt_eq <= '0';
            ELSE
                IF (redist96_expY_uid12_fpDivTest_b_44_split_0_rdcnt_i = TO_UNSIGNED(28, 5)) THEN
                    redist96_expY_uid12_fpDivTest_b_44_split_0_rdcnt_eq <= '1';
                ELSE
                    redist96_expY_uid12_fpDivTest_b_44_split_0_rdcnt_eq <= '0';
                END IF;
                IF (redist96_expY_uid12_fpDivTest_b_44_split_0_rdcnt_eq = '1') THEN
                    redist96_expY_uid12_fpDivTest_b_44_split_0_rdcnt_i <= redist96_expY_uid12_fpDivTest_b_44_split_0_rdcnt_i + 3;
                ELSE
                    redist96_expY_uid12_fpDivTest_b_44_split_0_rdcnt_i <= redist96_expY_uid12_fpDivTest_b_44_split_0_rdcnt_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    redist96_expY_uid12_fpDivTest_b_44_split_0_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist96_expY_uid12_fpDivTest_b_44_split_0_rdcnt_i, 5)));

    -- expY_uid12_fpDivTest(BITSELECT,11)@0
    expY_uid12_fpDivTest_b <= b(62 downto 52);

    -- redist96_expY_uid12_fpDivTest_b_44_split_0_wraddr(REG,819)
    redist96_expY_uid12_fpDivTest_b_44_split_0_wraddr_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist96_expY_uid12_fpDivTest_b_44_split_0_wraddr_q <= "11101";
            ELSE
                redist96_expY_uid12_fpDivTest_b_44_split_0_wraddr_q <= STD_LOGIC_VECTOR(redist96_expY_uid12_fpDivTest_b_44_split_0_rdcnt_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist96_expY_uid12_fpDivTest_b_44_split_0_mem(DUALMEM,817)
    redist96_expY_uid12_fpDivTest_b_44_split_0_mem_ia <= STD_LOGIC_VECTOR(expY_uid12_fpDivTest_b);
    redist96_expY_uid12_fpDivTest_b_44_split_0_mem_aa <= redist96_expY_uid12_fpDivTest_b_44_split_0_wraddr_q;
    redist96_expY_uid12_fpDivTest_b_44_split_0_mem_ab <= redist96_expY_uid12_fpDivTest_b_44_split_0_rdcnt_q;
    redist96_expY_uid12_fpDivTest_b_44_split_0_mem_reset0 <= areset;
    redist96_expY_uid12_fpDivTest_b_44_split_0_mem_dmem : altera_syncram
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
        clocken1 => redist96_expY_uid12_fpDivTest_b_44_split_0_enaAnd_q(0),
        clocken0 => '1',
        clock0 => clk,
        sclr => redist96_expY_uid12_fpDivTest_b_44_split_0_mem_reset0,
        clock1 => clk,
        address_a => redist96_expY_uid12_fpDivTest_b_44_split_0_mem_aa,
        data_a => redist96_expY_uid12_fpDivTest_b_44_split_0_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist96_expY_uid12_fpDivTest_b_44_split_0_mem_ab,
        q_b => redist96_expY_uid12_fpDivTest_b_44_split_0_mem_iq
    );
    redist96_expY_uid12_fpDivTest_b_44_split_0_mem_q <= redist96_expY_uid12_fpDivTest_b_44_split_0_mem_iq(10 downto 0);

    -- redist96_expY_uid12_fpDivTest_b_44_split_0_outputreg0(DELAY,816)
    redist96_expY_uid12_fpDivTest_b_44_split_0_outputreg0_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist96_expY_uid12_fpDivTest_b_44_split_0_outputreg0_q <= (others => '0');
            ELSE
                redist96_expY_uid12_fpDivTest_b_44_split_0_outputreg0_q <= STD_LOGIC_VECTOR(redist96_expY_uid12_fpDivTest_b_44_split_0_mem_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist96_expY_uid12_fpDivTest_b_44_split_0_outputreg1(DELAY,815)
    redist96_expY_uid12_fpDivTest_b_44_split_0_outputreg1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist96_expY_uid12_fpDivTest_b_44_split_0_outputreg1_q <= (others => '0');
            ELSE
                redist96_expY_uid12_fpDivTest_b_44_split_0_outputreg1_q <= STD_LOGIC_VECTOR(redist96_expY_uid12_fpDivTest_b_44_split_0_outputreg0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist96_expY_uid12_fpDivTest_b_44_inputreg1(DELAY,764)
    redist96_expY_uid12_fpDivTest_b_44_inputreg1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist96_expY_uid12_fpDivTest_b_44_inputreg1_q <= (others => '0');
            ELSE
                redist96_expY_uid12_fpDivTest_b_44_inputreg1_q <= STD_LOGIC_VECTOR(redist96_expY_uid12_fpDivTest_b_44_split_0_outputreg1_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist96_expY_uid12_fpDivTest_b_44_inputreg0(DELAY,766)
    redist96_expY_uid12_fpDivTest_b_44_inputreg0_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist96_expY_uid12_fpDivTest_b_44_inputreg0_q <= (others => '0');
            ELSE
                redist96_expY_uid12_fpDivTest_b_44_inputreg0_q <= STD_LOGIC_VECTOR(redist96_expY_uid12_fpDivTest_b_44_inputreg1_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist96_expY_uid12_fpDivTest_b_44_wraddr(REG,769)
    redist96_expY_uid12_fpDivTest_b_44_wraddr_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist96_expY_uid12_fpDivTest_b_44_wraddr_q <= "110";
            ELSE
                redist96_expY_uid12_fpDivTest_b_44_wraddr_q <= STD_LOGIC_VECTOR(redist96_expY_uid12_fpDivTest_b_44_rdcnt_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist96_expY_uid12_fpDivTest_b_44_mem(DUALMEM,767)
    redist96_expY_uid12_fpDivTest_b_44_mem_ia <= STD_LOGIC_VECTOR(redist96_expY_uid12_fpDivTest_b_44_inputreg0_q);
    redist96_expY_uid12_fpDivTest_b_44_mem_aa <= redist96_expY_uid12_fpDivTest_b_44_wraddr_q;
    redist96_expY_uid12_fpDivTest_b_44_mem_ab <= redist96_expY_uid12_fpDivTest_b_44_rdcnt_q;
    redist96_expY_uid12_fpDivTest_b_44_mem_reset0 <= areset;
    redist96_expY_uid12_fpDivTest_b_44_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 11,
        widthad_a => 3,
        numwords_a => 7,
        width_b => 11,
        widthad_b => 3,
        numwords_b => 7,
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
        clocken1 => redist96_expY_uid12_fpDivTest_b_44_enaAnd_q(0),
        clocken0 => '1',
        clock0 => clk,
        sclr => redist96_expY_uid12_fpDivTest_b_44_mem_reset0,
        clock1 => clk,
        address_a => redist96_expY_uid12_fpDivTest_b_44_mem_aa,
        data_a => redist96_expY_uid12_fpDivTest_b_44_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist96_expY_uid12_fpDivTest_b_44_mem_ab,
        q_b => redist96_expY_uid12_fpDivTest_b_44_mem_iq
    );
    redist96_expY_uid12_fpDivTest_b_44_mem_q <= redist96_expY_uid12_fpDivTest_b_44_mem_iq(10 downto 0);

    -- redist96_expY_uid12_fpDivTest_b_44_outputreg0(DELAY,765)
    redist96_expY_uid12_fpDivTest_b_44_outputreg0_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist96_expY_uid12_fpDivTest_b_44_outputreg0_q <= (others => '0');
            ELSE
                redist96_expY_uid12_fpDivTest_b_44_outputreg0_q <= STD_LOGIC_VECTOR(redist96_expY_uid12_fpDivTest_b_44_mem_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist97_expY_uid12_fpDivTest_b_47(DELAY,607)
    redist97_expY_uid12_fpDivTest_b_47_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist97_expY_uid12_fpDivTest_b_47_delay_0 <= (others => '0');
                redist97_expY_uid12_fpDivTest_b_47_delay_1 <= (others => '0');
                redist97_expY_uid12_fpDivTest_b_47_q <= (others => '0');
            ELSE
                redist97_expY_uid12_fpDivTest_b_47_delay_0 <= STD_LOGIC_VECTOR(redist96_expY_uid12_fpDivTest_b_44_outputreg0_q);
                redist97_expY_uid12_fpDivTest_b_47_delay_1 <= redist97_expY_uid12_fpDivTest_b_47_delay_0;
                redist97_expY_uid12_fpDivTest_b_47_q <= redist97_expY_uid12_fpDivTest_b_47_delay_1;
            END IF;
        END IF;
    END PROCESS;

    -- expXIsMax_uid38_fpDivTest(LOGICAL,37)@47 + 1
    expXIsMax_uid38_fpDivTest_qi <= "1" WHEN redist97_expY_uid12_fpDivTest_b_47_q = cstAllOWE_uid18_fpDivTest_q ELSE "0";
    expXIsMax_uid38_fpDivTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => expXIsMax_uid38_fpDivTest_qi, xout => expXIsMax_uid38_fpDivTest_q, clk => clk, aclr => areset, ena => '1' );

    -- excI_y_uid41_fpDivTest(LOGICAL,40)@48
    excI_y_uid41_fpDivTest_q <= expXIsMax_uid38_fpDivTest_q and and_lev1_uid415_fracXIsZero_uid39_fpDivTest_q;

    -- redist100_fracX_uid10_fpDivTest_b_46_notEnable(LOGICAL,786)
    redist100_fracX_uid10_fpDivTest_b_46_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist100_fracX_uid10_fpDivTest_b_46_nor(LOGICAL,787)
    redist100_fracX_uid10_fpDivTest_b_46_nor_q <= not (redist100_fracX_uid10_fpDivTest_b_46_notEnable_q or redist100_fracX_uid10_fpDivTest_b_46_sticky_ena_q);

    -- redist100_fracX_uid10_fpDivTest_b_46_mem_last(CONSTANT,783)
    redist100_fracX_uid10_fpDivTest_b_46_mem_last_q <= "0101";

    -- redist100_fracX_uid10_fpDivTest_b_46_cmp(LOGICAL,784)
    redist100_fracX_uid10_fpDivTest_b_46_cmp_b <= STD_LOGIC_VECTOR("0" & redist100_fracX_uid10_fpDivTest_b_46_rdcnt_q);
    redist100_fracX_uid10_fpDivTest_b_46_cmp_q <= "1" WHEN redist100_fracX_uid10_fpDivTest_b_46_mem_last_q = redist100_fracX_uid10_fpDivTest_b_46_cmp_b ELSE "0";

    -- redist100_fracX_uid10_fpDivTest_b_46_cmpReg(REG,785)
    redist100_fracX_uid10_fpDivTest_b_46_cmpReg_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist100_fracX_uid10_fpDivTest_b_46_cmpReg_q <= "0";
            ELSE
                redist100_fracX_uid10_fpDivTest_b_46_cmpReg_q <= STD_LOGIC_VECTOR(redist100_fracX_uid10_fpDivTest_b_46_cmp_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist100_fracX_uid10_fpDivTest_b_46_sticky_ena(REG,788)
    redist100_fracX_uid10_fpDivTest_b_46_sticky_ena_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist100_fracX_uid10_fpDivTest_b_46_sticky_ena_q <= "0";
            ELSE
                IF (redist100_fracX_uid10_fpDivTest_b_46_nor_q = "1") THEN
                    redist100_fracX_uid10_fpDivTest_b_46_sticky_ena_q <= STD_LOGIC_VECTOR(redist100_fracX_uid10_fpDivTest_b_46_cmpReg_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist100_fracX_uid10_fpDivTest_b_46_enaAnd(LOGICAL,789)
    redist100_fracX_uid10_fpDivTest_b_46_enaAnd_q <= redist100_fracX_uid10_fpDivTest_b_46_sticky_ena_q and VCC_q;

    -- redist100_fracX_uid10_fpDivTest_b_46_rdcnt(COUNTER,781)
    -- low=0, high=6, step=1, init=0
    redist100_fracX_uid10_fpDivTest_b_46_rdcnt_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist100_fracX_uid10_fpDivTest_b_46_rdcnt_i <= TO_UNSIGNED(0, 3);
                redist100_fracX_uid10_fpDivTest_b_46_rdcnt_eq <= '0';
            ELSE
                IF (redist100_fracX_uid10_fpDivTest_b_46_rdcnt_i = TO_UNSIGNED(5, 3)) THEN
                    redist100_fracX_uid10_fpDivTest_b_46_rdcnt_eq <= '1';
                ELSE
                    redist100_fracX_uid10_fpDivTest_b_46_rdcnt_eq <= '0';
                END IF;
                IF (redist100_fracX_uid10_fpDivTest_b_46_rdcnt_eq = '1') THEN
                    redist100_fracX_uid10_fpDivTest_b_46_rdcnt_i <= redist100_fracX_uid10_fpDivTest_b_46_rdcnt_i + 2;
                ELSE
                    redist100_fracX_uid10_fpDivTest_b_46_rdcnt_i <= redist100_fracX_uid10_fpDivTest_b_46_rdcnt_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    redist100_fracX_uid10_fpDivTest_b_46_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist100_fracX_uid10_fpDivTest_b_46_rdcnt_i, 3)));

    -- redist99_fracX_uid10_fpDivTest_b_35_split_0_notEnable(LOGICAL,835)
    redist99_fracX_uid10_fpDivTest_b_35_split_0_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist99_fracX_uid10_fpDivTest_b_35_split_0_nor(LOGICAL,836)
    redist99_fracX_uid10_fpDivTest_b_35_split_0_nor_q <= not (redist99_fracX_uid10_fpDivTest_b_35_split_0_notEnable_q or redist99_fracX_uid10_fpDivTest_b_35_split_0_sticky_ena_q);

    -- redist99_fracX_uid10_fpDivTest_b_35_split_0_mem_last(CONSTANT,832)
    redist99_fracX_uid10_fpDivTest_b_35_split_0_mem_last_q <= "011100";

    -- redist99_fracX_uid10_fpDivTest_b_35_split_0_cmp(LOGICAL,833)
    redist99_fracX_uid10_fpDivTest_b_35_split_0_cmp_b <= STD_LOGIC_VECTOR("0" & redist99_fracX_uid10_fpDivTest_b_35_split_0_rdcnt_q);
    redist99_fracX_uid10_fpDivTest_b_35_split_0_cmp_q <= "1" WHEN redist99_fracX_uid10_fpDivTest_b_35_split_0_mem_last_q = redist99_fracX_uid10_fpDivTest_b_35_split_0_cmp_b ELSE "0";

    -- redist99_fracX_uid10_fpDivTest_b_35_split_0_cmpReg(REG,834)
    redist99_fracX_uid10_fpDivTest_b_35_split_0_cmpReg_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist99_fracX_uid10_fpDivTest_b_35_split_0_cmpReg_q <= "0";
            ELSE
                redist99_fracX_uid10_fpDivTest_b_35_split_0_cmpReg_q <= STD_LOGIC_VECTOR(redist99_fracX_uid10_fpDivTest_b_35_split_0_cmp_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist99_fracX_uid10_fpDivTest_b_35_split_0_sticky_ena(REG,837)
    redist99_fracX_uid10_fpDivTest_b_35_split_0_sticky_ena_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist99_fracX_uid10_fpDivTest_b_35_split_0_sticky_ena_q <= "0";
            ELSE
                IF (redist99_fracX_uid10_fpDivTest_b_35_split_0_nor_q = "1") THEN
                    redist99_fracX_uid10_fpDivTest_b_35_split_0_sticky_ena_q <= STD_LOGIC_VECTOR(redist99_fracX_uid10_fpDivTest_b_35_split_0_cmpReg_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist99_fracX_uid10_fpDivTest_b_35_split_0_enaAnd(LOGICAL,838)
    redist99_fracX_uid10_fpDivTest_b_35_split_0_enaAnd_q <= redist99_fracX_uid10_fpDivTest_b_35_split_0_sticky_ena_q and VCC_q;

    -- redist99_fracX_uid10_fpDivTest_b_35_split_0_rdcnt(COUNTER,830)
    -- low=0, high=29, step=1, init=0
    redist99_fracX_uid10_fpDivTest_b_35_split_0_rdcnt_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist99_fracX_uid10_fpDivTest_b_35_split_0_rdcnt_i <= TO_UNSIGNED(0, 5);
                redist99_fracX_uid10_fpDivTest_b_35_split_0_rdcnt_eq <= '0';
            ELSE
                IF (redist99_fracX_uid10_fpDivTest_b_35_split_0_rdcnt_i = TO_UNSIGNED(28, 5)) THEN
                    redist99_fracX_uid10_fpDivTest_b_35_split_0_rdcnt_eq <= '1';
                ELSE
                    redist99_fracX_uid10_fpDivTest_b_35_split_0_rdcnt_eq <= '0';
                END IF;
                IF (redist99_fracX_uid10_fpDivTest_b_35_split_0_rdcnt_eq = '1') THEN
                    redist99_fracX_uid10_fpDivTest_b_35_split_0_rdcnt_i <= redist99_fracX_uid10_fpDivTest_b_35_split_0_rdcnt_i + 3;
                ELSE
                    redist99_fracX_uid10_fpDivTest_b_35_split_0_rdcnt_i <= redist99_fracX_uid10_fpDivTest_b_35_split_0_rdcnt_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    redist99_fracX_uid10_fpDivTest_b_35_split_0_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist99_fracX_uid10_fpDivTest_b_35_split_0_rdcnt_i, 5)));

    -- fracX_uid10_fpDivTest(BITSELECT,9)@0
    fracX_uid10_fpDivTest_b <= a(51 downto 0);

    -- redist99_fracX_uid10_fpDivTest_b_35_split_0_wraddr(REG,831)
    redist99_fracX_uid10_fpDivTest_b_35_split_0_wraddr_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist99_fracX_uid10_fpDivTest_b_35_split_0_wraddr_q <= "11101";
            ELSE
                redist99_fracX_uid10_fpDivTest_b_35_split_0_wraddr_q <= STD_LOGIC_VECTOR(redist99_fracX_uid10_fpDivTest_b_35_split_0_rdcnt_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist99_fracX_uid10_fpDivTest_b_35_split_0_mem(DUALMEM,829)
    redist99_fracX_uid10_fpDivTest_b_35_split_0_mem_ia <= STD_LOGIC_VECTOR(fracX_uid10_fpDivTest_b);
    redist99_fracX_uid10_fpDivTest_b_35_split_0_mem_aa <= redist99_fracX_uid10_fpDivTest_b_35_split_0_wraddr_q;
    redist99_fracX_uid10_fpDivTest_b_35_split_0_mem_ab <= redist99_fracX_uid10_fpDivTest_b_35_split_0_rdcnt_q;
    redist99_fracX_uid10_fpDivTest_b_35_split_0_mem_reset0 <= areset;
    redist99_fracX_uid10_fpDivTest_b_35_split_0_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 52,
        widthad_a => 5,
        numwords_a => 30,
        width_b => 52,
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
        clocken1 => redist99_fracX_uid10_fpDivTest_b_35_split_0_enaAnd_q(0),
        clocken0 => '1',
        clock0 => clk,
        sclr => redist99_fracX_uid10_fpDivTest_b_35_split_0_mem_reset0,
        clock1 => clk,
        address_a => redist99_fracX_uid10_fpDivTest_b_35_split_0_mem_aa,
        data_a => redist99_fracX_uid10_fpDivTest_b_35_split_0_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist99_fracX_uid10_fpDivTest_b_35_split_0_mem_ab,
        q_b => redist99_fracX_uid10_fpDivTest_b_35_split_0_mem_iq
    );
    redist99_fracX_uid10_fpDivTest_b_35_split_0_mem_q <= redist99_fracX_uid10_fpDivTest_b_35_split_0_mem_iq(51 downto 0);

    -- redist99_fracX_uid10_fpDivTest_b_35_split_0_outputreg0(DELAY,828)
    redist99_fracX_uid10_fpDivTest_b_35_split_0_outputreg0_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist99_fracX_uid10_fpDivTest_b_35_split_0_outputreg0_q <= (others => '0');
            ELSE
                redist99_fracX_uid10_fpDivTest_b_35_split_0_outputreg0_q <= STD_LOGIC_VECTOR(redist99_fracX_uid10_fpDivTest_b_35_split_0_mem_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist99_fracX_uid10_fpDivTest_b_35_split_0_outputreg1(DELAY,827)
    redist99_fracX_uid10_fpDivTest_b_35_split_0_outputreg1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist99_fracX_uid10_fpDivTest_b_35_split_0_outputreg1_q <= (others => '0');
            ELSE
                redist99_fracX_uid10_fpDivTest_b_35_split_0_outputreg1_q <= STD_LOGIC_VECTOR(redist99_fracX_uid10_fpDivTest_b_35_split_0_outputreg0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist99_fracX_uid10_fpDivTest_b_35(DELAY,609)
    redist99_fracX_uid10_fpDivTest_b_35_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist99_fracX_uid10_fpDivTest_b_35_delay_0 <= (others => '0');
                redist99_fracX_uid10_fpDivTest_b_35_q <= (others => '0');
            ELSE
                redist99_fracX_uid10_fpDivTest_b_35_delay_0 <= STD_LOGIC_VECTOR(redist99_fracX_uid10_fpDivTest_b_35_split_0_outputreg1_q);
                redist99_fracX_uid10_fpDivTest_b_35_q <= redist99_fracX_uid10_fpDivTest_b_35_delay_0;
            END IF;
        END IF;
    END PROCESS;

    -- redist100_fracX_uid10_fpDivTest_b_46_inputreg0(DELAY,777)
    redist100_fracX_uid10_fpDivTest_b_46_inputreg0_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist100_fracX_uid10_fpDivTest_b_46_inputreg0_q <= (others => '0');
            ELSE
                redist100_fracX_uid10_fpDivTest_b_46_inputreg0_q <= STD_LOGIC_VECTOR(redist99_fracX_uid10_fpDivTest_b_35_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist100_fracX_uid10_fpDivTest_b_46_wraddr(REG,782)
    redist100_fracX_uid10_fpDivTest_b_46_wraddr_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist100_fracX_uid10_fpDivTest_b_46_wraddr_q <= "110";
            ELSE
                redist100_fracX_uid10_fpDivTest_b_46_wraddr_q <= STD_LOGIC_VECTOR(redist100_fracX_uid10_fpDivTest_b_46_rdcnt_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist100_fracX_uid10_fpDivTest_b_46_mem(DUALMEM,780)
    redist100_fracX_uid10_fpDivTest_b_46_mem_ia <= STD_LOGIC_VECTOR(redist100_fracX_uid10_fpDivTest_b_46_inputreg0_q);
    redist100_fracX_uid10_fpDivTest_b_46_mem_aa <= redist100_fracX_uid10_fpDivTest_b_46_wraddr_q;
    redist100_fracX_uid10_fpDivTest_b_46_mem_ab <= redist100_fracX_uid10_fpDivTest_b_46_rdcnt_q;
    redist100_fracX_uid10_fpDivTest_b_46_mem_reset0 <= areset;
    redist100_fracX_uid10_fpDivTest_b_46_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 52,
        widthad_a => 3,
        numwords_a => 7,
        width_b => 52,
        widthad_b => 3,
        numwords_b => 7,
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
        clocken1 => redist100_fracX_uid10_fpDivTest_b_46_enaAnd_q(0),
        clocken0 => '1',
        clock0 => clk,
        sclr => redist100_fracX_uid10_fpDivTest_b_46_mem_reset0,
        clock1 => clk,
        address_a => redist100_fracX_uid10_fpDivTest_b_46_mem_aa,
        data_a => redist100_fracX_uid10_fpDivTest_b_46_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist100_fracX_uid10_fpDivTest_b_46_mem_ab,
        q_b => redist100_fracX_uid10_fpDivTest_b_46_mem_iq
    );
    redist100_fracX_uid10_fpDivTest_b_46_mem_q <= redist100_fracX_uid10_fpDivTest_b_46_mem_iq(51 downto 0);

    -- redist100_fracX_uid10_fpDivTest_b_46_outputreg0(DELAY,779)
    redist100_fracX_uid10_fpDivTest_b_46_outputreg0_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist100_fracX_uid10_fpDivTest_b_46_outputreg0_q <= (others => '0');
            ELSE
                redist100_fracX_uid10_fpDivTest_b_46_outputreg0_q <= STD_LOGIC_VECTOR(redist100_fracX_uid10_fpDivTest_b_46_mem_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist100_fracX_uid10_fpDivTest_b_46_outputreg1(DELAY,778)
    redist100_fracX_uid10_fpDivTest_b_46_outputreg1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist100_fracX_uid10_fpDivTest_b_46_outputreg1_q <= (others => '0');
            ELSE
                redist100_fracX_uid10_fpDivTest_b_46_outputreg1_q <= STD_LOGIC_VECTOR(redist100_fracX_uid10_fpDivTest_b_46_outputreg0_q);
            END IF;
        END IF;
    END PROCESS;

    -- z0_uid356_fracXIsZero_uid25_fpDivTest_merged_bit_select(BITSELECT,497)@46
    z0_uid356_fracXIsZero_uid25_fpDivTest_merged_bit_select_b <= redist100_fracX_uid10_fpDivTest_b_46_outputreg1_q(5 downto 0);
    z0_uid356_fracXIsZero_uid25_fpDivTest_merged_bit_select_c <= redist100_fracX_uid10_fpDivTest_b_46_outputreg1_q(11 downto 6);
    z0_uid356_fracXIsZero_uid25_fpDivTest_merged_bit_select_d <= redist100_fracX_uid10_fpDivTest_b_46_outputreg1_q(17 downto 12);
    z0_uid356_fracXIsZero_uid25_fpDivTest_merged_bit_select_e <= redist100_fracX_uid10_fpDivTest_b_46_outputreg1_q(23 downto 18);
    z0_uid356_fracXIsZero_uid25_fpDivTest_merged_bit_select_f <= redist100_fracX_uid10_fpDivTest_b_46_outputreg1_q(29 downto 24);
    z0_uid356_fracXIsZero_uid25_fpDivTest_merged_bit_select_g <= redist100_fracX_uid10_fpDivTest_b_46_outputreg1_q(35 downto 30);
    z0_uid356_fracXIsZero_uid25_fpDivTest_merged_bit_select_h <= redist100_fracX_uid10_fpDivTest_b_46_outputreg1_q(41 downto 36);
    z0_uid356_fracXIsZero_uid25_fpDivTest_merged_bit_select_i <= redist100_fracX_uid10_fpDivTest_b_46_outputreg1_q(47 downto 42);
    z0_uid356_fracXIsZero_uid25_fpDivTest_merged_bit_select_j <= redist100_fracX_uid10_fpDivTest_b_46_outputreg1_q(51 downto 48);

    -- eq8_uid382_fracXIsZero_uid25_fpDivTest(LOGICAL,381)@46
    eq8_uid382_fracXIsZero_uid25_fpDivTest_q <= "1" WHEN z0_uid356_fracXIsZero_uid25_fpDivTest_merged_bit_select_j = c0_uid357_fracXIsZero_uid25_fpDivTest_merged_bit_select_j ELSE "0";

    -- eq7_uid379_fracXIsZero_uid25_fpDivTest(LOGICAL,378)@46
    eq7_uid379_fracXIsZero_uid25_fpDivTest_q <= "1" WHEN z0_uid356_fracXIsZero_uid25_fpDivTest_merged_bit_select_i = c0_uid357_fracXIsZero_uid25_fpDivTest_merged_bit_select_i ELSE "0";

    -- eq6_uid376_fracXIsZero_uid25_fpDivTest(LOGICAL,375)@46
    eq6_uid376_fracXIsZero_uid25_fpDivTest_q <= "1" WHEN z0_uid356_fracXIsZero_uid25_fpDivTest_merged_bit_select_h = c0_uid357_fracXIsZero_uid25_fpDivTest_merged_bit_select_h ELSE "0";

    -- and_lev0_uid384_fracXIsZero_uid25_fpDivTest(LOGICAL,383)@46 + 1
    and_lev0_uid384_fracXIsZero_uid25_fpDivTest_qi <= eq6_uid376_fracXIsZero_uid25_fpDivTest_q and eq7_uid379_fracXIsZero_uid25_fpDivTest_q and eq8_uid382_fracXIsZero_uid25_fpDivTest_q;
    and_lev0_uid384_fracXIsZero_uid25_fpDivTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => and_lev0_uid384_fracXIsZero_uid25_fpDivTest_qi, xout => and_lev0_uid384_fracXIsZero_uid25_fpDivTest_q, clk => clk, aclr => areset, ena => '1' );

    -- eq5_uid373_fracXIsZero_uid25_fpDivTest(LOGICAL,372)@46
    eq5_uid373_fracXIsZero_uid25_fpDivTest_q <= "1" WHEN z0_uid356_fracXIsZero_uid25_fpDivTest_merged_bit_select_g = c0_uid357_fracXIsZero_uid25_fpDivTest_merged_bit_select_g ELSE "0";

    -- eq4_uid370_fracXIsZero_uid25_fpDivTest(LOGICAL,369)@46
    eq4_uid370_fracXIsZero_uid25_fpDivTest_q <= "1" WHEN z0_uid356_fracXIsZero_uid25_fpDivTest_merged_bit_select_f = c0_uid357_fracXIsZero_uid25_fpDivTest_merged_bit_select_f ELSE "0";

    -- eq3_uid367_fracXIsZero_uid25_fpDivTest(LOGICAL,366)@46
    eq3_uid367_fracXIsZero_uid25_fpDivTest_q <= "1" WHEN z0_uid356_fracXIsZero_uid25_fpDivTest_merged_bit_select_e = c0_uid357_fracXIsZero_uid25_fpDivTest_merged_bit_select_e ELSE "0";

    -- eq2_uid364_fracXIsZero_uid25_fpDivTest(LOGICAL,363)@46
    eq2_uid364_fracXIsZero_uid25_fpDivTest_q <= "1" WHEN z0_uid356_fracXIsZero_uid25_fpDivTest_merged_bit_select_d = c0_uid357_fracXIsZero_uid25_fpDivTest_merged_bit_select_d ELSE "0";

    -- eq1_uid361_fracXIsZero_uid25_fpDivTest(LOGICAL,360)@46
    eq1_uid361_fracXIsZero_uid25_fpDivTest_q <= "1" WHEN z0_uid356_fracXIsZero_uid25_fpDivTest_merged_bit_select_c = c0_uid357_fracXIsZero_uid25_fpDivTest_merged_bit_select_c ELSE "0";

    -- eq0_uid358_fracXIsZero_uid25_fpDivTest(LOGICAL,357)@46
    eq0_uid358_fracXIsZero_uid25_fpDivTest_q <= "1" WHEN z0_uid356_fracXIsZero_uid25_fpDivTest_merged_bit_select_b = c0_uid357_fracXIsZero_uid25_fpDivTest_merged_bit_select_b ELSE "0";

    -- and_lev0_uid383_fracXIsZero_uid25_fpDivTest(LOGICAL,382)@46 + 1
    and_lev0_uid383_fracXIsZero_uid25_fpDivTest_qi <= eq0_uid358_fracXIsZero_uid25_fpDivTest_q and eq1_uid361_fracXIsZero_uid25_fpDivTest_q and eq2_uid364_fracXIsZero_uid25_fpDivTest_q and eq3_uid367_fracXIsZero_uid25_fpDivTest_q and eq4_uid370_fracXIsZero_uid25_fpDivTest_q and eq5_uid373_fracXIsZero_uid25_fpDivTest_q;
    and_lev0_uid383_fracXIsZero_uid25_fpDivTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => and_lev0_uid383_fracXIsZero_uid25_fpDivTest_qi, xout => and_lev0_uid383_fracXIsZero_uid25_fpDivTest_q, clk => clk, aclr => areset, ena => '1' );

    -- and_lev1_uid385_fracXIsZero_uid25_fpDivTest(LOGICAL,384)@47 + 1
    and_lev1_uid385_fracXIsZero_uid25_fpDivTest_qi <= and_lev0_uid383_fracXIsZero_uid25_fpDivTest_q and and_lev0_uid384_fracXIsZero_uid25_fpDivTest_q;
    and_lev1_uid385_fracXIsZero_uid25_fpDivTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => and_lev1_uid385_fracXIsZero_uid25_fpDivTest_qi, xout => and_lev1_uid385_fracXIsZero_uid25_fpDivTest_q, clk => clk, aclr => areset, ena => '1' );

    -- redist102_expX_uid9_fpDivTest_b_44_notEnable(LOGICAL,799)
    redist102_expX_uid9_fpDivTest_b_44_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist102_expX_uid9_fpDivTest_b_44_nor(LOGICAL,800)
    redist102_expX_uid9_fpDivTest_b_44_nor_q <= not (redist102_expX_uid9_fpDivTest_b_44_notEnable_q or redist102_expX_uid9_fpDivTest_b_44_sticky_ena_q);

    -- redist102_expX_uid9_fpDivTest_b_44_mem_last(CONSTANT,796)
    redist102_expX_uid9_fpDivTest_b_44_mem_last_q <= "0101";

    -- redist102_expX_uid9_fpDivTest_b_44_cmp(LOGICAL,797)
    redist102_expX_uid9_fpDivTest_b_44_cmp_b <= STD_LOGIC_VECTOR("0" & redist102_expX_uid9_fpDivTest_b_44_rdcnt_q);
    redist102_expX_uid9_fpDivTest_b_44_cmp_q <= "1" WHEN redist102_expX_uid9_fpDivTest_b_44_mem_last_q = redist102_expX_uid9_fpDivTest_b_44_cmp_b ELSE "0";

    -- redist102_expX_uid9_fpDivTest_b_44_cmpReg(REG,798)
    redist102_expX_uid9_fpDivTest_b_44_cmpReg_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist102_expX_uid9_fpDivTest_b_44_cmpReg_q <= "0";
            ELSE
                redist102_expX_uid9_fpDivTest_b_44_cmpReg_q <= STD_LOGIC_VECTOR(redist102_expX_uid9_fpDivTest_b_44_cmp_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist102_expX_uid9_fpDivTest_b_44_sticky_ena(REG,801)
    redist102_expX_uid9_fpDivTest_b_44_sticky_ena_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist102_expX_uid9_fpDivTest_b_44_sticky_ena_q <= "0";
            ELSE
                IF (redist102_expX_uid9_fpDivTest_b_44_nor_q = "1") THEN
                    redist102_expX_uid9_fpDivTest_b_44_sticky_ena_q <= STD_LOGIC_VECTOR(redist102_expX_uid9_fpDivTest_b_44_cmpReg_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist102_expX_uid9_fpDivTest_b_44_enaAnd(LOGICAL,802)
    redist102_expX_uid9_fpDivTest_b_44_enaAnd_q <= redist102_expX_uid9_fpDivTest_b_44_sticky_ena_q and VCC_q;

    -- redist102_expX_uid9_fpDivTest_b_44_rdcnt(COUNTER,794)
    -- low=0, high=6, step=1, init=0
    redist102_expX_uid9_fpDivTest_b_44_rdcnt_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist102_expX_uid9_fpDivTest_b_44_rdcnt_i <= TO_UNSIGNED(0, 3);
                redist102_expX_uid9_fpDivTest_b_44_rdcnt_eq <= '0';
            ELSE
                IF (redist102_expX_uid9_fpDivTest_b_44_rdcnt_i = TO_UNSIGNED(5, 3)) THEN
                    redist102_expX_uid9_fpDivTest_b_44_rdcnt_eq <= '1';
                ELSE
                    redist102_expX_uid9_fpDivTest_b_44_rdcnt_eq <= '0';
                END IF;
                IF (redist102_expX_uid9_fpDivTest_b_44_rdcnt_eq = '1') THEN
                    redist102_expX_uid9_fpDivTest_b_44_rdcnt_i <= redist102_expX_uid9_fpDivTest_b_44_rdcnt_i + 2;
                ELSE
                    redist102_expX_uid9_fpDivTest_b_44_rdcnt_i <= redist102_expX_uid9_fpDivTest_b_44_rdcnt_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    redist102_expX_uid9_fpDivTest_b_44_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist102_expX_uid9_fpDivTest_b_44_rdcnt_i, 3)));

    -- redist102_expX_uid9_fpDivTest_b_44_split_0_nor(LOGICAL,848)
    redist102_expX_uid9_fpDivTest_b_44_split_0_nor_q <= not (redist102_expX_uid9_fpDivTest_b_44_notEnable_q or redist102_expX_uid9_fpDivTest_b_44_split_0_sticky_ena_q);

    -- redist102_expX_uid9_fpDivTest_b_44_split_0_mem_last(CONSTANT,844)
    redist102_expX_uid9_fpDivTest_b_44_split_0_mem_last_q <= "011100";

    -- redist102_expX_uid9_fpDivTest_b_44_split_0_cmp(LOGICAL,845)
    redist102_expX_uid9_fpDivTest_b_44_split_0_cmp_b <= STD_LOGIC_VECTOR("0" & redist102_expX_uid9_fpDivTest_b_44_split_0_rdcnt_q);
    redist102_expX_uid9_fpDivTest_b_44_split_0_cmp_q <= "1" WHEN redist102_expX_uid9_fpDivTest_b_44_split_0_mem_last_q = redist102_expX_uid9_fpDivTest_b_44_split_0_cmp_b ELSE "0";

    -- redist102_expX_uid9_fpDivTest_b_44_split_0_cmpReg(REG,846)
    redist102_expX_uid9_fpDivTest_b_44_split_0_cmpReg_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist102_expX_uid9_fpDivTest_b_44_split_0_cmpReg_q <= "0";
            ELSE
                redist102_expX_uid9_fpDivTest_b_44_split_0_cmpReg_q <= STD_LOGIC_VECTOR(redist102_expX_uid9_fpDivTest_b_44_split_0_cmp_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist102_expX_uid9_fpDivTest_b_44_split_0_sticky_ena(REG,849)
    redist102_expX_uid9_fpDivTest_b_44_split_0_sticky_ena_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist102_expX_uid9_fpDivTest_b_44_split_0_sticky_ena_q <= "0";
            ELSE
                IF (redist102_expX_uid9_fpDivTest_b_44_split_0_nor_q = "1") THEN
                    redist102_expX_uid9_fpDivTest_b_44_split_0_sticky_ena_q <= STD_LOGIC_VECTOR(redist102_expX_uid9_fpDivTest_b_44_split_0_cmpReg_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist102_expX_uid9_fpDivTest_b_44_split_0_enaAnd(LOGICAL,850)
    redist102_expX_uid9_fpDivTest_b_44_split_0_enaAnd_q <= redist102_expX_uid9_fpDivTest_b_44_split_0_sticky_ena_q and VCC_q;

    -- redist102_expX_uid9_fpDivTest_b_44_split_0_rdcnt(COUNTER,842)
    -- low=0, high=29, step=1, init=0
    redist102_expX_uid9_fpDivTest_b_44_split_0_rdcnt_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist102_expX_uid9_fpDivTest_b_44_split_0_rdcnt_i <= TO_UNSIGNED(0, 5);
                redist102_expX_uid9_fpDivTest_b_44_split_0_rdcnt_eq <= '0';
            ELSE
                IF (redist102_expX_uid9_fpDivTest_b_44_split_0_rdcnt_i = TO_UNSIGNED(28, 5)) THEN
                    redist102_expX_uid9_fpDivTest_b_44_split_0_rdcnt_eq <= '1';
                ELSE
                    redist102_expX_uid9_fpDivTest_b_44_split_0_rdcnt_eq <= '0';
                END IF;
                IF (redist102_expX_uid9_fpDivTest_b_44_split_0_rdcnt_eq = '1') THEN
                    redist102_expX_uid9_fpDivTest_b_44_split_0_rdcnt_i <= redist102_expX_uid9_fpDivTest_b_44_split_0_rdcnt_i + 3;
                ELSE
                    redist102_expX_uid9_fpDivTest_b_44_split_0_rdcnt_i <= redist102_expX_uid9_fpDivTest_b_44_split_0_rdcnt_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    redist102_expX_uid9_fpDivTest_b_44_split_0_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist102_expX_uid9_fpDivTest_b_44_split_0_rdcnt_i, 5)));

    -- expX_uid9_fpDivTest(BITSELECT,8)@0
    expX_uid9_fpDivTest_b <= a(62 downto 52);

    -- redist102_expX_uid9_fpDivTest_b_44_split_0_wraddr(REG,843)
    redist102_expX_uid9_fpDivTest_b_44_split_0_wraddr_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist102_expX_uid9_fpDivTest_b_44_split_0_wraddr_q <= "11101";
            ELSE
                redist102_expX_uid9_fpDivTest_b_44_split_0_wraddr_q <= STD_LOGIC_VECTOR(redist102_expX_uid9_fpDivTest_b_44_split_0_rdcnt_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist102_expX_uid9_fpDivTest_b_44_split_0_mem(DUALMEM,841)
    redist102_expX_uid9_fpDivTest_b_44_split_0_mem_ia <= STD_LOGIC_VECTOR(expX_uid9_fpDivTest_b);
    redist102_expX_uid9_fpDivTest_b_44_split_0_mem_aa <= redist102_expX_uid9_fpDivTest_b_44_split_0_wraddr_q;
    redist102_expX_uid9_fpDivTest_b_44_split_0_mem_ab <= redist102_expX_uid9_fpDivTest_b_44_split_0_rdcnt_q;
    redist102_expX_uid9_fpDivTest_b_44_split_0_mem_reset0 <= areset;
    redist102_expX_uid9_fpDivTest_b_44_split_0_mem_dmem : altera_syncram
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
        clocken1 => redist102_expX_uid9_fpDivTest_b_44_split_0_enaAnd_q(0),
        clocken0 => '1',
        clock0 => clk,
        sclr => redist102_expX_uid9_fpDivTest_b_44_split_0_mem_reset0,
        clock1 => clk,
        address_a => redist102_expX_uid9_fpDivTest_b_44_split_0_mem_aa,
        data_a => redist102_expX_uid9_fpDivTest_b_44_split_0_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist102_expX_uid9_fpDivTest_b_44_split_0_mem_ab,
        q_b => redist102_expX_uid9_fpDivTest_b_44_split_0_mem_iq
    );
    redist102_expX_uid9_fpDivTest_b_44_split_0_mem_q <= redist102_expX_uid9_fpDivTest_b_44_split_0_mem_iq(10 downto 0);

    -- redist102_expX_uid9_fpDivTest_b_44_split_0_outputreg0(DELAY,840)
    redist102_expX_uid9_fpDivTest_b_44_split_0_outputreg0_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist102_expX_uid9_fpDivTest_b_44_split_0_outputreg0_q <= (others => '0');
            ELSE
                redist102_expX_uid9_fpDivTest_b_44_split_0_outputreg0_q <= STD_LOGIC_VECTOR(redist102_expX_uid9_fpDivTest_b_44_split_0_mem_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist102_expX_uid9_fpDivTest_b_44_split_0_outputreg1(DELAY,839)
    redist102_expX_uid9_fpDivTest_b_44_split_0_outputreg1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist102_expX_uid9_fpDivTest_b_44_split_0_outputreg1_q <= (others => '0');
            ELSE
                redist102_expX_uid9_fpDivTest_b_44_split_0_outputreg1_q <= STD_LOGIC_VECTOR(redist102_expX_uid9_fpDivTest_b_44_split_0_outputreg0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist102_expX_uid9_fpDivTest_b_44_inputreg1(DELAY,790)
    redist102_expX_uid9_fpDivTest_b_44_inputreg1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist102_expX_uid9_fpDivTest_b_44_inputreg1_q <= (others => '0');
            ELSE
                redist102_expX_uid9_fpDivTest_b_44_inputreg1_q <= STD_LOGIC_VECTOR(redist102_expX_uid9_fpDivTest_b_44_split_0_outputreg1_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist102_expX_uid9_fpDivTest_b_44_inputreg0(DELAY,792)
    redist102_expX_uid9_fpDivTest_b_44_inputreg0_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist102_expX_uid9_fpDivTest_b_44_inputreg0_q <= (others => '0');
            ELSE
                redist102_expX_uid9_fpDivTest_b_44_inputreg0_q <= STD_LOGIC_VECTOR(redist102_expX_uid9_fpDivTest_b_44_inputreg1_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist102_expX_uid9_fpDivTest_b_44_wraddr(REG,795)
    redist102_expX_uid9_fpDivTest_b_44_wraddr_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist102_expX_uid9_fpDivTest_b_44_wraddr_q <= "110";
            ELSE
                redist102_expX_uid9_fpDivTest_b_44_wraddr_q <= STD_LOGIC_VECTOR(redist102_expX_uid9_fpDivTest_b_44_rdcnt_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist102_expX_uid9_fpDivTest_b_44_mem(DUALMEM,793)
    redist102_expX_uid9_fpDivTest_b_44_mem_ia <= STD_LOGIC_VECTOR(redist102_expX_uid9_fpDivTest_b_44_inputreg0_q);
    redist102_expX_uid9_fpDivTest_b_44_mem_aa <= redist102_expX_uid9_fpDivTest_b_44_wraddr_q;
    redist102_expX_uid9_fpDivTest_b_44_mem_ab <= redist102_expX_uid9_fpDivTest_b_44_rdcnt_q;
    redist102_expX_uid9_fpDivTest_b_44_mem_reset0 <= areset;
    redist102_expX_uid9_fpDivTest_b_44_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 11,
        widthad_a => 3,
        numwords_a => 7,
        width_b => 11,
        widthad_b => 3,
        numwords_b => 7,
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
        clocken1 => redist102_expX_uid9_fpDivTest_b_44_enaAnd_q(0),
        clocken0 => '1',
        clock0 => clk,
        sclr => redist102_expX_uid9_fpDivTest_b_44_mem_reset0,
        clock1 => clk,
        address_a => redist102_expX_uid9_fpDivTest_b_44_mem_aa,
        data_a => redist102_expX_uid9_fpDivTest_b_44_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist102_expX_uid9_fpDivTest_b_44_mem_ab,
        q_b => redist102_expX_uid9_fpDivTest_b_44_mem_iq
    );
    redist102_expX_uid9_fpDivTest_b_44_mem_q <= redist102_expX_uid9_fpDivTest_b_44_mem_iq(10 downto 0);

    -- redist102_expX_uid9_fpDivTest_b_44_outputreg0(DELAY,791)
    redist102_expX_uid9_fpDivTest_b_44_outputreg0_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist102_expX_uid9_fpDivTest_b_44_outputreg0_q <= (others => '0');
            ELSE
                redist102_expX_uid9_fpDivTest_b_44_outputreg0_q <= STD_LOGIC_VECTOR(redist102_expX_uid9_fpDivTest_b_44_mem_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist103_expX_uid9_fpDivTest_b_47(DELAY,613)
    redist103_expX_uid9_fpDivTest_b_47_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist103_expX_uid9_fpDivTest_b_47_delay_0 <= (others => '0');
                redist103_expX_uid9_fpDivTest_b_47_delay_1 <= (others => '0');
                redist103_expX_uid9_fpDivTest_b_47_q <= (others => '0');
            ELSE
                redist103_expX_uid9_fpDivTest_b_47_delay_0 <= STD_LOGIC_VECTOR(redist102_expX_uid9_fpDivTest_b_44_outputreg0_q);
                redist103_expX_uid9_fpDivTest_b_47_delay_1 <= redist103_expX_uid9_fpDivTest_b_47_delay_0;
                redist103_expX_uid9_fpDivTest_b_47_q <= redist103_expX_uid9_fpDivTest_b_47_delay_1;
            END IF;
        END IF;
    END PROCESS;

    -- expXIsMax_uid24_fpDivTest(LOGICAL,23)@47
    expXIsMax_uid24_fpDivTest_q <= "1" WHEN redist103_expX_uid9_fpDivTest_b_47_q = cstAllOWE_uid18_fpDivTest_q ELSE "0";

    -- redist91_expXIsMax_uid24_fpDivTest_q_1(DELAY,601)
    redist91_expXIsMax_uid24_fpDivTest_q_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist91_expXIsMax_uid24_fpDivTest_q_1_q <= (others => '0');
            ELSE
                redist91_expXIsMax_uid24_fpDivTest_q_1_q <= STD_LOGIC_VECTOR(expXIsMax_uid24_fpDivTest_q);
            END IF;
        END IF;
    END PROCESS;

    -- excI_x_uid27_fpDivTest(LOGICAL,26)@48
    excI_x_uid27_fpDivTest_q <= redist91_expXIsMax_uid24_fpDivTest_q_1_q and and_lev1_uid385_fracXIsZero_uid25_fpDivTest_q;

    -- excXIYI_uid130_fpDivTest(LOGICAL,129)@48
    excXIYI_uid130_fpDivTest_q <= excI_x_uid27_fpDivTest_q and excI_y_uid41_fpDivTest_q;

    -- fracXIsNotZero_uid40_fpDivTest(LOGICAL,39)@48
    fracXIsNotZero_uid40_fpDivTest_q <= not (and_lev1_uid415_fracXIsZero_uid39_fpDivTest_q);

    -- excN_y_uid42_fpDivTest(LOGICAL,41)@48
    excN_y_uid42_fpDivTest_q <= expXIsMax_uid38_fpDivTest_q and fracXIsNotZero_uid40_fpDivTest_q;

    -- fracXIsNotZero_uid26_fpDivTest(LOGICAL,25)@48
    fracXIsNotZero_uid26_fpDivTest_q <= not (and_lev1_uid385_fracXIsZero_uid25_fpDivTest_q);

    -- excN_x_uid28_fpDivTest(LOGICAL,27)@48
    excN_x_uid28_fpDivTest_q <= redist91_expXIsMax_uid24_fpDivTest_q_1_q and fracXIsNotZero_uid26_fpDivTest_q;

    -- cstAllZWE_uid20_fpDivTest(CONSTANT,19)
    cstAllZWE_uid20_fpDivTest_q <= "00000000000";

    -- excZ_y_uid37_fpDivTest(LOGICAL,36)@47 + 1
    excZ_y_uid37_fpDivTest_qi <= "1" WHEN redist97_expY_uid12_fpDivTest_b_47_q = cstAllZWE_uid20_fpDivTest_q ELSE "0";
    excZ_y_uid37_fpDivTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => excZ_y_uid37_fpDivTest_qi, xout => excZ_y_uid37_fpDivTest_q, clk => clk, aclr => areset, ena => '1' );

    -- excZ_x_uid23_fpDivTest(LOGICAL,22)@47
    excZ_x_uid23_fpDivTest_q <= "1" WHEN redist103_expX_uid9_fpDivTest_b_47_q = cstAllZWE_uid20_fpDivTest_q ELSE "0";

    -- redist92_excZ_x_uid23_fpDivTest_q_1(DELAY,602)
    redist92_excZ_x_uid23_fpDivTest_q_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist92_excZ_x_uid23_fpDivTest_q_1_q <= (others => '0');
            ELSE
                redist92_excZ_x_uid23_fpDivTest_q_1_q <= STD_LOGIC_VECTOR(excZ_x_uid23_fpDivTest_q);
            END IF;
        END IF;
    END PROCESS;

    -- excXZYZ_uid129_fpDivTest(LOGICAL,128)@48
    excXZYZ_uid129_fpDivTest_q <= redist92_excZ_x_uid23_fpDivTest_q_1_q and excZ_y_uid37_fpDivTest_q;

    -- excRNaN_uid131_fpDivTest(LOGICAL,130)@48 + 1
    excRNaN_uid131_fpDivTest_qi <= excXZYZ_uid129_fpDivTest_q or excN_x_uid28_fpDivTest_q or excN_y_uid42_fpDivTest_q or excXIYI_uid130_fpDivTest_q;
    excRNaN_uid131_fpDivTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => excRNaN_uid131_fpDivTest_qi, xout => excRNaN_uid131_fpDivTest_q, clk => clk, aclr => areset, ena => '1' );

    -- invExcRNaN_uid142_fpDivTest(LOGICAL,141)@49
    invExcRNaN_uid142_fpDivTest_q <= not (excRNaN_uid131_fpDivTest_q);

    -- signY_uid14_fpDivTest(BITSELECT,13)@0
    signY_uid14_fpDivTest_b <= STD_LOGIC_VECTOR(b(63 downto 63));

    -- signX_uid11_fpDivTest(BITSELECT,10)@0
    signX_uid11_fpDivTest_b <= STD_LOGIC_VECTOR(a(63 downto 63));

    -- signR_uid46_fpDivTest(LOGICAL,45)@0 + 1
    signR_uid46_fpDivTest_qi <= signX_uid11_fpDivTest_b xor signY_uid14_fpDivTest_b;
    signR_uid46_fpDivTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => signR_uid46_fpDivTest_qi, xout => signR_uid46_fpDivTest_q, clk => clk, aclr => areset, ena => '1' );

    -- redist90_signR_uid46_fpDivTest_q_49(DELAY,600)
    redist90_signR_uid46_fpDivTest_q_49 : dspba_delay
    GENERIC MAP ( width => 1, depth => 48, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => signR_uid46_fpDivTest_q, xout => redist90_signR_uid46_fpDivTest_q_49_q, clk => clk, aclr => areset, ena => '1' );

    -- sRPostExc_uid143_fpDivTest(LOGICAL,142)@49 + 1
    sRPostExc_uid143_fpDivTest_qi <= redist90_signR_uid46_fpDivTest_q_49_q and invExcRNaN_uid142_fpDivTest_q;
    sRPostExc_uid143_fpDivTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => sRPostExc_uid143_fpDivTest_qi, xout => sRPostExc_uid143_fpDivTest_q, clk => clk, aclr => areset, ena => '1' );

    -- redist64_sRPostExc_uid143_fpDivTest_q_13(DELAY,574)
    redist64_sRPostExc_uid143_fpDivTest_q_13 : dspba_delay
    GENERIC MAP ( width => 1, depth => 12, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => sRPostExc_uid143_fpDivTest_q, xout => redist64_sRPostExc_uid143_fpDivTest_q_13_q, clk => clk, aclr => areset, ena => '1' );

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- redist76_fracPostRndF_uid80_fpDivTest_q_13_notEnable(LOGICAL,661)
    redist76_fracPostRndF_uid80_fpDivTest_q_13_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist76_fracPostRndF_uid80_fpDivTest_q_13_nor(LOGICAL,662)
    redist76_fracPostRndF_uid80_fpDivTest_q_13_nor_q <= not (redist76_fracPostRndF_uid80_fpDivTest_q_13_notEnable_q or redist76_fracPostRndF_uid80_fpDivTest_q_13_sticky_ena_q);

    -- redist76_fracPostRndF_uid80_fpDivTest_q_13_mem_last(CONSTANT,658)
    redist76_fracPostRndF_uid80_fpDivTest_q_13_mem_last_q <= "0111";

    -- redist76_fracPostRndF_uid80_fpDivTest_q_13_cmp(LOGICAL,659)
    redist76_fracPostRndF_uid80_fpDivTest_q_13_cmp_q <= "1" WHEN redist76_fracPostRndF_uid80_fpDivTest_q_13_mem_last_q = redist76_fracPostRndF_uid80_fpDivTest_q_13_rdcnt_q ELSE "0";

    -- redist76_fracPostRndF_uid80_fpDivTest_q_13_cmpReg(REG,660)
    redist76_fracPostRndF_uid80_fpDivTest_q_13_cmpReg_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist76_fracPostRndF_uid80_fpDivTest_q_13_cmpReg_q <= "0";
            ELSE
                redist76_fracPostRndF_uid80_fpDivTest_q_13_cmpReg_q <= STD_LOGIC_VECTOR(redist76_fracPostRndF_uid80_fpDivTest_q_13_cmp_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist76_fracPostRndF_uid80_fpDivTest_q_13_sticky_ena(REG,663)
    redist76_fracPostRndF_uid80_fpDivTest_q_13_sticky_ena_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist76_fracPostRndF_uid80_fpDivTest_q_13_sticky_ena_q <= "0";
            ELSE
                IF (redist76_fracPostRndF_uid80_fpDivTest_q_13_nor_q = "1") THEN
                    redist76_fracPostRndF_uid80_fpDivTest_q_13_sticky_ena_q <= STD_LOGIC_VECTOR(redist76_fracPostRndF_uid80_fpDivTest_q_13_cmpReg_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist76_fracPostRndF_uid80_fpDivTest_q_13_enaAnd(LOGICAL,664)
    redist76_fracPostRndF_uid80_fpDivTest_q_13_enaAnd_q <= redist76_fracPostRndF_uid80_fpDivTest_q_13_sticky_ena_q and VCC_q;

    -- redist76_fracPostRndF_uid80_fpDivTest_q_13_rdcnt(COUNTER,656)
    -- low=0, high=8, step=1, init=0
    redist76_fracPostRndF_uid80_fpDivTest_q_13_rdcnt_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist76_fracPostRndF_uid80_fpDivTest_q_13_rdcnt_i <= TO_UNSIGNED(0, 4);
                redist76_fracPostRndF_uid80_fpDivTest_q_13_rdcnt_eq <= '0';
            ELSE
                IF (redist76_fracPostRndF_uid80_fpDivTest_q_13_rdcnt_i = TO_UNSIGNED(7, 4)) THEN
                    redist76_fracPostRndF_uid80_fpDivTest_q_13_rdcnt_eq <= '1';
                ELSE
                    redist76_fracPostRndF_uid80_fpDivTest_q_13_rdcnt_eq <= '0';
                END IF;
                IF (redist76_fracPostRndF_uid80_fpDivTest_q_13_rdcnt_eq = '1') THEN
                    redist76_fracPostRndF_uid80_fpDivTest_q_13_rdcnt_i <= redist76_fracPostRndF_uid80_fpDivTest_q_13_rdcnt_i + 8;
                ELSE
                    redist76_fracPostRndF_uid80_fpDivTest_q_13_rdcnt_i <= redist76_fracPostRndF_uid80_fpDivTest_q_13_rdcnt_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    redist76_fracPostRndF_uid80_fpDivTest_q_13_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist76_fracPostRndF_uid80_fpDivTest_q_13_rdcnt_i, 4)));

    -- redist101_fracX_uid10_fpDivTest_b_47(DELAY,611)
    redist101_fracX_uid10_fpDivTest_b_47_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist101_fracX_uid10_fpDivTest_b_47_q <= (others => '0');
            ELSE
                redist101_fracX_uid10_fpDivTest_b_47_q <= STD_LOGIC_VECTOR(redist100_fracX_uid10_fpDivTest_b_46_outputreg1_q);
            END IF;
        END IF;
    END PROCESS;

    -- fracXExt_uid77_fpDivTest(BITJOIN,76)@47
    fracXExt_uid77_fpDivTest_q <= redist101_fracX_uid10_fpDivTest_b_47_q & GND_q;

    -- redist80_lOAdded_uid57_fpDivTest_q_10_notEnable(LOGICAL,673)
    redist80_lOAdded_uid57_fpDivTest_q_10_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist80_lOAdded_uid57_fpDivTest_q_10_nor(LOGICAL,674)
    redist80_lOAdded_uid57_fpDivTest_q_10_nor_q <= not (redist80_lOAdded_uid57_fpDivTest_q_10_notEnable_q or redist80_lOAdded_uid57_fpDivTest_q_10_sticky_ena_q);

    -- redist80_lOAdded_uid57_fpDivTest_q_10_mem_last(CONSTANT,670)
    redist80_lOAdded_uid57_fpDivTest_q_10_mem_last_q <= "010";

    -- redist80_lOAdded_uid57_fpDivTest_q_10_cmp(LOGICAL,671)
    redist80_lOAdded_uid57_fpDivTest_q_10_cmp_b <= STD_LOGIC_VECTOR("0" & redist80_lOAdded_uid57_fpDivTest_q_10_rdcnt_q);
    redist80_lOAdded_uid57_fpDivTest_q_10_cmp_q <= "1" WHEN redist80_lOAdded_uid57_fpDivTest_q_10_mem_last_q = redist80_lOAdded_uid57_fpDivTest_q_10_cmp_b ELSE "0";

    -- redist80_lOAdded_uid57_fpDivTest_q_10_cmpReg(REG,672)
    redist80_lOAdded_uid57_fpDivTest_q_10_cmpReg_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist80_lOAdded_uid57_fpDivTest_q_10_cmpReg_q <= "0";
            ELSE
                redist80_lOAdded_uid57_fpDivTest_q_10_cmpReg_q <= STD_LOGIC_VECTOR(redist80_lOAdded_uid57_fpDivTest_q_10_cmp_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist80_lOAdded_uid57_fpDivTest_q_10_sticky_ena(REG,675)
    redist80_lOAdded_uid57_fpDivTest_q_10_sticky_ena_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist80_lOAdded_uid57_fpDivTest_q_10_sticky_ena_q <= "0";
            ELSE
                IF (redist80_lOAdded_uid57_fpDivTest_q_10_nor_q = "1") THEN
                    redist80_lOAdded_uid57_fpDivTest_q_10_sticky_ena_q <= STD_LOGIC_VECTOR(redist80_lOAdded_uid57_fpDivTest_q_10_cmpReg_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist80_lOAdded_uid57_fpDivTest_q_10_enaAnd(LOGICAL,676)
    redist80_lOAdded_uid57_fpDivTest_q_10_enaAnd_q <= redist80_lOAdded_uid57_fpDivTest_q_10_sticky_ena_q and VCC_q;

    -- redist80_lOAdded_uid57_fpDivTest_q_10_rdcnt(COUNTER,668)
    -- low=0, high=3, step=1, init=0
    redist80_lOAdded_uid57_fpDivTest_q_10_rdcnt_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist80_lOAdded_uid57_fpDivTest_q_10_rdcnt_i <= TO_UNSIGNED(0, 2);
            ELSE
                redist80_lOAdded_uid57_fpDivTest_q_10_rdcnt_i <= redist80_lOAdded_uid57_fpDivTest_q_10_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist80_lOAdded_uid57_fpDivTest_q_10_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist80_lOAdded_uid57_fpDivTest_q_10_rdcnt_i, 2)));

    -- lOAdded_uid57_fpDivTest(BITJOIN,56)@35
    lOAdded_uid57_fpDivTest_q <= VCC_q & redist99_fracX_uid10_fpDivTest_b_35_q;

    -- redist78_lOAdded_uid57_fpDivTest_q_1(DELAY,588)
    redist78_lOAdded_uid57_fpDivTest_q_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist78_lOAdded_uid57_fpDivTest_q_1_q <= (others => '0');
            ELSE
                redist78_lOAdded_uid57_fpDivTest_q_1_q <= STD_LOGIC_VECTOR(lOAdded_uid57_fpDivTest_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist79_lOAdded_uid57_fpDivTest_q_3(DELAY,589)
    redist79_lOAdded_uid57_fpDivTest_q_3_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist79_lOAdded_uid57_fpDivTest_q_3_delay_0 <= (others => '0');
                redist79_lOAdded_uid57_fpDivTest_q_3_q <= (others => '0');
            ELSE
                redist79_lOAdded_uid57_fpDivTest_q_3_delay_0 <= STD_LOGIC_VECTOR(redist78_lOAdded_uid57_fpDivTest_q_1_q);
                redist79_lOAdded_uid57_fpDivTest_q_3_q <= redist79_lOAdded_uid57_fpDivTest_q_3_delay_0;
            END IF;
        END IF;
    END PROCESS;

    -- redist80_lOAdded_uid57_fpDivTest_q_10_wraddr(REG,669)
    redist80_lOAdded_uid57_fpDivTest_q_10_wraddr_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist80_lOAdded_uid57_fpDivTest_q_10_wraddr_q <= "11";
            ELSE
                redist80_lOAdded_uid57_fpDivTest_q_10_wraddr_q <= STD_LOGIC_VECTOR(redist80_lOAdded_uid57_fpDivTest_q_10_rdcnt_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist80_lOAdded_uid57_fpDivTest_q_10_mem(DUALMEM,667)
    redist80_lOAdded_uid57_fpDivTest_q_10_mem_ia <= STD_LOGIC_VECTOR(redist79_lOAdded_uid57_fpDivTest_q_3_q);
    redist80_lOAdded_uid57_fpDivTest_q_10_mem_aa <= redist80_lOAdded_uid57_fpDivTest_q_10_wraddr_q;
    redist80_lOAdded_uid57_fpDivTest_q_10_mem_ab <= redist80_lOAdded_uid57_fpDivTest_q_10_rdcnt_q;
    redist80_lOAdded_uid57_fpDivTest_q_10_mem_reset0 <= areset;
    redist80_lOAdded_uid57_fpDivTest_q_10_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 53,
        widthad_a => 2,
        numwords_a => 4,
        width_b => 53,
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
        clocken1 => redist80_lOAdded_uid57_fpDivTest_q_10_enaAnd_q(0),
        clocken0 => '1',
        clock0 => clk,
        sclr => redist80_lOAdded_uid57_fpDivTest_q_10_mem_reset0,
        clock1 => clk,
        address_a => redist80_lOAdded_uid57_fpDivTest_q_10_mem_aa,
        data_a => redist80_lOAdded_uid57_fpDivTest_q_10_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist80_lOAdded_uid57_fpDivTest_q_10_mem_ab,
        q_b => redist80_lOAdded_uid57_fpDivTest_q_10_mem_iq
    );
    redist80_lOAdded_uid57_fpDivTest_q_10_mem_q <= redist80_lOAdded_uid57_fpDivTest_q_10_mem_iq(52 downto 0);

    -- redist80_lOAdded_uid57_fpDivTest_q_10_outputreg0(DELAY,666)
    redist80_lOAdded_uid57_fpDivTest_q_10_outputreg0_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist80_lOAdded_uid57_fpDivTest_q_10_outputreg0_q <= (others => '0');
            ELSE
                redist80_lOAdded_uid57_fpDivTest_q_10_outputreg0_q <= STD_LOGIC_VECTOR(redist80_lOAdded_uid57_fpDivTest_q_10_mem_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist80_lOAdded_uid57_fpDivTest_q_10_outputreg1(DELAY,665)
    redist80_lOAdded_uid57_fpDivTest_q_10_outputreg1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist80_lOAdded_uid57_fpDivTest_q_10_outputreg1_q <= (others => '0');
            ELSE
                redist80_lOAdded_uid57_fpDivTest_q_10_outputreg1_q <= STD_LOGIC_VECTOR(redist80_lOAdded_uid57_fpDivTest_q_10_outputreg0_q);
            END IF;
        END IF;
    END PROCESS;

    -- z4_uid60_fpDivTest(CONSTANT,59)
    z4_uid60_fpDivTest_q <= "0000";

    -- oFracXZ4_uid61_fpDivTest(BITJOIN,60)@45
    oFracXZ4_uid61_fpDivTest_q <= redist80_lOAdded_uid57_fpDivTest_q_10_outputreg1_q & z4_uid60_fpDivTest_q;

    -- rightBottomY_uid229_divValPreNorm_uid59_fpDivTest(BITSELECT,228)@38
    rightBottomY_uid229_divValPreNorm_uid59_fpDivTest_b <= redist79_lOAdded_uid57_fpDivTest_q_3_q(52 downto 48);

    -- redist85_yPE_uid52_fpDivTest_b_26_notEnable(LOGICAL,713)
    redist85_yPE_uid52_fpDivTest_b_26_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist85_yPE_uid52_fpDivTest_b_26_nor(LOGICAL,714)
    redist85_yPE_uid52_fpDivTest_b_26_nor_q <= not (redist85_yPE_uid52_fpDivTest_b_26_notEnable_q or redist85_yPE_uid52_fpDivTest_b_26_sticky_ena_q);

    -- redist85_yPE_uid52_fpDivTest_b_26_mem_last(CONSTANT,710)
    redist85_yPE_uid52_fpDivTest_b_26_mem_last_q <= "01";

    -- redist85_yPE_uid52_fpDivTest_b_26_cmp(LOGICAL,711)
    redist85_yPE_uid52_fpDivTest_b_26_cmp_q <= "1" WHEN redist85_yPE_uid52_fpDivTest_b_26_mem_last_q = redist85_yPE_uid52_fpDivTest_b_26_rdcnt_q ELSE "0";

    -- redist85_yPE_uid52_fpDivTest_b_26_cmpReg(REG,712)
    redist85_yPE_uid52_fpDivTest_b_26_cmpReg_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist85_yPE_uid52_fpDivTest_b_26_cmpReg_q <= "0";
            ELSE
                redist85_yPE_uid52_fpDivTest_b_26_cmpReg_q <= STD_LOGIC_VECTOR(redist85_yPE_uid52_fpDivTest_b_26_cmp_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist85_yPE_uid52_fpDivTest_b_26_sticky_ena(REG,715)
    redist85_yPE_uid52_fpDivTest_b_26_sticky_ena_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist85_yPE_uid52_fpDivTest_b_26_sticky_ena_q <= "0";
            ELSE
                IF (redist85_yPE_uid52_fpDivTest_b_26_nor_q = "1") THEN
                    redist85_yPE_uid52_fpDivTest_b_26_sticky_ena_q <= STD_LOGIC_VECTOR(redist85_yPE_uid52_fpDivTest_b_26_cmpReg_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist85_yPE_uid52_fpDivTest_b_26_enaAnd(LOGICAL,716)
    redist85_yPE_uid52_fpDivTest_b_26_enaAnd_q <= redist85_yPE_uid52_fpDivTest_b_26_sticky_ena_q and VCC_q;

    -- redist85_yPE_uid52_fpDivTest_b_26_rdcnt(COUNTER,708)
    -- low=0, high=2, step=1, init=0
    redist85_yPE_uid52_fpDivTest_b_26_rdcnt_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist85_yPE_uid52_fpDivTest_b_26_rdcnt_i <= TO_UNSIGNED(0, 2);
                redist85_yPE_uid52_fpDivTest_b_26_rdcnt_eq <= '0';
            ELSE
                IF (redist85_yPE_uid52_fpDivTest_b_26_rdcnt_i = TO_UNSIGNED(1, 2)) THEN
                    redist85_yPE_uid52_fpDivTest_b_26_rdcnt_eq <= '1';
                ELSE
                    redist85_yPE_uid52_fpDivTest_b_26_rdcnt_eq <= '0';
                END IF;
                IF (redist85_yPE_uid52_fpDivTest_b_26_rdcnt_eq = '1') THEN
                    redist85_yPE_uid52_fpDivTest_b_26_rdcnt_i <= redist85_yPE_uid52_fpDivTest_b_26_rdcnt_i + 2;
                ELSE
                    redist85_yPE_uid52_fpDivTest_b_26_rdcnt_i <= redist85_yPE_uid52_fpDivTest_b_26_rdcnt_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    redist85_yPE_uid52_fpDivTest_b_26_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist85_yPE_uid52_fpDivTest_b_26_rdcnt_i, 2)));

    -- redist84_yPE_uid52_fpDivTest_b_18_notEnable(LOGICAL,699)
    redist84_yPE_uid52_fpDivTest_b_18_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist84_yPE_uid52_fpDivTest_b_18_nor(LOGICAL,700)
    redist84_yPE_uid52_fpDivTest_b_18_nor_q <= not (redist84_yPE_uid52_fpDivTest_b_18_notEnable_q or redist84_yPE_uid52_fpDivTest_b_18_sticky_ena_q);

    -- redist84_yPE_uid52_fpDivTest_b_18_mem_last(CONSTANT,696)
    redist84_yPE_uid52_fpDivTest_b_18_mem_last_q <= "010";

    -- redist84_yPE_uid52_fpDivTest_b_18_cmp(LOGICAL,697)
    redist84_yPE_uid52_fpDivTest_b_18_cmp_b <= STD_LOGIC_VECTOR("0" & redist84_yPE_uid52_fpDivTest_b_18_rdcnt_q);
    redist84_yPE_uid52_fpDivTest_b_18_cmp_q <= "1" WHEN redist84_yPE_uid52_fpDivTest_b_18_mem_last_q = redist84_yPE_uid52_fpDivTest_b_18_cmp_b ELSE "0";

    -- redist84_yPE_uid52_fpDivTest_b_18_cmpReg(REG,698)
    redist84_yPE_uid52_fpDivTest_b_18_cmpReg_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist84_yPE_uid52_fpDivTest_b_18_cmpReg_q <= "0";
            ELSE
                redist84_yPE_uid52_fpDivTest_b_18_cmpReg_q <= STD_LOGIC_VECTOR(redist84_yPE_uid52_fpDivTest_b_18_cmp_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist84_yPE_uid52_fpDivTest_b_18_sticky_ena(REG,701)
    redist84_yPE_uid52_fpDivTest_b_18_sticky_ena_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist84_yPE_uid52_fpDivTest_b_18_sticky_ena_q <= "0";
            ELSE
                IF (redist84_yPE_uid52_fpDivTest_b_18_nor_q = "1") THEN
                    redist84_yPE_uid52_fpDivTest_b_18_sticky_ena_q <= STD_LOGIC_VECTOR(redist84_yPE_uid52_fpDivTest_b_18_cmpReg_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist84_yPE_uid52_fpDivTest_b_18_enaAnd(LOGICAL,702)
    redist84_yPE_uid52_fpDivTest_b_18_enaAnd_q <= redist84_yPE_uid52_fpDivTest_b_18_sticky_ena_q and VCC_q;

    -- redist84_yPE_uid52_fpDivTest_b_18_rdcnt(COUNTER,694)
    -- low=0, high=3, step=1, init=0
    redist84_yPE_uid52_fpDivTest_b_18_rdcnt_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist84_yPE_uid52_fpDivTest_b_18_rdcnt_i <= TO_UNSIGNED(0, 2);
            ELSE
                redist84_yPE_uid52_fpDivTest_b_18_rdcnt_i <= redist84_yPE_uid52_fpDivTest_b_18_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist84_yPE_uid52_fpDivTest_b_18_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist84_yPE_uid52_fpDivTest_b_18_rdcnt_i, 2)));

    -- redist83_yPE_uid52_fpDivTest_b_9_notEnable(LOGICAL,685)
    redist83_yPE_uid52_fpDivTest_b_9_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist83_yPE_uid52_fpDivTest_b_9_nor(LOGICAL,686)
    redist83_yPE_uid52_fpDivTest_b_9_nor_q <= not (redist83_yPE_uid52_fpDivTest_b_9_notEnable_q or redist83_yPE_uid52_fpDivTest_b_9_sticky_ena_q);

    -- redist83_yPE_uid52_fpDivTest_b_9_mem_last(CONSTANT,682)
    redist83_yPE_uid52_fpDivTest_b_9_mem_last_q <= "010";

    -- redist83_yPE_uid52_fpDivTest_b_9_cmp(LOGICAL,683)
    redist83_yPE_uid52_fpDivTest_b_9_cmp_b <= STD_LOGIC_VECTOR("0" & redist83_yPE_uid52_fpDivTest_b_9_rdcnt_q);
    redist83_yPE_uid52_fpDivTest_b_9_cmp_q <= "1" WHEN redist83_yPE_uid52_fpDivTest_b_9_mem_last_q = redist83_yPE_uid52_fpDivTest_b_9_cmp_b ELSE "0";

    -- redist83_yPE_uid52_fpDivTest_b_9_cmpReg(REG,684)
    redist83_yPE_uid52_fpDivTest_b_9_cmpReg_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist83_yPE_uid52_fpDivTest_b_9_cmpReg_q <= "0";
            ELSE
                redist83_yPE_uid52_fpDivTest_b_9_cmpReg_q <= STD_LOGIC_VECTOR(redist83_yPE_uid52_fpDivTest_b_9_cmp_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist83_yPE_uid52_fpDivTest_b_9_sticky_ena(REG,687)
    redist83_yPE_uid52_fpDivTest_b_9_sticky_ena_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist83_yPE_uid52_fpDivTest_b_9_sticky_ena_q <= "0";
            ELSE
                IF (redist83_yPE_uid52_fpDivTest_b_9_nor_q = "1") THEN
                    redist83_yPE_uid52_fpDivTest_b_9_sticky_ena_q <= STD_LOGIC_VECTOR(redist83_yPE_uid52_fpDivTest_b_9_cmpReg_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist83_yPE_uid52_fpDivTest_b_9_enaAnd(LOGICAL,688)
    redist83_yPE_uid52_fpDivTest_b_9_enaAnd_q <= redist83_yPE_uid52_fpDivTest_b_9_sticky_ena_q and VCC_q;

    -- redist83_yPE_uid52_fpDivTest_b_9_rdcnt(COUNTER,680)
    -- low=0, high=3, step=1, init=0
    redist83_yPE_uid52_fpDivTest_b_9_rdcnt_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist83_yPE_uid52_fpDivTest_b_9_rdcnt_i <= TO_UNSIGNED(0, 2);
            ELSE
                redist83_yPE_uid52_fpDivTest_b_9_rdcnt_i <= redist83_yPE_uid52_fpDivTest_b_9_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist83_yPE_uid52_fpDivTest_b_9_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist83_yPE_uid52_fpDivTest_b_9_rdcnt_i, 2)));

    -- yPE_uid52_fpDivTest(BITSELECT,51)@0
    yPE_uid52_fpDivTest_b <= b(40 downto 0);

    -- redist82_yPE_uid52_fpDivTest_b_2(DELAY,592)
    redist82_yPE_uid52_fpDivTest_b_2_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist82_yPE_uid52_fpDivTest_b_2_delay_0 <= (others => '0');
                redist82_yPE_uid52_fpDivTest_b_2_q <= (others => '0');
            ELSE
                redist82_yPE_uid52_fpDivTest_b_2_delay_0 <= STD_LOGIC_VECTOR(yPE_uid52_fpDivTest_b);
                redist82_yPE_uid52_fpDivTest_b_2_q <= redist82_yPE_uid52_fpDivTest_b_2_delay_0;
            END IF;
        END IF;
    END PROCESS;

    -- redist83_yPE_uid52_fpDivTest_b_9_wraddr(REG,681)
    redist83_yPE_uid52_fpDivTest_b_9_wraddr_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist83_yPE_uid52_fpDivTest_b_9_wraddr_q <= "11";
            ELSE
                redist83_yPE_uid52_fpDivTest_b_9_wraddr_q <= STD_LOGIC_VECTOR(redist83_yPE_uid52_fpDivTest_b_9_rdcnt_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist83_yPE_uid52_fpDivTest_b_9_mem(DUALMEM,679)
    redist83_yPE_uid52_fpDivTest_b_9_mem_ia <= STD_LOGIC_VECTOR(redist82_yPE_uid52_fpDivTest_b_2_q);
    redist83_yPE_uid52_fpDivTest_b_9_mem_aa <= redist83_yPE_uid52_fpDivTest_b_9_wraddr_q;
    redist83_yPE_uid52_fpDivTest_b_9_mem_ab <= redist83_yPE_uid52_fpDivTest_b_9_rdcnt_q;
    redist83_yPE_uid52_fpDivTest_b_9_mem_reset0 <= areset;
    redist83_yPE_uid52_fpDivTest_b_9_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 41,
        widthad_a => 2,
        numwords_a => 4,
        width_b => 41,
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
        clocken1 => redist83_yPE_uid52_fpDivTest_b_9_enaAnd_q(0),
        clocken0 => '1',
        clock0 => clk,
        sclr => redist83_yPE_uid52_fpDivTest_b_9_mem_reset0,
        clock1 => clk,
        address_a => redist83_yPE_uid52_fpDivTest_b_9_mem_aa,
        data_a => redist83_yPE_uid52_fpDivTest_b_9_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist83_yPE_uid52_fpDivTest_b_9_mem_ab,
        q_b => redist83_yPE_uid52_fpDivTest_b_9_mem_iq
    );
    redist83_yPE_uid52_fpDivTest_b_9_mem_q <= redist83_yPE_uid52_fpDivTest_b_9_mem_iq(40 downto 0);

    -- redist83_yPE_uid52_fpDivTest_b_9_outputreg0(DELAY,678)
    redist83_yPE_uid52_fpDivTest_b_9_outputreg0_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist83_yPE_uid52_fpDivTest_b_9_outputreg0_q <= (others => '0');
            ELSE
                redist83_yPE_uid52_fpDivTest_b_9_outputreg0_q <= STD_LOGIC_VECTOR(redist83_yPE_uid52_fpDivTest_b_9_mem_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist83_yPE_uid52_fpDivTest_b_9_outputreg1(DELAY,677)
    redist83_yPE_uid52_fpDivTest_b_9_outputreg1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist83_yPE_uid52_fpDivTest_b_9_outputreg1_q <= (others => '0');
            ELSE
                redist83_yPE_uid52_fpDivTest_b_9_outputreg1_q <= STD_LOGIC_VECTOR(redist83_yPE_uid52_fpDivTest_b_9_outputreg0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist84_yPE_uid52_fpDivTest_b_18_inputreg1(DELAY,689)
    redist84_yPE_uid52_fpDivTest_b_18_inputreg1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist84_yPE_uid52_fpDivTest_b_18_inputreg1_q <= (others => '0');
            ELSE
                redist84_yPE_uid52_fpDivTest_b_18_inputreg1_q <= STD_LOGIC_VECTOR(redist83_yPE_uid52_fpDivTest_b_9_outputreg1_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist84_yPE_uid52_fpDivTest_b_18_inputreg0(DELAY,691)
    redist84_yPE_uid52_fpDivTest_b_18_inputreg0_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist84_yPE_uid52_fpDivTest_b_18_inputreg0_q <= (others => '0');
            ELSE
                redist84_yPE_uid52_fpDivTest_b_18_inputreg0_q <= STD_LOGIC_VECTOR(redist84_yPE_uid52_fpDivTest_b_18_inputreg1_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist84_yPE_uid52_fpDivTest_b_18_wraddr(REG,695)
    redist84_yPE_uid52_fpDivTest_b_18_wraddr_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist84_yPE_uid52_fpDivTest_b_18_wraddr_q <= "11";
            ELSE
                redist84_yPE_uid52_fpDivTest_b_18_wraddr_q <= STD_LOGIC_VECTOR(redist84_yPE_uid52_fpDivTest_b_18_rdcnt_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist84_yPE_uid52_fpDivTest_b_18_mem(DUALMEM,693)
    redist84_yPE_uid52_fpDivTest_b_18_mem_ia <= STD_LOGIC_VECTOR(redist84_yPE_uid52_fpDivTest_b_18_inputreg0_q);
    redist84_yPE_uid52_fpDivTest_b_18_mem_aa <= redist84_yPE_uid52_fpDivTest_b_18_wraddr_q;
    redist84_yPE_uid52_fpDivTest_b_18_mem_ab <= redist84_yPE_uid52_fpDivTest_b_18_rdcnt_q;
    redist84_yPE_uid52_fpDivTest_b_18_mem_reset0 <= areset;
    redist84_yPE_uid52_fpDivTest_b_18_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 41,
        widthad_a => 2,
        numwords_a => 4,
        width_b => 41,
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
        clocken1 => redist84_yPE_uid52_fpDivTest_b_18_enaAnd_q(0),
        clocken0 => '1',
        clock0 => clk,
        sclr => redist84_yPE_uid52_fpDivTest_b_18_mem_reset0,
        clock1 => clk,
        address_a => redist84_yPE_uid52_fpDivTest_b_18_mem_aa,
        data_a => redist84_yPE_uid52_fpDivTest_b_18_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist84_yPE_uid52_fpDivTest_b_18_mem_ab,
        q_b => redist84_yPE_uid52_fpDivTest_b_18_mem_iq
    );
    redist84_yPE_uid52_fpDivTest_b_18_mem_q <= redist84_yPE_uid52_fpDivTest_b_18_mem_iq(40 downto 0);

    -- redist84_yPE_uid52_fpDivTest_b_18_outputreg0(DELAY,692)
    redist84_yPE_uid52_fpDivTest_b_18_outputreg0_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist84_yPE_uid52_fpDivTest_b_18_outputreg0_q <= (others => '0');
            ELSE
                redist84_yPE_uid52_fpDivTest_b_18_outputreg0_q <= STD_LOGIC_VECTOR(redist84_yPE_uid52_fpDivTest_b_18_mem_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist84_yPE_uid52_fpDivTest_b_18_outputreg1(DELAY,690)
    redist84_yPE_uid52_fpDivTest_b_18_outputreg1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist84_yPE_uid52_fpDivTest_b_18_outputreg1_q <= (others => '0');
            ELSE
                redist84_yPE_uid52_fpDivTest_b_18_outputreg1_q <= STD_LOGIC_VECTOR(redist84_yPE_uid52_fpDivTest_b_18_outputreg0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist85_yPE_uid52_fpDivTest_b_26_inputreg1(DELAY,703)
    redist85_yPE_uid52_fpDivTest_b_26_inputreg1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist85_yPE_uid52_fpDivTest_b_26_inputreg1_q <= (others => '0');
            ELSE
                redist85_yPE_uid52_fpDivTest_b_26_inputreg1_q <= STD_LOGIC_VECTOR(redist84_yPE_uid52_fpDivTest_b_18_outputreg1_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist85_yPE_uid52_fpDivTest_b_26_inputreg0(DELAY,705)
    redist85_yPE_uid52_fpDivTest_b_26_inputreg0_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist85_yPE_uid52_fpDivTest_b_26_inputreg0_q <= (others => '0');
            ELSE
                redist85_yPE_uid52_fpDivTest_b_26_inputreg0_q <= STD_LOGIC_VECTOR(redist85_yPE_uid52_fpDivTest_b_26_inputreg1_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist85_yPE_uid52_fpDivTest_b_26_wraddr(REG,709)
    redist85_yPE_uid52_fpDivTest_b_26_wraddr_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist85_yPE_uid52_fpDivTest_b_26_wraddr_q <= "10";
            ELSE
                redist85_yPE_uid52_fpDivTest_b_26_wraddr_q <= STD_LOGIC_VECTOR(redist85_yPE_uid52_fpDivTest_b_26_rdcnt_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist85_yPE_uid52_fpDivTest_b_26_mem(DUALMEM,707)
    redist85_yPE_uid52_fpDivTest_b_26_mem_ia <= STD_LOGIC_VECTOR(redist85_yPE_uid52_fpDivTest_b_26_inputreg0_q);
    redist85_yPE_uid52_fpDivTest_b_26_mem_aa <= redist85_yPE_uid52_fpDivTest_b_26_wraddr_q;
    redist85_yPE_uid52_fpDivTest_b_26_mem_ab <= redist85_yPE_uid52_fpDivTest_b_26_rdcnt_q;
    redist85_yPE_uid52_fpDivTest_b_26_mem_reset0 <= areset;
    redist85_yPE_uid52_fpDivTest_b_26_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 41,
        widthad_a => 2,
        numwords_a => 3,
        width_b => 41,
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
        clocken1 => redist85_yPE_uid52_fpDivTest_b_26_enaAnd_q(0),
        clocken0 => '1',
        clock0 => clk,
        sclr => redist85_yPE_uid52_fpDivTest_b_26_mem_reset0,
        clock1 => clk,
        address_a => redist85_yPE_uid52_fpDivTest_b_26_mem_aa,
        data_a => redist85_yPE_uid52_fpDivTest_b_26_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist85_yPE_uid52_fpDivTest_b_26_mem_ab,
        q_b => redist85_yPE_uid52_fpDivTest_b_26_mem_iq
    );
    redist85_yPE_uid52_fpDivTest_b_26_mem_q <= redist85_yPE_uid52_fpDivTest_b_26_mem_iq(40 downto 0);

    -- redist85_yPE_uid52_fpDivTest_b_26_outputreg0(DELAY,706)
    redist85_yPE_uid52_fpDivTest_b_26_outputreg0_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist85_yPE_uid52_fpDivTest_b_26_outputreg0_q <= (others => '0');
            ELSE
                redist85_yPE_uid52_fpDivTest_b_26_outputreg0_q <= STD_LOGIC_VECTOR(redist85_yPE_uid52_fpDivTest_b_26_mem_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist85_yPE_uid52_fpDivTest_b_26_outputreg1(DELAY,704)
    redist85_yPE_uid52_fpDivTest_b_26_outputreg1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist85_yPE_uid52_fpDivTest_b_26_outputreg1_q <= (others => '0');
            ELSE
                redist85_yPE_uid52_fpDivTest_b_26_outputreg1_q <= STD_LOGIC_VECTOR(redist85_yPE_uid52_fpDivTest_b_26_outputreg0_q);
            END IF;
        END IF;
    END PROCESS;

    -- nx_mergedSignalTM_uid321_pT4_uid201_invPolyEval(BITJOIN,320)@26
    nx_mergedSignalTM_uid321_pT4_uid201_invPolyEval_q <= GND_q & redist85_yPE_uid52_fpDivTest_b_26_outputreg1_q;

    -- topRangeX_uid323_pT4_uid201_invPolyEval(BITSELECT,322)@26
    topRangeX_uid323_pT4_uid201_invPolyEval_b <= STD_LOGIC_VECTOR(nx_mergedSignalTM_uid321_pT4_uid201_invPolyEval_q(41 downto 15));

    -- yT3_uid194_invPolyEval(BITSELECT,193)@18
    yT3_uid194_invPolyEval_b <= redist84_yPE_uid52_fpDivTest_b_18_outputreg1_q(40 downto 3);

    -- nx_mergedSignalTM_uid286_pT3_uid195_invPolyEval(BITJOIN,285)@18
    nx_mergedSignalTM_uid286_pT3_uid195_invPolyEval_q <= GND_q & yT3_uid194_invPolyEval_b;

    -- aboveLeftX_uid290_pT3_uid195_invPolyEval(BITSELECT,289)@18
    aboveLeftX_uid290_pT3_uid195_invPolyEval_b <= STD_LOGIC_VECTOR(nx_mergedSignalTM_uid286_pT3_uid195_invPolyEval_q(38 downto 21));

    -- yAddr_uid51_fpDivTest(BITSELECT,50)@0
    yAddr_uid51_fpDivTest_b <= fracY_uid13_fpDivTest_b(51 downto 41);

    -- memoryC4_uid174_invTables_lutmem(DUALMEM,450)@0 + 2
    -- in j@20000000
    memoryC4_uid174_invTables_lutmem_aa <= yAddr_uid51_fpDivTest_b;
    memoryC4_uid174_invTables_lutmem_reset0 <= areset;
    memoryC4_uid174_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "ROM",
        width_a => 6,
        widthad_a => 11,
        numwords_a => 2048,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_sclr_a => "SCLEAR",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "float64_div_altera_fp_functions_191_4b5aiyq_memoryC4_uid174_invTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Stratix 10"
    )
    PORT MAP (
        clocken0 => '1',
        sclr => memoryC4_uid174_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC4_uid174_invTables_lutmem_aa,
        q_a => memoryC4_uid174_invTables_lutmem_ir
    );
    memoryC4_uid174_invTables_lutmem_r <= memoryC4_uid174_invTables_lutmem_ir(5 downto 0);

    -- memoryC4_uid173_invTables_lutmem(DUALMEM,449)@0 + 2
    -- in j@20000000
    memoryC4_uid173_invTables_lutmem_aa <= yAddr_uid51_fpDivTest_b;
    memoryC4_uid173_invTables_lutmem_reset0 <= areset;
    memoryC4_uid173_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "ROM",
        width_a => 10,
        widthad_a => 11,
        numwords_a => 2048,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_sclr_a => "SCLEAR",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "float64_div_altera_fp_functions_191_4b5aiyq_memoryC4_uid173_invTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Stratix 10"
    )
    PORT MAP (
        clocken0 => '1',
        sclr => memoryC4_uid173_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC4_uid173_invTables_lutmem_aa,
        q_a => memoryC4_uid173_invTables_lutmem_ir
    );
    memoryC4_uid173_invTables_lutmem_r <= memoryC4_uid173_invTables_lutmem_ir(9 downto 0);

    -- os_uid175_invTables(BITJOIN,174)@2
    os_uid175_invTables_q <= memoryC4_uid174_invTables_lutmem_r & memoryC4_uid173_invTables_lutmem_r;

    -- yT1_uid182_invPolyEval(BITSELECT,181)@2
    yT1_uid182_invPolyEval_b <= redist82_yPE_uid52_fpDivTest_b_2_q(40 downto 25);

    -- prodXY_uid246_pT1_uid183_invPolyEval_cma(CHAINMULTADD,467)@2 + 5
    -- out q@8
    prodXY_uid246_pT1_uid183_invPolyEval_cma_reset <= areset;
    prodXY_uid246_pT1_uid183_invPolyEval_cma_ena0 <= '1';
    prodXY_uid246_pT1_uid183_invPolyEval_cma_ena1 <= prodXY_uid246_pT1_uid183_invPolyEval_cma_ena0;
    prodXY_uid246_pT1_uid183_invPolyEval_cma_ena2 <= prodXY_uid246_pT1_uid183_invPolyEval_cma_ena0;
    prodXY_uid246_pT1_uid183_invPolyEval_cma_chainmultadd_hyper: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (false) THEN
            ELSE
                prodXY_uid246_pT1_uid183_invPolyEval_cma_ah(0) <= RESIZE(UNSIGNED(yT1_uid182_invPolyEval_b),16);
                prodXY_uid246_pT1_uid183_invPolyEval_cma_ch(0) <= RESIZE(SIGNED(os_uid175_invTables_q),16);
            END IF;
        END IF;
    END PROCESS;

    prodXY_uid246_pT1_uid183_invPolyEval_cma_a0 <= STD_LOGIC_VECTOR(prodXY_uid246_pT1_uid183_invPolyEval_cma_ah(0));
    prodXY_uid246_pT1_uid183_invPolyEval_cma_c0 <= STD_LOGIC_VECTOR(prodXY_uid246_pT1_uid183_invPolyEval_cma_ch(0));
    prodXY_uid246_pT1_uid183_invPolyEval_cma_DSP0 : fourteennm_mac
    GENERIC MAP (
        operation_mode => "m18x18_full",
        clear_type => "sclr",
        ay_scan_in_clock => "0",
        ay_scan_in_width => 16,
        ax_clock => "0",
        ax_width => 16,
        signed_may => "false",
        signed_max => "true",
        input_pipeline_clock => "2",
        second_pipeline_clock => "2",
        output_clock => "1",
        result_a_width => 32,
        bx_width => 0,
        by_width => 0,
        result_b_width => 0
    )
    PORT MAP (
        clk(0) => clk,
        clk(1) => clk,
        clk(2) => clk,
        ena(0) => prodXY_uid246_pT1_uid183_invPolyEval_cma_ena0,
        ena(1) => prodXY_uid246_pT1_uid183_invPolyEval_cma_ena1,
        ena(2) => prodXY_uid246_pT1_uid183_invPolyEval_cma_ena2,
        clr(0) => prodXY_uid246_pT1_uid183_invPolyEval_cma_reset,
        clr(1) => prodXY_uid246_pT1_uid183_invPolyEval_cma_reset,
        ay => prodXY_uid246_pT1_uid183_invPolyEval_cma_a0,
        ax => prodXY_uid246_pT1_uid183_invPolyEval_cma_c0,
        resulta => prodXY_uid246_pT1_uid183_invPolyEval_cma_s0
    );
    prodXY_uid246_pT1_uid183_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "NONE", phase => 0, modulus => 1 )
    PORT MAP ( xin => prodXY_uid246_pT1_uid183_invPolyEval_cma_s0, xout => prodXY_uid246_pT1_uid183_invPolyEval_cma_qq, clk => clk, aclr => areset, ena => '1' );
    prodXY_uid246_pT1_uid183_invPolyEval_cma_q <= STD_LOGIC_VECTOR(prodXY_uid246_pT1_uid183_invPolyEval_cma_qq(31 downto 0));

    -- osig_uid247_pT1_uid183_invPolyEval(BITSELECT,246)@8
    osig_uid247_pT1_uid183_invPolyEval_b <= STD_LOGIC_VECTOR(prodXY_uid246_pT1_uid183_invPolyEval_cma_q(31 downto 14));

    -- highBBits_uid185_invPolyEval(BITSELECT,184)@8
    highBBits_uid185_invPolyEval_b <= STD_LOGIC_VECTOR(osig_uid247_pT1_uid183_invPolyEval_b(17 downto 1));

    -- redist62_highBBits_uid185_invPolyEval_b_1(DELAY,572)
    redist62_highBBits_uid185_invPolyEval_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist62_highBBits_uid185_invPolyEval_b_1_q <= (others => '0');
            ELSE
                redist62_highBBits_uid185_invPolyEval_b_1_q <= STD_LOGIC_VECTOR(highBBits_uid185_invPolyEval_b);
            END IF;
        END IF;
    END PROCESS;

    -- redist86_yAddr_uid51_fpDivTest_b_6(DELAY,596)
    redist86_yAddr_uid51_fpDivTest_b_6_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist86_yAddr_uid51_fpDivTest_b_6_delay_0 <= (others => '0');
                redist86_yAddr_uid51_fpDivTest_b_6_delay_1 <= (others => '0');
                redist86_yAddr_uid51_fpDivTest_b_6_delay_2 <= (others => '0');
                redist86_yAddr_uid51_fpDivTest_b_6_q <= (others => '0');
            ELSE
                redist86_yAddr_uid51_fpDivTest_b_6_delay_0 <= STD_LOGIC_VECTOR(yAddr_uid51_fpDivTest_b);
                redist86_yAddr_uid51_fpDivTest_b_6_delay_1 <= redist86_yAddr_uid51_fpDivTest_b_6_delay_0;
                redist86_yAddr_uid51_fpDivTest_b_6_delay_2 <= redist86_yAddr_uid51_fpDivTest_b_6_delay_1;
                redist86_yAddr_uid51_fpDivTest_b_6_q <= redist86_yAddr_uid51_fpDivTest_b_6_delay_2;
            END IF;
        END IF;
    END PROCESS;

    -- redist86_yAddr_uid51_fpDivTest_b_6_outputreg0(DELAY,718)
    redist86_yAddr_uid51_fpDivTest_b_6_outputreg0_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist86_yAddr_uid51_fpDivTest_b_6_outputreg0_q <= (others => '0');
            ELSE
                redist86_yAddr_uid51_fpDivTest_b_6_outputreg0_q <= STD_LOGIC_VECTOR(redist86_yAddr_uid51_fpDivTest_b_6_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist86_yAddr_uid51_fpDivTest_b_6_outputreg1(DELAY,717)
    redist86_yAddr_uid51_fpDivTest_b_6_outputreg1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist86_yAddr_uid51_fpDivTest_b_6_outputreg1_q <= (others => '0');
            ELSE
                redist86_yAddr_uid51_fpDivTest_b_6_outputreg1_q <= STD_LOGIC_VECTOR(redist86_yAddr_uid51_fpDivTest_b_6_outputreg0_q);
            END IF;
        END IF;
    END PROCESS;

    -- memoryC3_uid170_invTables_lutmem(DUALMEM,448)@6 + 2
    -- in j@20000000
    memoryC3_uid170_invTables_lutmem_aa <= redist86_yAddr_uid51_fpDivTest_b_6_outputreg1_q;
    memoryC3_uid170_invTables_lutmem_reset0 <= areset;
    memoryC3_uid170_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "ROM",
        width_a => 8,
        widthad_a => 11,
        numwords_a => 2048,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_sclr_a => "SCLEAR",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "float64_div_altera_fp_functions_191_4b5aiyq_memoryC3_uid170_invTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Stratix 10"
    )
    PORT MAP (
        clocken0 => '1',
        sclr => memoryC3_uid170_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC3_uid170_invTables_lutmem_aa,
        q_a => memoryC3_uid170_invTables_lutmem_ir
    );
    memoryC3_uid170_invTables_lutmem_r <= memoryC3_uid170_invTables_lutmem_ir(7 downto 0);

    -- redist19_memoryC3_uid170_invTables_lutmem_r_1(DELAY,529)
    redist19_memoryC3_uid170_invTables_lutmem_r_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist19_memoryC3_uid170_invTables_lutmem_r_1_q <= (others => '0');
            ELSE
                redist19_memoryC3_uid170_invTables_lutmem_r_1_q <= STD_LOGIC_VECTOR(memoryC3_uid170_invTables_lutmem_r);
            END IF;
        END IF;
    END PROCESS;

    -- memoryC3_uid169_invTables_lutmem(DUALMEM,447)@6 + 2
    -- in j@20000000
    memoryC3_uid169_invTables_lutmem_aa <= redist86_yAddr_uid51_fpDivTest_b_6_outputreg1_q;
    memoryC3_uid169_invTables_lutmem_reset0 <= areset;
    memoryC3_uid169_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "ROM",
        width_a => 10,
        widthad_a => 11,
        numwords_a => 2048,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_sclr_a => "SCLEAR",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "float64_div_altera_fp_functions_191_4b5aiyq_memoryC3_uid169_invTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Stratix 10"
    )
    PORT MAP (
        clocken0 => '1',
        sclr => memoryC3_uid169_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC3_uid169_invTables_lutmem_aa,
        q_a => memoryC3_uid169_invTables_lutmem_ir
    );
    memoryC3_uid169_invTables_lutmem_r <= memoryC3_uid169_invTables_lutmem_ir(9 downto 0);

    -- redist20_memoryC3_uid169_invTables_lutmem_r_1(DELAY,530)
    redist20_memoryC3_uid169_invTables_lutmem_r_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist20_memoryC3_uid169_invTables_lutmem_r_1_q <= (others => '0');
            ELSE
                redist20_memoryC3_uid169_invTables_lutmem_r_1_q <= STD_LOGIC_VECTOR(memoryC3_uid169_invTables_lutmem_r);
            END IF;
        END IF;
    END PROCESS;

    -- memoryC3_uid168_invTables_lutmem(DUALMEM,446)@6 + 2
    -- in j@20000000
    memoryC3_uid168_invTables_lutmem_aa <= redist86_yAddr_uid51_fpDivTest_b_6_outputreg1_q;
    memoryC3_uid168_invTables_lutmem_reset0 <= areset;
    memoryC3_uid168_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "ROM",
        width_a => 10,
        widthad_a => 11,
        numwords_a => 2048,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_sclr_a => "SCLEAR",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "float64_div_altera_fp_functions_191_4b5aiyq_memoryC3_uid168_invTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Stratix 10"
    )
    PORT MAP (
        clocken0 => '1',
        sclr => memoryC3_uid168_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC3_uid168_invTables_lutmem_aa,
        q_a => memoryC3_uid168_invTables_lutmem_ir
    );
    memoryC3_uid168_invTables_lutmem_r <= memoryC3_uid168_invTables_lutmem_ir(9 downto 0);

    -- redist21_memoryC3_uid168_invTables_lutmem_r_1(DELAY,531)
    redist21_memoryC3_uid168_invTables_lutmem_r_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist21_memoryC3_uid168_invTables_lutmem_r_1_q <= (others => '0');
            ELSE
                redist21_memoryC3_uid168_invTables_lutmem_r_1_q <= STD_LOGIC_VECTOR(memoryC3_uid168_invTables_lutmem_r);
            END IF;
        END IF;
    END PROCESS;

    -- os_uid171_invTables(BITJOIN,170)@9
    os_uid171_invTables_q <= redist19_memoryC3_uid170_invTables_lutmem_r_1_q & redist20_memoryC3_uid169_invTables_lutmem_r_1_q & redist21_memoryC3_uid168_invTables_lutmem_r_1_q;

    -- s1sumAHighB_uid186_invPolyEval(ADD,185)@9
    s1sumAHighB_uid186_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 28 => os_uid171_invTables_q(27)) & os_uid171_invTables_q));
    s1sumAHighB_uid186_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 17 => redist62_highBBits_uid185_invPolyEval_b_1_q(16)) & redist62_highBBits_uid185_invPolyEval_b_1_q));
    s1sumAHighB_uid186_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(s1sumAHighB_uid186_invPolyEval_a) + SIGNED(s1sumAHighB_uid186_invPolyEval_b));
    s1sumAHighB_uid186_invPolyEval_q <= s1sumAHighB_uid186_invPolyEval_o(28 downto 0);

    -- lowRangeB_uid184_invPolyEval(BITSELECT,183)@8
    lowRangeB_uid184_invPolyEval_in <= osig_uid247_pT1_uid183_invPolyEval_b(0 downto 0);
    lowRangeB_uid184_invPolyEval_b <= lowRangeB_uid184_invPolyEval_in(0 downto 0);

    -- redist63_lowRangeB_uid184_invPolyEval_b_1(DELAY,573)
    redist63_lowRangeB_uid184_invPolyEval_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist63_lowRangeB_uid184_invPolyEval_b_1_q <= (others => '0');
            ELSE
                redist63_lowRangeB_uid184_invPolyEval_b_1_q <= STD_LOGIC_VECTOR(lowRangeB_uid184_invPolyEval_b);
            END IF;
        END IF;
    END PROCESS;

    -- s1_uid187_invPolyEval(BITJOIN,186)@9
    s1_uid187_invPolyEval_q <= s1sumAHighB_uid186_invPolyEval_q & redist63_lowRangeB_uid184_invPolyEval_b_1_q;

    -- rightBottomY_uid258_pT2_uid189_invPolyEval(BITSELECT,257)@9
    rightBottomY_uid258_pT2_uid189_invPolyEval_b <= STD_LOGIC_VECTOR(s1_uid187_invPolyEval_q(29 downto 24));

    -- redist48_rightBottomY_uid258_pT2_uid189_invPolyEval_b_2(DELAY,558)
    redist48_rightBottomY_uid258_pT2_uid189_invPolyEval_b_2_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist48_rightBottomY_uid258_pT2_uid189_invPolyEval_b_2_delay_0 <= (others => '0');
                redist48_rightBottomY_uid258_pT2_uid189_invPolyEval_b_2_q <= (others => '0');
            ELSE
                redist48_rightBottomY_uid258_pT2_uid189_invPolyEval_b_2_delay_0 <= STD_LOGIC_VECTOR(rightBottomY_uid258_pT2_uid189_invPolyEval_b);
                redist48_rightBottomY_uid258_pT2_uid189_invPolyEval_b_2_q <= redist48_rightBottomY_uid258_pT2_uid189_invPolyEval_b_2_delay_0;
            END IF;
        END IF;
    END PROCESS;

    -- yT2_uid188_invPolyEval(BITSELECT,187)@9
    yT2_uid188_invPolyEval_b <= redist83_yPE_uid52_fpDivTest_b_9_outputreg1_q(40 downto 13);

    -- rightBottomX_uid257_pT2_uid189_invPolyEval(BITSELECT,256)@9
    rightBottomX_uid257_pT2_uid189_invPolyEval_in <= yT2_uid188_invPolyEval_b(0 downto 0);
    rightBottomX_uid257_pT2_uid189_invPolyEval_b <= rightBottomX_uid257_pT2_uid189_invPolyEval_in(0 downto 0);

    -- redist49_rightBottomX_uid257_pT2_uid189_invPolyEval_b_2(DELAY,559)
    redist49_rightBottomX_uid257_pT2_uid189_invPolyEval_b_2_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist49_rightBottomX_uid257_pT2_uid189_invPolyEval_b_2_delay_0 <= (others => '0');
                redist49_rightBottomX_uid257_pT2_uid189_invPolyEval_b_2_q <= (others => '0');
            ELSE
                redist49_rightBottomX_uid257_pT2_uid189_invPolyEval_b_2_delay_0 <= STD_LOGIC_VECTOR(rightBottomX_uid257_pT2_uid189_invPolyEval_b);
                redist49_rightBottomX_uid257_pT2_uid189_invPolyEval_b_2_q <= redist49_rightBottomX_uid257_pT2_uid189_invPolyEval_b_2_delay_0;
            END IF;
        END IF;
    END PROCESS;

    -- sm0_uid263_pT2_uid189_invPolyEval(MULT,262)@11 + 5
    sm0_uid263_pT2_uid189_invPolyEval_pr <= signed(resize(UNSIGNED(sm0_uid263_pT2_uid189_invPolyEval_a2),2)) * SIGNED(sm0_uid263_pT2_uid189_invPolyEval_b2);
    sm0_uid263_pT2_uid189_invPolyEval_component: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                sm0_uid263_pT2_uid189_invPolyEval_a0 <= (others => '0');
                sm0_uid263_pT2_uid189_invPolyEval_b0 <= (others => '0');
                sm0_uid263_pT2_uid189_invPolyEval_a1 <= (others => '0');
                sm0_uid263_pT2_uid189_invPolyEval_b1 <= (others => '0');
                sm0_uid263_pT2_uid189_invPolyEval_a2 <= (others => '0');
                sm0_uid263_pT2_uid189_invPolyEval_b2 <= (others => '0');
                sm0_uid263_pT2_uid189_invPolyEval_s1 <= (others => '0');
            ELSE
                sm0_uid263_pT2_uid189_invPolyEval_a0 <= redist49_rightBottomX_uid257_pT2_uid189_invPolyEval_b_2_q;
                sm0_uid263_pT2_uid189_invPolyEval_b0 <= STD_LOGIC_VECTOR(redist48_rightBottomY_uid258_pT2_uid189_invPolyEval_b_2_q);
                sm0_uid263_pT2_uid189_invPolyEval_a1 <= sm0_uid263_pT2_uid189_invPolyEval_a0;
                sm0_uid263_pT2_uid189_invPolyEval_b1 <= sm0_uid263_pT2_uid189_invPolyEval_b0;
                sm0_uid263_pT2_uid189_invPolyEval_a2 <= sm0_uid263_pT2_uid189_invPolyEval_a1;
                sm0_uid263_pT2_uid189_invPolyEval_b2 <= sm0_uid263_pT2_uid189_invPolyEval_b1;
                sm0_uid263_pT2_uid189_invPolyEval_s1 <= STD_LOGIC_VECTOR(resize(sm0_uid263_pT2_uid189_invPolyEval_pr,7));
            END IF;
        END IF;
    END PROCESS;
    sm0_uid263_pT2_uid189_invPolyEval: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                sm0_uid263_pT2_uid189_invPolyEval_q <= (others => '0');
            ELSE
                sm0_uid263_pT2_uid189_invPolyEval_q <= sm0_uid263_pT2_uid189_invPolyEval_s1;
            END IF;
        END IF;
    END PROCESS;

    -- redist46_sm0_uid263_pT2_uid189_invPolyEval_q_1(DELAY,556)
    redist46_sm0_uid263_pT2_uid189_invPolyEval_q_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist46_sm0_uid263_pT2_uid189_invPolyEval_q_1_q <= (others => '0');
            ELSE
                redist46_sm0_uid263_pT2_uid189_invPolyEval_q_1_q <= STD_LOGIC_VECTOR(sm0_uid263_pT2_uid189_invPolyEval_q);
            END IF;
        END IF;
    END PROCESS;

    -- aboveLeftY_uid256_pT2_uid189_invPolyEval(BITSELECT,255)@9
    aboveLeftY_uid256_pT2_uid189_invPolyEval_in <= s1_uid187_invPolyEval_q(2 downto 0);
    aboveLeftY_uid256_pT2_uid189_invPolyEval_b <= aboveLeftY_uid256_pT2_uid189_invPolyEval_in(2 downto 0);

    -- redist50_aboveLeftY_uid256_pT2_uid189_invPolyEval_b_1(DELAY,560)
    redist50_aboveLeftY_uid256_pT2_uid189_invPolyEval_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist50_aboveLeftY_uid256_pT2_uid189_invPolyEval_b_1_q <= (others => '0');
            ELSE
                redist50_aboveLeftY_uid256_pT2_uid189_invPolyEval_b_1_q <= STD_LOGIC_VECTOR(aboveLeftY_uid256_pT2_uid189_invPolyEval_b);
            END IF;
        END IF;
    END PROCESS;

    -- aboveLeftX_uid255_pT2_uid189_invPolyEval(BITSELECT,254)@9
    aboveLeftX_uid255_pT2_uid189_invPolyEval_b <= yT2_uid188_invPolyEval_b(27 downto 24);

    -- redist51_aboveLeftX_uid255_pT2_uid189_invPolyEval_b_1(DELAY,561)
    redist51_aboveLeftX_uid255_pT2_uid189_invPolyEval_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist51_aboveLeftX_uid255_pT2_uid189_invPolyEval_b_1_q <= (others => '0');
            ELSE
                redist51_aboveLeftX_uid255_pT2_uid189_invPolyEval_b_1_q <= STD_LOGIC_VECTOR(aboveLeftX_uid255_pT2_uid189_invPolyEval_b);
            END IF;
        END IF;
    END PROCESS;

    -- sm0_uid262_pT2_uid189_invPolyEval(MULT,261)@10 + 5
    sm0_uid262_pT2_uid189_invPolyEval_pr <= UNSIGNED(sm0_uid262_pT2_uid189_invPolyEval_a2) * UNSIGNED(sm0_uid262_pT2_uid189_invPolyEval_b2);
    sm0_uid262_pT2_uid189_invPolyEval_component: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                sm0_uid262_pT2_uid189_invPolyEval_a0 <= (others => '0');
                sm0_uid262_pT2_uid189_invPolyEval_b0 <= (others => '0');
                sm0_uid262_pT2_uid189_invPolyEval_a1 <= (others => '0');
                sm0_uid262_pT2_uid189_invPolyEval_b1 <= (others => '0');
                sm0_uid262_pT2_uid189_invPolyEval_a2 <= (others => '0');
                sm0_uid262_pT2_uid189_invPolyEval_b2 <= (others => '0');
                sm0_uid262_pT2_uid189_invPolyEval_s1 <= (others => '0');
            ELSE
                sm0_uid262_pT2_uid189_invPolyEval_a0 <= redist51_aboveLeftX_uid255_pT2_uid189_invPolyEval_b_1_q;
                sm0_uid262_pT2_uid189_invPolyEval_b0 <= redist50_aboveLeftY_uid256_pT2_uid189_invPolyEval_b_1_q;
                sm0_uid262_pT2_uid189_invPolyEval_a1 <= sm0_uid262_pT2_uid189_invPolyEval_a0;
                sm0_uid262_pT2_uid189_invPolyEval_b1 <= sm0_uid262_pT2_uid189_invPolyEval_b0;
                sm0_uid262_pT2_uid189_invPolyEval_a2 <= sm0_uid262_pT2_uid189_invPolyEval_a1;
                sm0_uid262_pT2_uid189_invPolyEval_b2 <= sm0_uid262_pT2_uid189_invPolyEval_b1;
                sm0_uid262_pT2_uid189_invPolyEval_s1 <= STD_LOGIC_VECTOR(sm0_uid262_pT2_uid189_invPolyEval_pr);
            END IF;
        END IF;
    END PROCESS;
    sm0_uid262_pT2_uid189_invPolyEval: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                sm0_uid262_pT2_uid189_invPolyEval_q <= (others => '0');
            ELSE
                sm0_uid262_pT2_uid189_invPolyEval_q <= sm0_uid262_pT2_uid189_invPolyEval_s1;
            END IF;
        END IF;
    END PROCESS;

    -- redist47_sm0_uid262_pT2_uid189_invPolyEval_q_1(DELAY,557)
    redist47_sm0_uid262_pT2_uid189_invPolyEval_q_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist47_sm0_uid262_pT2_uid189_invPolyEval_q_1_q <= (others => '0');
            ELSE
                redist47_sm0_uid262_pT2_uid189_invPolyEval_q_1_q <= STD_LOGIC_VECTOR(sm0_uid262_pT2_uid189_invPolyEval_q);
            END IF;
        END IF;
    END PROCESS;

    -- topRangeY_uid260_pT2_uid189_invPolyEval(BITSELECT,259)@9
    topRangeY_uid260_pT2_uid189_invPolyEval_b <= STD_LOGIC_VECTOR(s1_uid187_invPolyEval_q(29 downto 3));

    -- topRangeX_uid259_pT2_uid189_invPolyEval(BITSELECT,258)@9
    topRangeX_uid259_pT2_uid189_invPolyEval_b <= yT2_uid188_invPolyEval_b(27 downto 1);

    -- sm0_uid261_pT2_uid189_invPolyEval_cma(CHAINMULTADD,468)@9 + 5
    -- out q@15
    sm0_uid261_pT2_uid189_invPolyEval_cma_reset <= areset;
    sm0_uid261_pT2_uid189_invPolyEval_cma_ena0 <= '1';
    sm0_uid261_pT2_uid189_invPolyEval_cma_ena1 <= sm0_uid261_pT2_uid189_invPolyEval_cma_ena0;
    sm0_uid261_pT2_uid189_invPolyEval_cma_ena2 <= sm0_uid261_pT2_uid189_invPolyEval_cma_ena0;
    sm0_uid261_pT2_uid189_invPolyEval_cma_chainmultadd_hyper: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (false) THEN
            ELSE
                sm0_uid261_pT2_uid189_invPolyEval_cma_ah(0) <= RESIZE(UNSIGNED(topRangeX_uid259_pT2_uid189_invPolyEval_b),27);
                sm0_uid261_pT2_uid189_invPolyEval_cma_ch(0) <= RESIZE(SIGNED(topRangeY_uid260_pT2_uid189_invPolyEval_b),27);
            END IF;
        END IF;
    END PROCESS;

    sm0_uid261_pT2_uid189_invPolyEval_cma_a0 <= STD_LOGIC_VECTOR(sm0_uid261_pT2_uid189_invPolyEval_cma_ah(0));
    sm0_uid261_pT2_uid189_invPolyEval_cma_c0 <= STD_LOGIC_VECTOR(sm0_uid261_pT2_uid189_invPolyEval_cma_ch(0));
    sm0_uid261_pT2_uid189_invPolyEval_cma_DSP0 : fourteennm_mac
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
        output_clock => "1",
        result_a_width => 54
    )
    PORT MAP (
        clk(0) => clk,
        clk(1) => clk,
        clk(2) => clk,
        ena(0) => sm0_uid261_pT2_uid189_invPolyEval_cma_ena0,
        ena(1) => sm0_uid261_pT2_uid189_invPolyEval_cma_ena1,
        ena(2) => sm0_uid261_pT2_uid189_invPolyEval_cma_ena2,
        clr(0) => sm0_uid261_pT2_uid189_invPolyEval_cma_reset,
        clr(1) => sm0_uid261_pT2_uid189_invPolyEval_cma_reset,
        ay => sm0_uid261_pT2_uid189_invPolyEval_cma_a0,
        ax => sm0_uid261_pT2_uid189_invPolyEval_cma_c0,
        resulta => sm0_uid261_pT2_uid189_invPolyEval_cma_s0
    );
    sm0_uid261_pT2_uid189_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 54, depth => 1, reset_kind => "NONE", phase => 0, modulus => 1 )
    PORT MAP ( xin => sm0_uid261_pT2_uid189_invPolyEval_cma_s0, xout => sm0_uid261_pT2_uid189_invPolyEval_cma_qq, clk => clk, aclr => areset, ena => '1' );
    sm0_uid261_pT2_uid189_invPolyEval_cma_q <= STD_LOGIC_VECTOR(sm0_uid261_pT2_uid189_invPolyEval_cma_qq(53 downto 0));

    -- redist16_sm0_uid261_pT2_uid189_invPolyEval_cma_q_1(DELAY,526)
    redist16_sm0_uid261_pT2_uid189_invPolyEval_cma_q_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist16_sm0_uid261_pT2_uid189_invPolyEval_cma_q_1_q <= (others => '0');
            ELSE
                redist16_sm0_uid261_pT2_uid189_invPolyEval_cma_q_1_q <= STD_LOGIC_VECTOR(sm0_uid261_pT2_uid189_invPolyEval_cma_q);
            END IF;
        END IF;
    END PROCESS;

    -- highABits_uid265_pT2_uid189_invPolyEval(BITSELECT,264)@16
    highABits_uid265_pT2_uid189_invPolyEval_b <= STD_LOGIC_VECTOR(redist16_sm0_uid261_pT2_uid189_invPolyEval_cma_q_1_q(53 downto 20));

    -- lev1_a0high_uid266_pT2_uid189_invPolyEval(ADD,265)@16
    lev1_a0high_uid266_pT2_uid189_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((35 downto 34 => highABits_uid265_pT2_uid189_invPolyEval_b(33)) & highABits_uid265_pT2_uid189_invPolyEval_b));
    lev1_a0high_uid266_pT2_uid189_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("00000000000000000000000000000" & redist47_sm0_uid262_pT2_uid189_invPolyEval_q_1_q));
    lev1_a0high_uid266_pT2_uid189_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(lev1_a0high_uid266_pT2_uid189_invPolyEval_a) + SIGNED(lev1_a0high_uid266_pT2_uid189_invPolyEval_b));
    lev1_a0high_uid266_pT2_uid189_invPolyEval_q <= lev1_a0high_uid266_pT2_uid189_invPolyEval_o(34 downto 0);

    -- lowRangeA_uid264_pT2_uid189_invPolyEval(BITSELECT,263)@16
    lowRangeA_uid264_pT2_uid189_invPolyEval_in <= redist16_sm0_uid261_pT2_uid189_invPolyEval_cma_q_1_q(19 downto 0);
    lowRangeA_uid264_pT2_uid189_invPolyEval_b <= lowRangeA_uid264_pT2_uid189_invPolyEval_in(19 downto 0);

    -- lev1_a0_uid267_pT2_uid189_invPolyEval(BITJOIN,266)@16
    lev1_a0_uid267_pT2_uid189_invPolyEval_q <= lev1_a0high_uid266_pT2_uid189_invPolyEval_q & lowRangeA_uid264_pT2_uid189_invPolyEval_b;

    -- highABits_uid269_pT2_uid189_invPolyEval(BITSELECT,268)@16
    highABits_uid269_pT2_uid189_invPolyEval_b <= STD_LOGIC_VECTOR(lev1_a0_uid267_pT2_uid189_invPolyEval_q(54 downto 20));

    -- redist44_highABits_uid269_pT2_uid189_invPolyEval_b_1(DELAY,554)
    redist44_highABits_uid269_pT2_uid189_invPolyEval_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist44_highABits_uid269_pT2_uid189_invPolyEval_b_1_q <= (others => '0');
            ELSE
                redist44_highABits_uid269_pT2_uid189_invPolyEval_b_1_q <= STD_LOGIC_VECTOR(highABits_uid269_pT2_uid189_invPolyEval_b);
            END IF;
        END IF;
    END PROCESS;

    -- lev2_a0high_uid270_pT2_uid189_invPolyEval(ADD,269)@17
    lev2_a0high_uid270_pT2_uid189_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((35 downto 35 => redist44_highABits_uid269_pT2_uid189_invPolyEval_b_1_q(34)) & redist44_highABits_uid269_pT2_uid189_invPolyEval_b_1_q));
    lev2_a0high_uid270_pT2_uid189_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((35 downto 7 => redist46_sm0_uid263_pT2_uid189_invPolyEval_q_1_q(6)) & redist46_sm0_uid263_pT2_uid189_invPolyEval_q_1_q));
    lev2_a0high_uid270_pT2_uid189_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(lev2_a0high_uid270_pT2_uid189_invPolyEval_a) + SIGNED(lev2_a0high_uid270_pT2_uid189_invPolyEval_b));
    lev2_a0high_uid270_pT2_uid189_invPolyEval_q <= lev2_a0high_uid270_pT2_uid189_invPolyEval_o(35 downto 0);

    -- lowRangeA_uid268_pT2_uid189_invPolyEval(BITSELECT,267)@16
    lowRangeA_uid268_pT2_uid189_invPolyEval_in <= lev1_a0_uid267_pT2_uid189_invPolyEval_q(19 downto 0);
    lowRangeA_uid268_pT2_uid189_invPolyEval_b <= lowRangeA_uid268_pT2_uid189_invPolyEval_in(19 downto 0);

    -- redist45_lowRangeA_uid268_pT2_uid189_invPolyEval_b_1(DELAY,555)
    redist45_lowRangeA_uid268_pT2_uid189_invPolyEval_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist45_lowRangeA_uid268_pT2_uid189_invPolyEval_b_1_q <= (others => '0');
            ELSE
                redist45_lowRangeA_uid268_pT2_uid189_invPolyEval_b_1_q <= STD_LOGIC_VECTOR(lowRangeA_uid268_pT2_uid189_invPolyEval_b);
            END IF;
        END IF;
    END PROCESS;

    -- lev2_a0_uid271_pT2_uid189_invPolyEval(BITJOIN,270)@17
    lev2_a0_uid271_pT2_uid189_invPolyEval_q <= lev2_a0high_uid270_pT2_uid189_invPolyEval_q & redist45_lowRangeA_uid268_pT2_uid189_invPolyEval_b_1_q;

    -- os_uid272_pT2_uid189_invPolyEval(BITSELECT,271)@17
    os_uid272_pT2_uid189_invPolyEval_in <= STD_LOGIC_VECTOR(lev2_a0_uid271_pT2_uid189_invPolyEval_q(53 downto 0));
    os_uid272_pT2_uid189_invPolyEval_b <= STD_LOGIC_VECTOR(os_uid272_pT2_uid189_invPolyEval_in(53 downto 25));

    -- highBBits_uid191_invPolyEval(BITSELECT,190)@17
    highBBits_uid191_invPolyEval_b <= STD_LOGIC_VECTOR(os_uid272_pT2_uid189_invPolyEval_b(28 downto 1));

    -- redist60_highBBits_uid191_invPolyEval_b_1(DELAY,570)
    redist60_highBBits_uid191_invPolyEval_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist60_highBBits_uid191_invPolyEval_b_1_q <= (others => '0');
            ELSE
                redist60_highBBits_uid191_invPolyEval_b_1_q <= STD_LOGIC_VECTOR(highBBits_uid191_invPolyEval_b);
            END IF;
        END IF;
    END PROCESS;

    -- redist87_yAddr_uid51_fpDivTest_b_15_notEnable(LOGICAL,729)
    redist87_yAddr_uid51_fpDivTest_b_15_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist87_yAddr_uid51_fpDivTest_b_15_nor(LOGICAL,730)
    redist87_yAddr_uid51_fpDivTest_b_15_nor_q <= not (redist87_yAddr_uid51_fpDivTest_b_15_notEnable_q or redist87_yAddr_uid51_fpDivTest_b_15_sticky_ena_q);

    -- redist87_yAddr_uid51_fpDivTest_b_15_mem_last(CONSTANT,726)
    redist87_yAddr_uid51_fpDivTest_b_15_mem_last_q <= "010";

    -- redist87_yAddr_uid51_fpDivTest_b_15_cmp(LOGICAL,727)
    redist87_yAddr_uid51_fpDivTest_b_15_cmp_b <= STD_LOGIC_VECTOR("0" & redist87_yAddr_uid51_fpDivTest_b_15_rdcnt_q);
    redist87_yAddr_uid51_fpDivTest_b_15_cmp_q <= "1" WHEN redist87_yAddr_uid51_fpDivTest_b_15_mem_last_q = redist87_yAddr_uid51_fpDivTest_b_15_cmp_b ELSE "0";

    -- redist87_yAddr_uid51_fpDivTest_b_15_cmpReg(REG,728)
    redist87_yAddr_uid51_fpDivTest_b_15_cmpReg_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist87_yAddr_uid51_fpDivTest_b_15_cmpReg_q <= "0";
            ELSE
                redist87_yAddr_uid51_fpDivTest_b_15_cmpReg_q <= STD_LOGIC_VECTOR(redist87_yAddr_uid51_fpDivTest_b_15_cmp_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist87_yAddr_uid51_fpDivTest_b_15_sticky_ena(REG,731)
    redist87_yAddr_uid51_fpDivTest_b_15_sticky_ena_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist87_yAddr_uid51_fpDivTest_b_15_sticky_ena_q <= "0";
            ELSE
                IF (redist87_yAddr_uid51_fpDivTest_b_15_nor_q = "1") THEN
                    redist87_yAddr_uid51_fpDivTest_b_15_sticky_ena_q <= STD_LOGIC_VECTOR(redist87_yAddr_uid51_fpDivTest_b_15_cmpReg_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist87_yAddr_uid51_fpDivTest_b_15_enaAnd(LOGICAL,732)
    redist87_yAddr_uid51_fpDivTest_b_15_enaAnd_q <= redist87_yAddr_uid51_fpDivTest_b_15_sticky_ena_q and VCC_q;

    -- redist87_yAddr_uid51_fpDivTest_b_15_rdcnt(COUNTER,724)
    -- low=0, high=3, step=1, init=0
    redist87_yAddr_uid51_fpDivTest_b_15_rdcnt_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist87_yAddr_uid51_fpDivTest_b_15_rdcnt_i <= TO_UNSIGNED(0, 2);
            ELSE
                redist87_yAddr_uid51_fpDivTest_b_15_rdcnt_i <= redist87_yAddr_uid51_fpDivTest_b_15_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist87_yAddr_uid51_fpDivTest_b_15_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist87_yAddr_uid51_fpDivTest_b_15_rdcnt_i, 2)));

    -- redist87_yAddr_uid51_fpDivTest_b_15_inputreg1(DELAY,719)
    redist87_yAddr_uid51_fpDivTest_b_15_inputreg1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist87_yAddr_uid51_fpDivTest_b_15_inputreg1_q <= (others => '0');
            ELSE
                redist87_yAddr_uid51_fpDivTest_b_15_inputreg1_q <= STD_LOGIC_VECTOR(redist86_yAddr_uid51_fpDivTest_b_6_outputreg1_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist87_yAddr_uid51_fpDivTest_b_15_inputreg0(DELAY,721)
    redist87_yAddr_uid51_fpDivTest_b_15_inputreg0_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist87_yAddr_uid51_fpDivTest_b_15_inputreg0_q <= (others => '0');
            ELSE
                redist87_yAddr_uid51_fpDivTest_b_15_inputreg0_q <= STD_LOGIC_VECTOR(redist87_yAddr_uid51_fpDivTest_b_15_inputreg1_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist87_yAddr_uid51_fpDivTest_b_15_wraddr(REG,725)
    redist87_yAddr_uid51_fpDivTest_b_15_wraddr_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist87_yAddr_uid51_fpDivTest_b_15_wraddr_q <= "11";
            ELSE
                redist87_yAddr_uid51_fpDivTest_b_15_wraddr_q <= STD_LOGIC_VECTOR(redist87_yAddr_uid51_fpDivTest_b_15_rdcnt_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist87_yAddr_uid51_fpDivTest_b_15_mem(DUALMEM,723)
    redist87_yAddr_uid51_fpDivTest_b_15_mem_ia <= STD_LOGIC_VECTOR(redist87_yAddr_uid51_fpDivTest_b_15_inputreg0_q);
    redist87_yAddr_uid51_fpDivTest_b_15_mem_aa <= redist87_yAddr_uid51_fpDivTest_b_15_wraddr_q;
    redist87_yAddr_uid51_fpDivTest_b_15_mem_ab <= redist87_yAddr_uid51_fpDivTest_b_15_rdcnt_q;
    redist87_yAddr_uid51_fpDivTest_b_15_mem_reset0 <= areset;
    redist87_yAddr_uid51_fpDivTest_b_15_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 11,
        widthad_a => 2,
        numwords_a => 4,
        width_b => 11,
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
        clocken1 => redist87_yAddr_uid51_fpDivTest_b_15_enaAnd_q(0),
        clocken0 => '1',
        clock0 => clk,
        sclr => redist87_yAddr_uid51_fpDivTest_b_15_mem_reset0,
        clock1 => clk,
        address_a => redist87_yAddr_uid51_fpDivTest_b_15_mem_aa,
        data_a => redist87_yAddr_uid51_fpDivTest_b_15_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist87_yAddr_uid51_fpDivTest_b_15_mem_ab,
        q_b => redist87_yAddr_uid51_fpDivTest_b_15_mem_iq
    );
    redist87_yAddr_uid51_fpDivTest_b_15_mem_q <= redist87_yAddr_uid51_fpDivTest_b_15_mem_iq(10 downto 0);

    -- redist87_yAddr_uid51_fpDivTest_b_15_outputreg0(DELAY,722)
    redist87_yAddr_uid51_fpDivTest_b_15_outputreg0_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist87_yAddr_uid51_fpDivTest_b_15_outputreg0_q <= (others => '0');
            ELSE
                redist87_yAddr_uid51_fpDivTest_b_15_outputreg0_q <= STD_LOGIC_VECTOR(redist87_yAddr_uid51_fpDivTest_b_15_mem_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist87_yAddr_uid51_fpDivTest_b_15_outputreg1(DELAY,720)
    redist87_yAddr_uid51_fpDivTest_b_15_outputreg1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist87_yAddr_uid51_fpDivTest_b_15_outputreg1_q <= (others => '0');
            ELSE
                redist87_yAddr_uid51_fpDivTest_b_15_outputreg1_q <= STD_LOGIC_VECTOR(redist87_yAddr_uid51_fpDivTest_b_15_outputreg0_q);
            END IF;
        END IF;
    END PROCESS;

    -- memoryC2_uid165_invTables_lutmem(DUALMEM,445)@15 + 2
    -- in j@20000000
    memoryC2_uid165_invTables_lutmem_aa <= redist87_yAddr_uid51_fpDivTest_b_15_outputreg1_q;
    memoryC2_uid165_invTables_lutmem_reset0 <= areset;
    memoryC2_uid165_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "ROM",
        width_a => 8,
        widthad_a => 11,
        numwords_a => 2048,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_sclr_a => "SCLEAR",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "float64_div_altera_fp_functions_191_4b5aiyq_memoryC2_uid165_invTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Stratix 10"
    )
    PORT MAP (
        clocken0 => '1',
        sclr => memoryC2_uid165_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC2_uid165_invTables_lutmem_aa,
        q_a => memoryC2_uid165_invTables_lutmem_ir
    );
    memoryC2_uid165_invTables_lutmem_r <= memoryC2_uid165_invTables_lutmem_ir(7 downto 0);

    -- redist22_memoryC2_uid165_invTables_lutmem_r_1(DELAY,532)
    redist22_memoryC2_uid165_invTables_lutmem_r_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist22_memoryC2_uid165_invTables_lutmem_r_1_q <= (others => '0');
            ELSE
                redist22_memoryC2_uid165_invTables_lutmem_r_1_q <= STD_LOGIC_VECTOR(memoryC2_uid165_invTables_lutmem_r);
            END IF;
        END IF;
    END PROCESS;

    -- memoryC2_uid164_invTables_lutmem(DUALMEM,444)@15 + 2
    -- in j@20000000
    memoryC2_uid164_invTables_lutmem_aa <= redist87_yAddr_uid51_fpDivTest_b_15_outputreg1_q;
    memoryC2_uid164_invTables_lutmem_reset0 <= areset;
    memoryC2_uid164_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "ROM",
        width_a => 10,
        widthad_a => 11,
        numwords_a => 2048,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_sclr_a => "SCLEAR",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "float64_div_altera_fp_functions_191_4b5aiyq_memoryC2_uid164_invTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Stratix 10"
    )
    PORT MAP (
        clocken0 => '1',
        sclr => memoryC2_uid164_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC2_uid164_invTables_lutmem_aa,
        q_a => memoryC2_uid164_invTables_lutmem_ir
    );
    memoryC2_uid164_invTables_lutmem_r <= memoryC2_uid164_invTables_lutmem_ir(9 downto 0);

    -- redist23_memoryC2_uid164_invTables_lutmem_r_1(DELAY,533)
    redist23_memoryC2_uid164_invTables_lutmem_r_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist23_memoryC2_uid164_invTables_lutmem_r_1_q <= (others => '0');
            ELSE
                redist23_memoryC2_uid164_invTables_lutmem_r_1_q <= STD_LOGIC_VECTOR(memoryC2_uid164_invTables_lutmem_r);
            END IF;
        END IF;
    END PROCESS;

    -- memoryC2_uid163_invTables_lutmem(DUALMEM,443)@15 + 2
    -- in j@20000000
    memoryC2_uid163_invTables_lutmem_aa <= redist87_yAddr_uid51_fpDivTest_b_15_outputreg1_q;
    memoryC2_uid163_invTables_lutmem_reset0 <= areset;
    memoryC2_uid163_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "ROM",
        width_a => 10,
        widthad_a => 11,
        numwords_a => 2048,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_sclr_a => "SCLEAR",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "float64_div_altera_fp_functions_191_4b5aiyq_memoryC2_uid163_invTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Stratix 10"
    )
    PORT MAP (
        clocken0 => '1',
        sclr => memoryC2_uid163_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC2_uid163_invTables_lutmem_aa,
        q_a => memoryC2_uid163_invTables_lutmem_ir
    );
    memoryC2_uid163_invTables_lutmem_r <= memoryC2_uid163_invTables_lutmem_ir(9 downto 0);

    -- redist24_memoryC2_uid163_invTables_lutmem_r_1(DELAY,534)
    redist24_memoryC2_uid163_invTables_lutmem_r_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist24_memoryC2_uid163_invTables_lutmem_r_1_q <= (others => '0');
            ELSE
                redist24_memoryC2_uid163_invTables_lutmem_r_1_q <= STD_LOGIC_VECTOR(memoryC2_uid163_invTables_lutmem_r);
            END IF;
        END IF;
    END PROCESS;

    -- memoryC2_uid162_invTables_lutmem(DUALMEM,442)@15 + 2
    -- in j@20000000
    memoryC2_uid162_invTables_lutmem_aa <= redist87_yAddr_uid51_fpDivTest_b_15_outputreg1_q;
    memoryC2_uid162_invTables_lutmem_reset0 <= areset;
    memoryC2_uid162_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "ROM",
        width_a => 10,
        widthad_a => 11,
        numwords_a => 2048,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_sclr_a => "SCLEAR",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "float64_div_altera_fp_functions_191_4b5aiyq_memoryC2_uid162_invTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Stratix 10"
    )
    PORT MAP (
        clocken0 => '1',
        sclr => memoryC2_uid162_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC2_uid162_invTables_lutmem_aa,
        q_a => memoryC2_uid162_invTables_lutmem_ir
    );
    memoryC2_uid162_invTables_lutmem_r <= memoryC2_uid162_invTables_lutmem_ir(9 downto 0);

    -- redist25_memoryC2_uid162_invTables_lutmem_r_1(DELAY,535)
    redist25_memoryC2_uid162_invTables_lutmem_r_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist25_memoryC2_uid162_invTables_lutmem_r_1_q <= (others => '0');
            ELSE
                redist25_memoryC2_uid162_invTables_lutmem_r_1_q <= STD_LOGIC_VECTOR(memoryC2_uid162_invTables_lutmem_r);
            END IF;
        END IF;
    END PROCESS;

    -- os_uid166_invTables(BITJOIN,165)@18
    os_uid166_invTables_q <= redist22_memoryC2_uid165_invTables_lutmem_r_1_q & redist23_memoryC2_uid164_invTables_lutmem_r_1_q & redist24_memoryC2_uid163_invTables_lutmem_r_1_q & redist25_memoryC2_uid162_invTables_lutmem_r_1_q;

    -- s2sumAHighB_uid192_invPolyEval(ADD,191)@18
    s2sumAHighB_uid192_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((38 downto 38 => os_uid166_invTables_q(37)) & os_uid166_invTables_q));
    s2sumAHighB_uid192_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((38 downto 28 => redist60_highBBits_uid191_invPolyEval_b_1_q(27)) & redist60_highBBits_uid191_invPolyEval_b_1_q));
    s2sumAHighB_uid192_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(s2sumAHighB_uid192_invPolyEval_a) + SIGNED(s2sumAHighB_uid192_invPolyEval_b));
    s2sumAHighB_uid192_invPolyEval_q <= s2sumAHighB_uid192_invPolyEval_o(38 downto 0);

    -- lowRangeB_uid190_invPolyEval(BITSELECT,189)@17
    lowRangeB_uid190_invPolyEval_in <= os_uid272_pT2_uid189_invPolyEval_b(0 downto 0);
    lowRangeB_uid190_invPolyEval_b <= lowRangeB_uid190_invPolyEval_in(0 downto 0);

    -- redist61_lowRangeB_uid190_invPolyEval_b_1(DELAY,571)
    redist61_lowRangeB_uid190_invPolyEval_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist61_lowRangeB_uid190_invPolyEval_b_1_q <= (others => '0');
            ELSE
                redist61_lowRangeB_uid190_invPolyEval_b_1_q <= STD_LOGIC_VECTOR(lowRangeB_uid190_invPolyEval_b);
            END IF;
        END IF;
    END PROCESS;

    -- s2_uid193_invPolyEval(BITJOIN,192)@18
    s2_uid193_invPolyEval_q <= s2sumAHighB_uid192_invPolyEval_q & redist61_lowRangeB_uid190_invPolyEval_b_1_q;

    -- aboveLeftY_bottomRange_uid292_pT3_uid195_invPolyEval(BITSELECT,291)@18
    aboveLeftY_bottomRange_uid292_pT3_uid195_invPolyEval_in <= STD_LOGIC_VECTOR(s2_uid193_invPolyEval_q(12 downto 0));
    aboveLeftY_bottomRange_uid292_pT3_uid195_invPolyEval_b <= STD_LOGIC_VECTOR(aboveLeftY_bottomRange_uid292_pT3_uid195_invPolyEval_in(12 downto 0));

    -- aboveLeftY_bottomExtension_uid291_pT3_uid195_invPolyEval(CONSTANT,290)
    aboveLeftY_bottomExtension_uid291_pT3_uid195_invPolyEval_q <= "00000";

    -- aboveLeftY_mergedSignalTM_uid293_pT3_uid195_invPolyEval(BITJOIN,292)@18
    aboveLeftY_mergedSignalTM_uid293_pT3_uid195_invPolyEval_q <= aboveLeftY_bottomRange_uid292_pT3_uid195_invPolyEval_b & aboveLeftY_bottomExtension_uid291_pT3_uid195_invPolyEval_q;

    -- rightBottomY_uid299_pT3_uid195_invPolyEval(BITSELECT,298)@18
    rightBottomY_uid299_pT3_uid195_invPolyEval_b <= STD_LOGIC_VECTOR(s2_uid193_invPolyEval_q(39 downto 22));

    -- rightBottomX_bottomRange_uid296_pT3_uid195_invPolyEval(BITSELECT,295)@18
    rightBottomX_bottomRange_uid296_pT3_uid195_invPolyEval_in <= STD_LOGIC_VECTOR(nx_mergedSignalTM_uid286_pT3_uid195_invPolyEval_q(11 downto 0));
    rightBottomX_bottomRange_uid296_pT3_uid195_invPolyEval_b <= STD_LOGIC_VECTOR(rightBottomX_bottomRange_uid296_pT3_uid195_invPolyEval_in(11 downto 0));

    -- rightBottomX_bottomExtension_uid295_pT3_uid195_invPolyEval(CONSTANT,294)
    rightBottomX_bottomExtension_uid295_pT3_uid195_invPolyEval_q <= "000000";

    -- rightBottomX_mergedSignalTM_uid297_pT3_uid195_invPolyEval(BITJOIN,296)@18
    rightBottomX_mergedSignalTM_uid297_pT3_uid195_invPolyEval_q <= rightBottomX_bottomRange_uid296_pT3_uid195_invPolyEval_b & rightBottomX_bottomExtension_uid295_pT3_uid195_invPolyEval_q;

    -- multSumOfTwoTS_uid301_pT3_uid195_invPolyEval_cma(CHAINMULTADD,474)@18 + 5
    -- out q@24
    multSumOfTwoTS_uid301_pT3_uid195_invPolyEval_cma_reset <= areset;
    multSumOfTwoTS_uid301_pT3_uid195_invPolyEval_cma_ena0 <= '1';
    multSumOfTwoTS_uid301_pT3_uid195_invPolyEval_cma_ena1 <= multSumOfTwoTS_uid301_pT3_uid195_invPolyEval_cma_ena0;
    multSumOfTwoTS_uid301_pT3_uid195_invPolyEval_cma_ena2 <= multSumOfTwoTS_uid301_pT3_uid195_invPolyEval_cma_ena0;
    multSumOfTwoTS_uid301_pT3_uid195_invPolyEval_cma_chainmultadd_hyper: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (false) THEN
            ELSE
                multSumOfTwoTS_uid301_pT3_uid195_invPolyEval_cma_ah(0) <= RESIZE(UNSIGNED(rightBottomX_mergedSignalTM_uid297_pT3_uid195_invPolyEval_q),18);
                multSumOfTwoTS_uid301_pT3_uid195_invPolyEval_cma_ah(1) <= RESIZE(UNSIGNED(aboveLeftY_mergedSignalTM_uid293_pT3_uid195_invPolyEval_q),18);
                multSumOfTwoTS_uid301_pT3_uid195_invPolyEval_cma_ch(0) <= RESIZE(SIGNED(rightBottomY_uid299_pT3_uid195_invPolyEval_b),18);
                multSumOfTwoTS_uid301_pT3_uid195_invPolyEval_cma_ch(1) <= RESIZE(SIGNED(aboveLeftX_uid290_pT3_uid195_invPolyEval_b),18);
            END IF;
        END IF;
    END PROCESS;

    multSumOfTwoTS_uid301_pT3_uid195_invPolyEval_cma_a0 <= STD_LOGIC_VECTOR(multSumOfTwoTS_uid301_pT3_uid195_invPolyEval_cma_ah(0));
    multSumOfTwoTS_uid301_pT3_uid195_invPolyEval_cma_c0 <= STD_LOGIC_VECTOR(multSumOfTwoTS_uid301_pT3_uid195_invPolyEval_cma_ch(0));
    multSumOfTwoTS_uid301_pT3_uid195_invPolyEval_cma_a1 <= STD_LOGIC_VECTOR(multSumOfTwoTS_uid301_pT3_uid195_invPolyEval_cma_ah(1));
    multSumOfTwoTS_uid301_pT3_uid195_invPolyEval_cma_c1 <= STD_LOGIC_VECTOR(multSumOfTwoTS_uid301_pT3_uid195_invPolyEval_cma_ch(1));
    multSumOfTwoTS_uid301_pT3_uid195_invPolyEval_cma_DSP0 : fourteennm_mac
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
        ena(0) => multSumOfTwoTS_uid301_pT3_uid195_invPolyEval_cma_ena0,
        ena(1) => multSumOfTwoTS_uid301_pT3_uid195_invPolyEval_cma_ena1,
        ena(2) => multSumOfTwoTS_uid301_pT3_uid195_invPolyEval_cma_ena2,
        clr(0) => multSumOfTwoTS_uid301_pT3_uid195_invPolyEval_cma_reset,
        clr(1) => multSumOfTwoTS_uid301_pT3_uid195_invPolyEval_cma_reset,
        ay => multSumOfTwoTS_uid301_pT3_uid195_invPolyEval_cma_a1,
        by => multSumOfTwoTS_uid301_pT3_uid195_invPolyEval_cma_a0,
        ax => multSumOfTwoTS_uid301_pT3_uid195_invPolyEval_cma_c1,
        bx => multSumOfTwoTS_uid301_pT3_uid195_invPolyEval_cma_c0,
        resulta => multSumOfTwoTS_uid301_pT3_uid195_invPolyEval_cma_s0
    );
    multSumOfTwoTS_uid301_pT3_uid195_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 37, depth => 1, reset_kind => "NONE", phase => 0, modulus => 1 )
    PORT MAP ( xin => multSumOfTwoTS_uid301_pT3_uid195_invPolyEval_cma_s0, xout => multSumOfTwoTS_uid301_pT3_uid195_invPolyEval_cma_qq, clk => clk, aclr => areset, ena => '1' );
    multSumOfTwoTS_uid301_pT3_uid195_invPolyEval_cma_q <= STD_LOGIC_VECTOR(multSumOfTwoTS_uid301_pT3_uid195_invPolyEval_cma_qq(36 downto 0));

    -- redist10_multSumOfTwoTS_uid301_pT3_uid195_invPolyEval_cma_q_1(DELAY,520)
    redist10_multSumOfTwoTS_uid301_pT3_uid195_invPolyEval_cma_q_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist10_multSumOfTwoTS_uid301_pT3_uid195_invPolyEval_cma_q_1_q <= (others => '0');
            ELSE
                redist10_multSumOfTwoTS_uid301_pT3_uid195_invPolyEval_cma_q_1_q <= STD_LOGIC_VECTOR(multSumOfTwoTS_uid301_pT3_uid195_invPolyEval_cma_q);
            END IF;
        END IF;
    END PROCESS;

    -- highBBits_uid304_pT3_uid195_invPolyEval(BITSELECT,303)@25
    highBBits_uid304_pT3_uid195_invPolyEval_b <= STD_LOGIC_VECTOR(redist10_multSumOfTwoTS_uid301_pT3_uid195_invPolyEval_cma_q_1_q(36 downto 9));

    -- topRangeY_uid289_pT3_uid195_invPolyEval(BITSELECT,288)@18
    topRangeY_uid289_pT3_uid195_invPolyEval_b <= STD_LOGIC_VECTOR(s2_uid193_invPolyEval_q(39 downto 13));

    -- topRangeX_uid288_pT3_uid195_invPolyEval(BITSELECT,287)@18
    topRangeX_uid288_pT3_uid195_invPolyEval_b <= STD_LOGIC_VECTOR(nx_mergedSignalTM_uid286_pT3_uid195_invPolyEval_q(38 downto 12));

    -- sm0_uid300_pT3_uid195_invPolyEval_cma(CHAINMULTADD,469)@18 + 5
    -- out q@24
    sm0_uid300_pT3_uid195_invPolyEval_cma_reset <= areset;
    sm0_uid300_pT3_uid195_invPolyEval_cma_ena0 <= '1';
    sm0_uid300_pT3_uid195_invPolyEval_cma_ena1 <= sm0_uid300_pT3_uid195_invPolyEval_cma_ena0;
    sm0_uid300_pT3_uid195_invPolyEval_cma_ena2 <= sm0_uid300_pT3_uid195_invPolyEval_cma_ena0;
    sm0_uid300_pT3_uid195_invPolyEval_cma_chainmultadd_hyper: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (false) THEN
            ELSE
                sm0_uid300_pT3_uid195_invPolyEval_cma_ah(0) <= RESIZE(SIGNED(topRangeX_uid288_pT3_uid195_invPolyEval_b),27);
                sm0_uid300_pT3_uid195_invPolyEval_cma_ch(0) <= RESIZE(SIGNED(topRangeY_uid289_pT3_uid195_invPolyEval_b),27);
            END IF;
        END IF;
    END PROCESS;

    sm0_uid300_pT3_uid195_invPolyEval_cma_a0 <= STD_LOGIC_VECTOR(sm0_uid300_pT3_uid195_invPolyEval_cma_ah(0));
    sm0_uid300_pT3_uid195_invPolyEval_cma_c0 <= STD_LOGIC_VECTOR(sm0_uid300_pT3_uid195_invPolyEval_cma_ch(0));
    sm0_uid300_pT3_uid195_invPolyEval_cma_DSP0 : fourteennm_mac
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
        ena(0) => sm0_uid300_pT3_uid195_invPolyEval_cma_ena0,
        ena(1) => sm0_uid300_pT3_uid195_invPolyEval_cma_ena1,
        ena(2) => sm0_uid300_pT3_uid195_invPolyEval_cma_ena2,
        clr(0) => sm0_uid300_pT3_uid195_invPolyEval_cma_reset,
        clr(1) => sm0_uid300_pT3_uid195_invPolyEval_cma_reset,
        ay => sm0_uid300_pT3_uid195_invPolyEval_cma_a0,
        ax => sm0_uid300_pT3_uid195_invPolyEval_cma_c0,
        resulta => sm0_uid300_pT3_uid195_invPolyEval_cma_s0
    );
    sm0_uid300_pT3_uid195_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 54, depth => 1, reset_kind => "NONE", phase => 0, modulus => 1 )
    PORT MAP ( xin => sm0_uid300_pT3_uid195_invPolyEval_cma_s0, xout => sm0_uid300_pT3_uid195_invPolyEval_cma_qq, clk => clk, aclr => areset, ena => '1' );
    sm0_uid300_pT3_uid195_invPolyEval_cma_q <= STD_LOGIC_VECTOR(sm0_uid300_pT3_uid195_invPolyEval_cma_qq(53 downto 0));

    -- redist15_sm0_uid300_pT3_uid195_invPolyEval_cma_q_1(DELAY,525)
    redist15_sm0_uid300_pT3_uid195_invPolyEval_cma_q_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist15_sm0_uid300_pT3_uid195_invPolyEval_cma_q_1_q <= (others => '0');
            ELSE
                redist15_sm0_uid300_pT3_uid195_invPolyEval_cma_q_1_q <= STD_LOGIC_VECTOR(sm0_uid300_pT3_uid195_invPolyEval_cma_q);
            END IF;
        END IF;
    END PROCESS;

    -- lev1_a0sumAHighB_uid305_pT3_uid195_invPolyEval(ADD,304)@25
    lev1_a0sumAHighB_uid305_pT3_uid195_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((54 downto 54 => redist15_sm0_uid300_pT3_uid195_invPolyEval_cma_q_1_q(53)) & redist15_sm0_uid300_pT3_uid195_invPolyEval_cma_q_1_q));
    lev1_a0sumAHighB_uid305_pT3_uid195_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((54 downto 28 => highBBits_uid304_pT3_uid195_invPolyEval_b(27)) & highBBits_uid304_pT3_uid195_invPolyEval_b));
    lev1_a0sumAHighB_uid305_pT3_uid195_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(lev1_a0sumAHighB_uid305_pT3_uid195_invPolyEval_a) + SIGNED(lev1_a0sumAHighB_uid305_pT3_uid195_invPolyEval_b));
    lev1_a0sumAHighB_uid305_pT3_uid195_invPolyEval_q <= lev1_a0sumAHighB_uid305_pT3_uid195_invPolyEval_o(54 downto 0);

    -- lowRangeB_uid303_pT3_uid195_invPolyEval(BITSELECT,302)@25
    lowRangeB_uid303_pT3_uid195_invPolyEval_in <= redist10_multSumOfTwoTS_uid301_pT3_uid195_invPolyEval_cma_q_1_q(8 downto 0);
    lowRangeB_uid303_pT3_uid195_invPolyEval_b <= lowRangeB_uid303_pT3_uid195_invPolyEval_in(8 downto 0);

    -- lev1_a0_uid306_pT3_uid195_invPolyEval(BITJOIN,305)@25
    lev1_a0_uid306_pT3_uid195_invPolyEval_q <= lev1_a0sumAHighB_uid305_pT3_uid195_invPolyEval_q & lowRangeB_uid303_pT3_uid195_invPolyEval_b;

    -- os_uid307_pT3_uid195_invPolyEval(BITSELECT,306)@25
    os_uid307_pT3_uid195_invPolyEval_in <= STD_LOGIC_VECTOR(lev1_a0_uid306_pT3_uid195_invPolyEval_q(61 downto 0));
    os_uid307_pT3_uid195_invPolyEval_b <= STD_LOGIC_VECTOR(os_uid307_pT3_uid195_invPolyEval_in(61 downto 22));

    -- highBBits_uid197_invPolyEval(BITSELECT,196)@25
    highBBits_uid197_invPolyEval_b <= STD_LOGIC_VECTOR(os_uid307_pT3_uid195_invPolyEval_b(39 downto 1));

    -- redist58_highBBits_uid197_invPolyEval_b_1(DELAY,568)
    redist58_highBBits_uid197_invPolyEval_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist58_highBBits_uid197_invPolyEval_b_1_q <= (others => '0');
            ELSE
                redist58_highBBits_uid197_invPolyEval_b_1_q <= STD_LOGIC_VECTOR(highBBits_uid197_invPolyEval_b);
            END IF;
        END IF;
    END PROCESS;

    -- redist88_yAddr_uid51_fpDivTest_b_23_inputreg1(DELAY,733)
    redist88_yAddr_uid51_fpDivTest_b_23_inputreg1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist88_yAddr_uid51_fpDivTest_b_23_inputreg1_q <= (others => '0');
            ELSE
                redist88_yAddr_uid51_fpDivTest_b_23_inputreg1_q <= STD_LOGIC_VECTOR(redist87_yAddr_uid51_fpDivTest_b_15_outputreg1_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist88_yAddr_uid51_fpDivTest_b_23_inputreg0(DELAY,735)
    redist88_yAddr_uid51_fpDivTest_b_23_inputreg0_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist88_yAddr_uid51_fpDivTest_b_23_inputreg0_q <= (others => '0');
            ELSE
                redist88_yAddr_uid51_fpDivTest_b_23_inputreg0_q <= STD_LOGIC_VECTOR(redist88_yAddr_uid51_fpDivTest_b_23_inputreg1_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist88_yAddr_uid51_fpDivTest_b_23(DELAY,598)
    redist88_yAddr_uid51_fpDivTest_b_23_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist88_yAddr_uid51_fpDivTest_b_23_delay_0 <= (others => '0');
                redist88_yAddr_uid51_fpDivTest_b_23_delay_1 <= (others => '0');
                redist88_yAddr_uid51_fpDivTest_b_23_delay_2 <= (others => '0');
                redist88_yAddr_uid51_fpDivTest_b_23_q <= (others => '0');
            ELSE
                redist88_yAddr_uid51_fpDivTest_b_23_delay_0 <= STD_LOGIC_VECTOR(redist88_yAddr_uid51_fpDivTest_b_23_inputreg0_q);
                redist88_yAddr_uid51_fpDivTest_b_23_delay_1 <= redist88_yAddr_uid51_fpDivTest_b_23_delay_0;
                redist88_yAddr_uid51_fpDivTest_b_23_delay_2 <= redist88_yAddr_uid51_fpDivTest_b_23_delay_1;
                redist88_yAddr_uid51_fpDivTest_b_23_q <= redist88_yAddr_uid51_fpDivTest_b_23_delay_2;
            END IF;
        END IF;
    END PROCESS;

    -- redist88_yAddr_uid51_fpDivTest_b_23_outputreg0(DELAY,736)
    redist88_yAddr_uid51_fpDivTest_b_23_outputreg0_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist88_yAddr_uid51_fpDivTest_b_23_outputreg0_q <= (others => '0');
            ELSE
                redist88_yAddr_uid51_fpDivTest_b_23_outputreg0_q <= STD_LOGIC_VECTOR(redist88_yAddr_uid51_fpDivTest_b_23_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist88_yAddr_uid51_fpDivTest_b_23_outputreg1(DELAY,734)
    redist88_yAddr_uid51_fpDivTest_b_23_outputreg1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist88_yAddr_uid51_fpDivTest_b_23_outputreg1_q <= (others => '0');
            ELSE
                redist88_yAddr_uid51_fpDivTest_b_23_outputreg1_q <= STD_LOGIC_VECTOR(redist88_yAddr_uid51_fpDivTest_b_23_outputreg0_q);
            END IF;
        END IF;
    END PROCESS;

    -- memoryC1_uid159_invTables_lutmem(DUALMEM,441)@23 + 2
    -- in j@20000000
    memoryC1_uid159_invTables_lutmem_aa <= redist88_yAddr_uid51_fpDivTest_b_23_outputreg1_q;
    memoryC1_uid159_invTables_lutmem_reset0 <= areset;
    memoryC1_uid159_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "ROM",
        width_a => 9,
        widthad_a => 11,
        numwords_a => 2048,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_sclr_a => "SCLEAR",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "float64_div_altera_fp_functions_191_4b5aiyq_memoryC1_uid159_invTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Stratix 10"
    )
    PORT MAP (
        clocken0 => '1',
        sclr => memoryC1_uid159_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC1_uid159_invTables_lutmem_aa,
        q_a => memoryC1_uid159_invTables_lutmem_ir
    );
    memoryC1_uid159_invTables_lutmem_r <= memoryC1_uid159_invTables_lutmem_ir(8 downto 0);

    -- redist26_memoryC1_uid159_invTables_lutmem_r_1(DELAY,536)
    redist26_memoryC1_uid159_invTables_lutmem_r_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist26_memoryC1_uid159_invTables_lutmem_r_1_q <= (others => '0');
            ELSE
                redist26_memoryC1_uid159_invTables_lutmem_r_1_q <= STD_LOGIC_VECTOR(memoryC1_uid159_invTables_lutmem_r);
            END IF;
        END IF;
    END PROCESS;

    -- memoryC1_uid158_invTables_lutmem(DUALMEM,440)@23 + 2
    -- in j@20000000
    memoryC1_uid158_invTables_lutmem_aa <= redist88_yAddr_uid51_fpDivTest_b_23_outputreg1_q;
    memoryC1_uid158_invTables_lutmem_reset0 <= areset;
    memoryC1_uid158_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "ROM",
        width_a => 10,
        widthad_a => 11,
        numwords_a => 2048,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_sclr_a => "SCLEAR",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "float64_div_altera_fp_functions_191_4b5aiyq_memoryC1_uid158_invTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Stratix 10"
    )
    PORT MAP (
        clocken0 => '1',
        sclr => memoryC1_uid158_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC1_uid158_invTables_lutmem_aa,
        q_a => memoryC1_uid158_invTables_lutmem_ir
    );
    memoryC1_uid158_invTables_lutmem_r <= memoryC1_uid158_invTables_lutmem_ir(9 downto 0);

    -- redist27_memoryC1_uid158_invTables_lutmem_r_1(DELAY,537)
    redist27_memoryC1_uid158_invTables_lutmem_r_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist27_memoryC1_uid158_invTables_lutmem_r_1_q <= (others => '0');
            ELSE
                redist27_memoryC1_uid158_invTables_lutmem_r_1_q <= STD_LOGIC_VECTOR(memoryC1_uid158_invTables_lutmem_r);
            END IF;
        END IF;
    END PROCESS;

    -- memoryC1_uid157_invTables_lutmem(DUALMEM,439)@23 + 2
    -- in j@20000000
    memoryC1_uid157_invTables_lutmem_aa <= redist88_yAddr_uid51_fpDivTest_b_23_outputreg1_q;
    memoryC1_uid157_invTables_lutmem_reset0 <= areset;
    memoryC1_uid157_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "ROM",
        width_a => 10,
        widthad_a => 11,
        numwords_a => 2048,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_sclr_a => "SCLEAR",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "float64_div_altera_fp_functions_191_4b5aiyq_memoryC1_uid157_invTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Stratix 10"
    )
    PORT MAP (
        clocken0 => '1',
        sclr => memoryC1_uid157_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC1_uid157_invTables_lutmem_aa,
        q_a => memoryC1_uid157_invTables_lutmem_ir
    );
    memoryC1_uid157_invTables_lutmem_r <= memoryC1_uid157_invTables_lutmem_ir(9 downto 0);

    -- redist28_memoryC1_uid157_invTables_lutmem_r_1(DELAY,538)
    redist28_memoryC1_uid157_invTables_lutmem_r_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist28_memoryC1_uid157_invTables_lutmem_r_1_q <= (others => '0');
            ELSE
                redist28_memoryC1_uid157_invTables_lutmem_r_1_q <= STD_LOGIC_VECTOR(memoryC1_uid157_invTables_lutmem_r);
            END IF;
        END IF;
    END PROCESS;

    -- memoryC1_uid156_invTables_lutmem(DUALMEM,438)@23 + 2
    -- in j@20000000
    memoryC1_uid156_invTables_lutmem_aa <= redist88_yAddr_uid51_fpDivTest_b_23_outputreg1_q;
    memoryC1_uid156_invTables_lutmem_reset0 <= areset;
    memoryC1_uid156_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "ROM",
        width_a => 10,
        widthad_a => 11,
        numwords_a => 2048,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_sclr_a => "SCLEAR",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "float64_div_altera_fp_functions_191_4b5aiyq_memoryC1_uid156_invTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Stratix 10"
    )
    PORT MAP (
        clocken0 => '1',
        sclr => memoryC1_uid156_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC1_uid156_invTables_lutmem_aa,
        q_a => memoryC1_uid156_invTables_lutmem_ir
    );
    memoryC1_uid156_invTables_lutmem_r <= memoryC1_uid156_invTables_lutmem_ir(9 downto 0);

    -- redist29_memoryC1_uid156_invTables_lutmem_r_1(DELAY,539)
    redist29_memoryC1_uid156_invTables_lutmem_r_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist29_memoryC1_uid156_invTables_lutmem_r_1_q <= (others => '0');
            ELSE
                redist29_memoryC1_uid156_invTables_lutmem_r_1_q <= STD_LOGIC_VECTOR(memoryC1_uid156_invTables_lutmem_r);
            END IF;
        END IF;
    END PROCESS;

    -- memoryC1_uid155_invTables_lutmem(DUALMEM,437)@23 + 2
    -- in j@20000000
    memoryC1_uid155_invTables_lutmem_aa <= redist88_yAddr_uid51_fpDivTest_b_23_outputreg1_q;
    memoryC1_uid155_invTables_lutmem_reset0 <= areset;
    memoryC1_uid155_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "ROM",
        width_a => 10,
        widthad_a => 11,
        numwords_a => 2048,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_sclr_a => "SCLEAR",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "float64_div_altera_fp_functions_191_4b5aiyq_memoryC1_uid155_invTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Stratix 10"
    )
    PORT MAP (
        clocken0 => '1',
        sclr => memoryC1_uid155_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC1_uid155_invTables_lutmem_aa,
        q_a => memoryC1_uid155_invTables_lutmem_ir
    );
    memoryC1_uid155_invTables_lutmem_r <= memoryC1_uid155_invTables_lutmem_ir(9 downto 0);

    -- redist30_memoryC1_uid155_invTables_lutmem_r_1(DELAY,540)
    redist30_memoryC1_uid155_invTables_lutmem_r_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist30_memoryC1_uid155_invTables_lutmem_r_1_q <= (others => '0');
            ELSE
                redist30_memoryC1_uid155_invTables_lutmem_r_1_q <= STD_LOGIC_VECTOR(memoryC1_uid155_invTables_lutmem_r);
            END IF;
        END IF;
    END PROCESS;

    -- os_uid160_invTables(BITJOIN,159)@26
    os_uid160_invTables_q <= redist26_memoryC1_uid159_invTables_lutmem_r_1_q & redist27_memoryC1_uid158_invTables_lutmem_r_1_q & redist28_memoryC1_uid157_invTables_lutmem_r_1_q & redist29_memoryC1_uid156_invTables_lutmem_r_1_q & redist30_memoryC1_uid155_invTables_lutmem_r_1_q;

    -- s3sumAHighB_uid198_invPolyEval(ADD,197)@26
    s3sumAHighB_uid198_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((49 downto 49 => os_uid160_invTables_q(48)) & os_uid160_invTables_q));
    s3sumAHighB_uid198_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((49 downto 39 => redist58_highBBits_uid197_invPolyEval_b_1_q(38)) & redist58_highBBits_uid197_invPolyEval_b_1_q));
    s3sumAHighB_uid198_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(s3sumAHighB_uid198_invPolyEval_a) + SIGNED(s3sumAHighB_uid198_invPolyEval_b));
    s3sumAHighB_uid198_invPolyEval_q <= s3sumAHighB_uid198_invPolyEval_o(49 downto 0);

    -- lowRangeB_uid196_invPolyEval(BITSELECT,195)@25
    lowRangeB_uid196_invPolyEval_in <= os_uid307_pT3_uid195_invPolyEval_b(0 downto 0);
    lowRangeB_uid196_invPolyEval_b <= lowRangeB_uid196_invPolyEval_in(0 downto 0);

    -- redist59_lowRangeB_uid196_invPolyEval_b_1(DELAY,569)
    redist59_lowRangeB_uid196_invPolyEval_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist59_lowRangeB_uid196_invPolyEval_b_1_q <= (others => '0');
            ELSE
                redist59_lowRangeB_uid196_invPolyEval_b_1_q <= STD_LOGIC_VECTOR(lowRangeB_uid196_invPolyEval_b);
            END IF;
        END IF;
    END PROCESS;

    -- s3_uid199_invPolyEval(BITJOIN,198)@26
    s3_uid199_invPolyEval_q <= s3sumAHighB_uid198_invPolyEval_q & redist59_lowRangeB_uid196_invPolyEval_b_1_q;

    -- aboveLeftY_bottomRange_uid327_pT4_uid201_invPolyEval(BITSELECT,326)@26
    aboveLeftY_bottomRange_uid327_pT4_uid201_invPolyEval_in <= STD_LOGIC_VECTOR(s3_uid199_invPolyEval_q(23 downto 0));
    aboveLeftY_bottomRange_uid327_pT4_uid201_invPolyEval_b <= STD_LOGIC_VECTOR(aboveLeftY_bottomRange_uid327_pT4_uid201_invPolyEval_in(23 downto 0));

    -- aboveLeftY_bottomExtension_uid326_pT4_uid201_invPolyEval(CONSTANT,325)
    aboveLeftY_bottomExtension_uid326_pT4_uid201_invPolyEval_q <= "000";

    -- aboveLeftY_mergedSignalTM_uid328_pT4_uid201_invPolyEval(BITJOIN,327)@26
    aboveLeftY_mergedSignalTM_uid328_pT4_uid201_invPolyEval_q <= aboveLeftY_bottomRange_uid327_pT4_uid201_invPolyEval_b & aboveLeftY_bottomExtension_uid326_pT4_uid201_invPolyEval_q;

    -- topRangeY_uid324_pT4_uid201_invPolyEval(BITSELECT,323)@26
    topRangeY_uid324_pT4_uid201_invPolyEval_b <= STD_LOGIC_VECTOR(s3_uid199_invPolyEval_q(50 downto 24));

    -- redist42_topRangeY_uid324_pT4_uid201_invPolyEval_b_1(DELAY,552)
    redist42_topRangeY_uid324_pT4_uid201_invPolyEval_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist42_topRangeY_uid324_pT4_uid201_invPolyEval_b_1_q <= (others => '0');
            ELSE
                redist42_topRangeY_uid324_pT4_uid201_invPolyEval_b_1_q <= STD_LOGIC_VECTOR(topRangeY_uid324_pT4_uid201_invPolyEval_b);
            END IF;
        END IF;
    END PROCESS;

    -- rightBottomX_bottomRange_uid331_pT4_uid201_invPolyEval(BITSELECT,330)@26
    rightBottomX_bottomRange_uid331_pT4_uid201_invPolyEval_in <= STD_LOGIC_VECTOR(nx_mergedSignalTM_uid321_pT4_uid201_invPolyEval_q(14 downto 0));
    rightBottomX_bottomRange_uid331_pT4_uid201_invPolyEval_b <= STD_LOGIC_VECTOR(rightBottomX_bottomRange_uid331_pT4_uid201_invPolyEval_in(14 downto 0));

    -- redist41_rightBottomX_bottomRange_uid331_pT4_uid201_invPolyEval_b_1(DELAY,551)
    redist41_rightBottomX_bottomRange_uid331_pT4_uid201_invPolyEval_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist41_rightBottomX_bottomRange_uid331_pT4_uid201_invPolyEval_b_1_q <= (others => '0');
            ELSE
                redist41_rightBottomX_bottomRange_uid331_pT4_uid201_invPolyEval_b_1_q <= STD_LOGIC_VECTOR(rightBottomX_bottomRange_uid331_pT4_uid201_invPolyEval_b);
            END IF;
        END IF;
    END PROCESS;

    -- rightBottomX_bottomExtension_uid330_pT4_uid201_invPolyEval(CONSTANT,329)
    rightBottomX_bottomExtension_uid330_pT4_uid201_invPolyEval_q <= "000000000000";

    -- rightBottomX_mergedSignalTM_uid332_pT4_uid201_invPolyEval(BITJOIN,331)@27
    rightBottomX_mergedSignalTM_uid332_pT4_uid201_invPolyEval_q <= redist41_rightBottomX_bottomRange_uid331_pT4_uid201_invPolyEval_b_1_q & rightBottomX_bottomExtension_uid330_pT4_uid201_invPolyEval_q;

    -- multSumOfTwoTS_uid338_pT4_uid201_invPolyEval_cma(CHAINMULTADD,475)@26 + 5
    -- in e@27
    -- in g@27
    -- out q@33
    multSumOfTwoTS_uid338_pT4_uid201_invPolyEval_cma_reset <= areset;
    multSumOfTwoTS_uid338_pT4_uid201_invPolyEval_cma_ena0 <= '1';
    multSumOfTwoTS_uid338_pT4_uid201_invPolyEval_cma_ena1 <= multSumOfTwoTS_uid338_pT4_uid201_invPolyEval_cma_ena0;
    multSumOfTwoTS_uid338_pT4_uid201_invPolyEval_cma_ena2 <= multSumOfTwoTS_uid338_pT4_uid201_invPolyEval_cma_ena0;
    multSumOfTwoTS_uid338_pT4_uid201_invPolyEval_cma_chainmultadd_hyper: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (false) THEN
            ELSE
                multSumOfTwoTS_uid338_pT4_uid201_invPolyEval_cma_ah(0) <= RESIZE(UNSIGNED(rightBottomX_mergedSignalTM_uid332_pT4_uid201_invPolyEval_q),27);
                multSumOfTwoTS_uid338_pT4_uid201_invPolyEval_cma_ah(1) <= RESIZE(UNSIGNED(aboveLeftY_mergedSignalTM_uid328_pT4_uid201_invPolyEval_q),27);
                multSumOfTwoTS_uid338_pT4_uid201_invPolyEval_cma_ch(0) <= RESIZE(SIGNED(redist42_topRangeY_uid324_pT4_uid201_invPolyEval_b_1_q),27);
                multSumOfTwoTS_uid338_pT4_uid201_invPolyEval_cma_ch(1) <= RESIZE(SIGNED(topRangeX_uid323_pT4_uid201_invPolyEval_b),27);
            END IF;
        END IF;
    END PROCESS;

    multSumOfTwoTS_uid338_pT4_uid201_invPolyEval_cma_a0 <= STD_LOGIC_VECTOR(multSumOfTwoTS_uid338_pT4_uid201_invPolyEval_cma_ah(0));
    multSumOfTwoTS_uid338_pT4_uid201_invPolyEval_cma_c0 <= STD_LOGIC_VECTOR(multSumOfTwoTS_uid338_pT4_uid201_invPolyEval_cma_ch(0));
    multSumOfTwoTS_uid338_pT4_uid201_invPolyEval_cma_a1 <= STD_LOGIC_VECTOR(multSumOfTwoTS_uid338_pT4_uid201_invPolyEval_cma_ah(1));
    multSumOfTwoTS_uid338_pT4_uid201_invPolyEval_cma_c1 <= STD_LOGIC_VECTOR(multSumOfTwoTS_uid338_pT4_uid201_invPolyEval_cma_ch(1));
    multSumOfTwoTS_uid338_pT4_uid201_invPolyEval_cma_DSP1 : fourteennm_mac
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
        ena(0) => multSumOfTwoTS_uid338_pT4_uid201_invPolyEval_cma_ena0,
        ena(1) => multSumOfTwoTS_uid338_pT4_uid201_invPolyEval_cma_ena1,
        ena(2) => multSumOfTwoTS_uid338_pT4_uid201_invPolyEval_cma_ena2,
        clr(0) => multSumOfTwoTS_uid338_pT4_uid201_invPolyEval_cma_reset,
        clr(1) => multSumOfTwoTS_uid338_pT4_uid201_invPolyEval_cma_reset,
        ay => multSumOfTwoTS_uid338_pT4_uid201_invPolyEval_cma_a1,
        ax => multSumOfTwoTS_uid338_pT4_uid201_invPolyEval_cma_c1,
        chainout => multSumOfTwoTS_uid338_pT4_uid201_invPolyEval_cma_s1
    );
    multSumOfTwoTS_uid338_pT4_uid201_invPolyEval_cma_DSP0 : fourteennm_mac
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
        ena(0) => multSumOfTwoTS_uid338_pT4_uid201_invPolyEval_cma_ena0,
        ena(1) => multSumOfTwoTS_uid338_pT4_uid201_invPolyEval_cma_ena1,
        ena(2) => multSumOfTwoTS_uid338_pT4_uid201_invPolyEval_cma_ena2,
        clr(0) => multSumOfTwoTS_uid338_pT4_uid201_invPolyEval_cma_reset,
        clr(1) => multSumOfTwoTS_uid338_pT4_uid201_invPolyEval_cma_reset,
        ay => multSumOfTwoTS_uid338_pT4_uid201_invPolyEval_cma_a0,
        ax => multSumOfTwoTS_uid338_pT4_uid201_invPolyEval_cma_c0,
        chainin => multSumOfTwoTS_uid338_pT4_uid201_invPolyEval_cma_s1,
        resulta => multSumOfTwoTS_uid338_pT4_uid201_invPolyEval_cma_s0
    );
    multSumOfTwoTS_uid338_pT4_uid201_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 55, depth => 1, reset_kind => "NONE", phase => 0, modulus => 1 )
    PORT MAP ( xin => multSumOfTwoTS_uid338_pT4_uid201_invPolyEval_cma_s0, xout => multSumOfTwoTS_uid338_pT4_uid201_invPolyEval_cma_qq, clk => clk, aclr => areset, ena => '1' );
    multSumOfTwoTS_uid338_pT4_uid201_invPolyEval_cma_q <= STD_LOGIC_VECTOR(multSumOfTwoTS_uid338_pT4_uid201_invPolyEval_cma_qq(54 downto 0));

    -- redist9_multSumOfTwoTS_uid338_pT4_uid201_invPolyEval_cma_q_1(DELAY,519)
    redist9_multSumOfTwoTS_uid338_pT4_uid201_invPolyEval_cma_q_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist9_multSumOfTwoTS_uid338_pT4_uid201_invPolyEval_cma_q_1_q <= (others => '0');
            ELSE
                redist9_multSumOfTwoTS_uid338_pT4_uid201_invPolyEval_cma_q_1_q <= STD_LOGIC_VECTOR(multSumOfTwoTS_uid338_pT4_uid201_invPolyEval_cma_q);
            END IF;
        END IF;
    END PROCESS;

    -- highBBits_uid343_pT4_uid201_invPolyEval(BITSELECT,342)@34
    highBBits_uid343_pT4_uid201_invPolyEval_b <= STD_LOGIC_VECTOR(redist9_multSumOfTwoTS_uid338_pT4_uid201_invPolyEval_cma_q_1_q(54 downto 23));

    -- redist43_topRangeX_uid323_pT4_uid201_invPolyEval_b_1(DELAY,553)
    redist43_topRangeX_uid323_pT4_uid201_invPolyEval_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist43_topRangeX_uid323_pT4_uid201_invPolyEval_b_1_q <= (others => '0');
            ELSE
                redist43_topRangeX_uid323_pT4_uid201_invPolyEval_b_1_q <= STD_LOGIC_VECTOR(topRangeX_uid323_pT4_uid201_invPolyEval_b);
            END IF;
        END IF;
    END PROCESS;

    -- sm0_uid337_pT4_uid201_invPolyEval_cma(CHAINMULTADD,470)@27 + 5
    -- out q@33
    sm0_uid337_pT4_uid201_invPolyEval_cma_reset <= areset;
    sm0_uid337_pT4_uid201_invPolyEval_cma_ena0 <= '1';
    sm0_uid337_pT4_uid201_invPolyEval_cma_ena1 <= sm0_uid337_pT4_uid201_invPolyEval_cma_ena0;
    sm0_uid337_pT4_uid201_invPolyEval_cma_ena2 <= sm0_uid337_pT4_uid201_invPolyEval_cma_ena0;
    sm0_uid337_pT4_uid201_invPolyEval_cma_chainmultadd_hyper: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (false) THEN
            ELSE
                sm0_uid337_pT4_uid201_invPolyEval_cma_ah(0) <= RESIZE(SIGNED(redist43_topRangeX_uid323_pT4_uid201_invPolyEval_b_1_q),27);
                sm0_uid337_pT4_uid201_invPolyEval_cma_ch(0) <= RESIZE(SIGNED(redist42_topRangeY_uid324_pT4_uid201_invPolyEval_b_1_q),27);
            END IF;
        END IF;
    END PROCESS;

    sm0_uid337_pT4_uid201_invPolyEval_cma_a0 <= STD_LOGIC_VECTOR(sm0_uid337_pT4_uid201_invPolyEval_cma_ah(0));
    sm0_uid337_pT4_uid201_invPolyEval_cma_c0 <= STD_LOGIC_VECTOR(sm0_uid337_pT4_uid201_invPolyEval_cma_ch(0));
    sm0_uid337_pT4_uid201_invPolyEval_cma_DSP0 : fourteennm_mac
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
        ena(0) => sm0_uid337_pT4_uid201_invPolyEval_cma_ena0,
        ena(1) => sm0_uid337_pT4_uid201_invPolyEval_cma_ena1,
        ena(2) => sm0_uid337_pT4_uid201_invPolyEval_cma_ena2,
        clr(0) => sm0_uid337_pT4_uid201_invPolyEval_cma_reset,
        clr(1) => sm0_uid337_pT4_uid201_invPolyEval_cma_reset,
        ay => sm0_uid337_pT4_uid201_invPolyEval_cma_a0,
        ax => sm0_uid337_pT4_uid201_invPolyEval_cma_c0,
        resulta => sm0_uid337_pT4_uid201_invPolyEval_cma_s0
    );
    sm0_uid337_pT4_uid201_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 54, depth => 1, reset_kind => "NONE", phase => 0, modulus => 1 )
    PORT MAP ( xin => sm0_uid337_pT4_uid201_invPolyEval_cma_s0, xout => sm0_uid337_pT4_uid201_invPolyEval_cma_qq, clk => clk, aclr => areset, ena => '1' );
    sm0_uid337_pT4_uid201_invPolyEval_cma_q <= STD_LOGIC_VECTOR(sm0_uid337_pT4_uid201_invPolyEval_cma_qq(53 downto 0));

    -- redist14_sm0_uid337_pT4_uid201_invPolyEval_cma_q_1(DELAY,524)
    redist14_sm0_uid337_pT4_uid201_invPolyEval_cma_q_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist14_sm0_uid337_pT4_uid201_invPolyEval_cma_q_1_q <= (others => '0');
            ELSE
                redist14_sm0_uid337_pT4_uid201_invPolyEval_cma_q_1_q <= STD_LOGIC_VECTOR(sm0_uid337_pT4_uid201_invPolyEval_cma_q);
            END IF;
        END IF;
    END PROCESS;

    -- aboveLeftY_uid336_pT4_uid201_invPolyEval(BITSELECT,335)@26
    aboveLeftY_uid336_pT4_uid201_invPolyEval_in <= s3_uid199_invPolyEval_q(23 downto 0);
    aboveLeftY_uid336_pT4_uid201_invPolyEval_b <= aboveLeftY_uid336_pT4_uid201_invPolyEval_in(23 downto 22);

    -- redist39_aboveLeftY_uid336_pT4_uid201_invPolyEval_b_2(DELAY,549)
    redist39_aboveLeftY_uid336_pT4_uid201_invPolyEval_b_2_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist39_aboveLeftY_uid336_pT4_uid201_invPolyEval_b_2_delay_0 <= (others => '0');
                redist39_aboveLeftY_uid336_pT4_uid201_invPolyEval_b_2_q <= (others => '0');
            ELSE
                redist39_aboveLeftY_uid336_pT4_uid201_invPolyEval_b_2_delay_0 <= STD_LOGIC_VECTOR(aboveLeftY_uid336_pT4_uid201_invPolyEval_b);
                redist39_aboveLeftY_uid336_pT4_uid201_invPolyEval_b_2_q <= redist39_aboveLeftY_uid336_pT4_uid201_invPolyEval_b_2_delay_0;
            END IF;
        END IF;
    END PROCESS;

    -- aboveLeftX_uid335_pT4_uid201_invPolyEval(BITSELECT,334)@26
    aboveLeftX_uid335_pT4_uid201_invPolyEval_in <= nx_mergedSignalTM_uid321_pT4_uid201_invPolyEval_q(14 downto 0);
    aboveLeftX_uid335_pT4_uid201_invPolyEval_b <= aboveLeftX_uid335_pT4_uid201_invPolyEval_in(14 downto 13);

    -- redist40_aboveLeftX_uid335_pT4_uid201_invPolyEval_b_2(DELAY,550)
    redist40_aboveLeftX_uid335_pT4_uid201_invPolyEval_b_2_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist40_aboveLeftX_uid335_pT4_uid201_invPolyEval_b_2_delay_0 <= (others => '0');
                redist40_aboveLeftX_uid335_pT4_uid201_invPolyEval_b_2_q <= (others => '0');
            ELSE
                redist40_aboveLeftX_uid335_pT4_uid201_invPolyEval_b_2_delay_0 <= STD_LOGIC_VECTOR(aboveLeftX_uid335_pT4_uid201_invPolyEval_b);
                redist40_aboveLeftX_uid335_pT4_uid201_invPolyEval_b_2_q <= redist40_aboveLeftX_uid335_pT4_uid201_invPolyEval_b_2_delay_0;
            END IF;
        END IF;
    END PROCESS;

    -- sm0_uid340_pT4_uid201_invPolyEval(MULT,339)@28 + 5
    sm0_uid340_pT4_uid201_invPolyEval_pr <= UNSIGNED(sm0_uid340_pT4_uid201_invPolyEval_a2) * UNSIGNED(sm0_uid340_pT4_uid201_invPolyEval_b2);
    sm0_uid340_pT4_uid201_invPolyEval_component: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                sm0_uid340_pT4_uid201_invPolyEval_a0 <= (others => '0');
                sm0_uid340_pT4_uid201_invPolyEval_b0 <= (others => '0');
                sm0_uid340_pT4_uid201_invPolyEval_a1 <= (others => '0');
                sm0_uid340_pT4_uid201_invPolyEval_b1 <= (others => '0');
                sm0_uid340_pT4_uid201_invPolyEval_a2 <= (others => '0');
                sm0_uid340_pT4_uid201_invPolyEval_b2 <= (others => '0');
                sm0_uid340_pT4_uid201_invPolyEval_s1 <= (others => '0');
            ELSE
                sm0_uid340_pT4_uid201_invPolyEval_a0 <= redist40_aboveLeftX_uid335_pT4_uid201_invPolyEval_b_2_q;
                sm0_uid340_pT4_uid201_invPolyEval_b0 <= redist39_aboveLeftY_uid336_pT4_uid201_invPolyEval_b_2_q;
                sm0_uid340_pT4_uid201_invPolyEval_a1 <= sm0_uid340_pT4_uid201_invPolyEval_a0;
                sm0_uid340_pT4_uid201_invPolyEval_b1 <= sm0_uid340_pT4_uid201_invPolyEval_b0;
                sm0_uid340_pT4_uid201_invPolyEval_a2 <= sm0_uid340_pT4_uid201_invPolyEval_a1;
                sm0_uid340_pT4_uid201_invPolyEval_b2 <= sm0_uid340_pT4_uid201_invPolyEval_b1;
                sm0_uid340_pT4_uid201_invPolyEval_s1 <= STD_LOGIC_VECTOR(sm0_uid340_pT4_uid201_invPolyEval_pr);
            END IF;
        END IF;
    END PROCESS;
    sm0_uid340_pT4_uid201_invPolyEval: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                sm0_uid340_pT4_uid201_invPolyEval_q <= (others => '0');
            ELSE
                sm0_uid340_pT4_uid201_invPolyEval_q <= sm0_uid340_pT4_uid201_invPolyEval_s1;
            END IF;
        END IF;
    END PROCESS;

    -- redist38_sm0_uid340_pT4_uid201_invPolyEval_q_1(DELAY,548)
    redist38_sm0_uid340_pT4_uid201_invPolyEval_q_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist38_sm0_uid340_pT4_uid201_invPolyEval_q_1_q <= (others => '0');
            ELSE
                redist38_sm0_uid340_pT4_uid201_invPolyEval_q_1_q <= STD_LOGIC_VECTOR(sm0_uid340_pT4_uid201_invPolyEval_q);
            END IF;
        END IF;
    END PROCESS;

    -- sumAb_uid341_pT4_uid201_invPolyEval(BITJOIN,340)@34
    sumAb_uid341_pT4_uid201_invPolyEval_q <= redist14_sm0_uid337_pT4_uid201_invPolyEval_cma_q_1_q & redist38_sm0_uid340_pT4_uid201_invPolyEval_q_1_q;

    -- lev1_a0sumAHighB_uid344_pT4_uid201_invPolyEval(ADD,343)@34
    lev1_a0sumAHighB_uid344_pT4_uid201_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((58 downto 58 => sumAb_uid341_pT4_uid201_invPolyEval_q(57)) & sumAb_uid341_pT4_uid201_invPolyEval_q));
    lev1_a0sumAHighB_uid344_pT4_uid201_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((58 downto 32 => highBBits_uid343_pT4_uid201_invPolyEval_b(31)) & highBBits_uid343_pT4_uid201_invPolyEval_b));
    lev1_a0sumAHighB_uid344_pT4_uid201_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(lev1_a0sumAHighB_uid344_pT4_uid201_invPolyEval_a) + SIGNED(lev1_a0sumAHighB_uid344_pT4_uid201_invPolyEval_b));
    lev1_a0sumAHighB_uid344_pT4_uid201_invPolyEval_q <= lev1_a0sumAHighB_uid344_pT4_uid201_invPolyEval_o(58 downto 0);

    -- lowRangeB_uid342_pT4_uid201_invPolyEval(BITSELECT,341)@34
    lowRangeB_uid342_pT4_uid201_invPolyEval_in <= redist9_multSumOfTwoTS_uid338_pT4_uid201_invPolyEval_cma_q_1_q(22 downto 0);
    lowRangeB_uid342_pT4_uid201_invPolyEval_b <= lowRangeB_uid342_pT4_uid201_invPolyEval_in(22 downto 0);

    -- lev1_a0_uid345_pT4_uid201_invPolyEval(BITJOIN,344)@34
    lev1_a0_uid345_pT4_uid201_invPolyEval_q <= lev1_a0sumAHighB_uid344_pT4_uid201_invPolyEval_q & lowRangeB_uid342_pT4_uid201_invPolyEval_b;

    -- os_uid346_pT4_uid201_invPolyEval(BITSELECT,345)@34
    os_uid346_pT4_uid201_invPolyEval_in <= STD_LOGIC_VECTOR(lev1_a0_uid345_pT4_uid201_invPolyEval_q(79 downto 0));
    os_uid346_pT4_uid201_invPolyEval_b <= STD_LOGIC_VECTOR(os_uid346_pT4_uid201_invPolyEval_in(79 downto 28));

    -- redist37_os_uid346_pT4_uid201_invPolyEval_b_1(DELAY,547)
    redist37_os_uid346_pT4_uid201_invPolyEval_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist37_os_uid346_pT4_uid201_invPolyEval_b_1_q <= (others => '0');
            ELSE
                redist37_os_uid346_pT4_uid201_invPolyEval_b_1_q <= STD_LOGIC_VECTOR(os_uid346_pT4_uid201_invPolyEval_b);
            END IF;
        END IF;
    END PROCESS;

    -- highBBits_uid203_invPolyEval(BITSELECT,202)@35
    highBBits_uid203_invPolyEval_b <= STD_LOGIC_VECTOR(redist37_os_uid346_pT4_uid201_invPolyEval_b_1_q(51 downto 2));

    -- redist89_yAddr_uid51_fpDivTest_b_32_notEnable(LOGICAL,747)
    redist89_yAddr_uid51_fpDivTest_b_32_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist89_yAddr_uid51_fpDivTest_b_32_nor(LOGICAL,748)
    redist89_yAddr_uid51_fpDivTest_b_32_nor_q <= not (redist89_yAddr_uid51_fpDivTest_b_32_notEnable_q or redist89_yAddr_uid51_fpDivTest_b_32_sticky_ena_q);

    -- redist89_yAddr_uid51_fpDivTest_b_32_mem_last(CONSTANT,744)
    redist89_yAddr_uid51_fpDivTest_b_32_mem_last_q <= "010";

    -- redist89_yAddr_uid51_fpDivTest_b_32_cmp(LOGICAL,745)
    redist89_yAddr_uid51_fpDivTest_b_32_cmp_b <= STD_LOGIC_VECTOR("0" & redist89_yAddr_uid51_fpDivTest_b_32_rdcnt_q);
    redist89_yAddr_uid51_fpDivTest_b_32_cmp_q <= "1" WHEN redist89_yAddr_uid51_fpDivTest_b_32_mem_last_q = redist89_yAddr_uid51_fpDivTest_b_32_cmp_b ELSE "0";

    -- redist89_yAddr_uid51_fpDivTest_b_32_cmpReg(REG,746)
    redist89_yAddr_uid51_fpDivTest_b_32_cmpReg_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist89_yAddr_uid51_fpDivTest_b_32_cmpReg_q <= "0";
            ELSE
                redist89_yAddr_uid51_fpDivTest_b_32_cmpReg_q <= STD_LOGIC_VECTOR(redist89_yAddr_uid51_fpDivTest_b_32_cmp_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist89_yAddr_uid51_fpDivTest_b_32_sticky_ena(REG,749)
    redist89_yAddr_uid51_fpDivTest_b_32_sticky_ena_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist89_yAddr_uid51_fpDivTest_b_32_sticky_ena_q <= "0";
            ELSE
                IF (redist89_yAddr_uid51_fpDivTest_b_32_nor_q = "1") THEN
                    redist89_yAddr_uid51_fpDivTest_b_32_sticky_ena_q <= STD_LOGIC_VECTOR(redist89_yAddr_uid51_fpDivTest_b_32_cmpReg_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist89_yAddr_uid51_fpDivTest_b_32_enaAnd(LOGICAL,750)
    redist89_yAddr_uid51_fpDivTest_b_32_enaAnd_q <= redist89_yAddr_uid51_fpDivTest_b_32_sticky_ena_q and VCC_q;

    -- redist89_yAddr_uid51_fpDivTest_b_32_rdcnt(COUNTER,742)
    -- low=0, high=3, step=1, init=0
    redist89_yAddr_uid51_fpDivTest_b_32_rdcnt_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist89_yAddr_uid51_fpDivTest_b_32_rdcnt_i <= TO_UNSIGNED(0, 2);
            ELSE
                redist89_yAddr_uid51_fpDivTest_b_32_rdcnt_i <= redist89_yAddr_uid51_fpDivTest_b_32_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist89_yAddr_uid51_fpDivTest_b_32_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist89_yAddr_uid51_fpDivTest_b_32_rdcnt_i, 2)));

    -- redist89_yAddr_uid51_fpDivTest_b_32_inputreg1(DELAY,737)
    redist89_yAddr_uid51_fpDivTest_b_32_inputreg1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist89_yAddr_uid51_fpDivTest_b_32_inputreg1_q <= (others => '0');
            ELSE
                redist89_yAddr_uid51_fpDivTest_b_32_inputreg1_q <= STD_LOGIC_VECTOR(redist88_yAddr_uid51_fpDivTest_b_23_outputreg1_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist89_yAddr_uid51_fpDivTest_b_32_inputreg0(DELAY,739)
    redist89_yAddr_uid51_fpDivTest_b_32_inputreg0_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist89_yAddr_uid51_fpDivTest_b_32_inputreg0_q <= (others => '0');
            ELSE
                redist89_yAddr_uid51_fpDivTest_b_32_inputreg0_q <= STD_LOGIC_VECTOR(redist89_yAddr_uid51_fpDivTest_b_32_inputreg1_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist89_yAddr_uid51_fpDivTest_b_32_wraddr(REG,743)
    redist89_yAddr_uid51_fpDivTest_b_32_wraddr_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist89_yAddr_uid51_fpDivTest_b_32_wraddr_q <= "11";
            ELSE
                redist89_yAddr_uid51_fpDivTest_b_32_wraddr_q <= STD_LOGIC_VECTOR(redist89_yAddr_uid51_fpDivTest_b_32_rdcnt_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist89_yAddr_uid51_fpDivTest_b_32_mem(DUALMEM,741)
    redist89_yAddr_uid51_fpDivTest_b_32_mem_ia <= STD_LOGIC_VECTOR(redist89_yAddr_uid51_fpDivTest_b_32_inputreg0_q);
    redist89_yAddr_uid51_fpDivTest_b_32_mem_aa <= redist89_yAddr_uid51_fpDivTest_b_32_wraddr_q;
    redist89_yAddr_uid51_fpDivTest_b_32_mem_ab <= redist89_yAddr_uid51_fpDivTest_b_32_rdcnt_q;
    redist89_yAddr_uid51_fpDivTest_b_32_mem_reset0 <= areset;
    redist89_yAddr_uid51_fpDivTest_b_32_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 11,
        widthad_a => 2,
        numwords_a => 4,
        width_b => 11,
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
        clocken1 => redist89_yAddr_uid51_fpDivTest_b_32_enaAnd_q(0),
        clocken0 => '1',
        clock0 => clk,
        sclr => redist89_yAddr_uid51_fpDivTest_b_32_mem_reset0,
        clock1 => clk,
        address_a => redist89_yAddr_uid51_fpDivTest_b_32_mem_aa,
        data_a => redist89_yAddr_uid51_fpDivTest_b_32_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist89_yAddr_uid51_fpDivTest_b_32_mem_ab,
        q_b => redist89_yAddr_uid51_fpDivTest_b_32_mem_iq
    );
    redist89_yAddr_uid51_fpDivTest_b_32_mem_q <= redist89_yAddr_uid51_fpDivTest_b_32_mem_iq(10 downto 0);

    -- redist89_yAddr_uid51_fpDivTest_b_32_outputreg0(DELAY,740)
    redist89_yAddr_uid51_fpDivTest_b_32_outputreg0_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist89_yAddr_uid51_fpDivTest_b_32_outputreg0_q <= (others => '0');
            ELSE
                redist89_yAddr_uid51_fpDivTest_b_32_outputreg0_q <= STD_LOGIC_VECTOR(redist89_yAddr_uid51_fpDivTest_b_32_mem_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist89_yAddr_uid51_fpDivTest_b_32_outputreg1(DELAY,738)
    redist89_yAddr_uid51_fpDivTest_b_32_outputreg1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist89_yAddr_uid51_fpDivTest_b_32_outputreg1_q <= (others => '0');
            ELSE
                redist89_yAddr_uid51_fpDivTest_b_32_outputreg1_q <= STD_LOGIC_VECTOR(redist89_yAddr_uid51_fpDivTest_b_32_outputreg0_q);
            END IF;
        END IF;
    END PROCESS;

    -- memoryC0_uid151_invTables_lutmem(DUALMEM,436)@32 + 2
    -- in j@20000000
    memoryC0_uid151_invTables_lutmem_aa <= redist89_yAddr_uid51_fpDivTest_b_32_outputreg1_q;
    memoryC0_uid151_invTables_lutmem_reset0 <= areset;
    memoryC0_uid151_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "ROM",
        width_a => 10,
        widthad_a => 11,
        numwords_a => 2048,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_sclr_a => "SCLEAR",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "float64_div_altera_fp_functions_191_4b5aiyq_memoryC0_uid151_invTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Stratix 10"
    )
    PORT MAP (
        clocken0 => '1',
        sclr => memoryC0_uid151_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC0_uid151_invTables_lutmem_aa,
        q_a => memoryC0_uid151_invTables_lutmem_ir
    );
    memoryC0_uid151_invTables_lutmem_r <= memoryC0_uid151_invTables_lutmem_ir(9 downto 0);

    -- redist31_memoryC0_uid151_invTables_lutmem_r_1(DELAY,541)
    redist31_memoryC0_uid151_invTables_lutmem_r_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist31_memoryC0_uid151_invTables_lutmem_r_1_q <= (others => '0');
            ELSE
                redist31_memoryC0_uid151_invTables_lutmem_r_1_q <= STD_LOGIC_VECTOR(memoryC0_uid151_invTables_lutmem_r);
            END IF;
        END IF;
    END PROCESS;

    -- memoryC0_uid150_invTables_lutmem(DUALMEM,435)@32 + 2
    -- in j@20000000
    memoryC0_uid150_invTables_lutmem_aa <= redist89_yAddr_uid51_fpDivTest_b_32_outputreg1_q;
    memoryC0_uid150_invTables_lutmem_reset0 <= areset;
    memoryC0_uid150_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "ROM",
        width_a => 10,
        widthad_a => 11,
        numwords_a => 2048,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_sclr_a => "SCLEAR",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "float64_div_altera_fp_functions_191_4b5aiyq_memoryC0_uid150_invTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Stratix 10"
    )
    PORT MAP (
        clocken0 => '1',
        sclr => memoryC0_uid150_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC0_uid150_invTables_lutmem_aa,
        q_a => memoryC0_uid150_invTables_lutmem_ir
    );
    memoryC0_uid150_invTables_lutmem_r <= memoryC0_uid150_invTables_lutmem_ir(9 downto 0);

    -- redist32_memoryC0_uid150_invTables_lutmem_r_1(DELAY,542)
    redist32_memoryC0_uid150_invTables_lutmem_r_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist32_memoryC0_uid150_invTables_lutmem_r_1_q <= (others => '0');
            ELSE
                redist32_memoryC0_uid150_invTables_lutmem_r_1_q <= STD_LOGIC_VECTOR(memoryC0_uid150_invTables_lutmem_r);
            END IF;
        END IF;
    END PROCESS;

    -- memoryC0_uid149_invTables_lutmem(DUALMEM,434)@32 + 2
    -- in j@20000000
    memoryC0_uid149_invTables_lutmem_aa <= redist89_yAddr_uid51_fpDivTest_b_32_outputreg1_q;
    memoryC0_uid149_invTables_lutmem_reset0 <= areset;
    memoryC0_uid149_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "ROM",
        width_a => 10,
        widthad_a => 11,
        numwords_a => 2048,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_sclr_a => "SCLEAR",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "float64_div_altera_fp_functions_191_4b5aiyq_memoryC0_uid149_invTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Stratix 10"
    )
    PORT MAP (
        clocken0 => '1',
        sclr => memoryC0_uid149_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC0_uid149_invTables_lutmem_aa,
        q_a => memoryC0_uid149_invTables_lutmem_ir
    );
    memoryC0_uid149_invTables_lutmem_r <= memoryC0_uid149_invTables_lutmem_ir(9 downto 0);

    -- redist33_memoryC0_uid149_invTables_lutmem_r_1(DELAY,543)
    redist33_memoryC0_uid149_invTables_lutmem_r_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist33_memoryC0_uid149_invTables_lutmem_r_1_q <= (others => '0');
            ELSE
                redist33_memoryC0_uid149_invTables_lutmem_r_1_q <= STD_LOGIC_VECTOR(memoryC0_uid149_invTables_lutmem_r);
            END IF;
        END IF;
    END PROCESS;

    -- memoryC0_uid148_invTables_lutmem(DUALMEM,433)@32 + 2
    -- in j@20000000
    memoryC0_uid148_invTables_lutmem_aa <= redist89_yAddr_uid51_fpDivTest_b_32_outputreg1_q;
    memoryC0_uid148_invTables_lutmem_reset0 <= areset;
    memoryC0_uid148_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "ROM",
        width_a => 10,
        widthad_a => 11,
        numwords_a => 2048,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_sclr_a => "SCLEAR",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "float64_div_altera_fp_functions_191_4b5aiyq_memoryC0_uid148_invTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Stratix 10"
    )
    PORT MAP (
        clocken0 => '1',
        sclr => memoryC0_uid148_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC0_uid148_invTables_lutmem_aa,
        q_a => memoryC0_uid148_invTables_lutmem_ir
    );
    memoryC0_uid148_invTables_lutmem_r <= memoryC0_uid148_invTables_lutmem_ir(9 downto 0);

    -- redist34_memoryC0_uid148_invTables_lutmem_r_1(DELAY,544)
    redist34_memoryC0_uid148_invTables_lutmem_r_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist34_memoryC0_uid148_invTables_lutmem_r_1_q <= (others => '0');
            ELSE
                redist34_memoryC0_uid148_invTables_lutmem_r_1_q <= STD_LOGIC_VECTOR(memoryC0_uid148_invTables_lutmem_r);
            END IF;
        END IF;
    END PROCESS;

    -- memoryC0_uid147_invTables_lutmem(DUALMEM,432)@32 + 2
    -- in j@20000000
    memoryC0_uid147_invTables_lutmem_aa <= redist89_yAddr_uid51_fpDivTest_b_32_outputreg1_q;
    memoryC0_uid147_invTables_lutmem_reset0 <= areset;
    memoryC0_uid147_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "ROM",
        width_a => 10,
        widthad_a => 11,
        numwords_a => 2048,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_sclr_a => "SCLEAR",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "float64_div_altera_fp_functions_191_4b5aiyq_memoryC0_uid147_invTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Stratix 10"
    )
    PORT MAP (
        clocken0 => '1',
        sclr => memoryC0_uid147_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC0_uid147_invTables_lutmem_aa,
        q_a => memoryC0_uid147_invTables_lutmem_ir
    );
    memoryC0_uid147_invTables_lutmem_r <= memoryC0_uid147_invTables_lutmem_ir(9 downto 0);

    -- redist35_memoryC0_uid147_invTables_lutmem_r_1(DELAY,545)
    redist35_memoryC0_uid147_invTables_lutmem_r_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist35_memoryC0_uid147_invTables_lutmem_r_1_q <= (others => '0');
            ELSE
                redist35_memoryC0_uid147_invTables_lutmem_r_1_q <= STD_LOGIC_VECTOR(memoryC0_uid147_invTables_lutmem_r);
            END IF;
        END IF;
    END PROCESS;

    -- memoryC0_uid146_invTables_lutmem(DUALMEM,431)@32 + 2
    -- in j@20000000
    memoryC0_uid146_invTables_lutmem_aa <= redist89_yAddr_uid51_fpDivTest_b_32_outputreg1_q;
    memoryC0_uid146_invTables_lutmem_reset0 <= areset;
    memoryC0_uid146_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "ROM",
        width_a => 10,
        widthad_a => 11,
        numwords_a => 2048,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_sclr_a => "SCLEAR",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "float64_div_altera_fp_functions_191_4b5aiyq_memoryC0_uid146_invTables_lutmem.hex",
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
    memoryC0_uid146_invTables_lutmem_r <= memoryC0_uid146_invTables_lutmem_ir(9 downto 0);

    -- redist36_memoryC0_uid146_invTables_lutmem_r_1(DELAY,546)
    redist36_memoryC0_uid146_invTables_lutmem_r_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist36_memoryC0_uid146_invTables_lutmem_r_1_q <= (others => '0');
            ELSE
                redist36_memoryC0_uid146_invTables_lutmem_r_1_q <= STD_LOGIC_VECTOR(memoryC0_uid146_invTables_lutmem_r);
            END IF;
        END IF;
    END PROCESS;

    -- os_uid153_invTables(BITJOIN,152)@35
    os_uid153_invTables_q <= GND_q & redist31_memoryC0_uid151_invTables_lutmem_r_1_q & redist32_memoryC0_uid150_invTables_lutmem_r_1_q & redist33_memoryC0_uid149_invTables_lutmem_r_1_q & redist34_memoryC0_uid148_invTables_lutmem_r_1_q & redist35_memoryC0_uid147_invTables_lutmem_r_1_q & redist36_memoryC0_uid146_invTables_lutmem_r_1_q;

    -- s4sumAHighB_uid204_invPolyEval(ADD,203)@35
    s4sumAHighB_uid204_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((61 downto 61 => os_uid153_invTables_q(60)) & os_uid153_invTables_q));
    s4sumAHighB_uid204_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((61 downto 50 => highBBits_uid203_invPolyEval_b(49)) & highBBits_uid203_invPolyEval_b));
    s4sumAHighB_uid204_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(s4sumAHighB_uid204_invPolyEval_a) + SIGNED(s4sumAHighB_uid204_invPolyEval_b));
    s4sumAHighB_uid204_invPolyEval_q <= s4sumAHighB_uid204_invPolyEval_o(61 downto 0);

    -- lowRangeB_uid202_invPolyEval(BITSELECT,201)@35
    lowRangeB_uid202_invPolyEval_in <= redist37_os_uid346_pT4_uid201_invPolyEval_b_1_q(1 downto 0);
    lowRangeB_uid202_invPolyEval_b <= lowRangeB_uid202_invPolyEval_in(1 downto 0);

    -- s4_uid205_invPolyEval(BITJOIN,204)@35
    s4_uid205_invPolyEval_q <= s4sumAHighB_uid204_invPolyEval_q & lowRangeB_uid202_invPolyEval_b;

    -- invY_uid54_fpDivTest(BITSELECT,53)@35
    invY_uid54_fpDivTest_in <= s4_uid205_invPolyEval_q(60 downto 0);
    invY_uid54_fpDivTest_b <= invY_uid54_fpDivTest_in(60 downto 5);

    -- rightBottomX_uid228_divValPreNorm_uid59_fpDivTest(BITSELECT,227)@35
    rightBottomX_uid228_divValPreNorm_uid59_fpDivTest_in <= invY_uid54_fpDivTest_b(1 downto 0);
    rightBottomX_uid228_divValPreNorm_uid59_fpDivTest_b <= rightBottomX_uid228_divValPreNorm_uid59_fpDivTest_in(1 downto 0);

    -- redist54_rightBottomX_uid228_divValPreNorm_uid59_fpDivTest_b_3(DELAY,564)
    redist54_rightBottomX_uid228_divValPreNorm_uid59_fpDivTest_b_3_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist54_rightBottomX_uid228_divValPreNorm_uid59_fpDivTest_b_3_delay_0 <= (others => '0');
                redist54_rightBottomX_uid228_divValPreNorm_uid59_fpDivTest_b_3_delay_1 <= (others => '0');
                redist54_rightBottomX_uid228_divValPreNorm_uid59_fpDivTest_b_3_q <= (others => '0');
            ELSE
                redist54_rightBottomX_uid228_divValPreNorm_uid59_fpDivTest_b_3_delay_0 <= STD_LOGIC_VECTOR(rightBottomX_uid228_divValPreNorm_uid59_fpDivTest_b);
                redist54_rightBottomX_uid228_divValPreNorm_uid59_fpDivTest_b_3_delay_1 <= redist54_rightBottomX_uid228_divValPreNorm_uid59_fpDivTest_b_3_delay_0;
                redist54_rightBottomX_uid228_divValPreNorm_uid59_fpDivTest_b_3_q <= redist54_rightBottomX_uid228_divValPreNorm_uid59_fpDivTest_b_3_delay_1;
            END IF;
        END IF;
    END PROCESS;

    -- sm0_uid234_divValPreNorm_uid59_fpDivTest(MULT,233)@38 + 5
    sm0_uid234_divValPreNorm_uid59_fpDivTest_pr <= UNSIGNED(sm0_uid234_divValPreNorm_uid59_fpDivTest_a2) * UNSIGNED(sm0_uid234_divValPreNorm_uid59_fpDivTest_b2);
    sm0_uid234_divValPreNorm_uid59_fpDivTest_component: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                sm0_uid234_divValPreNorm_uid59_fpDivTest_a0 <= (others => '0');
                sm0_uid234_divValPreNorm_uid59_fpDivTest_b0 <= (others => '0');
                sm0_uid234_divValPreNorm_uid59_fpDivTest_a1 <= (others => '0');
                sm0_uid234_divValPreNorm_uid59_fpDivTest_b1 <= (others => '0');
                sm0_uid234_divValPreNorm_uid59_fpDivTest_a2 <= (others => '0');
                sm0_uid234_divValPreNorm_uid59_fpDivTest_b2 <= (others => '0');
                sm0_uid234_divValPreNorm_uid59_fpDivTest_s1 <= (others => '0');
            ELSE
                sm0_uid234_divValPreNorm_uid59_fpDivTest_a0 <= redist54_rightBottomX_uid228_divValPreNorm_uid59_fpDivTest_b_3_q;
                sm0_uid234_divValPreNorm_uid59_fpDivTest_b0 <= rightBottomY_uid229_divValPreNorm_uid59_fpDivTest_b;
                sm0_uid234_divValPreNorm_uid59_fpDivTest_a1 <= sm0_uid234_divValPreNorm_uid59_fpDivTest_a0;
                sm0_uid234_divValPreNorm_uid59_fpDivTest_b1 <= sm0_uid234_divValPreNorm_uid59_fpDivTest_b0;
                sm0_uid234_divValPreNorm_uid59_fpDivTest_a2 <= sm0_uid234_divValPreNorm_uid59_fpDivTest_a1;
                sm0_uid234_divValPreNorm_uid59_fpDivTest_b2 <= sm0_uid234_divValPreNorm_uid59_fpDivTest_b1;
                sm0_uid234_divValPreNorm_uid59_fpDivTest_s1 <= STD_LOGIC_VECTOR(sm0_uid234_divValPreNorm_uid59_fpDivTest_pr);
            END IF;
        END IF;
    END PROCESS;
    sm0_uid234_divValPreNorm_uid59_fpDivTest: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                sm0_uid234_divValPreNorm_uid59_fpDivTest_q <= (others => '0');
            ELSE
                sm0_uid234_divValPreNorm_uid59_fpDivTest_q <= sm0_uid234_divValPreNorm_uid59_fpDivTest_s1;
            END IF;
        END IF;
    END PROCESS;

    -- redist53_sm0_uid234_divValPreNorm_uid59_fpDivTest_q_1(DELAY,563)
    redist53_sm0_uid234_divValPreNorm_uid59_fpDivTest_q_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist53_sm0_uid234_divValPreNorm_uid59_fpDivTest_q_1_q <= (others => '0');
            ELSE
                redist53_sm0_uid234_divValPreNorm_uid59_fpDivTest_q_1_q <= STD_LOGIC_VECTOR(sm0_uid234_divValPreNorm_uid59_fpDivTest_q);
            END IF;
        END IF;
    END PROCESS;

    -- lev2_a0high_uid242_divValPreNorm_uid59_fpDivTest(ADD,241)@44
    lev2_a0high_uid242_divValPreNorm_uid59_fpDivTest_a <= STD_LOGIC_VECTOR("0" & lowRangeA_uid240_divValPreNorm_uid59_fpDivTest_merged_bit_select_c);
    lev2_a0high_uid242_divValPreNorm_uid59_fpDivTest_b <= STD_LOGIC_VECTOR("00000000000000000000000000000000000000000000000000000000" & redist53_sm0_uid234_divValPreNorm_uid59_fpDivTest_q_1_q);
    lev2_a0high_uid242_divValPreNorm_uid59_fpDivTest_o <= STD_LOGIC_VECTOR(UNSIGNED(lev2_a0high_uid242_divValPreNorm_uid59_fpDivTest_a) + UNSIGNED(lev2_a0high_uid242_divValPreNorm_uid59_fpDivTest_b));
    lev2_a0high_uid242_divValPreNorm_uid59_fpDivTest_q <= lev2_a0high_uid242_divValPreNorm_uid59_fpDivTest_o(62 downto 0);

    -- topRangeX_uid217_divValPreNorm_uid59_fpDivTest(BITSELECT,216)@35
    topRangeX_uid217_divValPreNorm_uid59_fpDivTest_b <= invY_uid54_fpDivTest_b(55 downto 29);

    -- aboveLeftY_bottomRange_uid221_divValPreNorm_uid59_fpDivTest(BITSELECT,220)@35
    aboveLeftY_bottomRange_uid221_divValPreNorm_uid59_fpDivTest_in <= lOAdded_uid57_fpDivTest_q(25 downto 0);
    aboveLeftY_bottomRange_uid221_divValPreNorm_uid59_fpDivTest_b <= aboveLeftY_bottomRange_uid221_divValPreNorm_uid59_fpDivTest_in(25 downto 0);

    -- aboveLeftY_mergedSignalTM_uid222_divValPreNorm_uid59_fpDivTest(BITJOIN,221)@35
    aboveLeftY_mergedSignalTM_uid222_divValPreNorm_uid59_fpDivTest_q <= aboveLeftY_bottomRange_uid221_divValPreNorm_uid59_fpDivTest_b & GND_q;

    -- rightBottomX_uid224_divValPreNorm_uid59_fpDivTest(BITSELECT,223)@35
    rightBottomX_uid224_divValPreNorm_uid59_fpDivTest_in <= invY_uid54_fpDivTest_b(28 downto 0);
    rightBottomX_uid224_divValPreNorm_uid59_fpDivTest_b <= rightBottomX_uid224_divValPreNorm_uid59_fpDivTest_in(28 downto 2);

    -- redist56_rightBottomX_uid224_divValPreNorm_uid59_fpDivTest_b_1(DELAY,566)
    redist56_rightBottomX_uid224_divValPreNorm_uid59_fpDivTest_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist56_rightBottomX_uid224_divValPreNorm_uid59_fpDivTest_b_1_q <= (others => '0');
            ELSE
                redist56_rightBottomX_uid224_divValPreNorm_uid59_fpDivTest_b_1_q <= STD_LOGIC_VECTOR(rightBottomX_uid224_divValPreNorm_uid59_fpDivTest_b);
            END IF;
        END IF;
    END PROCESS;

    -- topRangeY_uid218_divValPreNorm_uid59_fpDivTest(BITSELECT,217)@36
    topRangeY_uid218_divValPreNorm_uid59_fpDivTest_b <= redist78_lOAdded_uid57_fpDivTest_q_1_q(52 downto 26);

    -- multSumOfTwoTS_uid231_divValPreNorm_uid59_fpDivTest_cma(CHAINMULTADD,473)@35 + 5
    -- in e@36
    -- in g@36
    -- out q@42
    multSumOfTwoTS_uid231_divValPreNorm_uid59_fpDivTest_cma_reset <= areset;
    multSumOfTwoTS_uid231_divValPreNorm_uid59_fpDivTest_cma_ena0 <= '1';
    multSumOfTwoTS_uid231_divValPreNorm_uid59_fpDivTest_cma_ena1 <= multSumOfTwoTS_uid231_divValPreNorm_uid59_fpDivTest_cma_ena0;
    multSumOfTwoTS_uid231_divValPreNorm_uid59_fpDivTest_cma_ena2 <= multSumOfTwoTS_uid231_divValPreNorm_uid59_fpDivTest_cma_ena0;
    multSumOfTwoTS_uid231_divValPreNorm_uid59_fpDivTest_cma_chainmultadd_hyper: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (false) THEN
            ELSE
                multSumOfTwoTS_uid231_divValPreNorm_uid59_fpDivTest_cma_ah(0) <= RESIZE(UNSIGNED(topRangeY_uid218_divValPreNorm_uid59_fpDivTest_b),27);
                multSumOfTwoTS_uid231_divValPreNorm_uid59_fpDivTest_cma_ah(1) <= RESIZE(UNSIGNED(aboveLeftY_mergedSignalTM_uid222_divValPreNorm_uid59_fpDivTest_q),27);
                multSumOfTwoTS_uid231_divValPreNorm_uid59_fpDivTest_cma_ch(0) <= RESIZE(UNSIGNED(redist56_rightBottomX_uid224_divValPreNorm_uid59_fpDivTest_b_1_q),27);
                multSumOfTwoTS_uid231_divValPreNorm_uid59_fpDivTest_cma_ch(1) <= RESIZE(UNSIGNED(topRangeX_uid217_divValPreNorm_uid59_fpDivTest_b),27);
            END IF;
        END IF;
    END PROCESS;

    multSumOfTwoTS_uid231_divValPreNorm_uid59_fpDivTest_cma_a0 <= STD_LOGIC_VECTOR(multSumOfTwoTS_uid231_divValPreNorm_uid59_fpDivTest_cma_ah(0));
    multSumOfTwoTS_uid231_divValPreNorm_uid59_fpDivTest_cma_c0 <= STD_LOGIC_VECTOR(multSumOfTwoTS_uid231_divValPreNorm_uid59_fpDivTest_cma_ch(0));
    multSumOfTwoTS_uid231_divValPreNorm_uid59_fpDivTest_cma_a1 <= STD_LOGIC_VECTOR(multSumOfTwoTS_uid231_divValPreNorm_uid59_fpDivTest_cma_ah(1));
    multSumOfTwoTS_uid231_divValPreNorm_uid59_fpDivTest_cma_c1 <= STD_LOGIC_VECTOR(multSumOfTwoTS_uid231_divValPreNorm_uid59_fpDivTest_cma_ch(1));
    multSumOfTwoTS_uid231_divValPreNorm_uid59_fpDivTest_cma_DSP1 : fourteennm_mac
    GENERIC MAP (
        operation_mode => "m27x27",
        clear_type => "sclr",
        use_chainadder => "false",
        ay_scan_in_clock => "0",
        ay_scan_in_width => 27,
        ax_clock => "0",
        ax_width => 27,
        signed_may => "false",
        signed_max => "false",
        input_pipeline_clock => "2",
        second_pipeline_clock => "2",
        output_clock => "1"
    )
    PORT MAP (
        clk(0) => clk,
        clk(1) => clk,
        clk(2) => clk,
        ena(0) => multSumOfTwoTS_uid231_divValPreNorm_uid59_fpDivTest_cma_ena0,
        ena(1) => multSumOfTwoTS_uid231_divValPreNorm_uid59_fpDivTest_cma_ena1,
        ena(2) => multSumOfTwoTS_uid231_divValPreNorm_uid59_fpDivTest_cma_ena2,
        clr(0) => multSumOfTwoTS_uid231_divValPreNorm_uid59_fpDivTest_cma_reset,
        clr(1) => multSumOfTwoTS_uid231_divValPreNorm_uid59_fpDivTest_cma_reset,
        ay => multSumOfTwoTS_uid231_divValPreNorm_uid59_fpDivTest_cma_a1,
        ax => multSumOfTwoTS_uid231_divValPreNorm_uid59_fpDivTest_cma_c1,
        chainout => multSumOfTwoTS_uid231_divValPreNorm_uid59_fpDivTest_cma_s1
    );
    multSumOfTwoTS_uid231_divValPreNorm_uid59_fpDivTest_cma_DSP0 : fourteennm_mac
    GENERIC MAP (
        operation_mode => "m27x27",
        clear_type => "sclr",
        use_chainadder => "true",
        ay_scan_in_clock => "0",
        ay_scan_in_width => 27,
        ax_clock => "0",
        ax_width => 27,
        signed_may => "false",
        signed_max => "false",
        input_pipeline_clock => "2",
        second_pipeline_clock => "2",
        output_clock => "1",
        result_a_width => 55
    )
    PORT MAP (
        clk(0) => clk,
        clk(1) => clk,
        clk(2) => clk,
        ena(0) => multSumOfTwoTS_uid231_divValPreNorm_uid59_fpDivTest_cma_ena0,
        ena(1) => multSumOfTwoTS_uid231_divValPreNorm_uid59_fpDivTest_cma_ena1,
        ena(2) => multSumOfTwoTS_uid231_divValPreNorm_uid59_fpDivTest_cma_ena2,
        clr(0) => multSumOfTwoTS_uid231_divValPreNorm_uid59_fpDivTest_cma_reset,
        clr(1) => multSumOfTwoTS_uid231_divValPreNorm_uid59_fpDivTest_cma_reset,
        ay => multSumOfTwoTS_uid231_divValPreNorm_uid59_fpDivTest_cma_a0,
        ax => multSumOfTwoTS_uid231_divValPreNorm_uid59_fpDivTest_cma_c0,
        chainin => multSumOfTwoTS_uid231_divValPreNorm_uid59_fpDivTest_cma_s1,
        resulta => multSumOfTwoTS_uid231_divValPreNorm_uid59_fpDivTest_cma_s0
    );
    multSumOfTwoTS_uid231_divValPreNorm_uid59_fpDivTest_cma_delay : dspba_delay
    GENERIC MAP ( width => 55, depth => 1, reset_kind => "NONE", phase => 0, modulus => 1 )
    PORT MAP ( xin => multSumOfTwoTS_uid231_divValPreNorm_uid59_fpDivTest_cma_s0, xout => multSumOfTwoTS_uid231_divValPreNorm_uid59_fpDivTest_cma_qq, clk => clk, aclr => areset, ena => '1' );
    multSumOfTwoTS_uid231_divValPreNorm_uid59_fpDivTest_cma_q <= STD_LOGIC_VECTOR(multSumOfTwoTS_uid231_divValPreNorm_uid59_fpDivTest_cma_qq(54 downto 0));

    -- redist11_multSumOfTwoTS_uid231_divValPreNorm_uid59_fpDivTest_cma_q_1(DELAY,521)
    redist11_multSumOfTwoTS_uid231_divValPreNorm_uid59_fpDivTest_cma_q_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist11_multSumOfTwoTS_uid231_divValPreNorm_uid59_fpDivTest_cma_q_1_q <= (others => '0');
            ELSE
                redist11_multSumOfTwoTS_uid231_divValPreNorm_uid59_fpDivTest_cma_q_1_q <= STD_LOGIC_VECTOR(multSumOfTwoTS_uid231_divValPreNorm_uid59_fpDivTest_cma_q);
            END IF;
        END IF;
    END PROCESS;

    -- lowRangeB_uid236_divValPreNorm_uid59_fpDivTest_merged_bit_select(BITSELECT,507)@43
    lowRangeB_uid236_divValPreNorm_uid59_fpDivTest_merged_bit_select_b <= redist11_multSumOfTwoTS_uid231_divValPreNorm_uid59_fpDivTest_cma_q_1_q(12 downto 0);
    lowRangeB_uid236_divValPreNorm_uid59_fpDivTest_merged_bit_select_c <= redist11_multSumOfTwoTS_uid231_divValPreNorm_uid59_fpDivTest_cma_q_1_q(54 downto 13);

    -- redist57_topRangeX_uid217_divValPreNorm_uid59_fpDivTest_b_1(DELAY,567)
    redist57_topRangeX_uid217_divValPreNorm_uid59_fpDivTest_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist57_topRangeX_uid217_divValPreNorm_uid59_fpDivTest_b_1_q <= (others => '0');
            ELSE
                redist57_topRangeX_uid217_divValPreNorm_uid59_fpDivTest_b_1_q <= STD_LOGIC_VECTOR(topRangeX_uid217_divValPreNorm_uid59_fpDivTest_b);
            END IF;
        END IF;
    END PROCESS;

    -- sm0_uid230_divValPreNorm_uid59_fpDivTest_cma(CHAINMULTADD,465)@36 + 5
    -- out q@42
    sm0_uid230_divValPreNorm_uid59_fpDivTest_cma_reset <= areset;
    sm0_uid230_divValPreNorm_uid59_fpDivTest_cma_ena0 <= '1';
    sm0_uid230_divValPreNorm_uid59_fpDivTest_cma_ena1 <= sm0_uid230_divValPreNorm_uid59_fpDivTest_cma_ena0;
    sm0_uid230_divValPreNorm_uid59_fpDivTest_cma_ena2 <= sm0_uid230_divValPreNorm_uid59_fpDivTest_cma_ena0;
    sm0_uid230_divValPreNorm_uid59_fpDivTest_cma_chainmultadd_hyper: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (false) THEN
            ELSE
                sm0_uid230_divValPreNorm_uid59_fpDivTest_cma_ah(0) <= RESIZE(UNSIGNED(redist57_topRangeX_uid217_divValPreNorm_uid59_fpDivTest_b_1_q),27);
                sm0_uid230_divValPreNorm_uid59_fpDivTest_cma_ch(0) <= RESIZE(UNSIGNED(topRangeY_uid218_divValPreNorm_uid59_fpDivTest_b),27);
            END IF;
        END IF;
    END PROCESS;

    sm0_uid230_divValPreNorm_uid59_fpDivTest_cma_a0 <= STD_LOGIC_VECTOR(sm0_uid230_divValPreNorm_uid59_fpDivTest_cma_ah(0));
    sm0_uid230_divValPreNorm_uid59_fpDivTest_cma_c0 <= STD_LOGIC_VECTOR(sm0_uid230_divValPreNorm_uid59_fpDivTest_cma_ch(0));
    sm0_uid230_divValPreNorm_uid59_fpDivTest_cma_DSP0 : fourteennm_mac
    GENERIC MAP (
        operation_mode => "m27x27",
        clear_type => "sclr",
        use_chainadder => "false",
        ay_scan_in_clock => "0",
        ay_scan_in_width => 27,
        ax_clock => "0",
        ax_width => 27,
        signed_may => "false",
        signed_max => "false",
        input_pipeline_clock => "2",
        second_pipeline_clock => "2",
        output_clock => "1",
        result_a_width => 54
    )
    PORT MAP (
        clk(0) => clk,
        clk(1) => clk,
        clk(2) => clk,
        ena(0) => sm0_uid230_divValPreNorm_uid59_fpDivTest_cma_ena0,
        ena(1) => sm0_uid230_divValPreNorm_uid59_fpDivTest_cma_ena1,
        ena(2) => sm0_uid230_divValPreNorm_uid59_fpDivTest_cma_ena2,
        clr(0) => sm0_uid230_divValPreNorm_uid59_fpDivTest_cma_reset,
        clr(1) => sm0_uid230_divValPreNorm_uid59_fpDivTest_cma_reset,
        ay => sm0_uid230_divValPreNorm_uid59_fpDivTest_cma_a0,
        ax => sm0_uid230_divValPreNorm_uid59_fpDivTest_cma_c0,
        resulta => sm0_uid230_divValPreNorm_uid59_fpDivTest_cma_s0
    );
    sm0_uid230_divValPreNorm_uid59_fpDivTest_cma_delay : dspba_delay
    GENERIC MAP ( width => 54, depth => 1, reset_kind => "NONE", phase => 0, modulus => 1 )
    PORT MAP ( xin => sm0_uid230_divValPreNorm_uid59_fpDivTest_cma_s0, xout => sm0_uid230_divValPreNorm_uid59_fpDivTest_cma_qq, clk => clk, aclr => areset, ena => '1' );
    sm0_uid230_divValPreNorm_uid59_fpDivTest_cma_q <= STD_LOGIC_VECTOR(sm0_uid230_divValPreNorm_uid59_fpDivTest_cma_qq(53 downto 0));

    -- redist18_sm0_uid230_divValPreNorm_uid59_fpDivTest_cma_q_1(DELAY,528)
    redist18_sm0_uid230_divValPreNorm_uid59_fpDivTest_cma_q_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist18_sm0_uid230_divValPreNorm_uid59_fpDivTest_cma_q_1_q <= (others => '0');
            ELSE
                redist18_sm0_uid230_divValPreNorm_uid59_fpDivTest_cma_q_1_q <= STD_LOGIC_VECTOR(sm0_uid230_divValPreNorm_uid59_fpDivTest_cma_q);
            END IF;
        END IF;
    END PROCESS;

    -- aboveLeftY_uid227_divValPreNorm_uid59_fpDivTest(BITSELECT,226)@36
    aboveLeftY_uid227_divValPreNorm_uid59_fpDivTest_in <= redist78_lOAdded_uid57_fpDivTest_q_1_q(25 downto 0);
    aboveLeftY_uid227_divValPreNorm_uid59_fpDivTest_b <= aboveLeftY_uid227_divValPreNorm_uid59_fpDivTest_in(25 downto 19);

    -- aboveLeftX_uid226_divValPreNorm_uid59_fpDivTest(BITSELECT,225)@35
    aboveLeftX_uid226_divValPreNorm_uid59_fpDivTest_in <= invY_uid54_fpDivTest_b(28 downto 0);
    aboveLeftX_uid226_divValPreNorm_uid59_fpDivTest_b <= aboveLeftX_uid226_divValPreNorm_uid59_fpDivTest_in(28 downto 22);

    -- redist55_aboveLeftX_uid226_divValPreNorm_uid59_fpDivTest_b_1(DELAY,565)
    redist55_aboveLeftX_uid226_divValPreNorm_uid59_fpDivTest_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist55_aboveLeftX_uid226_divValPreNorm_uid59_fpDivTest_b_1_q <= (others => '0');
            ELSE
                redist55_aboveLeftX_uid226_divValPreNorm_uid59_fpDivTest_b_1_q <= STD_LOGIC_VECTOR(aboveLeftX_uid226_divValPreNorm_uid59_fpDivTest_b);
            END IF;
        END IF;
    END PROCESS;

    -- sm0_uid233_divValPreNorm_uid59_fpDivTest_cma(CHAINMULTADD,466)@36 + 5
    -- out q@42
    sm0_uid233_divValPreNorm_uid59_fpDivTest_cma_reset <= areset;
    sm0_uid233_divValPreNorm_uid59_fpDivTest_cma_ena0 <= '1';
    sm0_uid233_divValPreNorm_uid59_fpDivTest_cma_ena1 <= sm0_uid233_divValPreNorm_uid59_fpDivTest_cma_ena0;
    sm0_uid233_divValPreNorm_uid59_fpDivTest_cma_ena2 <= sm0_uid233_divValPreNorm_uid59_fpDivTest_cma_ena0;
    sm0_uid233_divValPreNorm_uid59_fpDivTest_cma_chainmultadd_hyper: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (false) THEN
            ELSE
                sm0_uid233_divValPreNorm_uid59_fpDivTest_cma_ah(0) <= RESIZE(UNSIGNED(redist55_aboveLeftX_uid226_divValPreNorm_uid59_fpDivTest_b_1_q),7);
                sm0_uid233_divValPreNorm_uid59_fpDivTest_cma_ch(0) <= RESIZE(UNSIGNED(aboveLeftY_uid227_divValPreNorm_uid59_fpDivTest_b),10);
            END IF;
        END IF;
    END PROCESS;

    sm0_uid233_divValPreNorm_uid59_fpDivTest_cma_a0 <= STD_LOGIC_VECTOR(sm0_uid233_divValPreNorm_uid59_fpDivTest_cma_ah(0));
    sm0_uid233_divValPreNorm_uid59_fpDivTest_cma_c0 <= STD_LOGIC_VECTOR(sm0_uid233_divValPreNorm_uid59_fpDivTest_cma_ch(0));
    sm0_uid233_divValPreNorm_uid59_fpDivTest_cma_DSP0 : fourteennm_mac
    GENERIC MAP (
        operation_mode => "m18x18_full",
        clear_type => "sclr",
        ay_scan_in_clock => "0",
        ay_scan_in_width => 7,
        ax_clock => "0",
        ax_width => 10,
        signed_may => "false",
        signed_max => "false",
        input_pipeline_clock => "2",
        second_pipeline_clock => "2",
        output_clock => "1",
        result_a_width => 17,
        bx_width => 0,
        by_width => 0,
        result_b_width => 0
    )
    PORT MAP (
        clk(0) => clk,
        clk(1) => clk,
        clk(2) => clk,
        ena(0) => sm0_uid233_divValPreNorm_uid59_fpDivTest_cma_ena0,
        ena(1) => sm0_uid233_divValPreNorm_uid59_fpDivTest_cma_ena1,
        ena(2) => sm0_uid233_divValPreNorm_uid59_fpDivTest_cma_ena2,
        clr(0) => sm0_uid233_divValPreNorm_uid59_fpDivTest_cma_reset,
        clr(1) => sm0_uid233_divValPreNorm_uid59_fpDivTest_cma_reset,
        ay => sm0_uid233_divValPreNorm_uid59_fpDivTest_cma_a0,
        ax => sm0_uid233_divValPreNorm_uid59_fpDivTest_cma_c0,
        resulta => sm0_uid233_divValPreNorm_uid59_fpDivTest_cma_s0
    );
    sm0_uid233_divValPreNorm_uid59_fpDivTest_cma_delay : dspba_delay
    GENERIC MAP ( width => 17, depth => 1, reset_kind => "NONE", phase => 0, modulus => 1 )
    PORT MAP ( xin => sm0_uid233_divValPreNorm_uid59_fpDivTest_cma_s0, xout => sm0_uid233_divValPreNorm_uid59_fpDivTest_cma_qq, clk => clk, aclr => areset, ena => '1' );
    sm0_uid233_divValPreNorm_uid59_fpDivTest_cma_q <= STD_LOGIC_VECTOR(sm0_uid233_divValPreNorm_uid59_fpDivTest_cma_qq(13 downto 0));

    -- redist17_sm0_uid233_divValPreNorm_uid59_fpDivTest_cma_q_1(DELAY,527)
    redist17_sm0_uid233_divValPreNorm_uid59_fpDivTest_cma_q_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist17_sm0_uid233_divValPreNorm_uid59_fpDivTest_cma_q_1_q <= (others => '0');
            ELSE
                redist17_sm0_uid233_divValPreNorm_uid59_fpDivTest_cma_q_1_q <= STD_LOGIC_VECTOR(sm0_uid233_divValPreNorm_uid59_fpDivTest_cma_q);
            END IF;
        END IF;
    END PROCESS;

    -- sumAb_uid235_divValPreNorm_uid59_fpDivTest(BITJOIN,234)@43
    sumAb_uid235_divValPreNorm_uid59_fpDivTest_q <= redist18_sm0_uid230_divValPreNorm_uid59_fpDivTest_cma_q_1_q & redist17_sm0_uid233_divValPreNorm_uid59_fpDivTest_cma_q_1_q;

    -- lev1_a0sumAHighB_uid238_divValPreNorm_uid59_fpDivTest(ADD,237)@43 + 1
    lev1_a0sumAHighB_uid238_divValPreNorm_uid59_fpDivTest_a <= STD_LOGIC_VECTOR("0" & sumAb_uid235_divValPreNorm_uid59_fpDivTest_q);
    lev1_a0sumAHighB_uid238_divValPreNorm_uid59_fpDivTest_b <= STD_LOGIC_VECTOR("000000000000000000000000000" & lowRangeB_uid236_divValPreNorm_uid59_fpDivTest_merged_bit_select_c);
    lev1_a0sumAHighB_uid238_divValPreNorm_uid59_fpDivTest_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                lev1_a0sumAHighB_uid238_divValPreNorm_uid59_fpDivTest_o <= (others => '0');
            ELSE
                lev1_a0sumAHighB_uid238_divValPreNorm_uid59_fpDivTest_o <= STD_LOGIC_VECTOR(UNSIGNED(lev1_a0sumAHighB_uid238_divValPreNorm_uid59_fpDivTest_a) + UNSIGNED(lev1_a0sumAHighB_uid238_divValPreNorm_uid59_fpDivTest_b));
            END IF;
        END IF;
    END PROCESS;
    lev1_a0sumAHighB_uid238_divValPreNorm_uid59_fpDivTest_q <= lev1_a0sumAHighB_uid238_divValPreNorm_uid59_fpDivTest_o(68 downto 0);

    -- redist0_lowRangeB_uid236_divValPreNorm_uid59_fpDivTest_merged_bit_select_b_1(DELAY,510)
    redist0_lowRangeB_uid236_divValPreNorm_uid59_fpDivTest_merged_bit_select_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist0_lowRangeB_uid236_divValPreNorm_uid59_fpDivTest_merged_bit_select_b_1_q <= (others => '0');
            ELSE
                redist0_lowRangeB_uid236_divValPreNorm_uid59_fpDivTest_merged_bit_select_b_1_q <= STD_LOGIC_VECTOR(lowRangeB_uid236_divValPreNorm_uid59_fpDivTest_merged_bit_select_b);
            END IF;
        END IF;
    END PROCESS;

    -- lev1_a0_uid239_divValPreNorm_uid59_fpDivTest(BITJOIN,238)@44
    lev1_a0_uid239_divValPreNorm_uid59_fpDivTest_q <= lev1_a0sumAHighB_uid238_divValPreNorm_uid59_fpDivTest_q & redist0_lowRangeB_uid236_divValPreNorm_uid59_fpDivTest_merged_bit_select_b_1_q;

    -- lowRangeA_uid240_divValPreNorm_uid59_fpDivTest_merged_bit_select(BITSELECT,502)@44
    lowRangeA_uid240_divValPreNorm_uid59_fpDivTest_merged_bit_select_b <= lev1_a0_uid239_divValPreNorm_uid59_fpDivTest_q(19 downto 0);
    lowRangeA_uid240_divValPreNorm_uid59_fpDivTest_merged_bit_select_c <= lev1_a0_uid239_divValPreNorm_uid59_fpDivTest_q(81 downto 20);

    -- lev2_a0_uid243_divValPreNorm_uid59_fpDivTest(BITJOIN,242)@44
    lev2_a0_uid243_divValPreNorm_uid59_fpDivTest_q <= lev2_a0high_uid242_divValPreNorm_uid59_fpDivTest_q & lowRangeA_uid240_divValPreNorm_uid59_fpDivTest_merged_bit_select_b;

    -- os_uid244_divValPreNorm_uid59_fpDivTest(BITSELECT,243)@44
    os_uid244_divValPreNorm_uid59_fpDivTest_in <= lev2_a0_uid243_divValPreNorm_uid59_fpDivTest_q(80 downto 0);
    os_uid244_divValPreNorm_uid59_fpDivTest_b <= os_uid244_divValPreNorm_uid59_fpDivTest_in(80 downto 24);

    -- redist52_os_uid244_divValPreNorm_uid59_fpDivTest_b_1(DELAY,562)
    redist52_os_uid244_divValPreNorm_uid59_fpDivTest_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist52_os_uid244_divValPreNorm_uid59_fpDivTest_b_1_q <= (others => '0');
            ELSE
                redist52_os_uid244_divValPreNorm_uid59_fpDivTest_b_1_q <= STD_LOGIC_VECTOR(os_uid244_divValPreNorm_uid59_fpDivTest_b);
            END IF;
        END IF;
    END PROCESS;

    -- updatedY_uid16_fpDivTest(BITJOIN,15)@43
    updatedY_uid16_fpDivTest_q <= GND_q & paddingY_uid15_fpDivTest_q;

    -- y0_uid350_fracYZero_uid15_fpDivTest_merged_bit_select(BITSELECT,499)@43
    y0_uid350_fracYZero_uid15_fpDivTest_merged_bit_select_b <= updatedY_uid16_fpDivTest_q(25 downto 0);
    y0_uid350_fracYZero_uid15_fpDivTest_merged_bit_select_c <= updatedY_uid16_fpDivTest_q(52 downto 26);

    -- y0_uid460_eq1_uid354_fracYZero_uid15_fpDivTest_merged_bit_select(BITSELECT,509)@43
    y0_uid460_eq1_uid354_fracYZero_uid15_fpDivTest_merged_bit_select_b <= y0_uid350_fracYZero_uid15_fpDivTest_merged_bit_select_c(12 downto 0);
    y0_uid460_eq1_uid354_fracYZero_uid15_fpDivTest_merged_bit_select_c <= y0_uid350_fracYZero_uid15_fpDivTest_merged_bit_select_c(26 downto 13);

    -- x1_uid352_fracYZero_uid15_fpDivTest(BITSELECT,351)@43
    x1_uid352_fracYZero_uid15_fpDivTest_b <= redist93_fracY_uid13_fpDivTest_b_43_outputreg0_q(51 downto 26);

    -- x0_uid459_eq1_uid354_fracYZero_uid15_fpDivTest_merged_bit_select(BITSELECT,504)@43
    x0_uid459_eq1_uid354_fracYZero_uid15_fpDivTest_merged_bit_select_b <= x1_uid352_fracYZero_uid15_fpDivTest_b(12 downto 0);
    x0_uid459_eq1_uid354_fracYZero_uid15_fpDivTest_merged_bit_select_c <= x1_uid352_fracYZero_uid15_fpDivTest_b(25 downto 13);

    -- eq1_uid464_eq1_uid354_fracYZero_uid15_fpDivTest(LOGICAL,463)@43
    eq1_uid464_eq1_uid354_fracYZero_uid15_fpDivTest_a <= STD_LOGIC_VECTOR("0" & x0_uid459_eq1_uid354_fracYZero_uid15_fpDivTest_merged_bit_select_c);
    eq1_uid464_eq1_uid354_fracYZero_uid15_fpDivTest_q <= "1" WHEN eq1_uid464_eq1_uid354_fracYZero_uid15_fpDivTest_a = y0_uid460_eq1_uid354_fracYZero_uid15_fpDivTest_merged_bit_select_c ELSE "0";

    -- eq0_uid461_eq1_uid354_fracYZero_uid15_fpDivTest(LOGICAL,460)@43
    eq0_uid461_eq1_uid354_fracYZero_uid15_fpDivTest_q <= "1" WHEN x0_uid459_eq1_uid354_fracYZero_uid15_fpDivTest_merged_bit_select_b = y0_uid460_eq1_uid354_fracYZero_uid15_fpDivTest_merged_bit_select_b ELSE "0";

    -- andEq_uid465_eq1_uid354_fracYZero_uid15_fpDivTest(LOGICAL,464)@43 + 1
    andEq_uid465_eq1_uid354_fracYZero_uid15_fpDivTest_qi <= eq0_uid461_eq1_uid354_fracYZero_uid15_fpDivTest_q and eq1_uid464_eq1_uid354_fracYZero_uid15_fpDivTest_q;
    andEq_uid465_eq1_uid354_fracYZero_uid15_fpDivTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => andEq_uid465_eq1_uid354_fracYZero_uid15_fpDivTest_qi, xout => andEq_uid465_eq1_uid354_fracYZero_uid15_fpDivTest_q, clk => clk, aclr => areset, ena => '1' );

    -- y0_uid453_eq0_uid351_fracYZero_uid15_fpDivTest_merged_bit_select(BITSELECT,508)@43
    y0_uid453_eq0_uid351_fracYZero_uid15_fpDivTest_merged_bit_select_b <= y0_uid350_fracYZero_uid15_fpDivTest_merged_bit_select_b(12 downto 0);
    y0_uid453_eq0_uid351_fracYZero_uid15_fpDivTest_merged_bit_select_c <= y0_uid350_fracYZero_uid15_fpDivTest_merged_bit_select_b(25 downto 13);

    -- x0_uid349_fracYZero_uid15_fpDivTest(BITSELECT,348)@43
    x0_uid349_fracYZero_uid15_fpDivTest_in <= redist93_fracY_uid13_fpDivTest_b_43_outputreg0_q(25 downto 0);
    x0_uid349_fracYZero_uid15_fpDivTest_b <= x0_uid349_fracYZero_uid15_fpDivTest_in(25 downto 0);

    -- x0_uid452_eq0_uid351_fracYZero_uid15_fpDivTest_merged_bit_select(BITSELECT,503)@43
    x0_uid452_eq0_uid351_fracYZero_uid15_fpDivTest_merged_bit_select_b <= x0_uid349_fracYZero_uid15_fpDivTest_b(12 downto 0);
    x0_uid452_eq0_uid351_fracYZero_uid15_fpDivTest_merged_bit_select_c <= x0_uid349_fracYZero_uid15_fpDivTest_b(25 downto 13);

    -- eq1_uid457_eq0_uid351_fracYZero_uid15_fpDivTest(LOGICAL,456)@43
    eq1_uid457_eq0_uid351_fracYZero_uid15_fpDivTest_q <= "1" WHEN x0_uid452_eq0_uid351_fracYZero_uid15_fpDivTest_merged_bit_select_c = y0_uid453_eq0_uid351_fracYZero_uid15_fpDivTest_merged_bit_select_c ELSE "0";

    -- eq0_uid454_eq0_uid351_fracYZero_uid15_fpDivTest(LOGICAL,453)@43
    eq0_uid454_eq0_uid351_fracYZero_uid15_fpDivTest_q <= "1" WHEN x0_uid452_eq0_uid351_fracYZero_uid15_fpDivTest_merged_bit_select_b = y0_uid453_eq0_uid351_fracYZero_uid15_fpDivTest_merged_bit_select_b ELSE "0";

    -- andEq_uid458_eq0_uid351_fracYZero_uid15_fpDivTest(LOGICAL,457)@43 + 1
    andEq_uid458_eq0_uid351_fracYZero_uid15_fpDivTest_qi <= eq0_uid454_eq0_uid351_fracYZero_uid15_fpDivTest_q and eq1_uid457_eq0_uid351_fracYZero_uid15_fpDivTest_q;
    andEq_uid458_eq0_uid351_fracYZero_uid15_fpDivTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => andEq_uid458_eq0_uid351_fracYZero_uid15_fpDivTest_qi, xout => andEq_uid458_eq0_uid351_fracYZero_uid15_fpDivTest_q, clk => clk, aclr => areset, ena => '1' );

    -- andEq_uid355_fracYZero_uid15_fpDivTest(LOGICAL,354)@44 + 1
    andEq_uid355_fracYZero_uid15_fpDivTest_qi <= andEq_uid458_eq0_uid351_fracYZero_uid15_fpDivTest_q and andEq_uid465_eq1_uid354_fracYZero_uid15_fpDivTest_q;
    andEq_uid355_fracYZero_uid15_fpDivTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => andEq_uid355_fracYZero_uid15_fpDivTest_qi, xout => andEq_uid355_fracYZero_uid15_fpDivTest_q, clk => clk, aclr => areset, ena => '1' );

    -- divValPreNormYPow2Exc_uid63_fpDivTest(MUX,62)@45
    divValPreNormYPow2Exc_uid63_fpDivTest_s <= andEq_uid355_fracYZero_uid15_fpDivTest_q;
    divValPreNormYPow2Exc_uid63_fpDivTest_combproc: PROCESS (divValPreNormYPow2Exc_uid63_fpDivTest_s, redist52_os_uid244_divValPreNorm_uid59_fpDivTest_b_1_q, oFracXZ4_uid61_fpDivTest_q)
    BEGIN
        CASE (divValPreNormYPow2Exc_uid63_fpDivTest_s) IS
            WHEN "0" => divValPreNormYPow2Exc_uid63_fpDivTest_q <= redist52_os_uid244_divValPreNorm_uid59_fpDivTest_b_1_q;
            WHEN "1" => divValPreNormYPow2Exc_uid63_fpDivTest_q <= oFracXZ4_uid61_fpDivTest_q;
            WHEN OTHERS => divValPreNormYPow2Exc_uid63_fpDivTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- norm_uid64_fpDivTest(BITSELECT,63)@45
    norm_uid64_fpDivTest_b <= STD_LOGIC_VECTOR(divValPreNormYPow2Exc_uid63_fpDivTest_q(56 downto 56));

    -- redist77_norm_uid64_fpDivTest_b_1(DELAY,587)
    redist77_norm_uid64_fpDivTest_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist77_norm_uid64_fpDivTest_b_1_q <= (others => '0');
            ELSE
                redist77_norm_uid64_fpDivTest_b_1_q <= STD_LOGIC_VECTOR(norm_uid64_fpDivTest_b);
            END IF;
        END IF;
    END PROCESS;

    -- zeroPaddingInAddition_uid74_fpDivTest(CONSTANT,73)
    zeroPaddingInAddition_uid74_fpDivTest_q <= "00000000000000000000000000000000000000000000000000000";

    -- expFracPostRnd_uid75_fpDivTest(BITJOIN,74)@46
    expFracPostRnd_uid75_fpDivTest_q <= redist77_norm_uid64_fpDivTest_b_1_q & zeroPaddingInAddition_uid74_fpDivTest_q & VCC_q;

    -- cstBiasM1_uid6_fpDivTest(CONSTANT,5)
    cstBiasM1_uid6_fpDivTest_q <= "01111111110";

    -- expXmY_uid47_fpDivTest(SUB,46)@44 + 1
    expXmY_uid47_fpDivTest_a <= STD_LOGIC_VECTOR("0" & redist102_expX_uid9_fpDivTest_b_44_outputreg0_q);
    expXmY_uid47_fpDivTest_b <= STD_LOGIC_VECTOR("0" & redist96_expY_uid12_fpDivTest_b_44_outputreg0_q);
    expXmY_uid47_fpDivTest_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                expXmY_uid47_fpDivTest_o <= (others => '0');
            ELSE
                expXmY_uid47_fpDivTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expXmY_uid47_fpDivTest_a) - UNSIGNED(expXmY_uid47_fpDivTest_b));
            END IF;
        END IF;
    END PROCESS;
    expXmY_uid47_fpDivTest_q <= expXmY_uid47_fpDivTest_o(11 downto 0);

    -- expR_uid48_fpDivTest(ADD,47)@45 + 1
    expR_uid48_fpDivTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((13 downto 12 => expXmY_uid47_fpDivTest_q(11)) & expXmY_uid47_fpDivTest_q));
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
    expR_uid48_fpDivTest_q <= expR_uid48_fpDivTest_o(12 downto 0);

    -- divValPreNormHigh_uid65_fpDivTest(BITSELECT,64)@45
    divValPreNormHigh_uid65_fpDivTest_in <= divValPreNormYPow2Exc_uid63_fpDivTest_q(55 downto 0);
    divValPreNormHigh_uid65_fpDivTest_b <= divValPreNormHigh_uid65_fpDivTest_in(55 downto 2);

    -- divValPreNormLow_uid66_fpDivTest(BITSELECT,65)@45
    divValPreNormLow_uid66_fpDivTest_in <= divValPreNormYPow2Exc_uid63_fpDivTest_q(54 downto 0);
    divValPreNormLow_uid66_fpDivTest_b <= divValPreNormLow_uid66_fpDivTest_in(54 downto 1);

    -- normFracRnd_uid67_fpDivTest(MUX,66)@45 + 1
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

    -- expFracRnd_uid68_fpDivTest(BITJOIN,67)@46
    expFracRnd_uid68_fpDivTest_q <= expR_uid48_fpDivTest_q & normFracRnd_uid67_fpDivTest_q;

    -- expFracPostRnd_uid76_fpDivTest(ADD,75)@46 + 1
    expFracPostRnd_uid76_fpDivTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((68 downto 67 => expFracRnd_uid68_fpDivTest_q(66)) & expFracRnd_uid68_fpDivTest_q));
    expFracPostRnd_uid76_fpDivTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("00000000000000" & expFracPostRnd_uid75_fpDivTest_q));
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
    expFracPostRnd_uid76_fpDivTest_q <= expFracPostRnd_uid76_fpDivTest_o(67 downto 0);

    -- fracPostRndF_uid79_fpDivTest(BITSELECT,78)@47
    fracPostRndF_uid79_fpDivTest_in <= expFracPostRnd_uid76_fpDivTest_q(53 downto 0);
    fracPostRndF_uid79_fpDivTest_b <= fracPostRndF_uid79_fpDivTest_in(53 downto 1);

    -- invYO_uid55_fpDivTest(BITSELECT,54)@35
    invYO_uid55_fpDivTest_in <= STD_LOGIC_VECTOR(s4_uid205_invPolyEval_q(61 downto 0));
    invYO_uid55_fpDivTest_b <= STD_LOGIC_VECTOR(invYO_uid55_fpDivTest_in(61 downto 61));

    -- redist81_invYO_uid55_fpDivTest_b_12(DELAY,591)
    redist81_invYO_uid55_fpDivTest_b_12 : dspba_delay
    GENERIC MAP ( width => 1, depth => 12, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => invYO_uid55_fpDivTest_b, xout => redist81_invYO_uid55_fpDivTest_b_12_q, clk => clk, aclr => areset, ena => '1' );

    -- fracPostRndF_uid80_fpDivTest(MUX,79)@47
    fracPostRndF_uid80_fpDivTest_s <= redist81_invYO_uid55_fpDivTest_b_12_q;
    fracPostRndF_uid80_fpDivTest_combproc: PROCESS (fracPostRndF_uid80_fpDivTest_s, fracPostRndF_uid79_fpDivTest_b, fracXExt_uid77_fpDivTest_q)
    BEGIN
        CASE (fracPostRndF_uid80_fpDivTest_s) IS
            WHEN "0" => fracPostRndF_uid80_fpDivTest_q <= fracPostRndF_uid79_fpDivTest_b;
            WHEN "1" => fracPostRndF_uid80_fpDivTest_q <= fracXExt_uid77_fpDivTest_q;
            WHEN OTHERS => fracPostRndF_uid80_fpDivTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist76_fracPostRndF_uid80_fpDivTest_q_13_inputreg1(DELAY,652)
    redist76_fracPostRndF_uid80_fpDivTest_q_13_inputreg1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist76_fracPostRndF_uid80_fpDivTest_q_13_inputreg1_q <= (others => '0');
            ELSE
                redist76_fracPostRndF_uid80_fpDivTest_q_13_inputreg1_q <= STD_LOGIC_VECTOR(fracPostRndF_uid80_fpDivTest_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist76_fracPostRndF_uid80_fpDivTest_q_13_inputreg0(DELAY,654)
    redist76_fracPostRndF_uid80_fpDivTest_q_13_inputreg0_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist76_fracPostRndF_uid80_fpDivTest_q_13_inputreg0_q <= (others => '0');
            ELSE
                redist76_fracPostRndF_uid80_fpDivTest_q_13_inputreg0_q <= STD_LOGIC_VECTOR(redist76_fracPostRndF_uid80_fpDivTest_q_13_inputreg1_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist76_fracPostRndF_uid80_fpDivTest_q_13_wraddr(REG,657)
    redist76_fracPostRndF_uid80_fpDivTest_q_13_wraddr_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist76_fracPostRndF_uid80_fpDivTest_q_13_wraddr_q <= "1000";
            ELSE
                redist76_fracPostRndF_uid80_fpDivTest_q_13_wraddr_q <= STD_LOGIC_VECTOR(redist76_fracPostRndF_uid80_fpDivTest_q_13_rdcnt_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist76_fracPostRndF_uid80_fpDivTest_q_13_mem(DUALMEM,655)
    redist76_fracPostRndF_uid80_fpDivTest_q_13_mem_ia <= STD_LOGIC_VECTOR(redist76_fracPostRndF_uid80_fpDivTest_q_13_inputreg0_q);
    redist76_fracPostRndF_uid80_fpDivTest_q_13_mem_aa <= redist76_fracPostRndF_uid80_fpDivTest_q_13_wraddr_q;
    redist76_fracPostRndF_uid80_fpDivTest_q_13_mem_ab <= redist76_fracPostRndF_uid80_fpDivTest_q_13_rdcnt_q;
    redist76_fracPostRndF_uid80_fpDivTest_q_13_mem_reset0 <= areset;
    redist76_fracPostRndF_uid80_fpDivTest_q_13_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 53,
        widthad_a => 4,
        numwords_a => 9,
        width_b => 53,
        widthad_b => 4,
        numwords_b => 9,
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
        clocken1 => redist76_fracPostRndF_uid80_fpDivTest_q_13_enaAnd_q(0),
        clocken0 => '1',
        clock0 => clk,
        sclr => redist76_fracPostRndF_uid80_fpDivTest_q_13_mem_reset0,
        clock1 => clk,
        address_a => redist76_fracPostRndF_uid80_fpDivTest_q_13_mem_aa,
        data_a => redist76_fracPostRndF_uid80_fpDivTest_q_13_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist76_fracPostRndF_uid80_fpDivTest_q_13_mem_ab,
        q_b => redist76_fracPostRndF_uid80_fpDivTest_q_13_mem_iq
    );
    redist76_fracPostRndF_uid80_fpDivTest_q_13_mem_q <= redist76_fracPostRndF_uid80_fpDivTest_q_13_mem_iq(52 downto 0);

    -- redist76_fracPostRndF_uid80_fpDivTest_q_13_outputreg0(DELAY,653)
    redist76_fracPostRndF_uid80_fpDivTest_q_13_outputreg0_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist76_fracPostRndF_uid80_fpDivTest_q_13_outputreg0_q <= (others => '0');
            ELSE
                redist76_fracPostRndF_uid80_fpDivTest_q_13_outputreg0_q <= STD_LOGIC_VECTOR(redist76_fracPostRndF_uid80_fpDivTest_q_13_mem_q);
            END IF;
        END IF;
    END PROCESS;

    -- betweenFPwF_uid102_fpDivTest(BITSELECT,101)@60
    betweenFPwF_uid102_fpDivTest_in <= STD_LOGIC_VECTOR(redist76_fracPostRndF_uid80_fpDivTest_q_13_outputreg0_q(0 downto 0));
    betweenFPwF_uid102_fpDivTest_b <= STD_LOGIC_VECTOR(betweenFPwF_uid102_fpDivTest_in(0 downto 0));

    -- redist71_qDivProdLTX_opB_uid100_fpDivTest_q_12_notEnable(LOGICAL,625)
    redist71_qDivProdLTX_opB_uid100_fpDivTest_q_12_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist71_qDivProdLTX_opB_uid100_fpDivTest_q_12_nor(LOGICAL,626)
    redist71_qDivProdLTX_opB_uid100_fpDivTest_q_12_nor_q <= not (redist71_qDivProdLTX_opB_uid100_fpDivTest_q_12_notEnable_q or redist71_qDivProdLTX_opB_uid100_fpDivTest_q_12_sticky_ena_q);

    -- redist71_qDivProdLTX_opB_uid100_fpDivTest_q_12_mem_last(CONSTANT,622)
    redist71_qDivProdLTX_opB_uid100_fpDivTest_q_12_mem_last_q <= "01000";

    -- redist71_qDivProdLTX_opB_uid100_fpDivTest_q_12_cmp(LOGICAL,623)
    redist71_qDivProdLTX_opB_uid100_fpDivTest_q_12_cmp_b <= STD_LOGIC_VECTOR("0" & redist71_qDivProdLTX_opB_uid100_fpDivTest_q_12_rdcnt_q);
    redist71_qDivProdLTX_opB_uid100_fpDivTest_q_12_cmp_q <= "1" WHEN redist71_qDivProdLTX_opB_uid100_fpDivTest_q_12_mem_last_q = redist71_qDivProdLTX_opB_uid100_fpDivTest_q_12_cmp_b ELSE "0";

    -- redist71_qDivProdLTX_opB_uid100_fpDivTest_q_12_cmpReg(REG,624)
    redist71_qDivProdLTX_opB_uid100_fpDivTest_q_12_cmpReg_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist71_qDivProdLTX_opB_uid100_fpDivTest_q_12_cmpReg_q <= "0";
            ELSE
                redist71_qDivProdLTX_opB_uid100_fpDivTest_q_12_cmpReg_q <= STD_LOGIC_VECTOR(redist71_qDivProdLTX_opB_uid100_fpDivTest_q_12_cmp_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist71_qDivProdLTX_opB_uid100_fpDivTest_q_12_sticky_ena(REG,627)
    redist71_qDivProdLTX_opB_uid100_fpDivTest_q_12_sticky_ena_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist71_qDivProdLTX_opB_uid100_fpDivTest_q_12_sticky_ena_q <= "0";
            ELSE
                IF (redist71_qDivProdLTX_opB_uid100_fpDivTest_q_12_nor_q = "1") THEN
                    redist71_qDivProdLTX_opB_uid100_fpDivTest_q_12_sticky_ena_q <= STD_LOGIC_VECTOR(redist71_qDivProdLTX_opB_uid100_fpDivTest_q_12_cmpReg_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist71_qDivProdLTX_opB_uid100_fpDivTest_q_12_enaAnd(LOGICAL,628)
    redist71_qDivProdLTX_opB_uid100_fpDivTest_q_12_enaAnd_q <= redist71_qDivProdLTX_opB_uid100_fpDivTest_q_12_sticky_ena_q and VCC_q;

    -- redist71_qDivProdLTX_opB_uid100_fpDivTest_q_12_rdcnt(COUNTER,620)
    -- low=0, high=9, step=1, init=0
    redist71_qDivProdLTX_opB_uid100_fpDivTest_q_12_rdcnt_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist71_qDivProdLTX_opB_uid100_fpDivTest_q_12_rdcnt_i <= TO_UNSIGNED(0, 4);
                redist71_qDivProdLTX_opB_uid100_fpDivTest_q_12_rdcnt_eq <= '0';
            ELSE
                IF (redist71_qDivProdLTX_opB_uid100_fpDivTest_q_12_rdcnt_i = TO_UNSIGNED(8, 4)) THEN
                    redist71_qDivProdLTX_opB_uid100_fpDivTest_q_12_rdcnt_eq <= '1';
                ELSE
                    redist71_qDivProdLTX_opB_uid100_fpDivTest_q_12_rdcnt_eq <= '0';
                END IF;
                IF (redist71_qDivProdLTX_opB_uid100_fpDivTest_q_12_rdcnt_eq = '1') THEN
                    redist71_qDivProdLTX_opB_uid100_fpDivTest_q_12_rdcnt_i <= redist71_qDivProdLTX_opB_uid100_fpDivTest_q_12_rdcnt_i + 7;
                ELSE
                    redist71_qDivProdLTX_opB_uid100_fpDivTest_q_12_rdcnt_i <= redist71_qDivProdLTX_opB_uid100_fpDivTest_q_12_rdcnt_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    redist71_qDivProdLTX_opB_uid100_fpDivTest_q_12_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist71_qDivProdLTX_opB_uid100_fpDivTest_q_12_rdcnt_i, 4)));

    -- qDivProdLTX_opB_uid100_fpDivTest(BITJOIN,99)@47
    qDivProdLTX_opB_uid100_fpDivTest_q <= redist103_expX_uid9_fpDivTest_b_47_q & redist101_fracX_uid10_fpDivTest_b_47_q;

    -- redist71_qDivProdLTX_opB_uid100_fpDivTest_q_12_inputreg0(DELAY,618)
    redist71_qDivProdLTX_opB_uid100_fpDivTest_q_12_inputreg0_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist71_qDivProdLTX_opB_uid100_fpDivTest_q_12_inputreg0_q <= (others => '0');
            ELSE
                redist71_qDivProdLTX_opB_uid100_fpDivTest_q_12_inputreg0_q <= STD_LOGIC_VECTOR(qDivProdLTX_opB_uid100_fpDivTest_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist71_qDivProdLTX_opB_uid100_fpDivTest_q_12_wraddr(REG,621)
    redist71_qDivProdLTX_opB_uid100_fpDivTest_q_12_wraddr_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist71_qDivProdLTX_opB_uid100_fpDivTest_q_12_wraddr_q <= "1001";
            ELSE
                redist71_qDivProdLTX_opB_uid100_fpDivTest_q_12_wraddr_q <= STD_LOGIC_VECTOR(redist71_qDivProdLTX_opB_uid100_fpDivTest_q_12_rdcnt_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist71_qDivProdLTX_opB_uid100_fpDivTest_q_12_mem(DUALMEM,619)
    redist71_qDivProdLTX_opB_uid100_fpDivTest_q_12_mem_ia <= STD_LOGIC_VECTOR(redist71_qDivProdLTX_opB_uid100_fpDivTest_q_12_inputreg0_q);
    redist71_qDivProdLTX_opB_uid100_fpDivTest_q_12_mem_aa <= redist71_qDivProdLTX_opB_uid100_fpDivTest_q_12_wraddr_q;
    redist71_qDivProdLTX_opB_uid100_fpDivTest_q_12_mem_ab <= redist71_qDivProdLTX_opB_uid100_fpDivTest_q_12_rdcnt_q;
    redist71_qDivProdLTX_opB_uid100_fpDivTest_q_12_mem_reset0 <= areset;
    redist71_qDivProdLTX_opB_uid100_fpDivTest_q_12_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 63,
        widthad_a => 4,
        numwords_a => 10,
        width_b => 63,
        widthad_b => 4,
        numwords_b => 10,
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
        clocken1 => redist71_qDivProdLTX_opB_uid100_fpDivTest_q_12_enaAnd_q(0),
        clocken0 => '1',
        clock0 => clk,
        sclr => redist71_qDivProdLTX_opB_uid100_fpDivTest_q_12_mem_reset0,
        clock1 => clk,
        address_a => redist71_qDivProdLTX_opB_uid100_fpDivTest_q_12_mem_aa,
        data_a => redist71_qDivProdLTX_opB_uid100_fpDivTest_q_12_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist71_qDivProdLTX_opB_uid100_fpDivTest_q_12_mem_ab,
        q_b => redist71_qDivProdLTX_opB_uid100_fpDivTest_q_12_mem_iq
    );
    redist71_qDivProdLTX_opB_uid100_fpDivTest_q_12_mem_q <= redist71_qDivProdLTX_opB_uid100_fpDivTest_q_12_mem_iq(62 downto 0);

    -- lOAdded_uid84_fpDivTest(BITJOIN,83)@47
    lOAdded_uid84_fpDivTest_q <= VCC_q & fracPostRndF_uid80_fpDivTest_q;

    -- qDivProd_uid89_fpDivTest_bs1_merged_bit_select(BITSELECT,500)@47
    qDivProd_uid89_fpDivTest_bs1_merged_bit_select_b <= lOAdded_uid84_fpDivTest_q(53 downto 27);
    qDivProd_uid89_fpDivTest_bs1_merged_bit_select_c <= lOAdded_uid84_fpDivTest_q(26 downto 0);

    -- redist95_fracY_uid13_fpDivTest_b_47(DELAY,605)
    redist95_fracY_uid13_fpDivTest_b_47_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist95_fracY_uid13_fpDivTest_b_47_q <= (others => '0');
            ELSE
                redist95_fracY_uid13_fpDivTest_b_47_q <= STD_LOGIC_VECTOR(redist94_fracY_uid13_fpDivTest_b_46_q);
            END IF;
        END IF;
    END PROCESS;

    -- lOAdded_uid87_fpDivTest(BITJOIN,86)@47
    lOAdded_uid87_fpDivTest_q <= VCC_q & redist95_fracY_uid13_fpDivTest_b_47_q;

    -- qDivProd_uid89_fpDivTest_bs2_merged_bit_select(BITSELECT,501)@47
    qDivProd_uid89_fpDivTest_bs2_merged_bit_select_b <= lOAdded_uid87_fpDivTest_q(52 downto 27);
    qDivProd_uid89_fpDivTest_bs2_merged_bit_select_c <= lOAdded_uid87_fpDivTest_q(26 downto 0);

    -- redist6_qDivProd_uid89_fpDivTest_bs1_merged_bit_select_c_1(DELAY,516)
    redist6_qDivProd_uid89_fpDivTest_bs1_merged_bit_select_c_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist6_qDivProd_uid89_fpDivTest_bs1_merged_bit_select_c_1_q <= (others => '0');
            ELSE
                redist6_qDivProd_uid89_fpDivTest_bs1_merged_bit_select_c_1_q <= STD_LOGIC_VECTOR(qDivProd_uid89_fpDivTest_bs1_merged_bit_select_c);
            END IF;
        END IF;
    END PROCESS;

    -- redist3_qDivProd_uid89_fpDivTest_bs2_merged_bit_select_b_1(DELAY,513)
    redist3_qDivProd_uid89_fpDivTest_bs2_merged_bit_select_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist3_qDivProd_uid89_fpDivTest_bs2_merged_bit_select_b_1_q <= (others => '0');
            ELSE
                redist3_qDivProd_uid89_fpDivTest_bs2_merged_bit_select_b_1_q <= STD_LOGIC_VECTOR(qDivProd_uid89_fpDivTest_bs2_merged_bit_select_b);
            END IF;
        END IF;
    END PROCESS;

    -- qDivProd_uid89_fpDivTest_ma3_cma(CHAINMULTADD,476)@47 + 5
    -- in e@48
    -- in g@48
    -- out q@54
    qDivProd_uid89_fpDivTest_ma3_cma_reset <= areset;
    qDivProd_uid89_fpDivTest_ma3_cma_ena0 <= '1';
    qDivProd_uid89_fpDivTest_ma3_cma_ena1 <= qDivProd_uid89_fpDivTest_ma3_cma_ena0;
    qDivProd_uid89_fpDivTest_ma3_cma_ena2 <= qDivProd_uid89_fpDivTest_ma3_cma_ena0;
    qDivProd_uid89_fpDivTest_ma3_cma_chainmultadd_hyper: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (false) THEN
            ELSE
                qDivProd_uid89_fpDivTest_ma3_cma_ah(0) <= RESIZE(UNSIGNED(redist3_qDivProd_uid89_fpDivTest_bs2_merged_bit_select_b_1_q),27);
                qDivProd_uid89_fpDivTest_ma3_cma_ah(1) <= RESIZE(UNSIGNED(qDivProd_uid89_fpDivTest_bs2_merged_bit_select_c),27);
                qDivProd_uid89_fpDivTest_ma3_cma_ch(0) <= RESIZE(UNSIGNED(redist6_qDivProd_uid89_fpDivTest_bs1_merged_bit_select_c_1_q),27);
                qDivProd_uid89_fpDivTest_ma3_cma_ch(1) <= RESIZE(UNSIGNED(qDivProd_uid89_fpDivTest_bs1_merged_bit_select_b),27);
            END IF;
        END IF;
    END PROCESS;

    qDivProd_uid89_fpDivTest_ma3_cma_a0 <= STD_LOGIC_VECTOR(qDivProd_uid89_fpDivTest_ma3_cma_ah(0));
    qDivProd_uid89_fpDivTest_ma3_cma_c0 <= STD_LOGIC_VECTOR(qDivProd_uid89_fpDivTest_ma3_cma_ch(0));
    qDivProd_uid89_fpDivTest_ma3_cma_a1 <= STD_LOGIC_VECTOR(qDivProd_uid89_fpDivTest_ma3_cma_ah(1));
    qDivProd_uid89_fpDivTest_ma3_cma_c1 <= STD_LOGIC_VECTOR(qDivProd_uid89_fpDivTest_ma3_cma_ch(1));
    qDivProd_uid89_fpDivTest_ma3_cma_DSP1 : fourteennm_mac
    GENERIC MAP (
        operation_mode => "m27x27",
        clear_type => "sclr",
        use_chainadder => "false",
        ay_scan_in_clock => "0",
        ay_scan_in_width => 27,
        ax_clock => "0",
        ax_width => 27,
        signed_may => "false",
        signed_max => "false",
        input_pipeline_clock => "2",
        second_pipeline_clock => "2",
        output_clock => "1"
    )
    PORT MAP (
        clk(0) => clk,
        clk(1) => clk,
        clk(2) => clk,
        ena(0) => qDivProd_uid89_fpDivTest_ma3_cma_ena0,
        ena(1) => qDivProd_uid89_fpDivTest_ma3_cma_ena1,
        ena(2) => qDivProd_uid89_fpDivTest_ma3_cma_ena2,
        clr(0) => qDivProd_uid89_fpDivTest_ma3_cma_reset,
        clr(1) => qDivProd_uid89_fpDivTest_ma3_cma_reset,
        ay => qDivProd_uid89_fpDivTest_ma3_cma_a1,
        ax => qDivProd_uid89_fpDivTest_ma3_cma_c1,
        chainout => qDivProd_uid89_fpDivTest_ma3_cma_s1
    );
    qDivProd_uid89_fpDivTest_ma3_cma_DSP0 : fourteennm_mac
    GENERIC MAP (
        operation_mode => "m27x27",
        clear_type => "sclr",
        use_chainadder => "true",
        ay_scan_in_clock => "0",
        ay_scan_in_width => 27,
        ax_clock => "0",
        ax_width => 27,
        signed_may => "false",
        signed_max => "false",
        input_pipeline_clock => "2",
        second_pipeline_clock => "2",
        output_clock => "1",
        result_a_width => 55
    )
    PORT MAP (
        clk(0) => clk,
        clk(1) => clk,
        clk(2) => clk,
        ena(0) => qDivProd_uid89_fpDivTest_ma3_cma_ena0,
        ena(1) => qDivProd_uid89_fpDivTest_ma3_cma_ena1,
        ena(2) => qDivProd_uid89_fpDivTest_ma3_cma_ena2,
        clr(0) => qDivProd_uid89_fpDivTest_ma3_cma_reset,
        clr(1) => qDivProd_uid89_fpDivTest_ma3_cma_reset,
        ay => qDivProd_uid89_fpDivTest_ma3_cma_a0,
        ax => qDivProd_uid89_fpDivTest_ma3_cma_c0,
        chainin => qDivProd_uid89_fpDivTest_ma3_cma_s1,
        resulta => qDivProd_uid89_fpDivTest_ma3_cma_s0
    );
    qDivProd_uid89_fpDivTest_ma3_cma_delay : dspba_delay
    GENERIC MAP ( width => 55, depth => 1, reset_kind => "NONE", phase => 0, modulus => 1 )
    PORT MAP ( xin => qDivProd_uid89_fpDivTest_ma3_cma_s0, xout => qDivProd_uid89_fpDivTest_ma3_cma_qq, clk => clk, aclr => areset, ena => '1' );
    qDivProd_uid89_fpDivTest_ma3_cma_q <= STD_LOGIC_VECTOR(qDivProd_uid89_fpDivTest_ma3_cma_qq(54 downto 0));

    -- redist8_qDivProd_uid89_fpDivTest_ma3_cma_q_1(DELAY,518)
    redist8_qDivProd_uid89_fpDivTest_ma3_cma_q_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist8_qDivProd_uid89_fpDivTest_ma3_cma_q_1_q <= (others => '0');
            ELSE
                redist8_qDivProd_uid89_fpDivTest_ma3_cma_q_1_q <= STD_LOGIC_VECTOR(qDivProd_uid89_fpDivTest_ma3_cma_q);
            END IF;
        END IF;
    END PROCESS;

    -- qDivProd_uid89_fpDivTest_sums_align_1(BITSHIFT,427)@55
    qDivProd_uid89_fpDivTest_sums_align_1_qint <= redist8_qDivProd_uid89_fpDivTest_ma3_cma_q_1_q & "000000000000000000000000000";
    qDivProd_uid89_fpDivTest_sums_align_1_q <= qDivProd_uid89_fpDivTest_sums_align_1_qint(81 downto 0);

    -- qDivProd_uid89_fpDivTest_sums_result_add_0_0_BitSelect_for_b_tessel0_0_merged_bit_select(BITSELECT,505)@55
    qDivProd_uid89_fpDivTest_sums_result_add_0_0_BitSelect_for_b_tessel0_0_merged_bit_select_b <= STD_LOGIC_VECTOR(qDivProd_uid89_fpDivTest_sums_align_1_q(77 downto 0));
    qDivProd_uid89_fpDivTest_sums_result_add_0_0_BitSelect_for_b_tessel0_0_merged_bit_select_c <= STD_LOGIC_VECTOR(qDivProd_uid89_fpDivTest_sums_align_1_q(81 downto 78));

    -- redist5_qDivProd_uid89_fpDivTest_bs1_merged_bit_select_b_1(DELAY,515)
    redist5_qDivProd_uid89_fpDivTest_bs1_merged_bit_select_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist5_qDivProd_uid89_fpDivTest_bs1_merged_bit_select_b_1_q <= (others => '0');
            ELSE
                redist5_qDivProd_uid89_fpDivTest_bs1_merged_bit_select_b_1_q <= STD_LOGIC_VECTOR(qDivProd_uid89_fpDivTest_bs1_merged_bit_select_b);
            END IF;
        END IF;
    END PROCESS;

    -- qDivProd_uid89_fpDivTest_im0_cma(CHAINMULTADD,471)@48 + 5
    -- out q@54
    qDivProd_uid89_fpDivTest_im0_cma_reset <= areset;
    qDivProd_uid89_fpDivTest_im0_cma_ena0 <= '1';
    qDivProd_uid89_fpDivTest_im0_cma_ena1 <= qDivProd_uid89_fpDivTest_im0_cma_ena0;
    qDivProd_uid89_fpDivTest_im0_cma_ena2 <= qDivProd_uid89_fpDivTest_im0_cma_ena0;
    qDivProd_uid89_fpDivTest_im0_cma_chainmultadd_hyper: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (false) THEN
            ELSE
                qDivProd_uid89_fpDivTest_im0_cma_ah(0) <= RESIZE(UNSIGNED(redist5_qDivProd_uid89_fpDivTest_bs1_merged_bit_select_b_1_q),27);
                qDivProd_uid89_fpDivTest_im0_cma_ch(0) <= RESIZE(UNSIGNED(redist3_qDivProd_uid89_fpDivTest_bs2_merged_bit_select_b_1_q),26);
            END IF;
        END IF;
    END PROCESS;

    qDivProd_uid89_fpDivTest_im0_cma_a0 <= STD_LOGIC_VECTOR(qDivProd_uid89_fpDivTest_im0_cma_ah(0));
    qDivProd_uid89_fpDivTest_im0_cma_c0 <= STD_LOGIC_VECTOR(qDivProd_uid89_fpDivTest_im0_cma_ch(0));
    qDivProd_uid89_fpDivTest_im0_cma_DSP0 : fourteennm_mac
    GENERIC MAP (
        operation_mode => "m27x27",
        clear_type => "sclr",
        use_chainadder => "false",
        ay_scan_in_clock => "0",
        ay_scan_in_width => 27,
        ax_clock => "0",
        ax_width => 26,
        signed_may => "false",
        signed_max => "false",
        input_pipeline_clock => "2",
        second_pipeline_clock => "2",
        output_clock => "1",
        result_a_width => 53
    )
    PORT MAP (
        clk(0) => clk,
        clk(1) => clk,
        clk(2) => clk,
        ena(0) => qDivProd_uid89_fpDivTest_im0_cma_ena0,
        ena(1) => qDivProd_uid89_fpDivTest_im0_cma_ena1,
        ena(2) => qDivProd_uid89_fpDivTest_im0_cma_ena2,
        clr(0) => qDivProd_uid89_fpDivTest_im0_cma_reset,
        clr(1) => qDivProd_uid89_fpDivTest_im0_cma_reset,
        ay => qDivProd_uid89_fpDivTest_im0_cma_a0,
        ax => qDivProd_uid89_fpDivTest_im0_cma_c0,
        resulta => qDivProd_uid89_fpDivTest_im0_cma_s0
    );
    qDivProd_uid89_fpDivTest_im0_cma_delay : dspba_delay
    GENERIC MAP ( width => 53, depth => 1, reset_kind => "NONE", phase => 0, modulus => 1 )
    PORT MAP ( xin => qDivProd_uid89_fpDivTest_im0_cma_s0, xout => qDivProd_uid89_fpDivTest_im0_cma_qq, clk => clk, aclr => areset, ena => '1' );
    qDivProd_uid89_fpDivTest_im0_cma_q <= STD_LOGIC_VECTOR(qDivProd_uid89_fpDivTest_im0_cma_qq(52 downto 0));

    -- redist13_qDivProd_uid89_fpDivTest_im0_cma_q_1(DELAY,523)
    redist13_qDivProd_uid89_fpDivTest_im0_cma_q_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist13_qDivProd_uid89_fpDivTest_im0_cma_q_1_q <= (others => '0');
            ELSE
                redist13_qDivProd_uid89_fpDivTest_im0_cma_q_1_q <= STD_LOGIC_VECTOR(qDivProd_uid89_fpDivTest_im0_cma_q);
            END IF;
        END IF;
    END PROCESS;

    -- qDivProd_uid89_fpDivTest_sums_result_add_0_0_BitSelect_for_a_tessel0_1_merged_bit_select(BITSELECT,506)@55
    qDivProd_uid89_fpDivTest_sums_result_add_0_0_BitSelect_for_a_tessel0_1_merged_bit_select_b <= STD_LOGIC_VECTOR(redist13_qDivProd_uid89_fpDivTest_im0_cma_q_1_q(23 downto 0));
    qDivProd_uid89_fpDivTest_sums_result_add_0_0_BitSelect_for_a_tessel0_1_merged_bit_select_c <= STD_LOGIC_VECTOR(redist13_qDivProd_uid89_fpDivTest_im0_cma_q_1_q(52 downto 24));

    -- redist4_qDivProd_uid89_fpDivTest_bs2_merged_bit_select_c_1(DELAY,514)
    redist4_qDivProd_uid89_fpDivTest_bs2_merged_bit_select_c_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist4_qDivProd_uid89_fpDivTest_bs2_merged_bit_select_c_1_q <= (others => '0');
            ELSE
                redist4_qDivProd_uid89_fpDivTest_bs2_merged_bit_select_c_1_q <= STD_LOGIC_VECTOR(qDivProd_uid89_fpDivTest_bs2_merged_bit_select_c);
            END IF;
        END IF;
    END PROCESS;

    -- qDivProd_uid89_fpDivTest_im8_cma(CHAINMULTADD,472)@48 + 5
    -- out q@54
    qDivProd_uid89_fpDivTest_im8_cma_reset <= areset;
    qDivProd_uid89_fpDivTest_im8_cma_ena0 <= '1';
    qDivProd_uid89_fpDivTest_im8_cma_ena1 <= qDivProd_uid89_fpDivTest_im8_cma_ena0;
    qDivProd_uid89_fpDivTest_im8_cma_ena2 <= qDivProd_uid89_fpDivTest_im8_cma_ena0;
    qDivProd_uid89_fpDivTest_im8_cma_chainmultadd_hyper: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (false) THEN
            ELSE
                qDivProd_uid89_fpDivTest_im8_cma_ah(0) <= RESIZE(UNSIGNED(redist6_qDivProd_uid89_fpDivTest_bs1_merged_bit_select_c_1_q),27);
                qDivProd_uid89_fpDivTest_im8_cma_ch(0) <= RESIZE(UNSIGNED(redist4_qDivProd_uid89_fpDivTest_bs2_merged_bit_select_c_1_q),27);
            END IF;
        END IF;
    END PROCESS;

    qDivProd_uid89_fpDivTest_im8_cma_a0 <= STD_LOGIC_VECTOR(qDivProd_uid89_fpDivTest_im8_cma_ah(0));
    qDivProd_uid89_fpDivTest_im8_cma_c0 <= STD_LOGIC_VECTOR(qDivProd_uid89_fpDivTest_im8_cma_ch(0));
    qDivProd_uid89_fpDivTest_im8_cma_DSP0 : fourteennm_mac
    GENERIC MAP (
        operation_mode => "m27x27",
        clear_type => "sclr",
        use_chainadder => "false",
        ay_scan_in_clock => "0",
        ay_scan_in_width => 27,
        ax_clock => "0",
        ax_width => 27,
        signed_may => "false",
        signed_max => "false",
        input_pipeline_clock => "2",
        second_pipeline_clock => "2",
        output_clock => "1",
        result_a_width => 54
    )
    PORT MAP (
        clk(0) => clk,
        clk(1) => clk,
        clk(2) => clk,
        ena(0) => qDivProd_uid89_fpDivTest_im8_cma_ena0,
        ena(1) => qDivProd_uid89_fpDivTest_im8_cma_ena1,
        ena(2) => qDivProd_uid89_fpDivTest_im8_cma_ena2,
        clr(0) => qDivProd_uid89_fpDivTest_im8_cma_reset,
        clr(1) => qDivProd_uid89_fpDivTest_im8_cma_reset,
        ay => qDivProd_uid89_fpDivTest_im8_cma_a0,
        ax => qDivProd_uid89_fpDivTest_im8_cma_c0,
        resulta => qDivProd_uid89_fpDivTest_im8_cma_s0
    );
    qDivProd_uid89_fpDivTest_im8_cma_delay : dspba_delay
    GENERIC MAP ( width => 54, depth => 1, reset_kind => "NONE", phase => 0, modulus => 1 )
    PORT MAP ( xin => qDivProd_uid89_fpDivTest_im8_cma_s0, xout => qDivProd_uid89_fpDivTest_im8_cma_qq, clk => clk, aclr => areset, ena => '1' );
    qDivProd_uid89_fpDivTest_im8_cma_q <= STD_LOGIC_VECTOR(qDivProd_uid89_fpDivTest_im8_cma_qq(53 downto 0));

    -- redist12_qDivProd_uid89_fpDivTest_im8_cma_q_1(DELAY,522)
    redist12_qDivProd_uid89_fpDivTest_im8_cma_q_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist12_qDivProd_uid89_fpDivTest_im8_cma_q_1_q <= (others => '0');
            ELSE
                redist12_qDivProd_uid89_fpDivTest_im8_cma_q_1_q <= STD_LOGIC_VECTOR(qDivProd_uid89_fpDivTest_im8_cma_q);
            END IF;
        END IF;
    END PROCESS;

    -- qDivProd_uid89_fpDivTest_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_b(BITJOIN,488)@55
    qDivProd_uid89_fpDivTest_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_b_q <= qDivProd_uid89_fpDivTest_sums_result_add_0_0_BitSelect_for_a_tessel0_1_merged_bit_select_b & redist12_qDivProd_uid89_fpDivTest_im8_cma_q_1_q;

    -- qDivProd_uid89_fpDivTest_sums_result_add_0_0_p1_of_2(ADD,483)@55 + 1
    qDivProd_uid89_fpDivTest_sums_result_add_0_0_p1_of_2_a <= STD_LOGIC_VECTOR("0" & qDivProd_uid89_fpDivTest_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_b_q);
    qDivProd_uid89_fpDivTest_sums_result_add_0_0_p1_of_2_b <= STD_LOGIC_VECTOR("0" & qDivProd_uid89_fpDivTest_sums_result_add_0_0_BitSelect_for_b_tessel0_0_merged_bit_select_b);
    qDivProd_uid89_fpDivTest_sums_result_add_0_0_p1_of_2_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                qDivProd_uid89_fpDivTest_sums_result_add_0_0_p1_of_2_o <= (others => '0');
            ELSE
                qDivProd_uid89_fpDivTest_sums_result_add_0_0_p1_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(qDivProd_uid89_fpDivTest_sums_result_add_0_0_p1_of_2_a) + UNSIGNED(qDivProd_uid89_fpDivTest_sums_result_add_0_0_p1_of_2_b));
            END IF;
        END IF;
    END PROCESS;
    qDivProd_uid89_fpDivTest_sums_result_add_0_0_p1_of_2_c(0) <= qDivProd_uid89_fpDivTest_sums_result_add_0_0_p1_of_2_o(78);
    qDivProd_uid89_fpDivTest_sums_result_add_0_0_p1_of_2_q <= qDivProd_uid89_fpDivTest_sums_result_add_0_0_p1_of_2_o(77 downto 0);

    -- qDivProd_uid89_fpDivTest_sums_result_add_0_0_UpperBits_for_b(CONSTANT,480)
    qDivProd_uid89_fpDivTest_sums_result_add_0_0_UpperBits_for_b_q <= "00000000000000000000000000";

    -- redist2_qDivProd_uid89_fpDivTest_sums_result_add_0_0_BitSelect_for_b_tessel0_0_merged_bit_select_c_1(DELAY,512)
    redist2_qDivProd_uid89_fpDivTest_sums_result_add_0_0_BitSelect_for_b_tessel0_0_merged_bit_select_c_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist2_qDivProd_uid89_fpDivTest_sums_result_add_0_0_BitSelect_for_b_tessel0_0_merged_bit_select_c_1_q <= (others => '0');
            ELSE
                redist2_qDivProd_uid89_fpDivTest_sums_result_add_0_0_BitSelect_for_b_tessel0_0_merged_bit_select_c_1_q <= STD_LOGIC_VECTOR(qDivProd_uid89_fpDivTest_sums_result_add_0_0_BitSelect_for_b_tessel0_0_merged_bit_select_c);
            END IF;
        END IF;
    END PROCESS;

    -- qDivProd_uid89_fpDivTest_sums_result_add_0_0_BitSelect_for_b_BitJoin_for_c(BITJOIN,496)@56
    qDivProd_uid89_fpDivTest_sums_result_add_0_0_BitSelect_for_b_BitJoin_for_c_q <= qDivProd_uid89_fpDivTest_sums_result_add_0_0_UpperBits_for_b_q & redist2_qDivProd_uid89_fpDivTest_sums_result_add_0_0_BitSelect_for_b_tessel0_0_merged_bit_select_c_1_q;

    -- redist1_qDivProd_uid89_fpDivTest_sums_result_add_0_0_BitSelect_for_a_tessel0_1_merged_bit_select_c_1(DELAY,511)
    redist1_qDivProd_uid89_fpDivTest_sums_result_add_0_0_BitSelect_for_a_tessel0_1_merged_bit_select_c_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist1_qDivProd_uid89_fpDivTest_sums_result_add_0_0_BitSelect_for_a_tessel0_1_merged_bit_select_c_1_q <= (others => '0');
            ELSE
                redist1_qDivProd_uid89_fpDivTest_sums_result_add_0_0_BitSelect_for_a_tessel0_1_merged_bit_select_c_1_q <= STD_LOGIC_VECTOR(qDivProd_uid89_fpDivTest_sums_result_add_0_0_BitSelect_for_a_tessel0_1_merged_bit_select_c);
            END IF;
        END IF;
    END PROCESS;

    -- qDivProd_uid89_fpDivTest_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_c(BITJOIN,491)@56
    qDivProd_uid89_fpDivTest_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_c_q <= GND_q & redist1_qDivProd_uid89_fpDivTest_sums_result_add_0_0_BitSelect_for_a_tessel0_1_merged_bit_select_c_1_q;

    -- qDivProd_uid89_fpDivTest_sums_result_add_0_0_p2_of_2(ADD,484)@56 + 1
    qDivProd_uid89_fpDivTest_sums_result_add_0_0_p2_of_2_cin <= qDivProd_uid89_fpDivTest_sums_result_add_0_0_p1_of_2_c;
    qDivProd_uid89_fpDivTest_sums_result_add_0_0_p2_of_2_a <= STD_LOGIC_VECTOR("0" & qDivProd_uid89_fpDivTest_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_c_q) & '1';
    qDivProd_uid89_fpDivTest_sums_result_add_0_0_p2_of_2_b <= STD_LOGIC_VECTOR("0" & qDivProd_uid89_fpDivTest_sums_result_add_0_0_BitSelect_for_b_BitJoin_for_c_q) & qDivProd_uid89_fpDivTest_sums_result_add_0_0_p2_of_2_cin(0);
    qDivProd_uid89_fpDivTest_sums_result_add_0_0_p2_of_2_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                qDivProd_uid89_fpDivTest_sums_result_add_0_0_p2_of_2_o <= (others => '0');
            ELSE
                qDivProd_uid89_fpDivTest_sums_result_add_0_0_p2_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(qDivProd_uid89_fpDivTest_sums_result_add_0_0_p2_of_2_a) + UNSIGNED(qDivProd_uid89_fpDivTest_sums_result_add_0_0_p2_of_2_b));
            END IF;
        END IF;
    END PROCESS;
    qDivProd_uid89_fpDivTest_sums_result_add_0_0_p2_of_2_q <= qDivProd_uid89_fpDivTest_sums_result_add_0_0_p2_of_2_o(30 downto 1);

    -- redist7_qDivProd_uid89_fpDivTest_sums_result_add_0_0_p1_of_2_q_1(DELAY,517)
    redist7_qDivProd_uid89_fpDivTest_sums_result_add_0_0_p1_of_2_q_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist7_qDivProd_uid89_fpDivTest_sums_result_add_0_0_p1_of_2_q_1_q <= (others => '0');
            ELSE
                redist7_qDivProd_uid89_fpDivTest_sums_result_add_0_0_p1_of_2_q_1_q <= STD_LOGIC_VECTOR(qDivProd_uid89_fpDivTest_sums_result_add_0_0_p1_of_2_q);
            END IF;
        END IF;
    END PROCESS;

    -- qDivProd_uid89_fpDivTest_sums_result_add_0_0_BitJoin_for_q(BITJOIN,485)@57
    qDivProd_uid89_fpDivTest_sums_result_add_0_0_BitJoin_for_q_q <= qDivProd_uid89_fpDivTest_sums_result_add_0_0_p2_of_2_q & redist7_qDivProd_uid89_fpDivTest_sums_result_add_0_0_p1_of_2_q_1_q;

    -- qDivProdNorm_uid90_fpDivTest(BITSELECT,89)@57
    qDivProdNorm_uid90_fpDivTest_in <= STD_LOGIC_VECTOR(qDivProd_uid89_fpDivTest_sums_result_add_0_0_BitJoin_for_q_q(106 downto 0));
    qDivProdNorm_uid90_fpDivTest_b <= STD_LOGIC_VECTOR(qDivProdNorm_uid90_fpDivTest_in(106 downto 106));

    -- cstBias_uid7_fpDivTest(CONSTANT,6)
    cstBias_uid7_fpDivTest_q <= "01111111111";

    -- qDivProdExp_opBs_uid95_fpDivTest(SUB,94)@57 + 1
    qDivProdExp_opBs_uid95_fpDivTest_a <= STD_LOGIC_VECTOR("0" & cstBias_uid7_fpDivTest_q);
    qDivProdExp_opBs_uid95_fpDivTest_b <= STD_LOGIC_VECTOR("00000000000" & qDivProdNorm_uid90_fpDivTest_b);
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
    qDivProdExp_opBs_uid95_fpDivTest_q <= qDivProdExp_opBs_uid95_fpDivTest_o(11 downto 0);

    -- redist74_qDivProdExp_opA_uid94_fpDivTest_q_10_notEnable(LOGICAL,636)
    redist74_qDivProdExp_opA_uid94_fpDivTest_q_10_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist74_qDivProdExp_opA_uid94_fpDivTest_q_10_nor(LOGICAL,637)
    redist74_qDivProdExp_opA_uid94_fpDivTest_q_10_nor_q <= not (redist74_qDivProdExp_opA_uid94_fpDivTest_q_10_notEnable_q or redist74_qDivProdExp_opA_uid94_fpDivTest_q_10_sticky_ena_q);

    -- redist74_qDivProdExp_opA_uid94_fpDivTest_q_10_mem_last(CONSTANT,633)
    redist74_qDivProdExp_opA_uid94_fpDivTest_q_10_mem_last_q <= "0101";

    -- redist74_qDivProdExp_opA_uid94_fpDivTest_q_10_cmp(LOGICAL,634)
    redist74_qDivProdExp_opA_uid94_fpDivTest_q_10_cmp_b <= STD_LOGIC_VECTOR("0" & redist74_qDivProdExp_opA_uid94_fpDivTest_q_10_rdcnt_q);
    redist74_qDivProdExp_opA_uid94_fpDivTest_q_10_cmp_q <= "1" WHEN redist74_qDivProdExp_opA_uid94_fpDivTest_q_10_mem_last_q = redist74_qDivProdExp_opA_uid94_fpDivTest_q_10_cmp_b ELSE "0";

    -- redist74_qDivProdExp_opA_uid94_fpDivTest_q_10_cmpReg(REG,635)
    redist74_qDivProdExp_opA_uid94_fpDivTest_q_10_cmpReg_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist74_qDivProdExp_opA_uid94_fpDivTest_q_10_cmpReg_q <= "0";
            ELSE
                redist74_qDivProdExp_opA_uid94_fpDivTest_q_10_cmpReg_q <= STD_LOGIC_VECTOR(redist74_qDivProdExp_opA_uid94_fpDivTest_q_10_cmp_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist74_qDivProdExp_opA_uid94_fpDivTest_q_10_sticky_ena(REG,638)
    redist74_qDivProdExp_opA_uid94_fpDivTest_q_10_sticky_ena_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist74_qDivProdExp_opA_uid94_fpDivTest_q_10_sticky_ena_q <= "0";
            ELSE
                IF (redist74_qDivProdExp_opA_uid94_fpDivTest_q_10_nor_q = "1") THEN
                    redist74_qDivProdExp_opA_uid94_fpDivTest_q_10_sticky_ena_q <= STD_LOGIC_VECTOR(redist74_qDivProdExp_opA_uid94_fpDivTest_q_10_cmpReg_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist74_qDivProdExp_opA_uid94_fpDivTest_q_10_enaAnd(LOGICAL,639)
    redist74_qDivProdExp_opA_uid94_fpDivTest_q_10_enaAnd_q <= redist74_qDivProdExp_opA_uid94_fpDivTest_q_10_sticky_ena_q and VCC_q;

    -- redist74_qDivProdExp_opA_uid94_fpDivTest_q_10_rdcnt(COUNTER,631)
    -- low=0, high=6, step=1, init=0
    redist74_qDivProdExp_opA_uid94_fpDivTest_q_10_rdcnt_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist74_qDivProdExp_opA_uid94_fpDivTest_q_10_rdcnt_i <= TO_UNSIGNED(0, 3);
                redist74_qDivProdExp_opA_uid94_fpDivTest_q_10_rdcnt_eq <= '0';
            ELSE
                IF (redist74_qDivProdExp_opA_uid94_fpDivTest_q_10_rdcnt_i = TO_UNSIGNED(5, 3)) THEN
                    redist74_qDivProdExp_opA_uid94_fpDivTest_q_10_rdcnt_eq <= '1';
                ELSE
                    redist74_qDivProdExp_opA_uid94_fpDivTest_q_10_rdcnt_eq <= '0';
                END IF;
                IF (redist74_qDivProdExp_opA_uid94_fpDivTest_q_10_rdcnt_eq = '1') THEN
                    redist74_qDivProdExp_opA_uid94_fpDivTest_q_10_rdcnt_i <= redist74_qDivProdExp_opA_uid94_fpDivTest_q_10_rdcnt_i + 2;
                ELSE
                    redist74_qDivProdExp_opA_uid94_fpDivTest_q_10_rdcnt_i <= redist74_qDivProdExp_opA_uid94_fpDivTest_q_10_rdcnt_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    redist74_qDivProdExp_opA_uid94_fpDivTest_q_10_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist74_qDivProdExp_opA_uid94_fpDivTest_q_10_rdcnt_i, 3)));

    -- expPostRndFR_uid81_fpDivTest(BITSELECT,80)@47
    expPostRndFR_uid81_fpDivTest_in <= expFracPostRnd_uid76_fpDivTest_q(64 downto 0);
    expPostRndFR_uid81_fpDivTest_b <= expPostRndFR_uid81_fpDivTest_in(64 downto 54);

    -- expPostRndF_uid82_fpDivTest(MUX,81)@47 + 1
    expPostRndF_uid82_fpDivTest_s <= redist81_invYO_uid55_fpDivTest_b_12_q;
    expPostRndF_uid82_fpDivTest_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                expPostRndF_uid82_fpDivTest_q <= (others => '0');
            ELSE
                CASE (expPostRndF_uid82_fpDivTest_s) IS
                    WHEN "0" => expPostRndF_uid82_fpDivTest_q <= expPostRndFR_uid81_fpDivTest_b;
                    WHEN "1" => expPostRndF_uid82_fpDivTest_q <= redist103_expX_uid9_fpDivTest_b_47_q;
                    WHEN OTHERS => expPostRndF_uid82_fpDivTest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;

    -- redist98_expY_uid12_fpDivTest_b_48(DELAY,608)
    redist98_expY_uid12_fpDivTest_b_48_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist98_expY_uid12_fpDivTest_b_48_q <= (others => '0');
            ELSE
                redist98_expY_uid12_fpDivTest_b_48_q <= STD_LOGIC_VECTOR(redist97_expY_uid12_fpDivTest_b_47_q);
            END IF;
        END IF;
    END PROCESS;

    -- qDivProdExp_opA_uid94_fpDivTest(ADD,93)@48 + 1
    qDivProdExp_opA_uid94_fpDivTest_a <= STD_LOGIC_VECTOR("0" & redist98_expY_uid12_fpDivTest_b_48_q);
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
    qDivProdExp_opA_uid94_fpDivTest_q <= qDivProdExp_opA_uid94_fpDivTest_o(11 downto 0);

    -- redist74_qDivProdExp_opA_uid94_fpDivTest_q_10_wraddr(REG,632)
    redist74_qDivProdExp_opA_uid94_fpDivTest_q_10_wraddr_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist74_qDivProdExp_opA_uid94_fpDivTest_q_10_wraddr_q <= "110";
            ELSE
                redist74_qDivProdExp_opA_uid94_fpDivTest_q_10_wraddr_q <= STD_LOGIC_VECTOR(redist74_qDivProdExp_opA_uid94_fpDivTest_q_10_rdcnt_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist74_qDivProdExp_opA_uid94_fpDivTest_q_10_mem(DUALMEM,630)
    redist74_qDivProdExp_opA_uid94_fpDivTest_q_10_mem_ia <= STD_LOGIC_VECTOR(qDivProdExp_opA_uid94_fpDivTest_q);
    redist74_qDivProdExp_opA_uid94_fpDivTest_q_10_mem_aa <= redist74_qDivProdExp_opA_uid94_fpDivTest_q_10_wraddr_q;
    redist74_qDivProdExp_opA_uid94_fpDivTest_q_10_mem_ab <= redist74_qDivProdExp_opA_uid94_fpDivTest_q_10_rdcnt_q;
    redist74_qDivProdExp_opA_uid94_fpDivTest_q_10_mem_reset0 <= areset;
    redist74_qDivProdExp_opA_uid94_fpDivTest_q_10_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 12,
        widthad_a => 3,
        numwords_a => 7,
        width_b => 12,
        widthad_b => 3,
        numwords_b => 7,
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
        clocken1 => redist74_qDivProdExp_opA_uid94_fpDivTest_q_10_enaAnd_q(0),
        clocken0 => '1',
        clock0 => clk,
        sclr => redist74_qDivProdExp_opA_uid94_fpDivTest_q_10_mem_reset0,
        clock1 => clk,
        address_a => redist74_qDivProdExp_opA_uid94_fpDivTest_q_10_mem_aa,
        data_a => redist74_qDivProdExp_opA_uid94_fpDivTest_q_10_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist74_qDivProdExp_opA_uid94_fpDivTest_q_10_mem_ab,
        q_b => redist74_qDivProdExp_opA_uid94_fpDivTest_q_10_mem_iq
    );
    redist74_qDivProdExp_opA_uid94_fpDivTest_q_10_mem_q <= redist74_qDivProdExp_opA_uid94_fpDivTest_q_10_mem_iq(11 downto 0);

    -- redist74_qDivProdExp_opA_uid94_fpDivTest_q_10_outputreg0(DELAY,629)
    redist74_qDivProdExp_opA_uid94_fpDivTest_q_10_outputreg0_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist74_qDivProdExp_opA_uid94_fpDivTest_q_10_outputreg0_q <= (others => '0');
            ELSE
                redist74_qDivProdExp_opA_uid94_fpDivTest_q_10_outputreg0_q <= STD_LOGIC_VECTOR(redist74_qDivProdExp_opA_uid94_fpDivTest_q_10_mem_q);
            END IF;
        END IF;
    END PROCESS;

    -- qDivProdExp_uid96_fpDivTest(SUB,95)@58
    qDivProdExp_uid96_fpDivTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & redist74_qDivProdExp_opA_uid94_fpDivTest_q_10_outputreg0_q));
    qDivProdExp_uid96_fpDivTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 12 => qDivProdExp_opBs_uid95_fpDivTest_q(11)) & qDivProdExp_opBs_uid95_fpDivTest_q));
    qDivProdExp_uid96_fpDivTest_o <= STD_LOGIC_VECTOR(SIGNED(qDivProdExp_uid96_fpDivTest_a) - SIGNED(qDivProdExp_uid96_fpDivTest_b));
    qDivProdExp_uid96_fpDivTest_q <= qDivProdExp_uid96_fpDivTest_o(13 downto 0);

    -- qDivProdLTX_opA_uid98_fpDivTest(BITSELECT,97)@58
    qDivProdLTX_opA_uid98_fpDivTest_in <= qDivProdExp_uid96_fpDivTest_q(10 downto 0);
    qDivProdLTX_opA_uid98_fpDivTest_b <= qDivProdLTX_opA_uid98_fpDivTest_in(10 downto 0);

    -- redist72_qDivProdLTX_opA_uid98_fpDivTest_b_1(DELAY,582)
    redist72_qDivProdLTX_opA_uid98_fpDivTest_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist72_qDivProdLTX_opA_uid98_fpDivTest_b_1_q <= (others => '0');
            ELSE
                redist72_qDivProdLTX_opA_uid98_fpDivTest_b_1_q <= STD_LOGIC_VECTOR(qDivProdLTX_opA_uid98_fpDivTest_b);
            END IF;
        END IF;
    END PROCESS;

    -- qDivProdFracHigh_uid91_fpDivTest(BITSELECT,90)@57
    qDivProdFracHigh_uid91_fpDivTest_in <= qDivProd_uid89_fpDivTest_sums_result_add_0_0_BitJoin_for_q_q(105 downto 0);
    qDivProdFracHigh_uid91_fpDivTest_b <= qDivProdFracHigh_uid91_fpDivTest_in(105 downto 53);

    -- qDivProdFracLow_uid92_fpDivTest(BITSELECT,91)@57
    qDivProdFracLow_uid92_fpDivTest_in <= qDivProd_uid89_fpDivTest_sums_result_add_0_0_BitJoin_for_q_q(104 downto 0);
    qDivProdFracLow_uid92_fpDivTest_b <= qDivProdFracLow_uid92_fpDivTest_in(104 downto 52);

    -- qDivProdFrac_uid93_fpDivTest(MUX,92)@57
    qDivProdFrac_uid93_fpDivTest_s <= qDivProdNorm_uid90_fpDivTest_b;
    qDivProdFrac_uid93_fpDivTest_combproc: PROCESS (qDivProdFrac_uid93_fpDivTest_s, qDivProdFracLow_uid92_fpDivTest_b, qDivProdFracHigh_uid91_fpDivTest_b)
    BEGIN
        CASE (qDivProdFrac_uid93_fpDivTest_s) IS
            WHEN "0" => qDivProdFrac_uid93_fpDivTest_q <= qDivProdFracLow_uid92_fpDivTest_b;
            WHEN "1" => qDivProdFrac_uid93_fpDivTest_q <= qDivProdFracHigh_uid91_fpDivTest_b;
            WHEN OTHERS => qDivProdFrac_uid93_fpDivTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- qDivProdFracWF_uid97_fpDivTest(BITSELECT,96)@57
    qDivProdFracWF_uid97_fpDivTest_b <= qDivProdFrac_uid93_fpDivTest_q(52 downto 1);

    -- redist73_qDivProdFracWF_uid97_fpDivTest_b_2(DELAY,583)
    redist73_qDivProdFracWF_uid97_fpDivTest_b_2_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist73_qDivProdFracWF_uid97_fpDivTest_b_2_delay_0 <= (others => '0');
                redist73_qDivProdFracWF_uid97_fpDivTest_b_2_q <= (others => '0');
            ELSE
                redist73_qDivProdFracWF_uid97_fpDivTest_b_2_delay_0 <= STD_LOGIC_VECTOR(qDivProdFracWF_uid97_fpDivTest_b);
                redist73_qDivProdFracWF_uid97_fpDivTest_b_2_q <= redist73_qDivProdFracWF_uid97_fpDivTest_b_2_delay_0;
            END IF;
        END IF;
    END PROCESS;

    -- qDivProdLTX_opA_uid99_fpDivTest(BITJOIN,98)@59
    qDivProdLTX_opA_uid99_fpDivTest_q <= redist72_qDivProdLTX_opA_uid98_fpDivTest_b_1_q & redist73_qDivProdFracWF_uid97_fpDivTest_b_2_q;

    -- qDividerProdLTX_uid101_fpDivTest(COMPARE,100)@59 + 1
    qDividerProdLTX_uid101_fpDivTest_a <= STD_LOGIC_VECTOR("00" & qDivProdLTX_opA_uid99_fpDivTest_q);
    qDividerProdLTX_uid101_fpDivTest_b <= STD_LOGIC_VECTOR("00" & redist71_qDivProdLTX_opB_uid100_fpDivTest_q_12_mem_q);
    qDividerProdLTX_uid101_fpDivTest_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                qDividerProdLTX_uid101_fpDivTest_o <= (others => '0');
            ELSE
                qDividerProdLTX_uid101_fpDivTest_o <= STD_LOGIC_VECTOR(UNSIGNED(qDividerProdLTX_uid101_fpDivTest_a) - UNSIGNED(qDividerProdLTX_uid101_fpDivTest_b));
            END IF;
        END IF;
    END PROCESS;
    qDividerProdLTX_uid101_fpDivTest_c(0) <= qDividerProdLTX_uid101_fpDivTest_o(64);

    -- extraUlp_uid103_fpDivTest(LOGICAL,102)@60 + 1
    extraUlp_uid103_fpDivTest_qi <= qDividerProdLTX_uid101_fpDivTest_c and betweenFPwF_uid102_fpDivTest_b;
    extraUlp_uid103_fpDivTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => extraUlp_uid103_fpDivTest_qi, xout => extraUlp_uid103_fpDivTest_q, clk => clk, aclr => areset, ena => '1' );

    -- redist70_extraUlp_uid103_fpDivTest_q_2(DELAY,580)
    redist70_extraUlp_uid103_fpDivTest_q_2_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist70_extraUlp_uid103_fpDivTest_q_2_q <= (others => '0');
            ELSE
                redist70_extraUlp_uid103_fpDivTest_q_2_q <= STD_LOGIC_VECTOR(extraUlp_uid103_fpDivTest_q);
            END IF;
        END IF;
    END PROCESS;

    -- fracPostRndFT_uid104_fpDivTest(BITSELECT,103)@60
    fracPostRndFT_uid104_fpDivTest_b <= redist76_fracPostRndF_uid80_fpDivTest_q_13_outputreg0_q(52 downto 1);

    -- redist68_fracPostRndFT_uid104_fpDivTest_b_1(DELAY,578)
    redist68_fracPostRndFT_uid104_fpDivTest_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist68_fracPostRndFT_uid104_fpDivTest_b_1_q <= (others => '0');
            ELSE
                redist68_fracPostRndFT_uid104_fpDivTest_b_1_q <= STD_LOGIC_VECTOR(fracPostRndFT_uid104_fpDivTest_b);
            END IF;
        END IF;
    END PROCESS;

    -- fracRPreExcExt_uid105_fpDivTest(ADD,104)@61
    fracRPreExcExt_uid105_fpDivTest_a <= STD_LOGIC_VECTOR("0" & redist68_fracPostRndFT_uid104_fpDivTest_b_1_q);
    fracRPreExcExt_uid105_fpDivTest_b <= STD_LOGIC_VECTOR("0000000000000000000000000000000000000000000000000000" & extraUlp_uid103_fpDivTest_q);
    fracRPreExcExt_uid105_fpDivTest_o <= STD_LOGIC_VECTOR(UNSIGNED(fracRPreExcExt_uid105_fpDivTest_a) + UNSIGNED(fracRPreExcExt_uid105_fpDivTest_b));
    fracRPreExcExt_uid105_fpDivTest_q <= fracRPreExcExt_uid105_fpDivTest_o(52 downto 0);

    -- ovfIncRnd_uid109_fpDivTest(BITSELECT,108)@61
    ovfIncRnd_uid109_fpDivTest_b <= STD_LOGIC_VECTOR(fracRPreExcExt_uid105_fpDivTest_q(52 downto 52));

    -- redist66_ovfIncRnd_uid109_fpDivTest_b_1(DELAY,576)
    redist66_ovfIncRnd_uid109_fpDivTest_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist66_ovfIncRnd_uid109_fpDivTest_b_1_q <= (others => '0');
            ELSE
                redist66_ovfIncRnd_uid109_fpDivTest_b_1_q <= STD_LOGIC_VECTOR(ovfIncRnd_uid109_fpDivTest_b);
            END IF;
        END IF;
    END PROCESS;

    -- redist75_expPostRndFR_uid81_fpDivTest_b_15_notEnable(LOGICAL,648)
    redist75_expPostRndFR_uid81_fpDivTest_b_15_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist75_expPostRndFR_uid81_fpDivTest_b_15_nor(LOGICAL,649)
    redist75_expPostRndFR_uid81_fpDivTest_b_15_nor_q <= not (redist75_expPostRndFR_uid81_fpDivTest_b_15_notEnable_q or redist75_expPostRndFR_uid81_fpDivTest_b_15_sticky_ena_q);

    -- redist75_expPostRndFR_uid81_fpDivTest_b_15_mem_last(CONSTANT,645)
    redist75_expPostRndFR_uid81_fpDivTest_b_15_mem_last_q <= "01010";

    -- redist75_expPostRndFR_uid81_fpDivTest_b_15_cmp(LOGICAL,646)
    redist75_expPostRndFR_uid81_fpDivTest_b_15_cmp_b <= STD_LOGIC_VECTOR("0" & redist75_expPostRndFR_uid81_fpDivTest_b_15_rdcnt_q);
    redist75_expPostRndFR_uid81_fpDivTest_b_15_cmp_q <= "1" WHEN redist75_expPostRndFR_uid81_fpDivTest_b_15_mem_last_q = redist75_expPostRndFR_uid81_fpDivTest_b_15_cmp_b ELSE "0";

    -- redist75_expPostRndFR_uid81_fpDivTest_b_15_cmpReg(REG,647)
    redist75_expPostRndFR_uid81_fpDivTest_b_15_cmpReg_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist75_expPostRndFR_uid81_fpDivTest_b_15_cmpReg_q <= "0";
            ELSE
                redist75_expPostRndFR_uid81_fpDivTest_b_15_cmpReg_q <= STD_LOGIC_VECTOR(redist75_expPostRndFR_uid81_fpDivTest_b_15_cmp_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist75_expPostRndFR_uid81_fpDivTest_b_15_sticky_ena(REG,650)
    redist75_expPostRndFR_uid81_fpDivTest_b_15_sticky_ena_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist75_expPostRndFR_uid81_fpDivTest_b_15_sticky_ena_q <= "0";
            ELSE
                IF (redist75_expPostRndFR_uid81_fpDivTest_b_15_nor_q = "1") THEN
                    redist75_expPostRndFR_uid81_fpDivTest_b_15_sticky_ena_q <= STD_LOGIC_VECTOR(redist75_expPostRndFR_uid81_fpDivTest_b_15_cmpReg_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist75_expPostRndFR_uid81_fpDivTest_b_15_enaAnd(LOGICAL,651)
    redist75_expPostRndFR_uid81_fpDivTest_b_15_enaAnd_q <= redist75_expPostRndFR_uid81_fpDivTest_b_15_sticky_ena_q and VCC_q;

    -- redist75_expPostRndFR_uid81_fpDivTest_b_15_rdcnt(COUNTER,643)
    -- low=0, high=11, step=1, init=0
    redist75_expPostRndFR_uid81_fpDivTest_b_15_rdcnt_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist75_expPostRndFR_uid81_fpDivTest_b_15_rdcnt_i <= TO_UNSIGNED(0, 4);
                redist75_expPostRndFR_uid81_fpDivTest_b_15_rdcnt_eq <= '0';
            ELSE
                IF (redist75_expPostRndFR_uid81_fpDivTest_b_15_rdcnt_i = TO_UNSIGNED(10, 4)) THEN
                    redist75_expPostRndFR_uid81_fpDivTest_b_15_rdcnt_eq <= '1';
                ELSE
                    redist75_expPostRndFR_uid81_fpDivTest_b_15_rdcnt_eq <= '0';
                END IF;
                IF (redist75_expPostRndFR_uid81_fpDivTest_b_15_rdcnt_eq = '1') THEN
                    redist75_expPostRndFR_uid81_fpDivTest_b_15_rdcnt_i <= redist75_expPostRndFR_uid81_fpDivTest_b_15_rdcnt_i + 5;
                ELSE
                    redist75_expPostRndFR_uid81_fpDivTest_b_15_rdcnt_i <= redist75_expPostRndFR_uid81_fpDivTest_b_15_rdcnt_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    redist75_expPostRndFR_uid81_fpDivTest_b_15_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist75_expPostRndFR_uid81_fpDivTest_b_15_rdcnt_i, 4)));

    -- redist75_expPostRndFR_uid81_fpDivTest_b_15_inputreg0(DELAY,640)
    redist75_expPostRndFR_uid81_fpDivTest_b_15_inputreg0_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist75_expPostRndFR_uid81_fpDivTest_b_15_inputreg0_q <= (others => '0');
            ELSE
                redist75_expPostRndFR_uid81_fpDivTest_b_15_inputreg0_q <= STD_LOGIC_VECTOR(expPostRndFR_uid81_fpDivTest_b);
            END IF;
        END IF;
    END PROCESS;

    -- redist75_expPostRndFR_uid81_fpDivTest_b_15_wraddr(REG,644)
    redist75_expPostRndFR_uid81_fpDivTest_b_15_wraddr_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist75_expPostRndFR_uid81_fpDivTest_b_15_wraddr_q <= "1011";
            ELSE
                redist75_expPostRndFR_uid81_fpDivTest_b_15_wraddr_q <= STD_LOGIC_VECTOR(redist75_expPostRndFR_uid81_fpDivTest_b_15_rdcnt_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist75_expPostRndFR_uid81_fpDivTest_b_15_mem(DUALMEM,642)
    redist75_expPostRndFR_uid81_fpDivTest_b_15_mem_ia <= STD_LOGIC_VECTOR(redist75_expPostRndFR_uid81_fpDivTest_b_15_inputreg0_q);
    redist75_expPostRndFR_uid81_fpDivTest_b_15_mem_aa <= redist75_expPostRndFR_uid81_fpDivTest_b_15_wraddr_q;
    redist75_expPostRndFR_uid81_fpDivTest_b_15_mem_ab <= redist75_expPostRndFR_uid81_fpDivTest_b_15_rdcnt_q;
    redist75_expPostRndFR_uid81_fpDivTest_b_15_mem_reset0 <= areset;
    redist75_expPostRndFR_uid81_fpDivTest_b_15_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 11,
        widthad_a => 4,
        numwords_a => 12,
        width_b => 11,
        widthad_b => 4,
        numwords_b => 12,
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
        clocken1 => redist75_expPostRndFR_uid81_fpDivTest_b_15_enaAnd_q(0),
        clocken0 => '1',
        clock0 => clk,
        sclr => redist75_expPostRndFR_uid81_fpDivTest_b_15_mem_reset0,
        clock1 => clk,
        address_a => redist75_expPostRndFR_uid81_fpDivTest_b_15_mem_aa,
        data_a => redist75_expPostRndFR_uid81_fpDivTest_b_15_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist75_expPostRndFR_uid81_fpDivTest_b_15_mem_ab,
        q_b => redist75_expPostRndFR_uid81_fpDivTest_b_15_mem_iq
    );
    redist75_expPostRndFR_uid81_fpDivTest_b_15_mem_q <= redist75_expPostRndFR_uid81_fpDivTest_b_15_mem_iq(10 downto 0);

    -- redist75_expPostRndFR_uid81_fpDivTest_b_15_outputreg0(DELAY,641)
    redist75_expPostRndFR_uid81_fpDivTest_b_15_outputreg0_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist75_expPostRndFR_uid81_fpDivTest_b_15_outputreg0_q <= (others => '0');
            ELSE
                redist75_expPostRndFR_uid81_fpDivTest_b_15_outputreg0_q <= STD_LOGIC_VECTOR(redist75_expPostRndFR_uid81_fpDivTest_b_15_mem_q);
            END IF;
        END IF;
    END PROCESS;

    -- expFracPostRndInc_uid110_fpDivTest_expRPreExc_uid112_fpDivTest_merged(ADD,430)@62
    expFracPostRndInc_uid110_fpDivTest_expRPreExc_uid112_fpDivTest_merged_a <= STD_LOGIC_VECTOR("0" & redist75_expPostRndFR_uid81_fpDivTest_b_15_outputreg0_q);
    expFracPostRndInc_uid110_fpDivTest_expRPreExc_uid112_fpDivTest_merged_b <= STD_LOGIC_VECTOR("00000000000" & redist66_ovfIncRnd_uid109_fpDivTest_b_1_q);
    expFracPostRndInc_uid110_fpDivTest_expRPreExc_uid112_fpDivTest_merged_i <= expFracPostRndInc_uid110_fpDivTest_expRPreExc_uid112_fpDivTest_merged_a;
    expFracPostRndInc_uid110_fpDivTest_expRPreExc_uid112_fpDivTest_merged_a1 <= expFracPostRndInc_uid110_fpDivTest_expRPreExc_uid112_fpDivTest_merged_i;
    expFracPostRndInc_uid110_fpDivTest_expRPreExc_uid112_fpDivTest_merged_b1 <= (others => '0') WHEN redist70_extraUlp_uid103_fpDivTest_q_2_q = "0" ELSE expFracPostRndInc_uid110_fpDivTest_expRPreExc_uid112_fpDivTest_merged_b;
    expFracPostRndInc_uid110_fpDivTest_expRPreExc_uid112_fpDivTest_merged_o <= STD_LOGIC_VECTOR(UNSIGNED(expFracPostRndInc_uid110_fpDivTest_expRPreExc_uid112_fpDivTest_merged_a1) + UNSIGNED(expFracPostRndInc_uid110_fpDivTest_expRPreExc_uid112_fpDivTest_merged_b1));
    expFracPostRndInc_uid110_fpDivTest_expRPreExc_uid112_fpDivTest_merged_q <= expFracPostRndInc_uid110_fpDivTest_expRPreExc_uid112_fpDivTest_merged_o(10 downto 0);

    -- invExpXIsMax_uid43_fpDivTest(LOGICAL,42)@48
    invExpXIsMax_uid43_fpDivTest_q <= not (expXIsMax_uid38_fpDivTest_q);

    -- InvExpXIsZero_uid44_fpDivTest(LOGICAL,43)@48
    InvExpXIsZero_uid44_fpDivTest_q <= not (excZ_y_uid37_fpDivTest_q);

    -- excR_y_uid45_fpDivTest(LOGICAL,44)@48
    excR_y_uid45_fpDivTest_q <= InvExpXIsZero_uid44_fpDivTest_q and invExpXIsMax_uid43_fpDivTest_q;

    -- excXIYR_uid127_fpDivTest(LOGICAL,126)@48
    excXIYR_uid127_fpDivTest_q <= excI_x_uid27_fpDivTest_q and excR_y_uid45_fpDivTest_q;

    -- excXIYZ_uid126_fpDivTest(LOGICAL,125)@48
    excXIYZ_uid126_fpDivTest_q <= excI_x_uid27_fpDivTest_q and excZ_y_uid37_fpDivTest_q;

    -- expRExt_uid114_fpDivTest(BITSELECT,113)@47
    expRExt_uid114_fpDivTest_b <= STD_LOGIC_VECTOR(expFracPostRnd_uid76_fpDivTest_q(67 downto 54));

    -- expOvf_uid118_fpDivTest(COMPARE,117)@47 + 1
    expOvf_uid118_fpDivTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 14 => expRExt_uid114_fpDivTest_b(13)) & expRExt_uid114_fpDivTest_b));
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
    expOvf_uid118_fpDivTest_n(0) <= not (expOvf_uid118_fpDivTest_o(15));

    -- invExpXIsMax_uid29_fpDivTest(LOGICAL,28)@47
    invExpXIsMax_uid29_fpDivTest_q <= not (expXIsMax_uid24_fpDivTest_q);

    -- InvExpXIsZero_uid30_fpDivTest(LOGICAL,29)@47
    InvExpXIsZero_uid30_fpDivTest_q <= not (excZ_x_uid23_fpDivTest_q);

    -- excR_x_uid31_fpDivTest(LOGICAL,30)@47 + 1
    excR_x_uid31_fpDivTest_qi <= InvExpXIsZero_uid30_fpDivTest_q and invExpXIsMax_uid29_fpDivTest_q;
    excR_x_uid31_fpDivTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => excR_x_uid31_fpDivTest_qi, xout => excR_x_uid31_fpDivTest_q, clk => clk, aclr => areset, ena => '1' );

    -- excXRYROvf_uid125_fpDivTest(LOGICAL,124)@48
    excXRYROvf_uid125_fpDivTest_q <= excR_x_uid31_fpDivTest_q and excR_y_uid45_fpDivTest_q and expOvf_uid118_fpDivTest_n;

    -- excXRYZ_uid124_fpDivTest(LOGICAL,123)@48
    excXRYZ_uid124_fpDivTest_q <= excR_x_uid31_fpDivTest_q and excZ_y_uid37_fpDivTest_q;

    -- excRInf_uid128_fpDivTest(LOGICAL,127)@48 + 1
    excRInf_uid128_fpDivTest_qi <= excXRYZ_uid124_fpDivTest_q or excXRYROvf_uid125_fpDivTest_q or excXIYZ_uid126_fpDivTest_q or excXIYR_uid127_fpDivTest_q;
    excRInf_uid128_fpDivTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => excRInf_uid128_fpDivTest_qi, xout => excRInf_uid128_fpDivTest_q, clk => clk, aclr => areset, ena => '1' );

    -- xRegOrZero_uid121_fpDivTest(LOGICAL,120)@48
    xRegOrZero_uid121_fpDivTest_q <= excR_x_uid31_fpDivTest_q or redist92_excZ_x_uid23_fpDivTest_q_1_q;

    -- regOrZeroOverInf_uid122_fpDivTest(LOGICAL,121)@48
    regOrZeroOverInf_uid122_fpDivTest_q <= xRegOrZero_uid121_fpDivTest_q and excI_y_uid41_fpDivTest_q;

    -- expUdf_uid115_fpDivTest(COMPARE,114)@47 + 1
    expUdf_uid115_fpDivTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000000000000000" & GND_q));
    expUdf_uid115_fpDivTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 14 => expRExt_uid114_fpDivTest_b(13)) & expRExt_uid114_fpDivTest_b));
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
    expUdf_uid115_fpDivTest_n(0) <= not (expUdf_uid115_fpDivTest_o(15));

    -- regOverRegWithUf_uid120_fpDivTest(LOGICAL,119)@48
    regOverRegWithUf_uid120_fpDivTest_q <= expUdf_uid115_fpDivTest_n and excR_x_uid31_fpDivTest_q and excR_y_uid45_fpDivTest_q;

    -- zeroOverReg_uid119_fpDivTest(LOGICAL,118)@48
    zeroOverReg_uid119_fpDivTest_q <= redist92_excZ_x_uid23_fpDivTest_q_1_q and excR_y_uid45_fpDivTest_q;

    -- excRZero_uid123_fpDivTest(LOGICAL,122)@48 + 1
    excRZero_uid123_fpDivTest_qi <= zeroOverReg_uid119_fpDivTest_q or regOverRegWithUf_uid120_fpDivTest_q or regOrZeroOverInf_uid122_fpDivTest_q;
    excRZero_uid123_fpDivTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => excRZero_uid123_fpDivTest_qi, xout => excRZero_uid123_fpDivTest_q, clk => clk, aclr => areset, ena => '1' );

    -- concExc_uid132_fpDivTest(BITJOIN,131)@49
    concExc_uid132_fpDivTest_q <= excRNaN_uid131_fpDivTest_q & excRInf_uid128_fpDivTest_q & excRZero_uid123_fpDivTest_q;

    -- excREnc_uid133_fpDivTest(LOOKUP,132)@49 + 1
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

    -- redist65_excREnc_uid133_fpDivTest_q_13(DELAY,575)
    redist65_excREnc_uid133_fpDivTest_q_13 : dspba_delay
    GENERIC MAP ( width => 2, depth => 12, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => excREnc_uid133_fpDivTest_q, xout => redist65_excREnc_uid133_fpDivTest_q_13_q, clk => clk, aclr => areset, ena => '1' );

    -- expRPostExc_uid141_fpDivTest(MUX,140)@62
    expRPostExc_uid141_fpDivTest_s <= redist65_excREnc_uid133_fpDivTest_q_13_q;
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
    oneFracRPostExc2_uid134_fpDivTest_q <= "0000000000000000000000000000000000000000000000000001";

    -- fracPostRndFPostUlp_uid106_fpDivTest(BITSELECT,105)@61
    fracPostRndFPostUlp_uid106_fpDivTest_in <= fracRPreExcExt_uid105_fpDivTest_q(51 downto 0);
    fracPostRndFPostUlp_uid106_fpDivTest_b <= fracPostRndFPostUlp_uid106_fpDivTest_in(51 downto 0);

    -- redist67_fracPostRndFPostUlp_uid106_fpDivTest_b_1(DELAY,577)
    redist67_fracPostRndFPostUlp_uid106_fpDivTest_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist67_fracPostRndFPostUlp_uid106_fpDivTest_b_1_q <= (others => '0');
            ELSE
                redist67_fracPostRndFPostUlp_uid106_fpDivTest_b_1_q <= STD_LOGIC_VECTOR(fracPostRndFPostUlp_uid106_fpDivTest_b);
            END IF;
        END IF;
    END PROCESS;

    -- redist69_fracPostRndFT_uid104_fpDivTest_b_2(DELAY,579)
    redist69_fracPostRndFT_uid104_fpDivTest_b_2_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist69_fracPostRndFT_uid104_fpDivTest_b_2_q <= (others => '0');
            ELSE
                redist69_fracPostRndFT_uid104_fpDivTest_b_2_q <= STD_LOGIC_VECTOR(redist68_fracPostRndFT_uid104_fpDivTest_b_1_q);
            END IF;
        END IF;
    END PROCESS;

    -- fracRPreExc_uid107_fpDivTest(MUX,106)@62
    fracRPreExc_uid107_fpDivTest_s <= redist70_extraUlp_uid103_fpDivTest_q_2_q;
    fracRPreExc_uid107_fpDivTest_combproc: PROCESS (fracRPreExc_uid107_fpDivTest_s, redist69_fracPostRndFT_uid104_fpDivTest_b_2_q, redist67_fracPostRndFPostUlp_uid106_fpDivTest_b_1_q)
    BEGIN
        CASE (fracRPreExc_uid107_fpDivTest_s) IS
            WHEN "0" => fracRPreExc_uid107_fpDivTest_q <= redist69_fracPostRndFT_uid104_fpDivTest_b_2_q;
            WHEN "1" => fracRPreExc_uid107_fpDivTest_q <= redist67_fracPostRndFPostUlp_uid106_fpDivTest_b_1_q;
            WHEN OTHERS => fracRPreExc_uid107_fpDivTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- fracRPostExc_uid137_fpDivTest(MUX,136)@62
    fracRPostExc_uid137_fpDivTest_s <= redist65_excREnc_uid133_fpDivTest_q_13_q;
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

    -- divR_uid144_fpDivTest(BITJOIN,143)@62
    divR_uid144_fpDivTest_q <= redist64_sRPostExc_uid143_fpDivTest_q_13_q & expRPostExc_uid141_fpDivTest_q & fracRPostExc_uid137_fpDivTest_q;

    -- xOut(GPOUT,4)@62
    q <= divR_uid144_fpDivTest_q;

END normal;
