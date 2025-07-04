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

-- VHDL created from float32_sub_altera_fp_functions_191_c32w4aa
-- VHDL created on Wed Sep 28 07:50:26 2022


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

entity float32_sub_altera_fp_functions_191_c32w4aa is
    port (
        a : in std_logic_vector(31 downto 0);  -- float32_m23
        b : in std_logic_vector(31 downto 0);  -- float32_m23
        q : out std_logic_vector(31 downto 0);  -- float32_m23
        clk : in std_logic;
        areset : in std_logic
    );
end float32_sub_altera_fp_functions_191_c32w4aa;

architecture normal of float32_sub_altera_fp_functions_191_c32w4aa is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracX_uid6_fpSubTest_b : STD_LOGIC_VECTOR (30 downto 0);
    signal expFracY_uid7_fpSubTest_b : STD_LOGIC_VECTOR (30 downto 0);
    signal xGTEy_uid8_fpSubTest_a : STD_LOGIC_VECTOR (32 downto 0);
    signal xGTEy_uid8_fpSubTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal xGTEy_uid8_fpSubTest_o : STD_LOGIC_VECTOR (32 downto 0);
    signal xGTEy_uid8_fpSubTest_n : STD_LOGIC_VECTOR (0 downto 0);
    signal fracY_uid9_fpSubTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal expY_uid10_fpSubTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal sigY_uid11_fpSubTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal invSigY_uid12_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal ypn_uid13_fpSubTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal aSig_uid17_fpSubTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aSig_uid17_fpSubTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bSig_uid18_fpSubTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal bSig_uid18_fpSubTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal cstAllOWE_uid19_fpSubTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cstZeroWF_uid20_fpSubTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal cstAllZWE_uid21_fpSubTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal exp_aSig_uid22_fpSubTest_in : STD_LOGIC_VECTOR (30 downto 0);
    signal exp_aSig_uid22_fpSubTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal frac_aSig_uid23_fpSubTest_in : STD_LOGIC_VECTOR (22 downto 0);
    signal frac_aSig_uid23_fpSubTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal excZ_aSig_uid17_uid24_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid25_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid26_fpSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid26_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid27_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_aSig_uid28_fpSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_aSig_uid28_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_aSig_uid29_fpSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_aSig_uid29_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid30_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid31_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_aSig_uid32_fpSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_aSig_uid32_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal exp_bSig_uid36_fpSubTest_in : STD_LOGIC_VECTOR (30 downto 0);
    signal exp_bSig_uid36_fpSubTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal frac_bSig_uid37_fpSubTest_in : STD_LOGIC_VECTOR (22 downto 0);
    signal frac_bSig_uid37_fpSubTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal excZ_bSig_uid18_uid38_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid39_fpSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid39_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid40_fpSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid40_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid41_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_bSig_uid42_fpSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_bSig_uid42_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_bSig_uid43_fpSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_bSig_uid43_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid44_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid45_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_bSig_uid46_fpSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_bSig_uid46_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sigA_uid51_fpSubTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal sigB_uid52_fpSubTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal effSub_uid53_fpSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal effSub_uid53_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracBz_uid57_fpSubTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fracBz_uid57_fpSubTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal oFracB_uid60_fpSubTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal expAmExpB_uid61_fpSubTest_a : STD_LOGIC_VECTOR (8 downto 0);
    signal expAmExpB_uid61_fpSubTest_b : STD_LOGIC_VECTOR (8 downto 0);
    signal expAmExpB_uid61_fpSubTest_o : STD_LOGIC_VECTOR (8 downto 0);
    signal expAmExpB_uid61_fpSubTest_q : STD_LOGIC_VECTOR (8 downto 0);
    signal cWFP2_uid62_fpSubTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal shiftedOut_uid64_fpSubTest_a : STD_LOGIC_VECTOR (10 downto 0);
    signal shiftedOut_uid64_fpSubTest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal shiftedOut_uid64_fpSubTest_o : STD_LOGIC_VECTOR (10 downto 0);
    signal shiftedOut_uid64_fpSubTest_c : STD_LOGIC_VECTOR (0 downto 0);
    signal padConst_uid65_fpSubTest_q : STD_LOGIC_VECTOR (24 downto 0);
    signal rightPaddedIn_uid66_fpSubTest_q : STD_LOGIC_VECTOR (48 downto 0);
    signal iShiftedOut_uid68_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal alignFracBPostShiftOut_uid69_fpSubTest_b : STD_LOGIC_VECTOR (48 downto 0);
    signal alignFracBPostShiftOut_uid69_fpSubTest_qi : STD_LOGIC_VECTOR (48 downto 0);
    signal alignFracBPostShiftOut_uid69_fpSubTest_q : STD_LOGIC_VECTOR (48 downto 0);
    signal cmpEQ_stickyBits_cZwF_uid72_fpSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal cmpEQ_stickyBits_cZwF_uid72_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invCmpEQ_stickyBits_cZwF_uid73_fpSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal invCmpEQ_stickyBits_cZwF_uid73_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal effSubInvSticky_uid75_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal zocst_uid77_fpSubTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal fracAAddOp_uid78_fpSubTest_q : STD_LOGIC_VECTOR (26 downto 0);
    signal fracBAddOp_uid81_fpSubTest_q : STD_LOGIC_VECTOR (26 downto 0);
    signal fracBAddOpPostXor_uid82_fpSubTest_b : STD_LOGIC_VECTOR (26 downto 0);
    signal fracBAddOpPostXor_uid82_fpSubTest_q : STD_LOGIC_VECTOR (26 downto 0);
    signal fracAddResult_uid83_fpSubTest_a : STD_LOGIC_VECTOR (27 downto 0);
    signal fracAddResult_uid83_fpSubTest_b : STD_LOGIC_VECTOR (27 downto 0);
    signal fracAddResult_uid83_fpSubTest_o : STD_LOGIC_VECTOR (27 downto 0);
    signal fracAddResult_uid83_fpSubTest_q : STD_LOGIC_VECTOR (27 downto 0);
    signal rangeFracAddResultMwfp3Dto0_uid84_fpSubTest_in : STD_LOGIC_VECTOR (26 downto 0);
    signal rangeFracAddResultMwfp3Dto0_uid84_fpSubTest_b : STD_LOGIC_VECTOR (26 downto 0);
    signal fracGRS_uid85_fpSubTest_q : STD_LOGIC_VECTOR (27 downto 0);
    signal cAmA_uid87_fpSubTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal aMinusA_uid88_fpSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal aMinusA_uid88_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracPostNorm_uid90_fpSubTest_b : STD_LOGIC_VECTOR (26 downto 0);
    signal oneCST_uid91_fpSubTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal expInc_uid92_fpSubTest_a : STD_LOGIC_VECTOR (8 downto 0);
    signal expInc_uid92_fpSubTest_b : STD_LOGIC_VECTOR (8 downto 0);
    signal expInc_uid92_fpSubTest_o : STD_LOGIC_VECTOR (8 downto 0);
    signal expInc_uid92_fpSubTest_q : STD_LOGIC_VECTOR (8 downto 0);
    signal expPostNorm_uid93_fpSubTest_a : STD_LOGIC_VECTOR (9 downto 0);
    signal expPostNorm_uid93_fpSubTest_b : STD_LOGIC_VECTOR (9 downto 0);
    signal expPostNorm_uid93_fpSubTest_o : STD_LOGIC_VECTOR (9 downto 0);
    signal expPostNorm_uid93_fpSubTest_q : STD_LOGIC_VECTOR (9 downto 0);
    signal Sticky0_uid94_fpSubTest_in : STD_LOGIC_VECTOR (0 downto 0);
    signal Sticky0_uid94_fpSubTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal Sticky1_uid95_fpSubTest_in : STD_LOGIC_VECTOR (1 downto 0);
    signal Sticky1_uid95_fpSubTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal Round_uid96_fpSubTest_in : STD_LOGIC_VECTOR (2 downto 0);
    signal Round_uid96_fpSubTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal Guard_uid97_fpSubTest_in : STD_LOGIC_VECTOR (3 downto 0);
    signal Guard_uid97_fpSubTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal LSB_uid98_fpSubTest_in : STD_LOGIC_VECTOR (4 downto 0);
    signal LSB_uid98_fpSubTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal rndBitCond_uid99_fpSubTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal cRBit_uid100_fpSubTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal rBi_uid101_fpSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal rBi_uid101_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal roundBit_uid102_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracPostNormRndRange_uid103_fpSubTest_in : STD_LOGIC_VECTOR (25 downto 0);
    signal fracPostNormRndRange_uid103_fpSubTest_b : STD_LOGIC_VECTOR (23 downto 0);
    signal expFracR_uid104_fpSubTest_q : STD_LOGIC_VECTOR (33 downto 0);
    signal rndExpFrac_uid105_fpSubTest_a : STD_LOGIC_VECTOR (34 downto 0);
    signal rndExpFrac_uid105_fpSubTest_b : STD_LOGIC_VECTOR (34 downto 0);
    signal rndExpFrac_uid105_fpSubTest_o : STD_LOGIC_VECTOR (34 downto 0);
    signal rndExpFrac_uid105_fpSubTest_q : STD_LOGIC_VECTOR (34 downto 0);
    signal wEP2AllOwE_uid106_fpSubTest_q : STD_LOGIC_VECTOR (9 downto 0);
    signal rndExp_uid107_fpSubTest_in : STD_LOGIC_VECTOR (33 downto 0);
    signal rndExp_uid107_fpSubTest_b : STD_LOGIC_VECTOR (9 downto 0);
    signal rOvfEQMax_uid108_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rndExpFracOvfBits_uid110_fpSubTest_in : STD_LOGIC_VECTOR (33 downto 0);
    signal rndExpFracOvfBits_uid110_fpSubTest_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rOvfExtraBits_uid111_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rOvf_uid112_fpSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal rOvf_uid112_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal wEP2AllZ_uid113_fpSubTest_q : STD_LOGIC_VECTOR (9 downto 0);
    signal rUdfEQMin_uid114_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rUdfExtraBit_uid115_fpSubTest_in : STD_LOGIC_VECTOR (33 downto 0);
    signal rUdfExtraBit_uid115_fpSubTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal rUdf_uid116_fpSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal rUdf_uid116_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPreExc_uid117_fpSubTest_in : STD_LOGIC_VECTOR (23 downto 0);
    signal fracRPreExc_uid117_fpSubTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal expRPreExc_uid118_fpSubTest_in : STD_LOGIC_VECTOR (31 downto 0);
    signal expRPreExc_uid118_fpSubTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal regInputs_uid119_fpSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal regInputs_uid119_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZeroVInC_uid120_fpSubTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal excRZero_uid121_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rInfOvf_uid122_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRInfVInC_uid123_fpSubTest_q : STD_LOGIC_VECTOR (5 downto 0);
    signal excRInf_uid124_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN2_uid125_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excAIBISub_uid126_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid127_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal concExc_uid128_fpSubTest_q : STD_LOGIC_VECTOR (2 downto 0);
    signal excREnc_uid129_fpSubTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal invAMinusA_uid130_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRReg_uid131_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sigBBInf_uid132_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sigAAInf_uid133_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRInf_uid134_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excAZBZSigASigB_uid135_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excBZARSigA_uid136_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRZero_uid137_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRInfRZRReg_uid138_fpSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal signRInfRZRReg_uid138_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExcRNaN_uid139_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRPostExc_uid140_fpSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal signRPostExc_uid140_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal oneFracRPostExc2_uid141_fpSubTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal fracRPostExc_uid144_fpSubTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid144_fpSubTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal expRPostExc_uid148_fpSubTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal expRPostExc_uid148_fpSubTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal R_uid149_fpSubTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal zs_uid151_lzCountVal_uid86_fpSubTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal rVStage_uid152_lzCountVal_uid86_fpSubTest_b : STD_LOGIC_VECTOR (15 downto 0);
    signal vCount_uid153_lzCountVal_uid86_fpSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal vCount_uid153_lzCountVal_uid86_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal mO_uid154_lzCountVal_uid86_fpSubTest_q : STD_LOGIC_VECTOR (3 downto 0);
    signal vStage_uid155_lzCountVal_uid86_fpSubTest_in : STD_LOGIC_VECTOR (11 downto 0);
    signal vStage_uid155_lzCountVal_uid86_fpSubTest_b : STD_LOGIC_VECTOR (11 downto 0);
    signal cStage_uid156_lzCountVal_uid86_fpSubTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal vStagei_uid158_lzCountVal_uid86_fpSubTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid158_lzCountVal_uid86_fpSubTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal vCount_uid161_lzCountVal_uid86_fpSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal vCount_uid161_lzCountVal_uid86_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid164_lzCountVal_uid86_fpSubTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid164_lzCountVal_uid86_fpSubTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal zs_uid165_lzCountVal_uid86_fpSubTest_q : STD_LOGIC_VECTOR (3 downto 0);
    signal vCount_uid167_lzCountVal_uid86_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid170_lzCountVal_uid86_fpSubTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid170_lzCountVal_uid86_fpSubTest_q : STD_LOGIC_VECTOR (3 downto 0);
    signal zs_uid171_lzCountVal_uid86_fpSubTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal vCount_uid173_lzCountVal_uid86_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid176_lzCountVal_uid86_fpSubTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid176_lzCountVal_uid86_fpSubTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal rVStage_uid178_lzCountVal_uid86_fpSubTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal vCount_uid179_lzCountVal_uid86_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal r_uid180_lzCountVal_uid86_fpSubTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal wIntCst_uid184_alignmentShifter_uid65_fpSubTest_q : STD_LOGIC_VECTOR (5 downto 0);
    signal shiftedOut_uid185_alignmentShifter_uid65_fpSubTest_a : STD_LOGIC_VECTOR (10 downto 0);
    signal shiftedOut_uid185_alignmentShifter_uid65_fpSubTest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal shiftedOut_uid185_alignmentShifter_uid65_fpSubTest_o : STD_LOGIC_VECTOR (10 downto 0);
    signal shiftedOut_uid185_alignmentShifter_uid65_fpSubTest_n : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage0Idx1Rng1_uid186_alignmentShifter_uid65_fpSubTest_b : STD_LOGIC_VECTOR (47 downto 0);
    signal rightShiftStage0Idx1_uid188_alignmentShifter_uid65_fpSubTest_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage0Idx2Rng2_uid189_alignmentShifter_uid65_fpSubTest_b : STD_LOGIC_VECTOR (46 downto 0);
    signal rightShiftStage0Idx2_uid191_alignmentShifter_uid65_fpSubTest_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage0Idx3Rng3_uid192_alignmentShifter_uid65_fpSubTest_b : STD_LOGIC_VECTOR (45 downto 0);
    signal rightShiftStage0Idx3Pad3_uid193_alignmentShifter_uid65_fpSubTest_q : STD_LOGIC_VECTOR (2 downto 0);
    signal rightShiftStage0Idx3_uid194_alignmentShifter_uid65_fpSubTest_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage0_uid196_alignmentShifter_uid65_fpSubTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage0_uid196_alignmentShifter_uid65_fpSubTest_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage1Idx1Rng4_uid197_alignmentShifter_uid65_fpSubTest_b : STD_LOGIC_VECTOR (44 downto 0);
    signal rightShiftStage1Idx1_uid199_alignmentShifter_uid65_fpSubTest_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage1Idx2Rng8_uid200_alignmentShifter_uid65_fpSubTest_b : STD_LOGIC_VECTOR (40 downto 0);
    signal rightShiftStage1Idx2_uid202_alignmentShifter_uid65_fpSubTest_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage1Idx3Rng12_uid203_alignmentShifter_uid65_fpSubTest_b : STD_LOGIC_VECTOR (36 downto 0);
    signal rightShiftStage1Idx3Pad12_uid204_alignmentShifter_uid65_fpSubTest_q : STD_LOGIC_VECTOR (11 downto 0);
    signal rightShiftStage1Idx3_uid205_alignmentShifter_uid65_fpSubTest_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage1_uid207_alignmentShifter_uid65_fpSubTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage1_uid207_alignmentShifter_uid65_fpSubTest_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage2Idx1Rng16_uid208_alignmentShifter_uid65_fpSubTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal rightShiftStage2Idx1_uid210_alignmentShifter_uid65_fpSubTest_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage2Idx2Rng32_uid211_alignmentShifter_uid65_fpSubTest_b : STD_LOGIC_VECTOR (16 downto 0);
    signal rightShiftStage2Idx2Pad32_uid212_alignmentShifter_uid65_fpSubTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage2Idx2_uid213_alignmentShifter_uid65_fpSubTest_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage2Idx3Rng48_uid214_alignmentShifter_uid65_fpSubTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage2Idx3Pad48_uid215_alignmentShifter_uid65_fpSubTest_q : STD_LOGIC_VECTOR (47 downto 0);
    signal rightShiftStage2Idx3_uid216_alignmentShifter_uid65_fpSubTest_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage2_uid218_alignmentShifter_uid65_fpSubTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage2_uid218_alignmentShifter_uid65_fpSubTest_q : STD_LOGIC_VECTOR (48 downto 0);
    signal zeroOutCst_uid219_alignmentShifter_uid65_fpSubTest_q : STD_LOGIC_VECTOR (48 downto 0);
    signal r_uid220_alignmentShifter_uid65_fpSubTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal r_uid220_alignmentShifter_uid65_fpSubTest_q : STD_LOGIC_VECTOR (48 downto 0);
    signal leftShiftStage0Idx1Rng8_uid225_fracPostNormExt_uid89_fpSubTest_in : STD_LOGIC_VECTOR (19 downto 0);
    signal leftShiftStage0Idx1Rng8_uid225_fracPostNormExt_uid89_fpSubTest_b : STD_LOGIC_VECTOR (19 downto 0);
    signal leftShiftStage0Idx1_uid226_fracPostNormExt_uid89_fpSubTest_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage0Idx2_uid229_fracPostNormExt_uid89_fpSubTest_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage0Idx3Pad24_uid230_fracPostNormExt_uid89_fpSubTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal leftShiftStage0Idx3Rng24_uid231_fracPostNormExt_uid89_fpSubTest_in : STD_LOGIC_VECTOR (3 downto 0);
    signal leftShiftStage0Idx3Rng24_uid231_fracPostNormExt_uid89_fpSubTest_b : STD_LOGIC_VECTOR (3 downto 0);
    signal leftShiftStage0Idx3_uid232_fracPostNormExt_uid89_fpSubTest_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage0_uid234_fracPostNormExt_uid89_fpSubTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage0_uid234_fracPostNormExt_uid89_fpSubTest_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage1Idx1Rng2_uid236_fracPostNormExt_uid89_fpSubTest_in : STD_LOGIC_VECTOR (25 downto 0);
    signal leftShiftStage1Idx1Rng2_uid236_fracPostNormExt_uid89_fpSubTest_b : STD_LOGIC_VECTOR (25 downto 0);
    signal leftShiftStage1Idx1_uid237_fracPostNormExt_uid89_fpSubTest_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage1Idx2Rng4_uid239_fracPostNormExt_uid89_fpSubTest_in : STD_LOGIC_VECTOR (23 downto 0);
    signal leftShiftStage1Idx2Rng4_uid239_fracPostNormExt_uid89_fpSubTest_b : STD_LOGIC_VECTOR (23 downto 0);
    signal leftShiftStage1Idx2_uid240_fracPostNormExt_uid89_fpSubTest_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage1Idx3Pad6_uid241_fracPostNormExt_uid89_fpSubTest_q : STD_LOGIC_VECTOR (5 downto 0);
    signal leftShiftStage1Idx3Rng6_uid242_fracPostNormExt_uid89_fpSubTest_in : STD_LOGIC_VECTOR (21 downto 0);
    signal leftShiftStage1Idx3Rng6_uid242_fracPostNormExt_uid89_fpSubTest_b : STD_LOGIC_VECTOR (21 downto 0);
    signal leftShiftStage1Idx3_uid243_fracPostNormExt_uid89_fpSubTest_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage1_uid245_fracPostNormExt_uid89_fpSubTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage1_uid245_fracPostNormExt_uid89_fpSubTest_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage2Idx1Rng1_uid247_fracPostNormExt_uid89_fpSubTest_in : STD_LOGIC_VECTOR (26 downto 0);
    signal leftShiftStage2Idx1Rng1_uid247_fracPostNormExt_uid89_fpSubTest_b : STD_LOGIC_VECTOR (26 downto 0);
    signal leftShiftStage2Idx1_uid248_fracPostNormExt_uid89_fpSubTest_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage2_uid250_fracPostNormExt_uid89_fpSubTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid250_fracPostNormExt_uid89_fpSubTest_q : STD_LOGIC_VECTOR (27 downto 0);
    signal rightShiftStageSel0Dto0_uid195_alignmentShifter_uid65_fpSubTest_merged_bit_select_in : STD_LOGIC_VECTOR (5 downto 0);
    signal rightShiftStageSel0Dto0_uid195_alignmentShifter_uid65_fpSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStageSel0Dto0_uid195_alignmentShifter_uid65_fpSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStageSel0Dto0_uid195_alignmentShifter_uid65_fpSubTest_merged_bit_select_d : STD_LOGIC_VECTOR (1 downto 0);
    signal stickyBits_uid70_fpSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (22 downto 0);
    signal stickyBits_uid70_fpSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (25 downto 0);
    signal rVStage_uid160_lzCountVal_uid86_fpSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (7 downto 0);
    signal rVStage_uid160_lzCountVal_uid86_fpSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (7 downto 0);
    signal rVStage_uid166_lzCountVal_uid86_fpSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (3 downto 0);
    signal rVStage_uid166_lzCountVal_uid86_fpSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (3 downto 0);
    signal rVStage_uid172_lzCountVal_uid86_fpSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rVStage_uid172_lzCountVal_uid86_fpSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStageSel0Dto3_uid233_fracPostNormExt_uid89_fpSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStageSel0Dto3_uid233_fracPostNormExt_uid89_fpSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStageSel0Dto3_uid233_fracPostNormExt_uid89_fpSubTest_merged_bit_select_d : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_leftShiftStageSel0Dto3_uid233_fracPostNormExt_uid89_fpSubTest_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist1_leftShiftStageSel0Dto3_uid233_fracPostNormExt_uid89_fpSubTest_merged_bit_select_d_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_rVStage_uid160_lzCountVal_uid86_fpSubTest_merged_bit_select_b_1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist3_rVStage_uid160_lzCountVal_uid86_fpSubTest_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist4_stickyBits_uid70_fpSubTest_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (25 downto 0);
    signal redist5_rightShiftStageSel0Dto0_uid195_alignmentShifter_uid65_fpSubTest_merged_bit_select_b_1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist6_rightShiftStageSel0Dto0_uid195_alignmentShifter_uid65_fpSubTest_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist7_rightShiftStageSel0Dto0_uid195_alignmentShifter_uid65_fpSubTest_merged_bit_select_d_1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist8_shiftedOut_uid185_alignmentShifter_uid65_fpSubTest_n_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_r_uid180_lzCountVal_uid86_fpSubTest_q_1_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist10_vCount_uid167_lzCountVal_uid86_fpSubTest_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_vCount_uid161_lzCountVal_uid86_fpSubTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_vStage_uid155_lzCountVal_uid86_fpSubTest_b_2_q : STD_LOGIC_VECTOR (11 downto 0);
    signal redist12_vStage_uid155_lzCountVal_uid86_fpSubTest_b_2_delay_0 : STD_LOGIC_VECTOR (11 downto 0);
    signal redist13_vCount_uid153_lzCountVal_uid86_fpSubTest_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_vCount_uid153_lzCountVal_uid86_fpSubTest_q_3_delay_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_rVStage_uid152_lzCountVal_uid86_fpSubTest_b_1_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist15_signRInfRZRReg_uid138_fpSubTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_regInputs_uid119_fpSubTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_expRPreExc_uid118_fpSubTest_b_2_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist17_expRPreExc_uid118_fpSubTest_b_2_delay_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal redist18_fracRPreExc_uid117_fpSubTest_b_2_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist18_fracRPreExc_uid117_fpSubTest_b_2_delay_0 : STD_LOGIC_VECTOR (22 downto 0);
    signal redist19_fracPostNormRndRange_uid103_fpSubTest_b_1_q : STD_LOGIC_VECTOR (23 downto 0);
    signal redist20_aMinusA_uid88_fpSubTest_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist20_aMinusA_uid88_fpSubTest_q_3_delay_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal redist21_fracGRS_uid85_fpSubTest_q_1_q : STD_LOGIC_VECTOR (27 downto 0);
    signal redist22_fracGRS_uid85_fpSubTest_q_3_q : STD_LOGIC_VECTOR (27 downto 0);
    signal redist22_fracGRS_uid85_fpSubTest_q_3_delay_0 : STD_LOGIC_VECTOR (27 downto 0);
    signal redist23_rangeFracAddResultMwfp3Dto0_uid84_fpSubTest_b_1_q : STD_LOGIC_VECTOR (26 downto 0);
    signal redist24_shiftedOut_uid64_fpSubTest_c_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist25_effSub_uid53_fpSubTest_q_9_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist26_sigB_uid52_fpSubTest_b_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist26_sigB_uid52_fpSubTest_b_4_delay_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal redist26_sigB_uid52_fpSubTest_b_4_delay_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal redist26_sigB_uid52_fpSubTest_b_4_delay_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal redist27_sigB_uid52_fpSubTest_b_11_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist28_sigA_uid51_fpSubTest_b_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist28_sigA_uid51_fpSubTest_b_4_delay_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal redist28_sigA_uid51_fpSubTest_b_4_delay_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal redist28_sigA_uid51_fpSubTest_b_4_delay_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal redist29_sigA_uid51_fpSubTest_b_11_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist30_InvExpXIsZero_uid45_fpSubTest_q_8_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist31_excN_bSig_uid43_fpSubTest_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist31_excN_bSig_uid43_fpSubTest_q_3_delay_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal redist32_excI_bSig_uid42_fpSubTest_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist32_excI_bSig_uid42_fpSubTest_q_3_delay_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal redist33_fracXIsZero_uid40_fpSubTest_q_9_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist34_expXIsMax_uid39_fpSubTest_q_9_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist35_excZ_bSig_uid18_uid38_fpSubTest_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist36_excZ_bSig_uid18_uid38_fpSubTest_q_10_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist37_excZ_bSig_uid18_uid38_fpSubTest_q_12_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist37_excZ_bSig_uid18_uid38_fpSubTest_q_12_delay_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal redist38_frac_bSig_uid37_fpSubTest_b_1_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist39_exp_bSig_uid36_fpSubTest_b_1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist40_excN_aSig_uid29_fpSubTest_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist40_excN_aSig_uid29_fpSubTest_q_3_delay_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal redist41_excI_aSig_uid28_fpSubTest_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist41_excI_aSig_uid28_fpSubTest_q_3_delay_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal redist42_fracXIsZero_uid26_fpSubTest_q_5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist42_fracXIsZero_uid26_fpSubTest_q_5_delay_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal redist42_fracXIsZero_uid26_fpSubTest_q_5_delay_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal redist42_fracXIsZero_uid26_fpSubTest_q_5_delay_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal redist43_excZ_aSig_uid17_uid24_fpSubTest_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist44_excZ_aSig_uid17_uid24_fpSubTest_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist44_excZ_aSig_uid17_uid24_fpSubTest_q_3_delay_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal redist45_frac_aSig_uid23_fpSubTest_b_5_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist45_frac_aSig_uid23_fpSubTest_b_5_delay_0 : STD_LOGIC_VECTOR (22 downto 0);
    signal redist45_frac_aSig_uid23_fpSubTest_b_5_delay_1 : STD_LOGIC_VECTOR (22 downto 0);
    signal redist45_frac_aSig_uid23_fpSubTest_b_5_delay_2 : STD_LOGIC_VECTOR (22 downto 0);
    signal redist46_exp_aSig_uid22_fpSubTest_b_1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist45_frac_aSig_uid23_fpSubTest_b_5_inputreg0_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist47_exp_aSig_uid22_fpSubTest_b_10_mem_reset0 : std_logic;
    signal redist47_exp_aSig_uid22_fpSubTest_b_10_mem_ia : STD_LOGIC_VECTOR (7 downto 0);
    signal redist47_exp_aSig_uid22_fpSubTest_b_10_mem_aa : STD_LOGIC_VECTOR (2 downto 0);
    signal redist47_exp_aSig_uid22_fpSubTest_b_10_mem_ab : STD_LOGIC_VECTOR (2 downto 0);
    signal redist47_exp_aSig_uid22_fpSubTest_b_10_mem_iq : STD_LOGIC_VECTOR (7 downto 0);
    signal redist47_exp_aSig_uid22_fpSubTest_b_10_mem_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist47_exp_aSig_uid22_fpSubTest_b_10_rdcnt_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist47_exp_aSig_uid22_fpSubTest_b_10_rdcnt_i : UNSIGNED (2 downto 0);
    attribute preserve_syn_only : boolean;
    attribute preserve_syn_only of redist47_exp_aSig_uid22_fpSubTest_b_10_rdcnt_i : signal is true;
    signal redist47_exp_aSig_uid22_fpSubTest_b_10_wraddr_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist47_exp_aSig_uid22_fpSubTest_b_10_mem_last_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist47_exp_aSig_uid22_fpSubTest_b_10_cmp_b : STD_LOGIC_VECTOR (3 downto 0);
    signal redist47_exp_aSig_uid22_fpSubTest_b_10_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist47_exp_aSig_uid22_fpSubTest_b_10_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist47_exp_aSig_uid22_fpSubTest_b_10_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist47_exp_aSig_uid22_fpSubTest_b_10_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist47_exp_aSig_uid22_fpSubTest_b_10_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist47_exp_aSig_uid22_fpSubTest_b_10_sticky_ena_q : signal is true;
    signal redist47_exp_aSig_uid22_fpSubTest_b_10_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- cAmA_uid87_fpSubTest(CONSTANT,86)
    cAmA_uid87_fpSubTest_q <= "11100";

    -- zs_uid151_lzCountVal_uid86_fpSubTest(CONSTANT,150)
    zs_uid151_lzCountVal_uid86_fpSubTest_q <= "0000000000000000";

    -- sigY_uid11_fpSubTest(BITSELECT,10)@0
    sigY_uid11_fpSubTest_b <= STD_LOGIC_VECTOR(b(31 downto 31));

    -- invSigY_uid12_fpSubTest(LOGICAL,11)@0
    invSigY_uid12_fpSubTest_q <= not (sigY_uid11_fpSubTest_b);

    -- expY_uid10_fpSubTest(BITSELECT,9)@0
    expY_uid10_fpSubTest_b <= b(30 downto 23);

    -- fracY_uid9_fpSubTest(BITSELECT,8)@0
    fracY_uid9_fpSubTest_b <= b(22 downto 0);

    -- ypn_uid13_fpSubTest(BITJOIN,12)@0
    ypn_uid13_fpSubTest_q <= invSigY_uid12_fpSubTest_q & expY_uid10_fpSubTest_b & fracY_uid9_fpSubTest_b;

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- expFracY_uid7_fpSubTest(BITSELECT,6)@0
    expFracY_uid7_fpSubTest_b <= b(30 downto 0);

    -- expFracX_uid6_fpSubTest(BITSELECT,5)@0
    expFracX_uid6_fpSubTest_b <= a(30 downto 0);

    -- xGTEy_uid8_fpSubTest(COMPARE,7)@0
    xGTEy_uid8_fpSubTest_a <= STD_LOGIC_VECTOR("00" & expFracX_uid6_fpSubTest_b);
    xGTEy_uid8_fpSubTest_b <= STD_LOGIC_VECTOR("00" & expFracY_uid7_fpSubTest_b);
    xGTEy_uid8_fpSubTest_o <= STD_LOGIC_VECTOR(UNSIGNED(xGTEy_uid8_fpSubTest_a) - UNSIGNED(xGTEy_uid8_fpSubTest_b));
    xGTEy_uid8_fpSubTest_n(0) <= not (xGTEy_uid8_fpSubTest_o(32));

    -- bSig_uid18_fpSubTest(MUX,17)@0
    bSig_uid18_fpSubTest_s <= xGTEy_uid8_fpSubTest_n;
    bSig_uid18_fpSubTest_combproc: PROCESS (bSig_uid18_fpSubTest_s, a, ypn_uid13_fpSubTest_q)
    BEGIN
        CASE (bSig_uid18_fpSubTest_s) IS
            WHEN "0" => bSig_uid18_fpSubTest_q <= a;
            WHEN "1" => bSig_uid18_fpSubTest_q <= ypn_uid13_fpSubTest_q;
            WHEN OTHERS => bSig_uid18_fpSubTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- sigB_uid52_fpSubTest(BITSELECT,51)@0
    sigB_uid52_fpSubTest_b <= STD_LOGIC_VECTOR(bSig_uid18_fpSubTest_q(31 downto 31));

    -- redist26_sigB_uid52_fpSubTest_b_4(DELAY,283)
    redist26_sigB_uid52_fpSubTest_b_4_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist26_sigB_uid52_fpSubTest_b_4_delay_0 <= (others => '0');
                redist26_sigB_uid52_fpSubTest_b_4_delay_1 <= (others => '0');
                redist26_sigB_uid52_fpSubTest_b_4_delay_2 <= (others => '0');
                redist26_sigB_uid52_fpSubTest_b_4_q <= (others => '0');
            ELSE
                redist26_sigB_uid52_fpSubTest_b_4_delay_0 <= STD_LOGIC_VECTOR(sigB_uid52_fpSubTest_b);
                redist26_sigB_uid52_fpSubTest_b_4_delay_1 <= redist26_sigB_uid52_fpSubTest_b_4_delay_0;
                redist26_sigB_uid52_fpSubTest_b_4_delay_2 <= redist26_sigB_uid52_fpSubTest_b_4_delay_1;
                redist26_sigB_uid52_fpSubTest_b_4_q <= redist26_sigB_uid52_fpSubTest_b_4_delay_2;
            END IF;
        END IF;
    END PROCESS;

    -- aSig_uid17_fpSubTest(MUX,16)@0
    aSig_uid17_fpSubTest_s <= xGTEy_uid8_fpSubTest_n;
    aSig_uid17_fpSubTest_combproc: PROCESS (aSig_uid17_fpSubTest_s, ypn_uid13_fpSubTest_q, a)
    BEGIN
        CASE (aSig_uid17_fpSubTest_s) IS
            WHEN "0" => aSig_uid17_fpSubTest_q <= ypn_uid13_fpSubTest_q;
            WHEN "1" => aSig_uid17_fpSubTest_q <= a;
            WHEN OTHERS => aSig_uid17_fpSubTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- sigA_uid51_fpSubTest(BITSELECT,50)@0
    sigA_uid51_fpSubTest_b <= STD_LOGIC_VECTOR(aSig_uid17_fpSubTest_q(31 downto 31));

    -- redist28_sigA_uid51_fpSubTest_b_4(DELAY,285)
    redist28_sigA_uid51_fpSubTest_b_4_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist28_sigA_uid51_fpSubTest_b_4_delay_0 <= (others => '0');
                redist28_sigA_uid51_fpSubTest_b_4_delay_1 <= (others => '0');
                redist28_sigA_uid51_fpSubTest_b_4_delay_2 <= (others => '0');
                redist28_sigA_uid51_fpSubTest_b_4_q <= (others => '0');
            ELSE
                redist28_sigA_uid51_fpSubTest_b_4_delay_0 <= STD_LOGIC_VECTOR(sigA_uid51_fpSubTest_b);
                redist28_sigA_uid51_fpSubTest_b_4_delay_1 <= redist28_sigA_uid51_fpSubTest_b_4_delay_0;
                redist28_sigA_uid51_fpSubTest_b_4_delay_2 <= redist28_sigA_uid51_fpSubTest_b_4_delay_1;
                redist28_sigA_uid51_fpSubTest_b_4_q <= redist28_sigA_uid51_fpSubTest_b_4_delay_2;
            END IF;
        END IF;
    END PROCESS;

    -- effSub_uid53_fpSubTest(LOGICAL,52)@4 + 1
    effSub_uid53_fpSubTest_qi <= redist28_sigA_uid51_fpSubTest_b_4_q xor redist26_sigB_uid52_fpSubTest_b_4_q;
    effSub_uid53_fpSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => effSub_uid53_fpSubTest_qi, xout => effSub_uid53_fpSubTest_q, clk => clk, aclr => areset, ena => '1' );

    -- exp_bSig_uid36_fpSubTest(BITSELECT,35)@0
    exp_bSig_uid36_fpSubTest_in <= bSig_uid18_fpSubTest_q(30 downto 0);
    exp_bSig_uid36_fpSubTest_b <= exp_bSig_uid36_fpSubTest_in(30 downto 23);

    -- redist39_exp_bSig_uid36_fpSubTest_b_1(DELAY,296)
    redist39_exp_bSig_uid36_fpSubTest_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist39_exp_bSig_uid36_fpSubTest_b_1_q <= (others => '0');
            ELSE
                redist39_exp_bSig_uid36_fpSubTest_b_1_q <= STD_LOGIC_VECTOR(exp_bSig_uid36_fpSubTest_b);
            END IF;
        END IF;
    END PROCESS;

    -- exp_aSig_uid22_fpSubTest(BITSELECT,21)@0
    exp_aSig_uid22_fpSubTest_in <= aSig_uid17_fpSubTest_q(30 downto 0);
    exp_aSig_uid22_fpSubTest_b <= exp_aSig_uid22_fpSubTest_in(30 downto 23);

    -- redist46_exp_aSig_uid22_fpSubTest_b_1(DELAY,303)
    redist46_exp_aSig_uid22_fpSubTest_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist46_exp_aSig_uid22_fpSubTest_b_1_q <= (others => '0');
            ELSE
                redist46_exp_aSig_uid22_fpSubTest_b_1_q <= STD_LOGIC_VECTOR(exp_aSig_uid22_fpSubTest_b);
            END IF;
        END IF;
    END PROCESS;

    -- expAmExpB_uid61_fpSubTest(SUB,60)@1
    expAmExpB_uid61_fpSubTest_a <= STD_LOGIC_VECTOR("0" & redist46_exp_aSig_uid22_fpSubTest_b_1_q);
    expAmExpB_uid61_fpSubTest_b <= STD_LOGIC_VECTOR("0" & redist39_exp_bSig_uid36_fpSubTest_b_1_q);
    expAmExpB_uid61_fpSubTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expAmExpB_uid61_fpSubTest_a) - UNSIGNED(expAmExpB_uid61_fpSubTest_b));
    expAmExpB_uid61_fpSubTest_q <= expAmExpB_uid61_fpSubTest_o(8 downto 0);

    -- cWFP2_uid62_fpSubTest(CONSTANT,61)
    cWFP2_uid62_fpSubTest_q <= "11001";

    -- shiftedOut_uid64_fpSubTest(COMPARE,63)@1 + 1
    shiftedOut_uid64_fpSubTest_a <= STD_LOGIC_VECTOR("000000" & cWFP2_uid62_fpSubTest_q);
    shiftedOut_uid64_fpSubTest_b <= STD_LOGIC_VECTOR("00" & expAmExpB_uid61_fpSubTest_q);
    shiftedOut_uid64_fpSubTest_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                shiftedOut_uid64_fpSubTest_o <= (others => '0');
            ELSE
                shiftedOut_uid64_fpSubTest_o <= STD_LOGIC_VECTOR(UNSIGNED(shiftedOut_uid64_fpSubTest_a) - UNSIGNED(shiftedOut_uid64_fpSubTest_b));
            END IF;
        END IF;
    END PROCESS;
    shiftedOut_uid64_fpSubTest_c(0) <= shiftedOut_uid64_fpSubTest_o(10);

    -- redist24_shiftedOut_uid64_fpSubTest_c_2(DELAY,281)
    redist24_shiftedOut_uid64_fpSubTest_c_2_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist24_shiftedOut_uid64_fpSubTest_c_2_q <= (others => '0');
            ELSE
                redist24_shiftedOut_uid64_fpSubTest_c_2_q <= STD_LOGIC_VECTOR(shiftedOut_uid64_fpSubTest_c);
            END IF;
        END IF;
    END PROCESS;

    -- iShiftedOut_uid68_fpSubTest(LOGICAL,67)@3
    iShiftedOut_uid68_fpSubTest_q <= not (redist24_shiftedOut_uid64_fpSubTest_c_2_q);

    -- zeroOutCst_uid219_alignmentShifter_uid65_fpSubTest(CONSTANT,218)
    zeroOutCst_uid219_alignmentShifter_uid65_fpSubTest_q <= "0000000000000000000000000000000000000000000000000";

    -- rightShiftStage2Idx3Pad48_uid215_alignmentShifter_uid65_fpSubTest(CONSTANT,214)
    rightShiftStage2Idx3Pad48_uid215_alignmentShifter_uid65_fpSubTest_q <= "000000000000000000000000000000000000000000000000";

    -- rightShiftStage2Idx3Rng48_uid214_alignmentShifter_uid65_fpSubTest(BITSELECT,213)@2
    rightShiftStage2Idx3Rng48_uid214_alignmentShifter_uid65_fpSubTest_b <= rightShiftStage1_uid207_alignmentShifter_uid65_fpSubTest_q(48 downto 48);

    -- rightShiftStage2Idx3_uid216_alignmentShifter_uid65_fpSubTest(BITJOIN,215)@2
    rightShiftStage2Idx3_uid216_alignmentShifter_uid65_fpSubTest_q <= rightShiftStage2Idx3Pad48_uid215_alignmentShifter_uid65_fpSubTest_q & rightShiftStage2Idx3Rng48_uid214_alignmentShifter_uid65_fpSubTest_b;

    -- rightShiftStage2Idx2Pad32_uid212_alignmentShifter_uid65_fpSubTest(CONSTANT,211)
    rightShiftStage2Idx2Pad32_uid212_alignmentShifter_uid65_fpSubTest_q <= "00000000000000000000000000000000";

    -- rightShiftStage2Idx2Rng32_uid211_alignmentShifter_uid65_fpSubTest(BITSELECT,210)@2
    rightShiftStage2Idx2Rng32_uid211_alignmentShifter_uid65_fpSubTest_b <= rightShiftStage1_uid207_alignmentShifter_uid65_fpSubTest_q(48 downto 32);

    -- rightShiftStage2Idx2_uid213_alignmentShifter_uid65_fpSubTest(BITJOIN,212)@2
    rightShiftStage2Idx2_uid213_alignmentShifter_uid65_fpSubTest_q <= rightShiftStage2Idx2Pad32_uid212_alignmentShifter_uid65_fpSubTest_q & rightShiftStage2Idx2Rng32_uid211_alignmentShifter_uid65_fpSubTest_b;

    -- rightShiftStage2Idx1Rng16_uid208_alignmentShifter_uid65_fpSubTest(BITSELECT,207)@2
    rightShiftStage2Idx1Rng16_uid208_alignmentShifter_uid65_fpSubTest_b <= rightShiftStage1_uid207_alignmentShifter_uid65_fpSubTest_q(48 downto 16);

    -- rightShiftStage2Idx1_uid210_alignmentShifter_uid65_fpSubTest(BITJOIN,209)@2
    rightShiftStage2Idx1_uid210_alignmentShifter_uid65_fpSubTest_q <= zs_uid151_lzCountVal_uid86_fpSubTest_q & rightShiftStage2Idx1Rng16_uid208_alignmentShifter_uid65_fpSubTest_b;

    -- rightShiftStage1Idx3Pad12_uid204_alignmentShifter_uid65_fpSubTest(CONSTANT,203)
    rightShiftStage1Idx3Pad12_uid204_alignmentShifter_uid65_fpSubTest_q <= "000000000000";

    -- rightShiftStage1Idx3Rng12_uid203_alignmentShifter_uid65_fpSubTest(BITSELECT,202)@2
    rightShiftStage1Idx3Rng12_uid203_alignmentShifter_uid65_fpSubTest_b <= rightShiftStage0_uid196_alignmentShifter_uid65_fpSubTest_q(48 downto 12);

    -- rightShiftStage1Idx3_uid205_alignmentShifter_uid65_fpSubTest(BITJOIN,204)@2
    rightShiftStage1Idx3_uid205_alignmentShifter_uid65_fpSubTest_q <= rightShiftStage1Idx3Pad12_uid204_alignmentShifter_uid65_fpSubTest_q & rightShiftStage1Idx3Rng12_uid203_alignmentShifter_uid65_fpSubTest_b;

    -- cstAllZWE_uid21_fpSubTest(CONSTANT,20)
    cstAllZWE_uid21_fpSubTest_q <= "00000000";

    -- rightShiftStage1Idx2Rng8_uid200_alignmentShifter_uid65_fpSubTest(BITSELECT,199)@2
    rightShiftStage1Idx2Rng8_uid200_alignmentShifter_uid65_fpSubTest_b <= rightShiftStage0_uid196_alignmentShifter_uid65_fpSubTest_q(48 downto 8);

    -- rightShiftStage1Idx2_uid202_alignmentShifter_uid65_fpSubTest(BITJOIN,201)@2
    rightShiftStage1Idx2_uid202_alignmentShifter_uid65_fpSubTest_q <= cstAllZWE_uid21_fpSubTest_q & rightShiftStage1Idx2Rng8_uid200_alignmentShifter_uid65_fpSubTest_b;

    -- zs_uid165_lzCountVal_uid86_fpSubTest(CONSTANT,164)
    zs_uid165_lzCountVal_uid86_fpSubTest_q <= "0000";

    -- rightShiftStage1Idx1Rng4_uid197_alignmentShifter_uid65_fpSubTest(BITSELECT,196)@2
    rightShiftStage1Idx1Rng4_uid197_alignmentShifter_uid65_fpSubTest_b <= rightShiftStage0_uid196_alignmentShifter_uid65_fpSubTest_q(48 downto 4);

    -- rightShiftStage1Idx1_uid199_alignmentShifter_uid65_fpSubTest(BITJOIN,198)@2
    rightShiftStage1Idx1_uid199_alignmentShifter_uid65_fpSubTest_q <= zs_uid165_lzCountVal_uid86_fpSubTest_q & rightShiftStage1Idx1Rng4_uid197_alignmentShifter_uid65_fpSubTest_b;

    -- rightShiftStage0Idx3Pad3_uid193_alignmentShifter_uid65_fpSubTest(CONSTANT,192)
    rightShiftStage0Idx3Pad3_uid193_alignmentShifter_uid65_fpSubTest_q <= "000";

    -- rightShiftStage0Idx3Rng3_uid192_alignmentShifter_uid65_fpSubTest(BITSELECT,191)@2
    rightShiftStage0Idx3Rng3_uid192_alignmentShifter_uid65_fpSubTest_b <= rightPaddedIn_uid66_fpSubTest_q(48 downto 3);

    -- rightShiftStage0Idx3_uid194_alignmentShifter_uid65_fpSubTest(BITJOIN,193)@2
    rightShiftStage0Idx3_uid194_alignmentShifter_uid65_fpSubTest_q <= rightShiftStage0Idx3Pad3_uid193_alignmentShifter_uid65_fpSubTest_q & rightShiftStage0Idx3Rng3_uid192_alignmentShifter_uid65_fpSubTest_b;

    -- zs_uid171_lzCountVal_uid86_fpSubTest(CONSTANT,170)
    zs_uid171_lzCountVal_uid86_fpSubTest_q <= "00";

    -- rightShiftStage0Idx2Rng2_uid189_alignmentShifter_uid65_fpSubTest(BITSELECT,188)@2
    rightShiftStage0Idx2Rng2_uid189_alignmentShifter_uid65_fpSubTest_b <= rightPaddedIn_uid66_fpSubTest_q(48 downto 2);

    -- rightShiftStage0Idx2_uid191_alignmentShifter_uid65_fpSubTest(BITJOIN,190)@2
    rightShiftStage0Idx2_uid191_alignmentShifter_uid65_fpSubTest_q <= zs_uid171_lzCountVal_uid86_fpSubTest_q & rightShiftStage0Idx2Rng2_uid189_alignmentShifter_uid65_fpSubTest_b;

    -- rightShiftStage0Idx1Rng1_uid186_alignmentShifter_uid65_fpSubTest(BITSELECT,185)@2
    rightShiftStage0Idx1Rng1_uid186_alignmentShifter_uid65_fpSubTest_b <= rightPaddedIn_uid66_fpSubTest_q(48 downto 1);

    -- rightShiftStage0Idx1_uid188_alignmentShifter_uid65_fpSubTest(BITJOIN,187)@2
    rightShiftStage0Idx1_uid188_alignmentShifter_uid65_fpSubTest_q <= GND_q & rightShiftStage0Idx1Rng1_uid186_alignmentShifter_uid65_fpSubTest_b;

    -- excZ_bSig_uid18_uid38_fpSubTest(LOGICAL,37)@1
    excZ_bSig_uid18_uid38_fpSubTest_q <= "1" WHEN redist39_exp_bSig_uid36_fpSubTest_b_1_q = cstAllZWE_uid21_fpSubTest_q ELSE "0";

    -- redist35_excZ_bSig_uid18_uid38_fpSubTest_q_1(DELAY,292)
    redist35_excZ_bSig_uid18_uid38_fpSubTest_q_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist35_excZ_bSig_uid18_uid38_fpSubTest_q_1_q <= (others => '0');
            ELSE
                redist35_excZ_bSig_uid18_uid38_fpSubTest_q_1_q <= STD_LOGIC_VECTOR(excZ_bSig_uid18_uid38_fpSubTest_q);
            END IF;
        END IF;
    END PROCESS;

    -- InvExpXIsZero_uid45_fpSubTest(LOGICAL,44)@2
    InvExpXIsZero_uid45_fpSubTest_q <= not (redist35_excZ_bSig_uid18_uid38_fpSubTest_q_1_q);

    -- cstZeroWF_uid20_fpSubTest(CONSTANT,19)
    cstZeroWF_uid20_fpSubTest_q <= "00000000000000000000000";

    -- frac_bSig_uid37_fpSubTest(BITSELECT,36)@0
    frac_bSig_uid37_fpSubTest_in <= bSig_uid18_fpSubTest_q(22 downto 0);
    frac_bSig_uid37_fpSubTest_b <= frac_bSig_uid37_fpSubTest_in(22 downto 0);

    -- redist38_frac_bSig_uid37_fpSubTest_b_1(DELAY,295)
    redist38_frac_bSig_uid37_fpSubTest_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist38_frac_bSig_uid37_fpSubTest_b_1_q <= (others => '0');
            ELSE
                redist38_frac_bSig_uid37_fpSubTest_b_1_q <= STD_LOGIC_VECTOR(frac_bSig_uid37_fpSubTest_b);
            END IF;
        END IF;
    END PROCESS;

    -- fracBz_uid57_fpSubTest(MUX,56)@1 + 1
    fracBz_uid57_fpSubTest_s <= excZ_bSig_uid18_uid38_fpSubTest_q;
    fracBz_uid57_fpSubTest_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                fracBz_uid57_fpSubTest_q <= (others => '0');
            ELSE
                CASE (fracBz_uid57_fpSubTest_s) IS
                    WHEN "0" => fracBz_uid57_fpSubTest_q <= redist38_frac_bSig_uid37_fpSubTest_b_1_q;
                    WHEN "1" => fracBz_uid57_fpSubTest_q <= cstZeroWF_uid20_fpSubTest_q;
                    WHEN OTHERS => fracBz_uid57_fpSubTest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;

    -- oFracB_uid60_fpSubTest(BITJOIN,59)@2
    oFracB_uid60_fpSubTest_q <= InvExpXIsZero_uid45_fpSubTest_q & fracBz_uid57_fpSubTest_q;

    -- padConst_uid65_fpSubTest(CONSTANT,64)
    padConst_uid65_fpSubTest_q <= "0000000000000000000000000";

    -- rightPaddedIn_uid66_fpSubTest(BITJOIN,65)@2
    rightPaddedIn_uid66_fpSubTest_q <= oFracB_uid60_fpSubTest_q & padConst_uid65_fpSubTest_q;

    -- rightShiftStageSel0Dto0_uid195_alignmentShifter_uid65_fpSubTest_merged_bit_select(BITSELECT,251)@1
    rightShiftStageSel0Dto0_uid195_alignmentShifter_uid65_fpSubTest_merged_bit_select_in <= expAmExpB_uid61_fpSubTest_q(5 downto 0);
    rightShiftStageSel0Dto0_uid195_alignmentShifter_uid65_fpSubTest_merged_bit_select_b <= rightShiftStageSel0Dto0_uid195_alignmentShifter_uid65_fpSubTest_merged_bit_select_in(1 downto 0);
    rightShiftStageSel0Dto0_uid195_alignmentShifter_uid65_fpSubTest_merged_bit_select_c <= rightShiftStageSel0Dto0_uid195_alignmentShifter_uid65_fpSubTest_merged_bit_select_in(3 downto 2);
    rightShiftStageSel0Dto0_uid195_alignmentShifter_uid65_fpSubTest_merged_bit_select_d <= rightShiftStageSel0Dto0_uid195_alignmentShifter_uid65_fpSubTest_merged_bit_select_in(5 downto 4);

    -- redist5_rightShiftStageSel0Dto0_uid195_alignmentShifter_uid65_fpSubTest_merged_bit_select_b_1(DELAY,262)
    redist5_rightShiftStageSel0Dto0_uid195_alignmentShifter_uid65_fpSubTest_merged_bit_select_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist5_rightShiftStageSel0Dto0_uid195_alignmentShifter_uid65_fpSubTest_merged_bit_select_b_1_q <= (others => '0');
            ELSE
                redist5_rightShiftStageSel0Dto0_uid195_alignmentShifter_uid65_fpSubTest_merged_bit_select_b_1_q <= STD_LOGIC_VECTOR(rightShiftStageSel0Dto0_uid195_alignmentShifter_uid65_fpSubTest_merged_bit_select_b);
            END IF;
        END IF;
    END PROCESS;

    -- rightShiftStage0_uid196_alignmentShifter_uid65_fpSubTest(MUX,195)@2
    rightShiftStage0_uid196_alignmentShifter_uid65_fpSubTest_s <= redist5_rightShiftStageSel0Dto0_uid195_alignmentShifter_uid65_fpSubTest_merged_bit_select_b_1_q;
    rightShiftStage0_uid196_alignmentShifter_uid65_fpSubTest_combproc: PROCESS (rightShiftStage0_uid196_alignmentShifter_uid65_fpSubTest_s, rightPaddedIn_uid66_fpSubTest_q, rightShiftStage0Idx1_uid188_alignmentShifter_uid65_fpSubTest_q, rightShiftStage0Idx2_uid191_alignmentShifter_uid65_fpSubTest_q, rightShiftStage0Idx3_uid194_alignmentShifter_uid65_fpSubTest_q)
    BEGIN
        CASE (rightShiftStage0_uid196_alignmentShifter_uid65_fpSubTest_s) IS
            WHEN "00" => rightShiftStage0_uid196_alignmentShifter_uid65_fpSubTest_q <= rightPaddedIn_uid66_fpSubTest_q;
            WHEN "01" => rightShiftStage0_uid196_alignmentShifter_uid65_fpSubTest_q <= rightShiftStage0Idx1_uid188_alignmentShifter_uid65_fpSubTest_q;
            WHEN "10" => rightShiftStage0_uid196_alignmentShifter_uid65_fpSubTest_q <= rightShiftStage0Idx2_uid191_alignmentShifter_uid65_fpSubTest_q;
            WHEN "11" => rightShiftStage0_uid196_alignmentShifter_uid65_fpSubTest_q <= rightShiftStage0Idx3_uid194_alignmentShifter_uid65_fpSubTest_q;
            WHEN OTHERS => rightShiftStage0_uid196_alignmentShifter_uid65_fpSubTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist6_rightShiftStageSel0Dto0_uid195_alignmentShifter_uid65_fpSubTest_merged_bit_select_c_1(DELAY,263)
    redist6_rightShiftStageSel0Dto0_uid195_alignmentShifter_uid65_fpSubTest_merged_bit_select_c_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist6_rightShiftStageSel0Dto0_uid195_alignmentShifter_uid65_fpSubTest_merged_bit_select_c_1_q <= (others => '0');
            ELSE
                redist6_rightShiftStageSel0Dto0_uid195_alignmentShifter_uid65_fpSubTest_merged_bit_select_c_1_q <= STD_LOGIC_VECTOR(rightShiftStageSel0Dto0_uid195_alignmentShifter_uid65_fpSubTest_merged_bit_select_c);
            END IF;
        END IF;
    END PROCESS;

    -- rightShiftStage1_uid207_alignmentShifter_uid65_fpSubTest(MUX,206)@2
    rightShiftStage1_uid207_alignmentShifter_uid65_fpSubTest_s <= redist6_rightShiftStageSel0Dto0_uid195_alignmentShifter_uid65_fpSubTest_merged_bit_select_c_1_q;
    rightShiftStage1_uid207_alignmentShifter_uid65_fpSubTest_combproc: PROCESS (rightShiftStage1_uid207_alignmentShifter_uid65_fpSubTest_s, rightShiftStage0_uid196_alignmentShifter_uid65_fpSubTest_q, rightShiftStage1Idx1_uid199_alignmentShifter_uid65_fpSubTest_q, rightShiftStage1Idx2_uid202_alignmentShifter_uid65_fpSubTest_q, rightShiftStage1Idx3_uid205_alignmentShifter_uid65_fpSubTest_q)
    BEGIN
        CASE (rightShiftStage1_uid207_alignmentShifter_uid65_fpSubTest_s) IS
            WHEN "00" => rightShiftStage1_uid207_alignmentShifter_uid65_fpSubTest_q <= rightShiftStage0_uid196_alignmentShifter_uid65_fpSubTest_q;
            WHEN "01" => rightShiftStage1_uid207_alignmentShifter_uid65_fpSubTest_q <= rightShiftStage1Idx1_uid199_alignmentShifter_uid65_fpSubTest_q;
            WHEN "10" => rightShiftStage1_uid207_alignmentShifter_uid65_fpSubTest_q <= rightShiftStage1Idx2_uid202_alignmentShifter_uid65_fpSubTest_q;
            WHEN "11" => rightShiftStage1_uid207_alignmentShifter_uid65_fpSubTest_q <= rightShiftStage1Idx3_uid205_alignmentShifter_uid65_fpSubTest_q;
            WHEN OTHERS => rightShiftStage1_uid207_alignmentShifter_uid65_fpSubTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist7_rightShiftStageSel0Dto0_uid195_alignmentShifter_uid65_fpSubTest_merged_bit_select_d_1(DELAY,264)
    redist7_rightShiftStageSel0Dto0_uid195_alignmentShifter_uid65_fpSubTest_merged_bit_select_d_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist7_rightShiftStageSel0Dto0_uid195_alignmentShifter_uid65_fpSubTest_merged_bit_select_d_1_q <= (others => '0');
            ELSE
                redist7_rightShiftStageSel0Dto0_uid195_alignmentShifter_uid65_fpSubTest_merged_bit_select_d_1_q <= STD_LOGIC_VECTOR(rightShiftStageSel0Dto0_uid195_alignmentShifter_uid65_fpSubTest_merged_bit_select_d);
            END IF;
        END IF;
    END PROCESS;

    -- rightShiftStage2_uid218_alignmentShifter_uid65_fpSubTest(MUX,217)@2 + 1
    rightShiftStage2_uid218_alignmentShifter_uid65_fpSubTest_s <= redist7_rightShiftStageSel0Dto0_uid195_alignmentShifter_uid65_fpSubTest_merged_bit_select_d_1_q;
    rightShiftStage2_uid218_alignmentShifter_uid65_fpSubTest_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                rightShiftStage2_uid218_alignmentShifter_uid65_fpSubTest_q <= (others => '0');
            ELSE
                CASE (rightShiftStage2_uid218_alignmentShifter_uid65_fpSubTest_s) IS
                    WHEN "00" => rightShiftStage2_uid218_alignmentShifter_uid65_fpSubTest_q <= rightShiftStage1_uid207_alignmentShifter_uid65_fpSubTest_q;
                    WHEN "01" => rightShiftStage2_uid218_alignmentShifter_uid65_fpSubTest_q <= rightShiftStage2Idx1_uid210_alignmentShifter_uid65_fpSubTest_q;
                    WHEN "10" => rightShiftStage2_uid218_alignmentShifter_uid65_fpSubTest_q <= rightShiftStage2Idx2_uid213_alignmentShifter_uid65_fpSubTest_q;
                    WHEN "11" => rightShiftStage2_uid218_alignmentShifter_uid65_fpSubTest_q <= rightShiftStage2Idx3_uid216_alignmentShifter_uid65_fpSubTest_q;
                    WHEN OTHERS => rightShiftStage2_uid218_alignmentShifter_uid65_fpSubTest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;

    -- wIntCst_uid184_alignmentShifter_uid65_fpSubTest(CONSTANT,183)
    wIntCst_uid184_alignmentShifter_uid65_fpSubTest_q <= "110001";

    -- shiftedOut_uid185_alignmentShifter_uid65_fpSubTest(COMPARE,184)@1 + 1
    shiftedOut_uid185_alignmentShifter_uid65_fpSubTest_a <= STD_LOGIC_VECTOR("00" & expAmExpB_uid61_fpSubTest_q);
    shiftedOut_uid185_alignmentShifter_uid65_fpSubTest_b <= STD_LOGIC_VECTOR("00000" & wIntCst_uid184_alignmentShifter_uid65_fpSubTest_q);
    shiftedOut_uid185_alignmentShifter_uid65_fpSubTest_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                shiftedOut_uid185_alignmentShifter_uid65_fpSubTest_o <= (others => '0');
            ELSE
                shiftedOut_uid185_alignmentShifter_uid65_fpSubTest_o <= STD_LOGIC_VECTOR(UNSIGNED(shiftedOut_uid185_alignmentShifter_uid65_fpSubTest_a) - UNSIGNED(shiftedOut_uid185_alignmentShifter_uid65_fpSubTest_b));
            END IF;
        END IF;
    END PROCESS;
    shiftedOut_uid185_alignmentShifter_uid65_fpSubTest_n(0) <= not (shiftedOut_uid185_alignmentShifter_uid65_fpSubTest_o(10));

    -- redist8_shiftedOut_uid185_alignmentShifter_uid65_fpSubTest_n_2(DELAY,265)
    redist8_shiftedOut_uid185_alignmentShifter_uid65_fpSubTest_n_2_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist8_shiftedOut_uid185_alignmentShifter_uid65_fpSubTest_n_2_q <= (others => '0');
            ELSE
                redist8_shiftedOut_uid185_alignmentShifter_uid65_fpSubTest_n_2_q <= STD_LOGIC_VECTOR(shiftedOut_uid185_alignmentShifter_uid65_fpSubTest_n);
            END IF;
        END IF;
    END PROCESS;

    -- r_uid220_alignmentShifter_uid65_fpSubTest(MUX,219)@3
    r_uid220_alignmentShifter_uid65_fpSubTest_s <= redist8_shiftedOut_uid185_alignmentShifter_uid65_fpSubTest_n_2_q;
    r_uid220_alignmentShifter_uid65_fpSubTest_combproc: PROCESS (r_uid220_alignmentShifter_uid65_fpSubTest_s, rightShiftStage2_uid218_alignmentShifter_uid65_fpSubTest_q, zeroOutCst_uid219_alignmentShifter_uid65_fpSubTest_q)
    BEGIN
        CASE (r_uid220_alignmentShifter_uid65_fpSubTest_s) IS
            WHEN "0" => r_uid220_alignmentShifter_uid65_fpSubTest_q <= rightShiftStage2_uid218_alignmentShifter_uid65_fpSubTest_q;
            WHEN "1" => r_uid220_alignmentShifter_uid65_fpSubTest_q <= zeroOutCst_uid219_alignmentShifter_uid65_fpSubTest_q;
            WHEN OTHERS => r_uid220_alignmentShifter_uid65_fpSubTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- alignFracBPostShiftOut_uid69_fpSubTest(LOGICAL,68)@3 + 1
    alignFracBPostShiftOut_uid69_fpSubTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((48 downto 1 => iShiftedOut_uid68_fpSubTest_q(0)) & iShiftedOut_uid68_fpSubTest_q));
    alignFracBPostShiftOut_uid69_fpSubTest_qi <= r_uid220_alignmentShifter_uid65_fpSubTest_q and alignFracBPostShiftOut_uid69_fpSubTest_b;
    alignFracBPostShiftOut_uid69_fpSubTest_delay : dspba_delay
    GENERIC MAP ( width => 49, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => alignFracBPostShiftOut_uid69_fpSubTest_qi, xout => alignFracBPostShiftOut_uid69_fpSubTest_q, clk => clk, aclr => areset, ena => '1' );

    -- stickyBits_uid70_fpSubTest_merged_bit_select(BITSELECT,252)@4
    stickyBits_uid70_fpSubTest_merged_bit_select_b <= alignFracBPostShiftOut_uid69_fpSubTest_q(22 downto 0);
    stickyBits_uid70_fpSubTest_merged_bit_select_c <= alignFracBPostShiftOut_uid69_fpSubTest_q(48 downto 23);

    -- redist4_stickyBits_uid70_fpSubTest_merged_bit_select_c_1(DELAY,261)
    redist4_stickyBits_uid70_fpSubTest_merged_bit_select_c_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist4_stickyBits_uid70_fpSubTest_merged_bit_select_c_1_q <= (others => '0');
            ELSE
                redist4_stickyBits_uid70_fpSubTest_merged_bit_select_c_1_q <= STD_LOGIC_VECTOR(stickyBits_uid70_fpSubTest_merged_bit_select_c);
            END IF;
        END IF;
    END PROCESS;

    -- fracBAddOp_uid81_fpSubTest(BITJOIN,80)@5
    fracBAddOp_uid81_fpSubTest_q <= GND_q & redist4_stickyBits_uid70_fpSubTest_merged_bit_select_c_1_q;

    -- fracBAddOpPostXor_uid82_fpSubTest(LOGICAL,81)@5
    fracBAddOpPostXor_uid82_fpSubTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 1 => effSub_uid53_fpSubTest_q(0)) & effSub_uid53_fpSubTest_q));
    fracBAddOpPostXor_uid82_fpSubTest_q <= fracBAddOp_uid81_fpSubTest_q xor fracBAddOpPostXor_uid82_fpSubTest_b;

    -- zocst_uid77_fpSubTest(CONSTANT,76)
    zocst_uid77_fpSubTest_q <= "01";

    -- frac_aSig_uid23_fpSubTest(BITSELECT,22)@0
    frac_aSig_uid23_fpSubTest_in <= aSig_uid17_fpSubTest_q(22 downto 0);
    frac_aSig_uid23_fpSubTest_b <= frac_aSig_uid23_fpSubTest_in(22 downto 0);

    -- redist45_frac_aSig_uid23_fpSubTest_b_5_inputreg0(DELAY,305)
    redist45_frac_aSig_uid23_fpSubTest_b_5_inputreg0_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist45_frac_aSig_uid23_fpSubTest_b_5_inputreg0_q <= (others => '0');
            ELSE
                redist45_frac_aSig_uid23_fpSubTest_b_5_inputreg0_q <= STD_LOGIC_VECTOR(frac_aSig_uid23_fpSubTest_b);
            END IF;
        END IF;
    END PROCESS;

    -- redist45_frac_aSig_uid23_fpSubTest_b_5(DELAY,302)
    redist45_frac_aSig_uid23_fpSubTest_b_5_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist45_frac_aSig_uid23_fpSubTest_b_5_delay_0 <= (others => '0');
                redist45_frac_aSig_uid23_fpSubTest_b_5_delay_1 <= (others => '0');
                redist45_frac_aSig_uid23_fpSubTest_b_5_delay_2 <= (others => '0');
                redist45_frac_aSig_uid23_fpSubTest_b_5_q <= (others => '0');
            ELSE
                redist45_frac_aSig_uid23_fpSubTest_b_5_delay_0 <= STD_LOGIC_VECTOR(redist45_frac_aSig_uid23_fpSubTest_b_5_inputreg0_q);
                redist45_frac_aSig_uid23_fpSubTest_b_5_delay_1 <= redist45_frac_aSig_uid23_fpSubTest_b_5_delay_0;
                redist45_frac_aSig_uid23_fpSubTest_b_5_delay_2 <= redist45_frac_aSig_uid23_fpSubTest_b_5_delay_1;
                redist45_frac_aSig_uid23_fpSubTest_b_5_q <= redist45_frac_aSig_uid23_fpSubTest_b_5_delay_2;
            END IF;
        END IF;
    END PROCESS;

    -- cmpEQ_stickyBits_cZwF_uid72_fpSubTest(LOGICAL,71)@4 + 1
    cmpEQ_stickyBits_cZwF_uid72_fpSubTest_qi <= "1" WHEN stickyBits_uid70_fpSubTest_merged_bit_select_b = cstZeroWF_uid20_fpSubTest_q ELSE "0";
    cmpEQ_stickyBits_cZwF_uid72_fpSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => cmpEQ_stickyBits_cZwF_uid72_fpSubTest_qi, xout => cmpEQ_stickyBits_cZwF_uid72_fpSubTest_q, clk => clk, aclr => areset, ena => '1' );

    -- effSubInvSticky_uid75_fpSubTest(LOGICAL,74)@5
    effSubInvSticky_uid75_fpSubTest_q <= effSub_uid53_fpSubTest_q and cmpEQ_stickyBits_cZwF_uid72_fpSubTest_q;

    -- fracAAddOp_uid78_fpSubTest(BITJOIN,77)@5
    fracAAddOp_uid78_fpSubTest_q <= zocst_uid77_fpSubTest_q & redist45_frac_aSig_uid23_fpSubTest_b_5_q & GND_q & effSubInvSticky_uid75_fpSubTest_q;

    -- fracAddResult_uid83_fpSubTest(ADD,82)@5
    fracAddResult_uid83_fpSubTest_a <= STD_LOGIC_VECTOR("0" & fracAAddOp_uid78_fpSubTest_q);
    fracAddResult_uid83_fpSubTest_b <= STD_LOGIC_VECTOR("0" & fracBAddOpPostXor_uid82_fpSubTest_q);
    fracAddResult_uid83_fpSubTest_o <= STD_LOGIC_VECTOR(UNSIGNED(fracAddResult_uid83_fpSubTest_a) + UNSIGNED(fracAddResult_uid83_fpSubTest_b));
    fracAddResult_uid83_fpSubTest_q <= fracAddResult_uid83_fpSubTest_o(27 downto 0);

    -- rangeFracAddResultMwfp3Dto0_uid84_fpSubTest(BITSELECT,83)@5
    rangeFracAddResultMwfp3Dto0_uid84_fpSubTest_in <= fracAddResult_uid83_fpSubTest_q(26 downto 0);
    rangeFracAddResultMwfp3Dto0_uid84_fpSubTest_b <= rangeFracAddResultMwfp3Dto0_uid84_fpSubTest_in(26 downto 0);

    -- redist23_rangeFracAddResultMwfp3Dto0_uid84_fpSubTest_b_1(DELAY,280)
    redist23_rangeFracAddResultMwfp3Dto0_uid84_fpSubTest_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist23_rangeFracAddResultMwfp3Dto0_uid84_fpSubTest_b_1_q <= (others => '0');
            ELSE
                redist23_rangeFracAddResultMwfp3Dto0_uid84_fpSubTest_b_1_q <= STD_LOGIC_VECTOR(rangeFracAddResultMwfp3Dto0_uid84_fpSubTest_b);
            END IF;
        END IF;
    END PROCESS;

    -- invCmpEQ_stickyBits_cZwF_uid73_fpSubTest(LOGICAL,72)@5 + 1
    invCmpEQ_stickyBits_cZwF_uid73_fpSubTest_qi <= not (cmpEQ_stickyBits_cZwF_uid72_fpSubTest_q);
    invCmpEQ_stickyBits_cZwF_uid73_fpSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => invCmpEQ_stickyBits_cZwF_uid73_fpSubTest_qi, xout => invCmpEQ_stickyBits_cZwF_uid73_fpSubTest_q, clk => clk, aclr => areset, ena => '1' );

    -- fracGRS_uid85_fpSubTest(BITJOIN,84)@6
    fracGRS_uid85_fpSubTest_q <= redist23_rangeFracAddResultMwfp3Dto0_uid84_fpSubTest_b_1_q & invCmpEQ_stickyBits_cZwF_uid73_fpSubTest_q;

    -- rVStage_uid152_lzCountVal_uid86_fpSubTest(BITSELECT,151)@6
    rVStage_uid152_lzCountVal_uid86_fpSubTest_b <= fracGRS_uid85_fpSubTest_q(27 downto 12);

    -- vCount_uid153_lzCountVal_uid86_fpSubTest(LOGICAL,152)@6 + 1
    vCount_uid153_lzCountVal_uid86_fpSubTest_qi <= "1" WHEN rVStage_uid152_lzCountVal_uid86_fpSubTest_b = zs_uid151_lzCountVal_uid86_fpSubTest_q ELSE "0";
    vCount_uid153_lzCountVal_uid86_fpSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => vCount_uid153_lzCountVal_uid86_fpSubTest_qi, xout => vCount_uid153_lzCountVal_uid86_fpSubTest_q, clk => clk, aclr => areset, ena => '1' );

    -- redist13_vCount_uid153_lzCountVal_uid86_fpSubTest_q_3(DELAY,270)
    redist13_vCount_uid153_lzCountVal_uid86_fpSubTest_q_3_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist13_vCount_uid153_lzCountVal_uid86_fpSubTest_q_3_delay_0 <= (others => '0');
                redist13_vCount_uid153_lzCountVal_uid86_fpSubTest_q_3_q <= (others => '0');
            ELSE
                redist13_vCount_uid153_lzCountVal_uid86_fpSubTest_q_3_delay_0 <= STD_LOGIC_VECTOR(vCount_uid153_lzCountVal_uid86_fpSubTest_q);
                redist13_vCount_uid153_lzCountVal_uid86_fpSubTest_q_3_q <= redist13_vCount_uid153_lzCountVal_uid86_fpSubTest_q_3_delay_0;
            END IF;
        END IF;
    END PROCESS;

    -- redist21_fracGRS_uid85_fpSubTest_q_1(DELAY,278)
    redist21_fracGRS_uid85_fpSubTest_q_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist21_fracGRS_uid85_fpSubTest_q_1_q <= (others => '0');
            ELSE
                redist21_fracGRS_uid85_fpSubTest_q_1_q <= STD_LOGIC_VECTOR(fracGRS_uid85_fpSubTest_q);
            END IF;
        END IF;
    END PROCESS;

    -- vStage_uid155_lzCountVal_uid86_fpSubTest(BITSELECT,154)@7
    vStage_uid155_lzCountVal_uid86_fpSubTest_in <= redist21_fracGRS_uid85_fpSubTest_q_1_q(11 downto 0);
    vStage_uid155_lzCountVal_uid86_fpSubTest_b <= vStage_uid155_lzCountVal_uid86_fpSubTest_in(11 downto 0);

    -- mO_uid154_lzCountVal_uid86_fpSubTest(CONSTANT,153)
    mO_uid154_lzCountVal_uid86_fpSubTest_q <= "1111";

    -- cStage_uid156_lzCountVal_uid86_fpSubTest(BITJOIN,155)@7
    cStage_uid156_lzCountVal_uid86_fpSubTest_q <= vStage_uid155_lzCountVal_uid86_fpSubTest_b & mO_uid154_lzCountVal_uid86_fpSubTest_q;

    -- redist14_rVStage_uid152_lzCountVal_uid86_fpSubTest_b_1(DELAY,271)
    redist14_rVStage_uid152_lzCountVal_uid86_fpSubTest_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist14_rVStage_uid152_lzCountVal_uid86_fpSubTest_b_1_q <= (others => '0');
            ELSE
                redist14_rVStage_uid152_lzCountVal_uid86_fpSubTest_b_1_q <= STD_LOGIC_VECTOR(rVStage_uid152_lzCountVal_uid86_fpSubTest_b);
            END IF;
        END IF;
    END PROCESS;

    -- vStagei_uid158_lzCountVal_uid86_fpSubTest(MUX,157)@7
    vStagei_uid158_lzCountVal_uid86_fpSubTest_s <= vCount_uid153_lzCountVal_uid86_fpSubTest_q;
    vStagei_uid158_lzCountVal_uid86_fpSubTest_combproc: PROCESS (vStagei_uid158_lzCountVal_uid86_fpSubTest_s, redist14_rVStage_uid152_lzCountVal_uid86_fpSubTest_b_1_q, cStage_uid156_lzCountVal_uid86_fpSubTest_q)
    BEGIN
        CASE (vStagei_uid158_lzCountVal_uid86_fpSubTest_s) IS
            WHEN "0" => vStagei_uid158_lzCountVal_uid86_fpSubTest_q <= redist14_rVStage_uid152_lzCountVal_uid86_fpSubTest_b_1_q;
            WHEN "1" => vStagei_uid158_lzCountVal_uid86_fpSubTest_q <= cStage_uid156_lzCountVal_uid86_fpSubTest_q;
            WHEN OTHERS => vStagei_uid158_lzCountVal_uid86_fpSubTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid160_lzCountVal_uid86_fpSubTest_merged_bit_select(BITSELECT,253)@7
    rVStage_uid160_lzCountVal_uid86_fpSubTest_merged_bit_select_b <= vStagei_uid158_lzCountVal_uid86_fpSubTest_q(15 downto 8);
    rVStage_uid160_lzCountVal_uid86_fpSubTest_merged_bit_select_c <= vStagei_uid158_lzCountVal_uid86_fpSubTest_q(7 downto 0);

    -- vCount_uid161_lzCountVal_uid86_fpSubTest(LOGICAL,160)@7 + 1
    vCount_uid161_lzCountVal_uid86_fpSubTest_qi <= "1" WHEN rVStage_uid160_lzCountVal_uid86_fpSubTest_merged_bit_select_b = cstAllZWE_uid21_fpSubTest_q ELSE "0";
    vCount_uid161_lzCountVal_uid86_fpSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => vCount_uid161_lzCountVal_uid86_fpSubTest_qi, xout => vCount_uid161_lzCountVal_uid86_fpSubTest_q, clk => clk, aclr => areset, ena => '1' );

    -- redist11_vCount_uid161_lzCountVal_uid86_fpSubTest_q_2(DELAY,268)
    redist11_vCount_uid161_lzCountVal_uid86_fpSubTest_q_2_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist11_vCount_uid161_lzCountVal_uid86_fpSubTest_q_2_q <= (others => '0');
            ELSE
                redist11_vCount_uid161_lzCountVal_uid86_fpSubTest_q_2_q <= STD_LOGIC_VECTOR(vCount_uid161_lzCountVal_uid86_fpSubTest_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist3_rVStage_uid160_lzCountVal_uid86_fpSubTest_merged_bit_select_c_1(DELAY,260)
    redist3_rVStage_uid160_lzCountVal_uid86_fpSubTest_merged_bit_select_c_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist3_rVStage_uid160_lzCountVal_uid86_fpSubTest_merged_bit_select_c_1_q <= (others => '0');
            ELSE
                redist3_rVStage_uid160_lzCountVal_uid86_fpSubTest_merged_bit_select_c_1_q <= STD_LOGIC_VECTOR(rVStage_uid160_lzCountVal_uid86_fpSubTest_merged_bit_select_c);
            END IF;
        END IF;
    END PROCESS;

    -- redist2_rVStage_uid160_lzCountVal_uid86_fpSubTest_merged_bit_select_b_1(DELAY,259)
    redist2_rVStage_uid160_lzCountVal_uid86_fpSubTest_merged_bit_select_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist2_rVStage_uid160_lzCountVal_uid86_fpSubTest_merged_bit_select_b_1_q <= (others => '0');
            ELSE
                redist2_rVStage_uid160_lzCountVal_uid86_fpSubTest_merged_bit_select_b_1_q <= STD_LOGIC_VECTOR(rVStage_uid160_lzCountVal_uid86_fpSubTest_merged_bit_select_b);
            END IF;
        END IF;
    END PROCESS;

    -- vStagei_uid164_lzCountVal_uid86_fpSubTest(MUX,163)@8
    vStagei_uid164_lzCountVal_uid86_fpSubTest_s <= vCount_uid161_lzCountVal_uid86_fpSubTest_q;
    vStagei_uid164_lzCountVal_uid86_fpSubTest_combproc: PROCESS (vStagei_uid164_lzCountVal_uid86_fpSubTest_s, redist2_rVStage_uid160_lzCountVal_uid86_fpSubTest_merged_bit_select_b_1_q, redist3_rVStage_uid160_lzCountVal_uid86_fpSubTest_merged_bit_select_c_1_q)
    BEGIN
        CASE (vStagei_uid164_lzCountVal_uid86_fpSubTest_s) IS
            WHEN "0" => vStagei_uid164_lzCountVal_uid86_fpSubTest_q <= redist2_rVStage_uid160_lzCountVal_uid86_fpSubTest_merged_bit_select_b_1_q;
            WHEN "1" => vStagei_uid164_lzCountVal_uid86_fpSubTest_q <= redist3_rVStage_uid160_lzCountVal_uid86_fpSubTest_merged_bit_select_c_1_q;
            WHEN OTHERS => vStagei_uid164_lzCountVal_uid86_fpSubTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid166_lzCountVal_uid86_fpSubTest_merged_bit_select(BITSELECT,254)@8
    rVStage_uid166_lzCountVal_uid86_fpSubTest_merged_bit_select_b <= vStagei_uid164_lzCountVal_uid86_fpSubTest_q(7 downto 4);
    rVStage_uid166_lzCountVal_uid86_fpSubTest_merged_bit_select_c <= vStagei_uid164_lzCountVal_uid86_fpSubTest_q(3 downto 0);

    -- vCount_uid167_lzCountVal_uid86_fpSubTest(LOGICAL,166)@8
    vCount_uid167_lzCountVal_uid86_fpSubTest_q <= "1" WHEN rVStage_uid166_lzCountVal_uid86_fpSubTest_merged_bit_select_b = zs_uid165_lzCountVal_uid86_fpSubTest_q ELSE "0";

    -- redist10_vCount_uid167_lzCountVal_uid86_fpSubTest_q_1(DELAY,267)
    redist10_vCount_uid167_lzCountVal_uid86_fpSubTest_q_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist10_vCount_uid167_lzCountVal_uid86_fpSubTest_q_1_q <= (others => '0');
            ELSE
                redist10_vCount_uid167_lzCountVal_uid86_fpSubTest_q_1_q <= STD_LOGIC_VECTOR(vCount_uid167_lzCountVal_uid86_fpSubTest_q);
            END IF;
        END IF;
    END PROCESS;

    -- vStagei_uid170_lzCountVal_uid86_fpSubTest(MUX,169)@8 + 1
    vStagei_uid170_lzCountVal_uid86_fpSubTest_s <= vCount_uid167_lzCountVal_uid86_fpSubTest_q;
    vStagei_uid170_lzCountVal_uid86_fpSubTest_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                vStagei_uid170_lzCountVal_uid86_fpSubTest_q <= (others => '0');
            ELSE
                CASE (vStagei_uid170_lzCountVal_uid86_fpSubTest_s) IS
                    WHEN "0" => vStagei_uid170_lzCountVal_uid86_fpSubTest_q <= rVStage_uid166_lzCountVal_uid86_fpSubTest_merged_bit_select_b;
                    WHEN "1" => vStagei_uid170_lzCountVal_uid86_fpSubTest_q <= rVStage_uid166_lzCountVal_uid86_fpSubTest_merged_bit_select_c;
                    WHEN OTHERS => vStagei_uid170_lzCountVal_uid86_fpSubTest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;

    -- rVStage_uid172_lzCountVal_uid86_fpSubTest_merged_bit_select(BITSELECT,255)@9
    rVStage_uid172_lzCountVal_uid86_fpSubTest_merged_bit_select_b <= vStagei_uid170_lzCountVal_uid86_fpSubTest_q(3 downto 2);
    rVStage_uid172_lzCountVal_uid86_fpSubTest_merged_bit_select_c <= vStagei_uid170_lzCountVal_uid86_fpSubTest_q(1 downto 0);

    -- vCount_uid173_lzCountVal_uid86_fpSubTest(LOGICAL,172)@9
    vCount_uid173_lzCountVal_uid86_fpSubTest_q <= "1" WHEN rVStage_uid172_lzCountVal_uid86_fpSubTest_merged_bit_select_b = zs_uid171_lzCountVal_uid86_fpSubTest_q ELSE "0";

    -- vStagei_uid176_lzCountVal_uid86_fpSubTest(MUX,175)@9
    vStagei_uid176_lzCountVal_uid86_fpSubTest_s <= vCount_uid173_lzCountVal_uid86_fpSubTest_q;
    vStagei_uid176_lzCountVal_uid86_fpSubTest_combproc: PROCESS (vStagei_uid176_lzCountVal_uid86_fpSubTest_s, rVStage_uid172_lzCountVal_uid86_fpSubTest_merged_bit_select_b, rVStage_uid172_lzCountVal_uid86_fpSubTest_merged_bit_select_c)
    BEGIN
        CASE (vStagei_uid176_lzCountVal_uid86_fpSubTest_s) IS
            WHEN "0" => vStagei_uid176_lzCountVal_uid86_fpSubTest_q <= rVStage_uid172_lzCountVal_uid86_fpSubTest_merged_bit_select_b;
            WHEN "1" => vStagei_uid176_lzCountVal_uid86_fpSubTest_q <= rVStage_uid172_lzCountVal_uid86_fpSubTest_merged_bit_select_c;
            WHEN OTHERS => vStagei_uid176_lzCountVal_uid86_fpSubTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid178_lzCountVal_uid86_fpSubTest(BITSELECT,177)@9
    rVStage_uid178_lzCountVal_uid86_fpSubTest_b <= vStagei_uid176_lzCountVal_uid86_fpSubTest_q(1 downto 1);

    -- vCount_uid179_lzCountVal_uid86_fpSubTest(LOGICAL,178)@9
    vCount_uid179_lzCountVal_uid86_fpSubTest_q <= "1" WHEN rVStage_uid178_lzCountVal_uid86_fpSubTest_b = GND_q ELSE "0";

    -- r_uid180_lzCountVal_uid86_fpSubTest(BITJOIN,179)@9
    r_uid180_lzCountVal_uid86_fpSubTest_q <= redist13_vCount_uid153_lzCountVal_uid86_fpSubTest_q_3_q & redist11_vCount_uid161_lzCountVal_uid86_fpSubTest_q_2_q & redist10_vCount_uid167_lzCountVal_uid86_fpSubTest_q_1_q & vCount_uid173_lzCountVal_uid86_fpSubTest_q & vCount_uid179_lzCountVal_uid86_fpSubTest_q;

    -- redist9_r_uid180_lzCountVal_uid86_fpSubTest_q_1(DELAY,266)
    redist9_r_uid180_lzCountVal_uid86_fpSubTest_q_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist9_r_uid180_lzCountVal_uid86_fpSubTest_q_1_q <= (others => '0');
            ELSE
                redist9_r_uid180_lzCountVal_uid86_fpSubTest_q_1_q <= STD_LOGIC_VECTOR(r_uid180_lzCountVal_uid86_fpSubTest_q);
            END IF;
        END IF;
    END PROCESS;

    -- aMinusA_uid88_fpSubTest(LOGICAL,87)@10 + 1
    aMinusA_uid88_fpSubTest_qi <= "1" WHEN redist9_r_uid180_lzCountVal_uid86_fpSubTest_q_1_q = cAmA_uid87_fpSubTest_q ELSE "0";
    aMinusA_uid88_fpSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => aMinusA_uid88_fpSubTest_qi, xout => aMinusA_uid88_fpSubTest_q, clk => clk, aclr => areset, ena => '1' );

    -- invAMinusA_uid130_fpSubTest(LOGICAL,129)@11
    invAMinusA_uid130_fpSubTest_q <= not (aMinusA_uid88_fpSubTest_q);

    -- redist29_sigA_uid51_fpSubTest_b_11(DELAY,286)
    redist29_sigA_uid51_fpSubTest_b_11 : dspba_delay
    GENERIC MAP ( width => 1, depth => 7, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => redist28_sigA_uid51_fpSubTest_b_4_q, xout => redist29_sigA_uid51_fpSubTest_b_11_q, clk => clk, aclr => areset, ena => '1' );

    -- cstAllOWE_uid19_fpSubTest(CONSTANT,18)
    cstAllOWE_uid19_fpSubTest_q <= "11111111";

    -- expXIsMax_uid39_fpSubTest(LOGICAL,38)@1 + 1
    expXIsMax_uid39_fpSubTest_qi <= "1" WHEN redist39_exp_bSig_uid36_fpSubTest_b_1_q = cstAllOWE_uid19_fpSubTest_q ELSE "0";
    expXIsMax_uid39_fpSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => expXIsMax_uid39_fpSubTest_qi, xout => expXIsMax_uid39_fpSubTest_q, clk => clk, aclr => areset, ena => '1' );

    -- redist34_expXIsMax_uid39_fpSubTest_q_9(DELAY,291)
    redist34_expXIsMax_uid39_fpSubTest_q_9 : dspba_delay
    GENERIC MAP ( width => 1, depth => 8, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => expXIsMax_uid39_fpSubTest_q, xout => redist34_expXIsMax_uid39_fpSubTest_q_9_q, clk => clk, aclr => areset, ena => '1' );

    -- invExpXIsMax_uid44_fpSubTest(LOGICAL,43)@10
    invExpXIsMax_uid44_fpSubTest_q <= not (redist34_expXIsMax_uid39_fpSubTest_q_9_q);

    -- redist30_InvExpXIsZero_uid45_fpSubTest_q_8(DELAY,287)
    redist30_InvExpXIsZero_uid45_fpSubTest_q_8 : dspba_delay
    GENERIC MAP ( width => 1, depth => 8, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => InvExpXIsZero_uid45_fpSubTest_q, xout => redist30_InvExpXIsZero_uid45_fpSubTest_q_8_q, clk => clk, aclr => areset, ena => '1' );

    -- excR_bSig_uid46_fpSubTest(LOGICAL,45)@10 + 1
    excR_bSig_uid46_fpSubTest_qi <= redist30_InvExpXIsZero_uid45_fpSubTest_q_8_q and invExpXIsMax_uid44_fpSubTest_q;
    excR_bSig_uid46_fpSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => excR_bSig_uid46_fpSubTest_qi, xout => excR_bSig_uid46_fpSubTest_q, clk => clk, aclr => areset, ena => '1' );

    -- redist47_exp_aSig_uid22_fpSubTest_b_10_notEnable(LOGICAL,312)
    redist47_exp_aSig_uid22_fpSubTest_b_10_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist47_exp_aSig_uid22_fpSubTest_b_10_nor(LOGICAL,313)
    redist47_exp_aSig_uid22_fpSubTest_b_10_nor_q <= not (redist47_exp_aSig_uid22_fpSubTest_b_10_notEnable_q or redist47_exp_aSig_uid22_fpSubTest_b_10_sticky_ena_q);

    -- redist47_exp_aSig_uid22_fpSubTest_b_10_mem_last(CONSTANT,309)
    redist47_exp_aSig_uid22_fpSubTest_b_10_mem_last_q <= "0110";

    -- redist47_exp_aSig_uid22_fpSubTest_b_10_cmp(LOGICAL,310)
    redist47_exp_aSig_uid22_fpSubTest_b_10_cmp_b <= STD_LOGIC_VECTOR("0" & redist47_exp_aSig_uid22_fpSubTest_b_10_rdcnt_q);
    redist47_exp_aSig_uid22_fpSubTest_b_10_cmp_q <= "1" WHEN redist47_exp_aSig_uid22_fpSubTest_b_10_mem_last_q = redist47_exp_aSig_uid22_fpSubTest_b_10_cmp_b ELSE "0";

    -- redist47_exp_aSig_uid22_fpSubTest_b_10_cmpReg(REG,311)
    redist47_exp_aSig_uid22_fpSubTest_b_10_cmpReg_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist47_exp_aSig_uid22_fpSubTest_b_10_cmpReg_q <= "0";
            ELSE
                redist47_exp_aSig_uid22_fpSubTest_b_10_cmpReg_q <= STD_LOGIC_VECTOR(redist47_exp_aSig_uid22_fpSubTest_b_10_cmp_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist47_exp_aSig_uid22_fpSubTest_b_10_sticky_ena(REG,314)
    redist47_exp_aSig_uid22_fpSubTest_b_10_sticky_ena_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist47_exp_aSig_uid22_fpSubTest_b_10_sticky_ena_q <= "0";
            ELSE
                IF (redist47_exp_aSig_uid22_fpSubTest_b_10_nor_q = "1") THEN
                    redist47_exp_aSig_uid22_fpSubTest_b_10_sticky_ena_q <= STD_LOGIC_VECTOR(redist47_exp_aSig_uid22_fpSubTest_b_10_cmpReg_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist47_exp_aSig_uid22_fpSubTest_b_10_enaAnd(LOGICAL,315)
    redist47_exp_aSig_uid22_fpSubTest_b_10_enaAnd_q <= redist47_exp_aSig_uid22_fpSubTest_b_10_sticky_ena_q and VCC_q;

    -- redist47_exp_aSig_uid22_fpSubTest_b_10_rdcnt(COUNTER,307)
    -- low=0, high=7, step=1, init=0
    redist47_exp_aSig_uid22_fpSubTest_b_10_rdcnt_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist47_exp_aSig_uid22_fpSubTest_b_10_rdcnt_i <= TO_UNSIGNED(0, 3);
            ELSE
                redist47_exp_aSig_uid22_fpSubTest_b_10_rdcnt_i <= redist47_exp_aSig_uid22_fpSubTest_b_10_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist47_exp_aSig_uid22_fpSubTest_b_10_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist47_exp_aSig_uid22_fpSubTest_b_10_rdcnt_i, 3)));

    -- redist47_exp_aSig_uid22_fpSubTest_b_10_wraddr(REG,308)
    redist47_exp_aSig_uid22_fpSubTest_b_10_wraddr_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist47_exp_aSig_uid22_fpSubTest_b_10_wraddr_q <= "111";
            ELSE
                redist47_exp_aSig_uid22_fpSubTest_b_10_wraddr_q <= STD_LOGIC_VECTOR(redist47_exp_aSig_uid22_fpSubTest_b_10_rdcnt_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist47_exp_aSig_uid22_fpSubTest_b_10_mem(DUALMEM,306)
    redist47_exp_aSig_uid22_fpSubTest_b_10_mem_ia <= STD_LOGIC_VECTOR(redist46_exp_aSig_uid22_fpSubTest_b_1_q);
    redist47_exp_aSig_uid22_fpSubTest_b_10_mem_aa <= redist47_exp_aSig_uid22_fpSubTest_b_10_wraddr_q;
    redist47_exp_aSig_uid22_fpSubTest_b_10_mem_ab <= redist47_exp_aSig_uid22_fpSubTest_b_10_rdcnt_q;
    redist47_exp_aSig_uid22_fpSubTest_b_10_mem_reset0 <= areset;
    redist47_exp_aSig_uid22_fpSubTest_b_10_mem_dmem : altera_syncram
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
        clocken1 => redist47_exp_aSig_uid22_fpSubTest_b_10_enaAnd_q(0),
        clocken0 => '1',
        clock0 => clk,
        sclr => redist47_exp_aSig_uid22_fpSubTest_b_10_mem_reset0,
        clock1 => clk,
        address_a => redist47_exp_aSig_uid22_fpSubTest_b_10_mem_aa,
        data_a => redist47_exp_aSig_uid22_fpSubTest_b_10_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist47_exp_aSig_uid22_fpSubTest_b_10_mem_ab,
        q_b => redist47_exp_aSig_uid22_fpSubTest_b_10_mem_iq
    );
    redist47_exp_aSig_uid22_fpSubTest_b_10_mem_q <= redist47_exp_aSig_uid22_fpSubTest_b_10_mem_iq(7 downto 0);

    -- expXIsMax_uid25_fpSubTest(LOGICAL,24)@10
    expXIsMax_uid25_fpSubTest_q <= "1" WHEN redist47_exp_aSig_uid22_fpSubTest_b_10_mem_q = cstAllOWE_uid19_fpSubTest_q ELSE "0";

    -- invExpXIsMax_uid30_fpSubTest(LOGICAL,29)@10
    invExpXIsMax_uid30_fpSubTest_q <= not (expXIsMax_uid25_fpSubTest_q);

    -- excZ_aSig_uid17_uid24_fpSubTest(LOGICAL,23)@10
    excZ_aSig_uid17_uid24_fpSubTest_q <= "1" WHEN redist47_exp_aSig_uid22_fpSubTest_b_10_mem_q = cstAllZWE_uid21_fpSubTest_q ELSE "0";

    -- InvExpXIsZero_uid31_fpSubTest(LOGICAL,30)@10
    InvExpXIsZero_uid31_fpSubTest_q <= not (excZ_aSig_uid17_uid24_fpSubTest_q);

    -- excR_aSig_uid32_fpSubTest(LOGICAL,31)@10 + 1
    excR_aSig_uid32_fpSubTest_qi <= InvExpXIsZero_uid31_fpSubTest_q and invExpXIsMax_uid30_fpSubTest_q;
    excR_aSig_uid32_fpSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => excR_aSig_uid32_fpSubTest_qi, xout => excR_aSig_uid32_fpSubTest_q, clk => clk, aclr => areset, ena => '1' );

    -- signRReg_uid131_fpSubTest(LOGICAL,130)@11
    signRReg_uid131_fpSubTest_q <= excR_aSig_uid32_fpSubTest_q and excR_bSig_uid46_fpSubTest_q and redist29_sigA_uid51_fpSubTest_b_11_q and invAMinusA_uid130_fpSubTest_q;

    -- redist27_sigB_uid52_fpSubTest_b_11(DELAY,284)
    redist27_sigB_uid52_fpSubTest_b_11 : dspba_delay
    GENERIC MAP ( width => 1, depth => 7, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => redist26_sigB_uid52_fpSubTest_b_4_q, xout => redist27_sigB_uid52_fpSubTest_b_11_q, clk => clk, aclr => areset, ena => '1' );

    -- redist36_excZ_bSig_uid18_uid38_fpSubTest_q_10(DELAY,293)
    redist36_excZ_bSig_uid18_uid38_fpSubTest_q_10 : dspba_delay
    GENERIC MAP ( width => 1, depth => 9, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => redist35_excZ_bSig_uid18_uid38_fpSubTest_q_1_q, xout => redist36_excZ_bSig_uid18_uid38_fpSubTest_q_10_q, clk => clk, aclr => areset, ena => '1' );

    -- redist43_excZ_aSig_uid17_uid24_fpSubTest_q_1(DELAY,300)
    redist43_excZ_aSig_uid17_uid24_fpSubTest_q_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist43_excZ_aSig_uid17_uid24_fpSubTest_q_1_q <= (others => '0');
            ELSE
                redist43_excZ_aSig_uid17_uid24_fpSubTest_q_1_q <= STD_LOGIC_VECTOR(excZ_aSig_uid17_uid24_fpSubTest_q);
            END IF;
        END IF;
    END PROCESS;

    -- excAZBZSigASigB_uid135_fpSubTest(LOGICAL,134)@11
    excAZBZSigASigB_uid135_fpSubTest_q <= redist43_excZ_aSig_uid17_uid24_fpSubTest_q_1_q and redist36_excZ_bSig_uid18_uid38_fpSubTest_q_10_q and redist29_sigA_uid51_fpSubTest_b_11_q and redist27_sigB_uid52_fpSubTest_b_11_q;

    -- excBZARSigA_uid136_fpSubTest(LOGICAL,135)@11
    excBZARSigA_uid136_fpSubTest_q <= redist36_excZ_bSig_uid18_uid38_fpSubTest_q_10_q and excR_aSig_uid32_fpSubTest_q and redist29_sigA_uid51_fpSubTest_b_11_q;

    -- signRZero_uid137_fpSubTest(LOGICAL,136)@11
    signRZero_uid137_fpSubTest_q <= excBZARSigA_uid136_fpSubTest_q or excAZBZSigASigB_uid135_fpSubTest_q;

    -- fracXIsZero_uid40_fpSubTest(LOGICAL,39)@1 + 1
    fracXIsZero_uid40_fpSubTest_qi <= "1" WHEN cstZeroWF_uid20_fpSubTest_q = redist38_frac_bSig_uid37_fpSubTest_b_1_q ELSE "0";
    fracXIsZero_uid40_fpSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => fracXIsZero_uid40_fpSubTest_qi, xout => fracXIsZero_uid40_fpSubTest_q, clk => clk, aclr => areset, ena => '1' );

    -- redist33_fracXIsZero_uid40_fpSubTest_q_9(DELAY,290)
    redist33_fracXIsZero_uid40_fpSubTest_q_9 : dspba_delay
    GENERIC MAP ( width => 1, depth => 8, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => fracXIsZero_uid40_fpSubTest_q, xout => redist33_fracXIsZero_uid40_fpSubTest_q_9_q, clk => clk, aclr => areset, ena => '1' );

    -- excI_bSig_uid42_fpSubTest(LOGICAL,41)@10 + 1
    excI_bSig_uid42_fpSubTest_qi <= redist34_expXIsMax_uid39_fpSubTest_q_9_q and redist33_fracXIsZero_uid40_fpSubTest_q_9_q;
    excI_bSig_uid42_fpSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => excI_bSig_uid42_fpSubTest_qi, xout => excI_bSig_uid42_fpSubTest_q, clk => clk, aclr => areset, ena => '1' );

    -- sigBBInf_uid132_fpSubTest(LOGICAL,131)@11
    sigBBInf_uid132_fpSubTest_q <= redist27_sigB_uid52_fpSubTest_b_11_q and excI_bSig_uid42_fpSubTest_q;

    -- fracXIsZero_uid26_fpSubTest(LOGICAL,25)@5 + 1
    fracXIsZero_uid26_fpSubTest_qi <= "1" WHEN cstZeroWF_uid20_fpSubTest_q = redist45_frac_aSig_uid23_fpSubTest_b_5_q ELSE "0";
    fracXIsZero_uid26_fpSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => fracXIsZero_uid26_fpSubTest_qi, xout => fracXIsZero_uid26_fpSubTest_q, clk => clk, aclr => areset, ena => '1' );

    -- redist42_fracXIsZero_uid26_fpSubTest_q_5(DELAY,299)
    redist42_fracXIsZero_uid26_fpSubTest_q_5_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist42_fracXIsZero_uid26_fpSubTest_q_5_delay_0 <= (others => '0');
                redist42_fracXIsZero_uid26_fpSubTest_q_5_delay_1 <= (others => '0');
                redist42_fracXIsZero_uid26_fpSubTest_q_5_delay_2 <= (others => '0');
                redist42_fracXIsZero_uid26_fpSubTest_q_5_q <= (others => '0');
            ELSE
                redist42_fracXIsZero_uid26_fpSubTest_q_5_delay_0 <= STD_LOGIC_VECTOR(fracXIsZero_uid26_fpSubTest_q);
                redist42_fracXIsZero_uid26_fpSubTest_q_5_delay_1 <= redist42_fracXIsZero_uid26_fpSubTest_q_5_delay_0;
                redist42_fracXIsZero_uid26_fpSubTest_q_5_delay_2 <= redist42_fracXIsZero_uid26_fpSubTest_q_5_delay_1;
                redist42_fracXIsZero_uid26_fpSubTest_q_5_q <= redist42_fracXIsZero_uid26_fpSubTest_q_5_delay_2;
            END IF;
        END IF;
    END PROCESS;

    -- excI_aSig_uid28_fpSubTest(LOGICAL,27)@10 + 1
    excI_aSig_uid28_fpSubTest_qi <= expXIsMax_uid25_fpSubTest_q and redist42_fracXIsZero_uid26_fpSubTest_q_5_q;
    excI_aSig_uid28_fpSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => excI_aSig_uid28_fpSubTest_qi, xout => excI_aSig_uid28_fpSubTest_q, clk => clk, aclr => areset, ena => '1' );

    -- sigAAInf_uid133_fpSubTest(LOGICAL,132)@11
    sigAAInf_uid133_fpSubTest_q <= redist29_sigA_uid51_fpSubTest_b_11_q and excI_aSig_uid28_fpSubTest_q;

    -- signRInf_uid134_fpSubTest(LOGICAL,133)@11
    signRInf_uid134_fpSubTest_q <= sigAAInf_uid133_fpSubTest_q or sigBBInf_uid132_fpSubTest_q;

    -- signRInfRZRReg_uid138_fpSubTest(LOGICAL,137)@11 + 1
    signRInfRZRReg_uid138_fpSubTest_qi <= signRInf_uid134_fpSubTest_q or signRZero_uid137_fpSubTest_q or signRReg_uid131_fpSubTest_q;
    signRInfRZRReg_uid138_fpSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => signRInfRZRReg_uid138_fpSubTest_qi, xout => signRInfRZRReg_uid138_fpSubTest_q, clk => clk, aclr => areset, ena => '1' );

    -- redist15_signRInfRZRReg_uid138_fpSubTest_q_2(DELAY,272)
    redist15_signRInfRZRReg_uid138_fpSubTest_q_2_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist15_signRInfRZRReg_uid138_fpSubTest_q_2_q <= (others => '0');
            ELSE
                redist15_signRInfRZRReg_uid138_fpSubTest_q_2_q <= STD_LOGIC_VECTOR(signRInfRZRReg_uid138_fpSubTest_q);
            END IF;
        END IF;
    END PROCESS;

    -- fracXIsNotZero_uid41_fpSubTest(LOGICAL,40)@10
    fracXIsNotZero_uid41_fpSubTest_q <= not (redist33_fracXIsZero_uid40_fpSubTest_q_9_q);

    -- excN_bSig_uid43_fpSubTest(LOGICAL,42)@10 + 1
    excN_bSig_uid43_fpSubTest_qi <= redist34_expXIsMax_uid39_fpSubTest_q_9_q and fracXIsNotZero_uid41_fpSubTest_q;
    excN_bSig_uid43_fpSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => excN_bSig_uid43_fpSubTest_qi, xout => excN_bSig_uid43_fpSubTest_q, clk => clk, aclr => areset, ena => '1' );

    -- redist31_excN_bSig_uid43_fpSubTest_q_3(DELAY,288)
    redist31_excN_bSig_uid43_fpSubTest_q_3_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist31_excN_bSig_uid43_fpSubTest_q_3_delay_0 <= (others => '0');
                redist31_excN_bSig_uid43_fpSubTest_q_3_q <= (others => '0');
            ELSE
                redist31_excN_bSig_uid43_fpSubTest_q_3_delay_0 <= STD_LOGIC_VECTOR(excN_bSig_uid43_fpSubTest_q);
                redist31_excN_bSig_uid43_fpSubTest_q_3_q <= redist31_excN_bSig_uid43_fpSubTest_q_3_delay_0;
            END IF;
        END IF;
    END PROCESS;

    -- fracXIsNotZero_uid27_fpSubTest(LOGICAL,26)@10
    fracXIsNotZero_uid27_fpSubTest_q <= not (redist42_fracXIsZero_uid26_fpSubTest_q_5_q);

    -- excN_aSig_uid29_fpSubTest(LOGICAL,28)@10 + 1
    excN_aSig_uid29_fpSubTest_qi <= expXIsMax_uid25_fpSubTest_q and fracXIsNotZero_uid27_fpSubTest_q;
    excN_aSig_uid29_fpSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => excN_aSig_uid29_fpSubTest_qi, xout => excN_aSig_uid29_fpSubTest_q, clk => clk, aclr => areset, ena => '1' );

    -- redist40_excN_aSig_uid29_fpSubTest_q_3(DELAY,297)
    redist40_excN_aSig_uid29_fpSubTest_q_3_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist40_excN_aSig_uid29_fpSubTest_q_3_delay_0 <= (others => '0');
                redist40_excN_aSig_uid29_fpSubTest_q_3_q <= (others => '0');
            ELSE
                redist40_excN_aSig_uid29_fpSubTest_q_3_delay_0 <= STD_LOGIC_VECTOR(excN_aSig_uid29_fpSubTest_q);
                redist40_excN_aSig_uid29_fpSubTest_q_3_q <= redist40_excN_aSig_uid29_fpSubTest_q_3_delay_0;
            END IF;
        END IF;
    END PROCESS;

    -- excRNaN2_uid125_fpSubTest(LOGICAL,124)@13
    excRNaN2_uid125_fpSubTest_q <= redist40_excN_aSig_uid29_fpSubTest_q_3_q or redist31_excN_bSig_uid43_fpSubTest_q_3_q;

    -- redist25_effSub_uid53_fpSubTest_q_9(DELAY,282)
    redist25_effSub_uid53_fpSubTest_q_9 : dspba_delay
    GENERIC MAP ( width => 1, depth => 8, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => effSub_uid53_fpSubTest_q, xout => redist25_effSub_uid53_fpSubTest_q_9_q, clk => clk, aclr => areset, ena => '1' );

    -- redist32_excI_bSig_uid42_fpSubTest_q_3(DELAY,289)
    redist32_excI_bSig_uid42_fpSubTest_q_3_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist32_excI_bSig_uid42_fpSubTest_q_3_delay_0 <= (others => '0');
                redist32_excI_bSig_uid42_fpSubTest_q_3_q <= (others => '0');
            ELSE
                redist32_excI_bSig_uid42_fpSubTest_q_3_delay_0 <= STD_LOGIC_VECTOR(excI_bSig_uid42_fpSubTest_q);
                redist32_excI_bSig_uid42_fpSubTest_q_3_q <= redist32_excI_bSig_uid42_fpSubTest_q_3_delay_0;
            END IF;
        END IF;
    END PROCESS;

    -- redist41_excI_aSig_uid28_fpSubTest_q_3(DELAY,298)
    redist41_excI_aSig_uid28_fpSubTest_q_3_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist41_excI_aSig_uid28_fpSubTest_q_3_delay_0 <= (others => '0');
                redist41_excI_aSig_uid28_fpSubTest_q_3_q <= (others => '0');
            ELSE
                redist41_excI_aSig_uid28_fpSubTest_q_3_delay_0 <= STD_LOGIC_VECTOR(excI_aSig_uid28_fpSubTest_q);
                redist41_excI_aSig_uid28_fpSubTest_q_3_q <= redist41_excI_aSig_uid28_fpSubTest_q_3_delay_0;
            END IF;
        END IF;
    END PROCESS;

    -- excAIBISub_uid126_fpSubTest(LOGICAL,125)@13
    excAIBISub_uid126_fpSubTest_q <= redist41_excI_aSig_uid28_fpSubTest_q_3_q and redist32_excI_bSig_uid42_fpSubTest_q_3_q and redist25_effSub_uid53_fpSubTest_q_9_q;

    -- excRNaN_uid127_fpSubTest(LOGICAL,126)@13
    excRNaN_uid127_fpSubTest_q <= excAIBISub_uid126_fpSubTest_q or excRNaN2_uid125_fpSubTest_q;

    -- invExcRNaN_uid139_fpSubTest(LOGICAL,138)@13
    invExcRNaN_uid139_fpSubTest_q <= not (excRNaN_uid127_fpSubTest_q);

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- signRPostExc_uid140_fpSubTest(LOGICAL,139)@13 + 1
    signRPostExc_uid140_fpSubTest_qi <= invExcRNaN_uid139_fpSubTest_q and redist15_signRInfRZRReg_uid138_fpSubTest_q_2_q;
    signRPostExc_uid140_fpSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => signRPostExc_uid140_fpSubTest_qi, xout => signRPostExc_uid140_fpSubTest_q, clk => clk, aclr => areset, ena => '1' );

    -- cRBit_uid100_fpSubTest(CONSTANT,99)
    cRBit_uid100_fpSubTest_q <= "01000";

    -- leftShiftStage2Idx1Rng1_uid247_fracPostNormExt_uid89_fpSubTest(BITSELECT,246)@10
    leftShiftStage2Idx1Rng1_uid247_fracPostNormExt_uid89_fpSubTest_in <= leftShiftStage1_uid245_fracPostNormExt_uid89_fpSubTest_q(26 downto 0);
    leftShiftStage2Idx1Rng1_uid247_fracPostNormExt_uid89_fpSubTest_b <= leftShiftStage2Idx1Rng1_uid247_fracPostNormExt_uid89_fpSubTest_in(26 downto 0);

    -- leftShiftStage2Idx1_uid248_fracPostNormExt_uid89_fpSubTest(BITJOIN,247)@10
    leftShiftStage2Idx1_uid248_fracPostNormExt_uid89_fpSubTest_q <= leftShiftStage2Idx1Rng1_uid247_fracPostNormExt_uid89_fpSubTest_b & GND_q;

    -- leftShiftStage1Idx3Rng6_uid242_fracPostNormExt_uid89_fpSubTest(BITSELECT,241)@10
    leftShiftStage1Idx3Rng6_uid242_fracPostNormExt_uid89_fpSubTest_in <= leftShiftStage0_uid234_fracPostNormExt_uid89_fpSubTest_q(21 downto 0);
    leftShiftStage1Idx3Rng6_uid242_fracPostNormExt_uid89_fpSubTest_b <= leftShiftStage1Idx3Rng6_uid242_fracPostNormExt_uid89_fpSubTest_in(21 downto 0);

    -- leftShiftStage1Idx3Pad6_uid241_fracPostNormExt_uid89_fpSubTest(CONSTANT,240)
    leftShiftStage1Idx3Pad6_uid241_fracPostNormExt_uid89_fpSubTest_q <= "000000";

    -- leftShiftStage1Idx3_uid243_fracPostNormExt_uid89_fpSubTest(BITJOIN,242)@10
    leftShiftStage1Idx3_uid243_fracPostNormExt_uid89_fpSubTest_q <= leftShiftStage1Idx3Rng6_uid242_fracPostNormExt_uid89_fpSubTest_b & leftShiftStage1Idx3Pad6_uid241_fracPostNormExt_uid89_fpSubTest_q;

    -- leftShiftStage1Idx2Rng4_uid239_fracPostNormExt_uid89_fpSubTest(BITSELECT,238)@10
    leftShiftStage1Idx2Rng4_uid239_fracPostNormExt_uid89_fpSubTest_in <= leftShiftStage0_uid234_fracPostNormExt_uid89_fpSubTest_q(23 downto 0);
    leftShiftStage1Idx2Rng4_uid239_fracPostNormExt_uid89_fpSubTest_b <= leftShiftStage1Idx2Rng4_uid239_fracPostNormExt_uid89_fpSubTest_in(23 downto 0);

    -- leftShiftStage1Idx2_uid240_fracPostNormExt_uid89_fpSubTest(BITJOIN,239)@10
    leftShiftStage1Idx2_uid240_fracPostNormExt_uid89_fpSubTest_q <= leftShiftStage1Idx2Rng4_uid239_fracPostNormExt_uid89_fpSubTest_b & zs_uid165_lzCountVal_uid86_fpSubTest_q;

    -- leftShiftStage1Idx1Rng2_uid236_fracPostNormExt_uid89_fpSubTest(BITSELECT,235)@10
    leftShiftStage1Idx1Rng2_uid236_fracPostNormExt_uid89_fpSubTest_in <= leftShiftStage0_uid234_fracPostNormExt_uid89_fpSubTest_q(25 downto 0);
    leftShiftStage1Idx1Rng2_uid236_fracPostNormExt_uid89_fpSubTest_b <= leftShiftStage1Idx1Rng2_uid236_fracPostNormExt_uid89_fpSubTest_in(25 downto 0);

    -- leftShiftStage1Idx1_uid237_fracPostNormExt_uid89_fpSubTest(BITJOIN,236)@10
    leftShiftStage1Idx1_uid237_fracPostNormExt_uid89_fpSubTest_q <= leftShiftStage1Idx1Rng2_uid236_fracPostNormExt_uid89_fpSubTest_b & zs_uid171_lzCountVal_uid86_fpSubTest_q;

    -- leftShiftStage0Idx3Rng24_uid231_fracPostNormExt_uid89_fpSubTest(BITSELECT,230)@9
    leftShiftStage0Idx3Rng24_uid231_fracPostNormExt_uid89_fpSubTest_in <= redist22_fracGRS_uid85_fpSubTest_q_3_q(3 downto 0);
    leftShiftStage0Idx3Rng24_uid231_fracPostNormExt_uid89_fpSubTest_b <= leftShiftStage0Idx3Rng24_uid231_fracPostNormExt_uid89_fpSubTest_in(3 downto 0);

    -- leftShiftStage0Idx3Pad24_uid230_fracPostNormExt_uid89_fpSubTest(CONSTANT,229)
    leftShiftStage0Idx3Pad24_uid230_fracPostNormExt_uid89_fpSubTest_q <= "000000000000000000000000";

    -- leftShiftStage0Idx3_uid232_fracPostNormExt_uid89_fpSubTest(BITJOIN,231)@9
    leftShiftStage0Idx3_uid232_fracPostNormExt_uid89_fpSubTest_q <= leftShiftStage0Idx3Rng24_uid231_fracPostNormExt_uid89_fpSubTest_b & leftShiftStage0Idx3Pad24_uid230_fracPostNormExt_uid89_fpSubTest_q;

    -- redist12_vStage_uid155_lzCountVal_uid86_fpSubTest_b_2(DELAY,269)
    redist12_vStage_uid155_lzCountVal_uid86_fpSubTest_b_2_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist12_vStage_uid155_lzCountVal_uid86_fpSubTest_b_2_delay_0 <= (others => '0');
                redist12_vStage_uid155_lzCountVal_uid86_fpSubTest_b_2_q <= (others => '0');
            ELSE
                redist12_vStage_uid155_lzCountVal_uid86_fpSubTest_b_2_delay_0 <= STD_LOGIC_VECTOR(vStage_uid155_lzCountVal_uid86_fpSubTest_b);
                redist12_vStage_uid155_lzCountVal_uid86_fpSubTest_b_2_q <= redist12_vStage_uid155_lzCountVal_uid86_fpSubTest_b_2_delay_0;
            END IF;
        END IF;
    END PROCESS;

    -- leftShiftStage0Idx2_uid229_fracPostNormExt_uid89_fpSubTest(BITJOIN,228)@9
    leftShiftStage0Idx2_uid229_fracPostNormExt_uid89_fpSubTest_q <= redist12_vStage_uid155_lzCountVal_uid86_fpSubTest_b_2_q & zs_uid151_lzCountVal_uid86_fpSubTest_q;

    -- leftShiftStage0Idx1Rng8_uid225_fracPostNormExt_uid89_fpSubTest(BITSELECT,224)@9
    leftShiftStage0Idx1Rng8_uid225_fracPostNormExt_uid89_fpSubTest_in <= redist22_fracGRS_uid85_fpSubTest_q_3_q(19 downto 0);
    leftShiftStage0Idx1Rng8_uid225_fracPostNormExt_uid89_fpSubTest_b <= leftShiftStage0Idx1Rng8_uid225_fracPostNormExt_uid89_fpSubTest_in(19 downto 0);

    -- leftShiftStage0Idx1_uid226_fracPostNormExt_uid89_fpSubTest(BITJOIN,225)@9
    leftShiftStage0Idx1_uid226_fracPostNormExt_uid89_fpSubTest_q <= leftShiftStage0Idx1Rng8_uid225_fracPostNormExt_uid89_fpSubTest_b & cstAllZWE_uid21_fpSubTest_q;

    -- redist22_fracGRS_uid85_fpSubTest_q_3(DELAY,279)
    redist22_fracGRS_uid85_fpSubTest_q_3_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist22_fracGRS_uid85_fpSubTest_q_3_delay_0 <= (others => '0');
                redist22_fracGRS_uid85_fpSubTest_q_3_q <= (others => '0');
            ELSE
                redist22_fracGRS_uid85_fpSubTest_q_3_delay_0 <= STD_LOGIC_VECTOR(redist21_fracGRS_uid85_fpSubTest_q_1_q);
                redist22_fracGRS_uid85_fpSubTest_q_3_q <= redist22_fracGRS_uid85_fpSubTest_q_3_delay_0;
            END IF;
        END IF;
    END PROCESS;

    -- leftShiftStageSel0Dto3_uid233_fracPostNormExt_uid89_fpSubTest_merged_bit_select(BITSELECT,256)@9
    leftShiftStageSel0Dto3_uid233_fracPostNormExt_uid89_fpSubTest_merged_bit_select_b <= r_uid180_lzCountVal_uid86_fpSubTest_q(4 downto 3);
    leftShiftStageSel0Dto3_uid233_fracPostNormExt_uid89_fpSubTest_merged_bit_select_c <= r_uid180_lzCountVal_uid86_fpSubTest_q(2 downto 1);
    leftShiftStageSel0Dto3_uid233_fracPostNormExt_uid89_fpSubTest_merged_bit_select_d <= r_uid180_lzCountVal_uid86_fpSubTest_q(0 downto 0);

    -- leftShiftStage0_uid234_fracPostNormExt_uid89_fpSubTest(MUX,233)@9 + 1
    leftShiftStage0_uid234_fracPostNormExt_uid89_fpSubTest_s <= leftShiftStageSel0Dto3_uid233_fracPostNormExt_uid89_fpSubTest_merged_bit_select_b;
    leftShiftStage0_uid234_fracPostNormExt_uid89_fpSubTest_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                leftShiftStage0_uid234_fracPostNormExt_uid89_fpSubTest_q <= (others => '0');
            ELSE
                CASE (leftShiftStage0_uid234_fracPostNormExt_uid89_fpSubTest_s) IS
                    WHEN "00" => leftShiftStage0_uid234_fracPostNormExt_uid89_fpSubTest_q <= redist22_fracGRS_uid85_fpSubTest_q_3_q;
                    WHEN "01" => leftShiftStage0_uid234_fracPostNormExt_uid89_fpSubTest_q <= leftShiftStage0Idx1_uid226_fracPostNormExt_uid89_fpSubTest_q;
                    WHEN "10" => leftShiftStage0_uid234_fracPostNormExt_uid89_fpSubTest_q <= leftShiftStage0Idx2_uid229_fracPostNormExt_uid89_fpSubTest_q;
                    WHEN "11" => leftShiftStage0_uid234_fracPostNormExt_uid89_fpSubTest_q <= leftShiftStage0Idx3_uid232_fracPostNormExt_uid89_fpSubTest_q;
                    WHEN OTHERS => leftShiftStage0_uid234_fracPostNormExt_uid89_fpSubTest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;

    -- redist0_leftShiftStageSel0Dto3_uid233_fracPostNormExt_uid89_fpSubTest_merged_bit_select_c_1(DELAY,257)
    redist0_leftShiftStageSel0Dto3_uid233_fracPostNormExt_uid89_fpSubTest_merged_bit_select_c_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist0_leftShiftStageSel0Dto3_uid233_fracPostNormExt_uid89_fpSubTest_merged_bit_select_c_1_q <= (others => '0');
            ELSE
                redist0_leftShiftStageSel0Dto3_uid233_fracPostNormExt_uid89_fpSubTest_merged_bit_select_c_1_q <= STD_LOGIC_VECTOR(leftShiftStageSel0Dto3_uid233_fracPostNormExt_uid89_fpSubTest_merged_bit_select_c);
            END IF;
        END IF;
    END PROCESS;

    -- leftShiftStage1_uid245_fracPostNormExt_uid89_fpSubTest(MUX,244)@10
    leftShiftStage1_uid245_fracPostNormExt_uid89_fpSubTest_s <= redist0_leftShiftStageSel0Dto3_uid233_fracPostNormExt_uid89_fpSubTest_merged_bit_select_c_1_q;
    leftShiftStage1_uid245_fracPostNormExt_uid89_fpSubTest_combproc: PROCESS (leftShiftStage1_uid245_fracPostNormExt_uid89_fpSubTest_s, leftShiftStage0_uid234_fracPostNormExt_uid89_fpSubTest_q, leftShiftStage1Idx1_uid237_fracPostNormExt_uid89_fpSubTest_q, leftShiftStage1Idx2_uid240_fracPostNormExt_uid89_fpSubTest_q, leftShiftStage1Idx3_uid243_fracPostNormExt_uid89_fpSubTest_q)
    BEGIN
        CASE (leftShiftStage1_uid245_fracPostNormExt_uid89_fpSubTest_s) IS
            WHEN "00" => leftShiftStage1_uid245_fracPostNormExt_uid89_fpSubTest_q <= leftShiftStage0_uid234_fracPostNormExt_uid89_fpSubTest_q;
            WHEN "01" => leftShiftStage1_uid245_fracPostNormExt_uid89_fpSubTest_q <= leftShiftStage1Idx1_uid237_fracPostNormExt_uid89_fpSubTest_q;
            WHEN "10" => leftShiftStage1_uid245_fracPostNormExt_uid89_fpSubTest_q <= leftShiftStage1Idx2_uid240_fracPostNormExt_uid89_fpSubTest_q;
            WHEN "11" => leftShiftStage1_uid245_fracPostNormExt_uid89_fpSubTest_q <= leftShiftStage1Idx3_uid243_fracPostNormExt_uid89_fpSubTest_q;
            WHEN OTHERS => leftShiftStage1_uid245_fracPostNormExt_uid89_fpSubTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist1_leftShiftStageSel0Dto3_uid233_fracPostNormExt_uid89_fpSubTest_merged_bit_select_d_1(DELAY,258)
    redist1_leftShiftStageSel0Dto3_uid233_fracPostNormExt_uid89_fpSubTest_merged_bit_select_d_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist1_leftShiftStageSel0Dto3_uid233_fracPostNormExt_uid89_fpSubTest_merged_bit_select_d_1_q <= (others => '0');
            ELSE
                redist1_leftShiftStageSel0Dto3_uid233_fracPostNormExt_uid89_fpSubTest_merged_bit_select_d_1_q <= STD_LOGIC_VECTOR(leftShiftStageSel0Dto3_uid233_fracPostNormExt_uid89_fpSubTest_merged_bit_select_d);
            END IF;
        END IF;
    END PROCESS;

    -- leftShiftStage2_uid250_fracPostNormExt_uid89_fpSubTest(MUX,249)@10
    leftShiftStage2_uid250_fracPostNormExt_uid89_fpSubTest_s <= redist1_leftShiftStageSel0Dto3_uid233_fracPostNormExt_uid89_fpSubTest_merged_bit_select_d_1_q;
    leftShiftStage2_uid250_fracPostNormExt_uid89_fpSubTest_combproc: PROCESS (leftShiftStage2_uid250_fracPostNormExt_uid89_fpSubTest_s, leftShiftStage1_uid245_fracPostNormExt_uid89_fpSubTest_q, leftShiftStage2Idx1_uid248_fracPostNormExt_uid89_fpSubTest_q)
    BEGIN
        CASE (leftShiftStage2_uid250_fracPostNormExt_uid89_fpSubTest_s) IS
            WHEN "0" => leftShiftStage2_uid250_fracPostNormExt_uid89_fpSubTest_q <= leftShiftStage1_uid245_fracPostNormExt_uid89_fpSubTest_q;
            WHEN "1" => leftShiftStage2_uid250_fracPostNormExt_uid89_fpSubTest_q <= leftShiftStage2Idx1_uid248_fracPostNormExt_uid89_fpSubTest_q;
            WHEN OTHERS => leftShiftStage2_uid250_fracPostNormExt_uid89_fpSubTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- LSB_uid98_fpSubTest(BITSELECT,97)@10
    LSB_uid98_fpSubTest_in <= STD_LOGIC_VECTOR(leftShiftStage2_uid250_fracPostNormExt_uid89_fpSubTest_q(4 downto 0));
    LSB_uid98_fpSubTest_b <= STD_LOGIC_VECTOR(LSB_uid98_fpSubTest_in(4 downto 4));

    -- Guard_uid97_fpSubTest(BITSELECT,96)@10
    Guard_uid97_fpSubTest_in <= STD_LOGIC_VECTOR(leftShiftStage2_uid250_fracPostNormExt_uid89_fpSubTest_q(3 downto 0));
    Guard_uid97_fpSubTest_b <= STD_LOGIC_VECTOR(Guard_uid97_fpSubTest_in(3 downto 3));

    -- Round_uid96_fpSubTest(BITSELECT,95)@10
    Round_uid96_fpSubTest_in <= STD_LOGIC_VECTOR(leftShiftStage2_uid250_fracPostNormExt_uid89_fpSubTest_q(2 downto 0));
    Round_uid96_fpSubTest_b <= STD_LOGIC_VECTOR(Round_uid96_fpSubTest_in(2 downto 2));

    -- Sticky1_uid95_fpSubTest(BITSELECT,94)@10
    Sticky1_uid95_fpSubTest_in <= STD_LOGIC_VECTOR(leftShiftStage2_uid250_fracPostNormExt_uid89_fpSubTest_q(1 downto 0));
    Sticky1_uid95_fpSubTest_b <= STD_LOGIC_VECTOR(Sticky1_uid95_fpSubTest_in(1 downto 1));

    -- Sticky0_uid94_fpSubTest(BITSELECT,93)@10
    Sticky0_uid94_fpSubTest_in <= STD_LOGIC_VECTOR(leftShiftStage2_uid250_fracPostNormExt_uid89_fpSubTest_q(0 downto 0));
    Sticky0_uid94_fpSubTest_b <= STD_LOGIC_VECTOR(Sticky0_uid94_fpSubTest_in(0 downto 0));

    -- rndBitCond_uid99_fpSubTest(BITJOIN,98)@10
    rndBitCond_uid99_fpSubTest_q <= LSB_uid98_fpSubTest_b & Guard_uid97_fpSubTest_b & Round_uid96_fpSubTest_b & Sticky1_uid95_fpSubTest_b & Sticky0_uid94_fpSubTest_b;

    -- rBi_uid101_fpSubTest(LOGICAL,100)@10 + 1
    rBi_uid101_fpSubTest_qi <= "1" WHEN rndBitCond_uid99_fpSubTest_q = cRBit_uid100_fpSubTest_q ELSE "0";
    rBi_uid101_fpSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => rBi_uid101_fpSubTest_qi, xout => rBi_uid101_fpSubTest_q, clk => clk, aclr => areset, ena => '1' );

    -- roundBit_uid102_fpSubTest(LOGICAL,101)@11
    roundBit_uid102_fpSubTest_q <= not (rBi_uid101_fpSubTest_q);

    -- oneCST_uid91_fpSubTest(CONSTANT,90)
    oneCST_uid91_fpSubTest_q <= "00000001";

    -- expInc_uid92_fpSubTest(ADD,91)@10
    expInc_uid92_fpSubTest_a <= STD_LOGIC_VECTOR("0" & redist47_exp_aSig_uid22_fpSubTest_b_10_mem_q);
    expInc_uid92_fpSubTest_b <= STD_LOGIC_VECTOR("0" & oneCST_uid91_fpSubTest_q);
    expInc_uid92_fpSubTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expInc_uid92_fpSubTest_a) + UNSIGNED(expInc_uid92_fpSubTest_b));
    expInc_uid92_fpSubTest_q <= expInc_uid92_fpSubTest_o(8 downto 0);

    -- expPostNorm_uid93_fpSubTest(SUB,92)@10 + 1
    expPostNorm_uid93_fpSubTest_a <= STD_LOGIC_VECTOR("0" & expInc_uid92_fpSubTest_q);
    expPostNorm_uid93_fpSubTest_b <= STD_LOGIC_VECTOR("00000" & redist9_r_uid180_lzCountVal_uid86_fpSubTest_q_1_q);
    expPostNorm_uid93_fpSubTest_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                expPostNorm_uid93_fpSubTest_o <= (others => '0');
            ELSE
                expPostNorm_uid93_fpSubTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expPostNorm_uid93_fpSubTest_a) - UNSIGNED(expPostNorm_uid93_fpSubTest_b));
            END IF;
        END IF;
    END PROCESS;
    expPostNorm_uid93_fpSubTest_q <= expPostNorm_uid93_fpSubTest_o(9 downto 0);

    -- fracPostNorm_uid90_fpSubTest(BITSELECT,89)@10
    fracPostNorm_uid90_fpSubTest_b <= leftShiftStage2_uid250_fracPostNormExt_uid89_fpSubTest_q(27 downto 1);

    -- fracPostNormRndRange_uid103_fpSubTest(BITSELECT,102)@10
    fracPostNormRndRange_uid103_fpSubTest_in <= fracPostNorm_uid90_fpSubTest_b(25 downto 0);
    fracPostNormRndRange_uid103_fpSubTest_b <= fracPostNormRndRange_uid103_fpSubTest_in(25 downto 2);

    -- redist19_fracPostNormRndRange_uid103_fpSubTest_b_1(DELAY,276)
    redist19_fracPostNormRndRange_uid103_fpSubTest_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist19_fracPostNormRndRange_uid103_fpSubTest_b_1_q <= (others => '0');
            ELSE
                redist19_fracPostNormRndRange_uid103_fpSubTest_b_1_q <= STD_LOGIC_VECTOR(fracPostNormRndRange_uid103_fpSubTest_b);
            END IF;
        END IF;
    END PROCESS;

    -- expFracR_uid104_fpSubTest(BITJOIN,103)@11
    expFracR_uid104_fpSubTest_q <= expPostNorm_uid93_fpSubTest_q & redist19_fracPostNormRndRange_uid103_fpSubTest_b_1_q;

    -- rndExpFrac_uid105_fpSubTest(ADD,104)@11 + 1
    rndExpFrac_uid105_fpSubTest_a <= STD_LOGIC_VECTOR("0" & expFracR_uid104_fpSubTest_q);
    rndExpFrac_uid105_fpSubTest_b <= STD_LOGIC_VECTOR("0000000000000000000000000000000000" & roundBit_uid102_fpSubTest_q);
    rndExpFrac_uid105_fpSubTest_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                rndExpFrac_uid105_fpSubTest_o <= (others => '0');
            ELSE
                rndExpFrac_uid105_fpSubTest_o <= STD_LOGIC_VECTOR(UNSIGNED(rndExpFrac_uid105_fpSubTest_a) + UNSIGNED(rndExpFrac_uid105_fpSubTest_b));
            END IF;
        END IF;
    END PROCESS;
    rndExpFrac_uid105_fpSubTest_q <= rndExpFrac_uid105_fpSubTest_o(34 downto 0);

    -- expRPreExc_uid118_fpSubTest(BITSELECT,117)@12
    expRPreExc_uid118_fpSubTest_in <= rndExpFrac_uid105_fpSubTest_q(31 downto 0);
    expRPreExc_uid118_fpSubTest_b <= expRPreExc_uid118_fpSubTest_in(31 downto 24);

    -- redist17_expRPreExc_uid118_fpSubTest_b_2(DELAY,274)
    redist17_expRPreExc_uid118_fpSubTest_b_2_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist17_expRPreExc_uid118_fpSubTest_b_2_delay_0 <= (others => '0');
                redist17_expRPreExc_uid118_fpSubTest_b_2_q <= (others => '0');
            ELSE
                redist17_expRPreExc_uid118_fpSubTest_b_2_delay_0 <= STD_LOGIC_VECTOR(expRPreExc_uid118_fpSubTest_b);
                redist17_expRPreExc_uid118_fpSubTest_b_2_q <= redist17_expRPreExc_uid118_fpSubTest_b_2_delay_0;
            END IF;
        END IF;
    END PROCESS;

    -- rndExpFracOvfBits_uid110_fpSubTest(BITSELECT,109)@12
    rndExpFracOvfBits_uid110_fpSubTest_in <= rndExpFrac_uid105_fpSubTest_q(33 downto 0);
    rndExpFracOvfBits_uid110_fpSubTest_b <= rndExpFracOvfBits_uid110_fpSubTest_in(33 downto 32);

    -- rOvfExtraBits_uid111_fpSubTest(LOGICAL,110)@12
    rOvfExtraBits_uid111_fpSubTest_q <= "1" WHEN rndExpFracOvfBits_uid110_fpSubTest_b = zocst_uid77_fpSubTest_q ELSE "0";

    -- wEP2AllOwE_uid106_fpSubTest(CONSTANT,105)
    wEP2AllOwE_uid106_fpSubTest_q <= "0011111111";

    -- rndExp_uid107_fpSubTest(BITSELECT,106)@12
    rndExp_uid107_fpSubTest_in <= rndExpFrac_uid105_fpSubTest_q(33 downto 0);
    rndExp_uid107_fpSubTest_b <= rndExp_uid107_fpSubTest_in(33 downto 24);

    -- rOvfEQMax_uid108_fpSubTest(LOGICAL,107)@12
    rOvfEQMax_uid108_fpSubTest_q <= "1" WHEN rndExp_uid107_fpSubTest_b = wEP2AllOwE_uid106_fpSubTest_q ELSE "0";

    -- rOvf_uid112_fpSubTest(LOGICAL,111)@12 + 1
    rOvf_uid112_fpSubTest_qi <= rOvfEQMax_uid108_fpSubTest_q or rOvfExtraBits_uid111_fpSubTest_q;
    rOvf_uid112_fpSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => rOvf_uid112_fpSubTest_qi, xout => rOvf_uid112_fpSubTest_q, clk => clk, aclr => areset, ena => '1' );

    -- regInputs_uid119_fpSubTest(LOGICAL,118)@11 + 1
    regInputs_uid119_fpSubTest_qi <= excR_aSig_uid32_fpSubTest_q and excR_bSig_uid46_fpSubTest_q;
    regInputs_uid119_fpSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => regInputs_uid119_fpSubTest_qi, xout => regInputs_uid119_fpSubTest_q, clk => clk, aclr => areset, ena => '1' );

    -- redist16_regInputs_uid119_fpSubTest_q_2(DELAY,273)
    redist16_regInputs_uid119_fpSubTest_q_2_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist16_regInputs_uid119_fpSubTest_q_2_q <= (others => '0');
            ELSE
                redist16_regInputs_uid119_fpSubTest_q_2_q <= STD_LOGIC_VECTOR(regInputs_uid119_fpSubTest_q);
            END IF;
        END IF;
    END PROCESS;

    -- rInfOvf_uid122_fpSubTest(LOGICAL,121)@13
    rInfOvf_uid122_fpSubTest_q <= redist16_regInputs_uid119_fpSubTest_q_2_q and rOvf_uid112_fpSubTest_q;

    -- excRInfVInC_uid123_fpSubTest(BITJOIN,122)@13
    excRInfVInC_uid123_fpSubTest_q <= rInfOvf_uid122_fpSubTest_q & redist31_excN_bSig_uid43_fpSubTest_q_3_q & redist40_excN_aSig_uid29_fpSubTest_q_3_q & redist32_excI_bSig_uid42_fpSubTest_q_3_q & redist41_excI_aSig_uid28_fpSubTest_q_3_q & redist25_effSub_uid53_fpSubTest_q_9_q;

    -- excRInf_uid124_fpSubTest(LOOKUP,123)@13
    excRInf_uid124_fpSubTest_combproc: PROCESS (excRInfVInC_uid123_fpSubTest_q)
    BEGIN
        -- Begin reserved scope level
        CASE (excRInfVInC_uid123_fpSubTest_q) IS
            WHEN "000000" => excRInf_uid124_fpSubTest_q <= "0";
            WHEN "000001" => excRInf_uid124_fpSubTest_q <= "0";
            WHEN "000010" => excRInf_uid124_fpSubTest_q <= "1";
            WHEN "000011" => excRInf_uid124_fpSubTest_q <= "1";
            WHEN "000100" => excRInf_uid124_fpSubTest_q <= "1";
            WHEN "000101" => excRInf_uid124_fpSubTest_q <= "1";
            WHEN "000110" => excRInf_uid124_fpSubTest_q <= "1";
            WHEN "000111" => excRInf_uid124_fpSubTest_q <= "0";
            WHEN "001000" => excRInf_uid124_fpSubTest_q <= "0";
            WHEN "001001" => excRInf_uid124_fpSubTest_q <= "0";
            WHEN "001010" => excRInf_uid124_fpSubTest_q <= "0";
            WHEN "001011" => excRInf_uid124_fpSubTest_q <= "0";
            WHEN "001100" => excRInf_uid124_fpSubTest_q <= "0";
            WHEN "001101" => excRInf_uid124_fpSubTest_q <= "0";
            WHEN "001110" => excRInf_uid124_fpSubTest_q <= "0";
            WHEN "001111" => excRInf_uid124_fpSubTest_q <= "0";
            WHEN "010000" => excRInf_uid124_fpSubTest_q <= "0";
            WHEN "010001" => excRInf_uid124_fpSubTest_q <= "0";
            WHEN "010010" => excRInf_uid124_fpSubTest_q <= "0";
            WHEN "010011" => excRInf_uid124_fpSubTest_q <= "0";
            WHEN "010100" => excRInf_uid124_fpSubTest_q <= "0";
            WHEN "010101" => excRInf_uid124_fpSubTest_q <= "0";
            WHEN "010110" => excRInf_uid124_fpSubTest_q <= "0";
            WHEN "010111" => excRInf_uid124_fpSubTest_q <= "0";
            WHEN "011000" => excRInf_uid124_fpSubTest_q <= "0";
            WHEN "011001" => excRInf_uid124_fpSubTest_q <= "0";
            WHEN "011010" => excRInf_uid124_fpSubTest_q <= "0";
            WHEN "011011" => excRInf_uid124_fpSubTest_q <= "0";
            WHEN "011100" => excRInf_uid124_fpSubTest_q <= "0";
            WHEN "011101" => excRInf_uid124_fpSubTest_q <= "0";
            WHEN "011110" => excRInf_uid124_fpSubTest_q <= "0";
            WHEN "011111" => excRInf_uid124_fpSubTest_q <= "0";
            WHEN "100000" => excRInf_uid124_fpSubTest_q <= "1";
            WHEN "100001" => excRInf_uid124_fpSubTest_q <= "0";
            WHEN "100010" => excRInf_uid124_fpSubTest_q <= "0";
            WHEN "100011" => excRInf_uid124_fpSubTest_q <= "0";
            WHEN "100100" => excRInf_uid124_fpSubTest_q <= "0";
            WHEN "100101" => excRInf_uid124_fpSubTest_q <= "0";
            WHEN "100110" => excRInf_uid124_fpSubTest_q <= "0";
            WHEN "100111" => excRInf_uid124_fpSubTest_q <= "0";
            WHEN "101000" => excRInf_uid124_fpSubTest_q <= "0";
            WHEN "101001" => excRInf_uid124_fpSubTest_q <= "0";
            WHEN "101010" => excRInf_uid124_fpSubTest_q <= "0";
            WHEN "101011" => excRInf_uid124_fpSubTest_q <= "0";
            WHEN "101100" => excRInf_uid124_fpSubTest_q <= "0";
            WHEN "101101" => excRInf_uid124_fpSubTest_q <= "0";
            WHEN "101110" => excRInf_uid124_fpSubTest_q <= "0";
            WHEN "101111" => excRInf_uid124_fpSubTest_q <= "0";
            WHEN "110000" => excRInf_uid124_fpSubTest_q <= "0";
            WHEN "110001" => excRInf_uid124_fpSubTest_q <= "0";
            WHEN "110010" => excRInf_uid124_fpSubTest_q <= "0";
            WHEN "110011" => excRInf_uid124_fpSubTest_q <= "0";
            WHEN "110100" => excRInf_uid124_fpSubTest_q <= "0";
            WHEN "110101" => excRInf_uid124_fpSubTest_q <= "0";
            WHEN "110110" => excRInf_uid124_fpSubTest_q <= "0";
            WHEN "110111" => excRInf_uid124_fpSubTest_q <= "0";
            WHEN "111000" => excRInf_uid124_fpSubTest_q <= "0";
            WHEN "111001" => excRInf_uid124_fpSubTest_q <= "0";
            WHEN "111010" => excRInf_uid124_fpSubTest_q <= "0";
            WHEN "111011" => excRInf_uid124_fpSubTest_q <= "0";
            WHEN "111100" => excRInf_uid124_fpSubTest_q <= "0";
            WHEN "111101" => excRInf_uid124_fpSubTest_q <= "0";
            WHEN "111110" => excRInf_uid124_fpSubTest_q <= "0";
            WHEN "111111" => excRInf_uid124_fpSubTest_q <= "0";
            WHEN OTHERS => -- unreachable
                           excRInf_uid124_fpSubTest_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- redist20_aMinusA_uid88_fpSubTest_q_3(DELAY,277)
    redist20_aMinusA_uid88_fpSubTest_q_3_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist20_aMinusA_uid88_fpSubTest_q_3_delay_0 <= (others => '0');
                redist20_aMinusA_uid88_fpSubTest_q_3_q <= (others => '0');
            ELSE
                redist20_aMinusA_uid88_fpSubTest_q_3_delay_0 <= STD_LOGIC_VECTOR(aMinusA_uid88_fpSubTest_q);
                redist20_aMinusA_uid88_fpSubTest_q_3_q <= redist20_aMinusA_uid88_fpSubTest_q_3_delay_0;
            END IF;
        END IF;
    END PROCESS;

    -- rUdfExtraBit_uid115_fpSubTest(BITSELECT,114)@12
    rUdfExtraBit_uid115_fpSubTest_in <= STD_LOGIC_VECTOR(rndExpFrac_uid105_fpSubTest_q(33 downto 0));
    rUdfExtraBit_uid115_fpSubTest_b <= STD_LOGIC_VECTOR(rUdfExtraBit_uid115_fpSubTest_in(33 downto 33));

    -- wEP2AllZ_uid113_fpSubTest(CONSTANT,112)
    wEP2AllZ_uid113_fpSubTest_q <= "0000000000";

    -- rUdfEQMin_uid114_fpSubTest(LOGICAL,113)@12
    rUdfEQMin_uid114_fpSubTest_q <= "1" WHEN rndExp_uid107_fpSubTest_b = wEP2AllZ_uid113_fpSubTest_q ELSE "0";

    -- rUdf_uid116_fpSubTest(LOGICAL,115)@12 + 1
    rUdf_uid116_fpSubTest_qi <= rUdfEQMin_uid114_fpSubTest_q or rUdfExtraBit_uid115_fpSubTest_b;
    rUdf_uid116_fpSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => rUdf_uid116_fpSubTest_qi, xout => rUdf_uid116_fpSubTest_q, clk => clk, aclr => areset, ena => '1' );

    -- redist37_excZ_bSig_uid18_uid38_fpSubTest_q_12(DELAY,294)
    redist37_excZ_bSig_uid18_uid38_fpSubTest_q_12_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist37_excZ_bSig_uid18_uid38_fpSubTest_q_12_delay_0 <= (others => '0');
                redist37_excZ_bSig_uid18_uid38_fpSubTest_q_12_q <= (others => '0');
            ELSE
                redist37_excZ_bSig_uid18_uid38_fpSubTest_q_12_delay_0 <= STD_LOGIC_VECTOR(redist36_excZ_bSig_uid18_uid38_fpSubTest_q_10_q);
                redist37_excZ_bSig_uid18_uid38_fpSubTest_q_12_q <= redist37_excZ_bSig_uid18_uid38_fpSubTest_q_12_delay_0;
            END IF;
        END IF;
    END PROCESS;

    -- redist44_excZ_aSig_uid17_uid24_fpSubTest_q_3(DELAY,301)
    redist44_excZ_aSig_uid17_uid24_fpSubTest_q_3_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist44_excZ_aSig_uid17_uid24_fpSubTest_q_3_delay_0 <= (others => '0');
                redist44_excZ_aSig_uid17_uid24_fpSubTest_q_3_q <= (others => '0');
            ELSE
                redist44_excZ_aSig_uid17_uid24_fpSubTest_q_3_delay_0 <= STD_LOGIC_VECTOR(redist43_excZ_aSig_uid17_uid24_fpSubTest_q_1_q);
                redist44_excZ_aSig_uid17_uid24_fpSubTest_q_3_q <= redist44_excZ_aSig_uid17_uid24_fpSubTest_q_3_delay_0;
            END IF;
        END IF;
    END PROCESS;

    -- excRZeroVInC_uid120_fpSubTest(BITJOIN,119)@13
    excRZeroVInC_uid120_fpSubTest_q <= redist20_aMinusA_uid88_fpSubTest_q_3_q & rUdf_uid116_fpSubTest_q & redist16_regInputs_uid119_fpSubTest_q_2_q & redist37_excZ_bSig_uid18_uid38_fpSubTest_q_12_q & redist44_excZ_aSig_uid17_uid24_fpSubTest_q_3_q;

    -- excRZero_uid121_fpSubTest(LOOKUP,120)@13
    excRZero_uid121_fpSubTest_combproc: PROCESS (excRZeroVInC_uid120_fpSubTest_q)
    BEGIN
        -- Begin reserved scope level
        CASE (excRZeroVInC_uid120_fpSubTest_q) IS
            WHEN "00000" => excRZero_uid121_fpSubTest_q <= "0";
            WHEN "00001" => excRZero_uid121_fpSubTest_q <= "0";
            WHEN "00010" => excRZero_uid121_fpSubTest_q <= "0";
            WHEN "00011" => excRZero_uid121_fpSubTest_q <= "1";
            WHEN "00100" => excRZero_uid121_fpSubTest_q <= "0";
            WHEN "00101" => excRZero_uid121_fpSubTest_q <= "0";
            WHEN "00110" => excRZero_uid121_fpSubTest_q <= "0";
            WHEN "00111" => excRZero_uid121_fpSubTest_q <= "0";
            WHEN "01000" => excRZero_uid121_fpSubTest_q <= "0";
            WHEN "01001" => excRZero_uid121_fpSubTest_q <= "0";
            WHEN "01010" => excRZero_uid121_fpSubTest_q <= "0";
            WHEN "01011" => excRZero_uid121_fpSubTest_q <= "1";
            WHEN "01100" => excRZero_uid121_fpSubTest_q <= "1";
            WHEN "01101" => excRZero_uid121_fpSubTest_q <= "0";
            WHEN "01110" => excRZero_uid121_fpSubTest_q <= "0";
            WHEN "01111" => excRZero_uid121_fpSubTest_q <= "0";
            WHEN "10000" => excRZero_uid121_fpSubTest_q <= "0";
            WHEN "10001" => excRZero_uid121_fpSubTest_q <= "0";
            WHEN "10010" => excRZero_uid121_fpSubTest_q <= "0";
            WHEN "10011" => excRZero_uid121_fpSubTest_q <= "1";
            WHEN "10100" => excRZero_uid121_fpSubTest_q <= "1";
            WHEN "10101" => excRZero_uid121_fpSubTest_q <= "0";
            WHEN "10110" => excRZero_uid121_fpSubTest_q <= "0";
            WHEN "10111" => excRZero_uid121_fpSubTest_q <= "0";
            WHEN "11000" => excRZero_uid121_fpSubTest_q <= "0";
            WHEN "11001" => excRZero_uid121_fpSubTest_q <= "0";
            WHEN "11010" => excRZero_uid121_fpSubTest_q <= "0";
            WHEN "11011" => excRZero_uid121_fpSubTest_q <= "1";
            WHEN "11100" => excRZero_uid121_fpSubTest_q <= "1";
            WHEN "11101" => excRZero_uid121_fpSubTest_q <= "0";
            WHEN "11110" => excRZero_uid121_fpSubTest_q <= "0";
            WHEN "11111" => excRZero_uid121_fpSubTest_q <= "0";
            WHEN OTHERS => -- unreachable
                           excRZero_uid121_fpSubTest_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- concExc_uid128_fpSubTest(BITJOIN,127)@13
    concExc_uid128_fpSubTest_q <= excRNaN_uid127_fpSubTest_q & excRInf_uid124_fpSubTest_q & excRZero_uid121_fpSubTest_q;

    -- excREnc_uid129_fpSubTest(LOOKUP,128)@13 + 1
    excREnc_uid129_fpSubTest_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                excREnc_uid129_fpSubTest_q <= "01";
            ELSE
                CASE (concExc_uid128_fpSubTest_q) IS
                    WHEN "000" => excREnc_uid129_fpSubTest_q <= "01";
                    WHEN "001" => excREnc_uid129_fpSubTest_q <= "00";
                    WHEN "010" => excREnc_uid129_fpSubTest_q <= "10";
                    WHEN "011" => excREnc_uid129_fpSubTest_q <= "10";
                    WHEN "100" => excREnc_uid129_fpSubTest_q <= "11";
                    WHEN "101" => excREnc_uid129_fpSubTest_q <= "11";
                    WHEN "110" => excREnc_uid129_fpSubTest_q <= "11";
                    WHEN "111" => excREnc_uid129_fpSubTest_q <= "11";
                    WHEN OTHERS => -- unreachable
                                   excREnc_uid129_fpSubTest_q <= (others => '-');
                END CASE;
            END IF;
        END IF;
    END PROCESS;

    -- expRPostExc_uid148_fpSubTest(MUX,147)@14
    expRPostExc_uid148_fpSubTest_s <= excREnc_uid129_fpSubTest_q;
    expRPostExc_uid148_fpSubTest_combproc: PROCESS (expRPostExc_uid148_fpSubTest_s, cstAllZWE_uid21_fpSubTest_q, redist17_expRPreExc_uid118_fpSubTest_b_2_q, cstAllOWE_uid19_fpSubTest_q)
    BEGIN
        CASE (expRPostExc_uid148_fpSubTest_s) IS
            WHEN "00" => expRPostExc_uid148_fpSubTest_q <= cstAllZWE_uid21_fpSubTest_q;
            WHEN "01" => expRPostExc_uid148_fpSubTest_q <= redist17_expRPreExc_uid118_fpSubTest_b_2_q;
            WHEN "10" => expRPostExc_uid148_fpSubTest_q <= cstAllOWE_uid19_fpSubTest_q;
            WHEN "11" => expRPostExc_uid148_fpSubTest_q <= cstAllOWE_uid19_fpSubTest_q;
            WHEN OTHERS => expRPostExc_uid148_fpSubTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- oneFracRPostExc2_uid141_fpSubTest(CONSTANT,140)
    oneFracRPostExc2_uid141_fpSubTest_q <= "00000000000000000000001";

    -- fracRPreExc_uid117_fpSubTest(BITSELECT,116)@12
    fracRPreExc_uid117_fpSubTest_in <= rndExpFrac_uid105_fpSubTest_q(23 downto 0);
    fracRPreExc_uid117_fpSubTest_b <= fracRPreExc_uid117_fpSubTest_in(23 downto 1);

    -- redist18_fracRPreExc_uid117_fpSubTest_b_2(DELAY,275)
    redist18_fracRPreExc_uid117_fpSubTest_b_2_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist18_fracRPreExc_uid117_fpSubTest_b_2_delay_0 <= (others => '0');
                redist18_fracRPreExc_uid117_fpSubTest_b_2_q <= (others => '0');
            ELSE
                redist18_fracRPreExc_uid117_fpSubTest_b_2_delay_0 <= STD_LOGIC_VECTOR(fracRPreExc_uid117_fpSubTest_b);
                redist18_fracRPreExc_uid117_fpSubTest_b_2_q <= redist18_fracRPreExc_uid117_fpSubTest_b_2_delay_0;
            END IF;
        END IF;
    END PROCESS;

    -- fracRPostExc_uid144_fpSubTest(MUX,143)@14
    fracRPostExc_uid144_fpSubTest_s <= excREnc_uid129_fpSubTest_q;
    fracRPostExc_uid144_fpSubTest_combproc: PROCESS (fracRPostExc_uid144_fpSubTest_s, cstZeroWF_uid20_fpSubTest_q, redist18_fracRPreExc_uid117_fpSubTest_b_2_q, oneFracRPostExc2_uid141_fpSubTest_q)
    BEGIN
        CASE (fracRPostExc_uid144_fpSubTest_s) IS
            WHEN "00" => fracRPostExc_uid144_fpSubTest_q <= cstZeroWF_uid20_fpSubTest_q;
            WHEN "01" => fracRPostExc_uid144_fpSubTest_q <= redist18_fracRPreExc_uid117_fpSubTest_b_2_q;
            WHEN "10" => fracRPostExc_uid144_fpSubTest_q <= cstZeroWF_uid20_fpSubTest_q;
            WHEN "11" => fracRPostExc_uid144_fpSubTest_q <= oneFracRPostExc2_uid141_fpSubTest_q;
            WHEN OTHERS => fracRPostExc_uid144_fpSubTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- R_uid149_fpSubTest(BITJOIN,148)@14
    R_uid149_fpSubTest_q <= signRPostExc_uid140_fpSubTest_q & expRPostExc_uid148_fpSubTest_q & fracRPostExc_uid144_fpSubTest_q;

    -- xOut(GPOUT,4)@14
    q <= R_uid149_fpSubTest_q;

END normal;
