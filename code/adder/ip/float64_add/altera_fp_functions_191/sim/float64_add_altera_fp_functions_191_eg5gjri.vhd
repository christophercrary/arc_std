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

-- VHDL created from float64_add_altera_fp_functions_191_eg5gjri
-- VHDL created on Mon Sep 26 21:10:49 2022


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

entity float64_add_altera_fp_functions_191_eg5gjri is
    port (
        a : in std_logic_vector(63 downto 0);  -- float64_m52
        b : in std_logic_vector(63 downto 0);  -- float64_m52
        q : out std_logic_vector(63 downto 0);  -- float64_m52
        clk : in std_logic;
        areset : in std_logic
    );
end float64_add_altera_fp_functions_191_eg5gjri;

architecture normal of float64_add_altera_fp_functions_191_eg5gjri is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracX_uid6_fpAddTest_b : STD_LOGIC_VECTOR (62 downto 0);
    signal expFracY_uid7_fpAddTest_b : STD_LOGIC_VECTOR (62 downto 0);
    signal xGTEy_uid8_fpAddTest_a : STD_LOGIC_VECTOR (64 downto 0);
    signal xGTEy_uid8_fpAddTest_b : STD_LOGIC_VECTOR (64 downto 0);
    signal xGTEy_uid8_fpAddTest_o : STD_LOGIC_VECTOR (64 downto 0);
    signal xGTEy_uid8_fpAddTest_n : STD_LOGIC_VECTOR (0 downto 0);
    signal fracY_uid9_fpAddTest_b : STD_LOGIC_VECTOR (51 downto 0);
    signal expY_uid10_fpAddTest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal sigY_uid11_fpAddTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal ypn_uid12_fpAddTest_q : STD_LOGIC_VECTOR (63 downto 0);
    signal aSig_uid16_fpAddTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aSig_uid16_fpAddTest_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bSig_uid17_fpAddTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal bSig_uid17_fpAddTest_q : STD_LOGIC_VECTOR (63 downto 0);
    signal cstAllOWE_uid18_fpAddTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal cstZeroWF_uid19_fpAddTest_q : STD_LOGIC_VECTOR (51 downto 0);
    signal cstAllZWE_uid20_fpAddTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal exp_aSig_uid21_fpAddTest_in : STD_LOGIC_VECTOR (62 downto 0);
    signal exp_aSig_uid21_fpAddTest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal frac_aSig_uid22_fpAddTest_in : STD_LOGIC_VECTOR (51 downto 0);
    signal frac_aSig_uid22_fpAddTest_b : STD_LOGIC_VECTOR (51 downto 0);
    signal excZ_aSig_uid16_uid23_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid24_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid26_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_aSig_uid27_fpAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_aSig_uid27_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_aSig_uid28_fpAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_aSig_uid28_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid29_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid30_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_aSig_uid31_fpAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_aSig_uid31_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal exp_bSig_uid35_fpAddTest_in : STD_LOGIC_VECTOR (62 downto 0);
    signal exp_bSig_uid35_fpAddTest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal frac_bSig_uid36_fpAddTest_in : STD_LOGIC_VECTOR (51 downto 0);
    signal frac_bSig_uid36_fpAddTest_b : STD_LOGIC_VECTOR (51 downto 0);
    signal excZ_bSig_uid17_uid37_fpAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_bSig_uid17_uid37_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid38_fpAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid38_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid40_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_bSig_uid41_fpAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_bSig_uid41_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_bSig_uid42_fpAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_bSig_uid42_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid43_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid44_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_bSig_uid45_fpAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_bSig_uid45_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sigA_uid50_fpAddTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal sigB_uid51_fpAddTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal effSub_uid52_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracBz_uid56_fpAddTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fracBz_uid56_fpAddTest_q : STD_LOGIC_VECTOR (51 downto 0);
    signal oFracB_uid59_fpAddTest_q : STD_LOGIC_VECTOR (52 downto 0);
    signal expAmExpB_uid60_fpAddTest_a : STD_LOGIC_VECTOR (11 downto 0);
    signal expAmExpB_uid60_fpAddTest_b : STD_LOGIC_VECTOR (11 downto 0);
    signal expAmExpB_uid60_fpAddTest_o : STD_LOGIC_VECTOR (11 downto 0);
    signal expAmExpB_uid60_fpAddTest_q : STD_LOGIC_VECTOR (11 downto 0);
    signal cWFP2_uid61_fpAddTest_q : STD_LOGIC_VECTOR (5 downto 0);
    signal shiftedOut_uid63_fpAddTest_a : STD_LOGIC_VECTOR (13 downto 0);
    signal shiftedOut_uid63_fpAddTest_b : STD_LOGIC_VECTOR (13 downto 0);
    signal shiftedOut_uid63_fpAddTest_o : STD_LOGIC_VECTOR (13 downto 0);
    signal shiftedOut_uid63_fpAddTest_c : STD_LOGIC_VECTOR (0 downto 0);
    signal padConst_uid64_fpAddTest_q : STD_LOGIC_VECTOR (53 downto 0);
    signal rightPaddedIn_uid65_fpAddTest_q : STD_LOGIC_VECTOR (106 downto 0);
    signal iShiftedOut_uid67_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal alignFracBPostShiftOut_uid68_fpAddTest_b : STD_LOGIC_VECTOR (106 downto 0);
    signal alignFracBPostShiftOut_uid68_fpAddTest_q : STD_LOGIC_VECTOR (106 downto 0);
    signal invCmpEQ_stickyBits_cZwF_uid72_fpAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal invCmpEQ_stickyBits_cZwF_uid72_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal effSubInvSticky_uid74_fpAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal effSubInvSticky_uid74_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal zocst_uid76_fpAddTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal fracAAddOp_uid77_fpAddTest_q : STD_LOGIC_VECTOR (55 downto 0);
    signal fracBAddOp_uid80_fpAddTest_q : STD_LOGIC_VECTOR (55 downto 0);
    signal fracBAddOpPostXor_uid81_fpAddTest_b : STD_LOGIC_VECTOR (55 downto 0);
    signal fracBAddOpPostXor_uid81_fpAddTest_qi : STD_LOGIC_VECTOR (55 downto 0);
    signal fracBAddOpPostXor_uid81_fpAddTest_q : STD_LOGIC_VECTOR (55 downto 0);
    signal fracAddResult_uid82_fpAddTest_a : STD_LOGIC_VECTOR (56 downto 0);
    signal fracAddResult_uid82_fpAddTest_b : STD_LOGIC_VECTOR (56 downto 0);
    signal fracAddResult_uid82_fpAddTest_o : STD_LOGIC_VECTOR (56 downto 0);
    signal fracAddResult_uid82_fpAddTest_q : STD_LOGIC_VECTOR (56 downto 0);
    signal rangeFracAddResultMwfp3Dto0_uid83_fpAddTest_in : STD_LOGIC_VECTOR (55 downto 0);
    signal rangeFracAddResultMwfp3Dto0_uid83_fpAddTest_b : STD_LOGIC_VECTOR (55 downto 0);
    signal fracGRS_uid84_fpAddTest_q : STD_LOGIC_VECTOR (56 downto 0);
    signal cAmA_uid86_fpAddTest_q : STD_LOGIC_VECTOR (5 downto 0);
    signal aMinusA_uid87_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracPostNorm_uid89_fpAddTest_b : STD_LOGIC_VECTOR (55 downto 0);
    signal oneCST_uid90_fpAddTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal expInc_uid91_fpAddTest_a : STD_LOGIC_VECTOR (11 downto 0);
    signal expInc_uid91_fpAddTest_b : STD_LOGIC_VECTOR (11 downto 0);
    signal expInc_uid91_fpAddTest_o : STD_LOGIC_VECTOR (11 downto 0);
    signal expInc_uid91_fpAddTest_q : STD_LOGIC_VECTOR (11 downto 0);
    signal expPostNorm_uid92_fpAddTest_a : STD_LOGIC_VECTOR (12 downto 0);
    signal expPostNorm_uid92_fpAddTest_b : STD_LOGIC_VECTOR (12 downto 0);
    signal expPostNorm_uid92_fpAddTest_o : STD_LOGIC_VECTOR (12 downto 0);
    signal expPostNorm_uid92_fpAddTest_q : STD_LOGIC_VECTOR (12 downto 0);
    signal Sticky0_uid93_fpAddTest_in : STD_LOGIC_VECTOR (0 downto 0);
    signal Sticky0_uid93_fpAddTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal Sticky1_uid94_fpAddTest_in : STD_LOGIC_VECTOR (1 downto 0);
    signal Sticky1_uid94_fpAddTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal Round_uid95_fpAddTest_in : STD_LOGIC_VECTOR (2 downto 0);
    signal Round_uid95_fpAddTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal Guard_uid96_fpAddTest_in : STD_LOGIC_VECTOR (3 downto 0);
    signal Guard_uid96_fpAddTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal LSB_uid97_fpAddTest_in : STD_LOGIC_VECTOR (4 downto 0);
    signal LSB_uid97_fpAddTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal rndBitCond_uid98_fpAddTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal cRBit_uid99_fpAddTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal rBi_uid100_fpAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal rBi_uid100_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal roundBit_uid101_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracPostNormRndRange_uid102_fpAddTest_in : STD_LOGIC_VECTOR (54 downto 0);
    signal fracPostNormRndRange_uid102_fpAddTest_b : STD_LOGIC_VECTOR (52 downto 0);
    signal expFracR_uid103_fpAddTest_q : STD_LOGIC_VECTOR (65 downto 0);
    signal rndExpFrac_uid104_fpAddTest_a : STD_LOGIC_VECTOR (66 downto 0);
    signal rndExpFrac_uid104_fpAddTest_b : STD_LOGIC_VECTOR (66 downto 0);
    signal rndExpFrac_uid104_fpAddTest_o : STD_LOGIC_VECTOR (66 downto 0);
    signal rndExpFrac_uid104_fpAddTest_q : STD_LOGIC_VECTOR (66 downto 0);
    signal wEP2AllOwE_uid105_fpAddTest_q : STD_LOGIC_VECTOR (12 downto 0);
    signal rndExp_uid106_fpAddTest_in : STD_LOGIC_VECTOR (65 downto 0);
    signal rndExp_uid106_fpAddTest_b : STD_LOGIC_VECTOR (12 downto 0);
    signal rOvfEQMax_uid107_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rndExpFracOvfBits_uid109_fpAddTest_in : STD_LOGIC_VECTOR (65 downto 0);
    signal rndExpFracOvfBits_uid109_fpAddTest_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rOvfExtraBits_uid110_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rOvf_uid111_fpAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal rOvf_uid111_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal wEP2AllZ_uid112_fpAddTest_q : STD_LOGIC_VECTOR (12 downto 0);
    signal rUdfEQMin_uid113_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rUdfExtraBit_uid114_fpAddTest_in : STD_LOGIC_VECTOR (65 downto 0);
    signal rUdfExtraBit_uid114_fpAddTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal rUdf_uid115_fpAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal rUdf_uid115_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPreExc_uid116_fpAddTest_in : STD_LOGIC_VECTOR (52 downto 0);
    signal fracRPreExc_uid116_fpAddTest_b : STD_LOGIC_VECTOR (51 downto 0);
    signal expRPreExc_uid117_fpAddTest_in : STD_LOGIC_VECTOR (63 downto 0);
    signal expRPreExc_uid117_fpAddTest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal regInputs_uid118_fpAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal regInputs_uid118_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZeroVInC_uid119_fpAddTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal excRZero_uid120_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rInfOvf_uid121_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRInfVInC_uid122_fpAddTest_q : STD_LOGIC_VECTOR (5 downto 0);
    signal excRInf_uid123_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN2_uid124_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excAIBISub_uid125_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid126_fpAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid126_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal concExc_uid127_fpAddTest_q : STD_LOGIC_VECTOR (2 downto 0);
    signal excREnc_uid128_fpAddTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal invAMinusA_uid129_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRReg_uid130_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sigBBInf_uid131_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sigAAInf_uid132_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRInf_uid133_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excAZBZSigASigB_uid134_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excBZARSigA_uid135_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRZero_uid136_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRInfRZRReg_uid137_fpAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal signRInfRZRReg_uid137_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExcRNaN_uid138_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRPostExc_uid139_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal oneFracRPostExc2_uid140_fpAddTest_q : STD_LOGIC_VECTOR (51 downto 0);
    signal fracRPostExc_uid143_fpAddTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid143_fpAddTest_q : STD_LOGIC_VECTOR (51 downto 0);
    signal expRPostExc_uid147_fpAddTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal expRPostExc_uid147_fpAddTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal R_uid148_fpAddTest_q : STD_LOGIC_VECTOR (63 downto 0);
    signal zs_uid150_lzCountVal_uid85_fpAddTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rVStage_uid151_lzCountVal_uid85_fpAddTest_b : STD_LOGIC_VECTOR (31 downto 0);
    signal vCount_uid152_lzCountVal_uid85_fpAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal vCount_uid152_lzCountVal_uid85_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal mO_uid153_lzCountVal_uid85_fpAddTest_q : STD_LOGIC_VECTOR (6 downto 0);
    signal vStage_uid154_lzCountVal_uid85_fpAddTest_in : STD_LOGIC_VECTOR (24 downto 0);
    signal vStage_uid154_lzCountVal_uid85_fpAddTest_b : STD_LOGIC_VECTOR (24 downto 0);
    signal cStage_uid155_lzCountVal_uid85_fpAddTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal vStagei_uid157_lzCountVal_uid85_fpAddTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid157_lzCountVal_uid85_fpAddTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal zs_uid158_lzCountVal_uid85_fpAddTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal vCount_uid160_lzCountVal_uid85_fpAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal vCount_uid160_lzCountVal_uid85_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid163_lzCountVal_uid85_fpAddTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid163_lzCountVal_uid85_fpAddTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal zs_uid164_lzCountVal_uid85_fpAddTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal vCount_uid166_lzCountVal_uid85_fpAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal vCount_uid166_lzCountVal_uid85_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid169_lzCountVal_uid85_fpAddTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid169_lzCountVal_uid85_fpAddTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal zs_uid170_lzCountVal_uid85_fpAddTest_q : STD_LOGIC_VECTOR (3 downto 0);
    signal vCount_uid172_lzCountVal_uid85_fpAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal vCount_uid172_lzCountVal_uid85_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid175_lzCountVal_uid85_fpAddTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid175_lzCountVal_uid85_fpAddTest_q : STD_LOGIC_VECTOR (3 downto 0);
    signal zs_uid176_lzCountVal_uid85_fpAddTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal vCount_uid178_lzCountVal_uid85_fpAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal vCount_uid178_lzCountVal_uid85_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid181_lzCountVal_uid85_fpAddTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid181_lzCountVal_uid85_fpAddTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal rVStage_uid183_lzCountVal_uid85_fpAddTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal vCount_uid184_lzCountVal_uid85_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal r_uid185_lzCountVal_uid85_fpAddTest_q : STD_LOGIC_VECTOR (5 downto 0);
    signal eq0_uid189_fracXIsZero_uid25_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid192_fracXIsZero_uid25_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq2_uid195_fracXIsZero_uid25_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq3_uid198_fracXIsZero_uid25_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq4_uid201_fracXIsZero_uid25_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq5_uid204_fracXIsZero_uid25_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq6_uid207_fracXIsZero_uid25_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq7_uid210_fracXIsZero_uid25_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq8_uid213_fracXIsZero_uid25_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid214_fracXIsZero_uid25_fpAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid214_fracXIsZero_uid25_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid215_fracXIsZero_uid25_fpAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid215_fracXIsZero_uid25_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev1_uid216_fracXIsZero_uid25_fpAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev1_uid216_fracXIsZero_uid25_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid219_fracXIsZero_uid39_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid222_fracXIsZero_uid39_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq2_uid225_fracXIsZero_uid39_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq3_uid228_fracXIsZero_uid39_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq4_uid231_fracXIsZero_uid39_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq5_uid234_fracXIsZero_uid39_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq6_uid237_fracXIsZero_uid39_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq7_uid240_fracXIsZero_uid39_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq8_uid243_fracXIsZero_uid39_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid244_fracXIsZero_uid39_fpAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid244_fracXIsZero_uid39_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid245_fracXIsZero_uid39_fpAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid245_fracXIsZero_uid39_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev1_uid246_fracXIsZero_uid39_fpAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev1_uid246_fracXIsZero_uid39_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal wIntCst_uid249_alignmentShifter_uid64_fpAddTest_q : STD_LOGIC_VECTOR (6 downto 0);
    signal shiftedOut_uid250_alignmentShifter_uid64_fpAddTest_a : STD_LOGIC_VECTOR (13 downto 0);
    signal shiftedOut_uid250_alignmentShifter_uid64_fpAddTest_b : STD_LOGIC_VECTOR (13 downto 0);
    signal shiftedOut_uid250_alignmentShifter_uid64_fpAddTest_o : STD_LOGIC_VECTOR (13 downto 0);
    signal shiftedOut_uid250_alignmentShifter_uid64_fpAddTest_n : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage0Idx1Rng1_uid251_alignmentShifter_uid64_fpAddTest_b : STD_LOGIC_VECTOR (105 downto 0);
    signal rightShiftStage0Idx1_uid253_alignmentShifter_uid64_fpAddTest_q : STD_LOGIC_VECTOR (106 downto 0);
    signal rightShiftStage0Idx2Rng2_uid254_alignmentShifter_uid64_fpAddTest_b : STD_LOGIC_VECTOR (104 downto 0);
    signal rightShiftStage0Idx2_uid256_alignmentShifter_uid64_fpAddTest_q : STD_LOGIC_VECTOR (106 downto 0);
    signal rightShiftStage0Idx3Rng3_uid257_alignmentShifter_uid64_fpAddTest_b : STD_LOGIC_VECTOR (103 downto 0);
    signal rightShiftStage0Idx3Pad3_uid258_alignmentShifter_uid64_fpAddTest_q : STD_LOGIC_VECTOR (2 downto 0);
    signal rightShiftStage0Idx3_uid259_alignmentShifter_uid64_fpAddTest_q : STD_LOGIC_VECTOR (106 downto 0);
    signal rightShiftStage0_uid261_alignmentShifter_uid64_fpAddTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage0_uid261_alignmentShifter_uid64_fpAddTest_q : STD_LOGIC_VECTOR (106 downto 0);
    signal rightShiftStage1Idx1Rng4_uid262_alignmentShifter_uid64_fpAddTest_b : STD_LOGIC_VECTOR (102 downto 0);
    signal rightShiftStage1Idx1_uid264_alignmentShifter_uid64_fpAddTest_q : STD_LOGIC_VECTOR (106 downto 0);
    signal rightShiftStage1Idx2Rng8_uid265_alignmentShifter_uid64_fpAddTest_b : STD_LOGIC_VECTOR (98 downto 0);
    signal rightShiftStage1Idx2_uid267_alignmentShifter_uid64_fpAddTest_q : STD_LOGIC_VECTOR (106 downto 0);
    signal rightShiftStage1Idx3Rng12_uid268_alignmentShifter_uid64_fpAddTest_b : STD_LOGIC_VECTOR (94 downto 0);
    signal rightShiftStage1Idx3Pad12_uid269_alignmentShifter_uid64_fpAddTest_q : STD_LOGIC_VECTOR (11 downto 0);
    signal rightShiftStage1Idx3_uid270_alignmentShifter_uid64_fpAddTest_q : STD_LOGIC_VECTOR (106 downto 0);
    signal rightShiftStage1_uid272_alignmentShifter_uid64_fpAddTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage1_uid272_alignmentShifter_uid64_fpAddTest_q : STD_LOGIC_VECTOR (106 downto 0);
    signal rightShiftStage2Idx1Rng16_uid273_alignmentShifter_uid64_fpAddTest_b : STD_LOGIC_VECTOR (90 downto 0);
    signal rightShiftStage2Idx1_uid275_alignmentShifter_uid64_fpAddTest_q : STD_LOGIC_VECTOR (106 downto 0);
    signal rightShiftStage2Idx2Rng32_uid276_alignmentShifter_uid64_fpAddTest_b : STD_LOGIC_VECTOR (74 downto 0);
    signal rightShiftStage2Idx2_uid278_alignmentShifter_uid64_fpAddTest_q : STD_LOGIC_VECTOR (106 downto 0);
    signal rightShiftStage2Idx3Rng48_uid279_alignmentShifter_uid64_fpAddTest_b : STD_LOGIC_VECTOR (58 downto 0);
    signal rightShiftStage2Idx3Pad48_uid280_alignmentShifter_uid64_fpAddTest_q : STD_LOGIC_VECTOR (47 downto 0);
    signal rightShiftStage2Idx3_uid281_alignmentShifter_uid64_fpAddTest_q : STD_LOGIC_VECTOR (106 downto 0);
    signal rightShiftStage2_uid283_alignmentShifter_uid64_fpAddTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage2_uid283_alignmentShifter_uid64_fpAddTest_q : STD_LOGIC_VECTOR (106 downto 0);
    signal rightShiftStage3Idx1Rng64_uid284_alignmentShifter_uid64_fpAddTest_b : STD_LOGIC_VECTOR (42 downto 0);
    signal rightShiftStage3Idx1Pad64_uid285_alignmentShifter_uid64_fpAddTest_q : STD_LOGIC_VECTOR (63 downto 0);
    signal rightShiftStage3Idx1_uid286_alignmentShifter_uid64_fpAddTest_q : STD_LOGIC_VECTOR (106 downto 0);
    signal rightShiftStage3_uid288_alignmentShifter_uid64_fpAddTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage3_uid288_alignmentShifter_uid64_fpAddTest_q : STD_LOGIC_VECTOR (106 downto 0);
    signal zeroOutCst_uid289_alignmentShifter_uid64_fpAddTest_q : STD_LOGIC_VECTOR (106 downto 0);
    signal r_uid290_alignmentShifter_uid64_fpAddTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal r_uid290_alignmentShifter_uid64_fpAddTest_q : STD_LOGIC_VECTOR (106 downto 0);
    signal eq0_uid294_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid294_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid297_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid297_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq2_uid300_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq2_uid300_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq3_uid303_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq3_uid303_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq4_uid306_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq4_uid306_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq5_uid309_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq5_uid309_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq6_uid312_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq6_uid312_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq7_uid315_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq7_uid315_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq8_uid318_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq8_uid318_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid319_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid320_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev1_uid321_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage0Idx1Rng16_uid325_fracPostNormExt_uid88_fpAddTest_in : STD_LOGIC_VECTOR (40 downto 0);
    signal leftShiftStage0Idx1Rng16_uid325_fracPostNormExt_uid88_fpAddTest_b : STD_LOGIC_VECTOR (40 downto 0);
    signal leftShiftStage0Idx1_uid326_fracPostNormExt_uid88_fpAddTest_q : STD_LOGIC_VECTOR (56 downto 0);
    signal leftShiftStage0Idx2_uid329_fracPostNormExt_uid88_fpAddTest_q : STD_LOGIC_VECTOR (56 downto 0);
    signal leftShiftStage0Idx3Rng48_uid331_fracPostNormExt_uid88_fpAddTest_in : STD_LOGIC_VECTOR (8 downto 0);
    signal leftShiftStage0Idx3Rng48_uid331_fracPostNormExt_uid88_fpAddTest_b : STD_LOGIC_VECTOR (8 downto 0);
    signal leftShiftStage0Idx3_uid332_fracPostNormExt_uid88_fpAddTest_q : STD_LOGIC_VECTOR (56 downto 0);
    signal leftShiftStage0_uid334_fracPostNormExt_uid88_fpAddTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage0_uid334_fracPostNormExt_uid88_fpAddTest_q : STD_LOGIC_VECTOR (56 downto 0);
    signal leftShiftStage1Idx1Rng4_uid336_fracPostNormExt_uid88_fpAddTest_in : STD_LOGIC_VECTOR (52 downto 0);
    signal leftShiftStage1Idx1Rng4_uid336_fracPostNormExt_uid88_fpAddTest_b : STD_LOGIC_VECTOR (52 downto 0);
    signal leftShiftStage1Idx1_uid337_fracPostNormExt_uid88_fpAddTest_q : STD_LOGIC_VECTOR (56 downto 0);
    signal leftShiftStage1Idx2Rng8_uid339_fracPostNormExt_uid88_fpAddTest_in : STD_LOGIC_VECTOR (48 downto 0);
    signal leftShiftStage1Idx2Rng8_uid339_fracPostNormExt_uid88_fpAddTest_b : STD_LOGIC_VECTOR (48 downto 0);
    signal leftShiftStage1Idx2_uid340_fracPostNormExt_uid88_fpAddTest_q : STD_LOGIC_VECTOR (56 downto 0);
    signal leftShiftStage1Idx3Rng12_uid342_fracPostNormExt_uid88_fpAddTest_in : STD_LOGIC_VECTOR (44 downto 0);
    signal leftShiftStage1Idx3Rng12_uid342_fracPostNormExt_uid88_fpAddTest_b : STD_LOGIC_VECTOR (44 downto 0);
    signal leftShiftStage1Idx3_uid343_fracPostNormExt_uid88_fpAddTest_q : STD_LOGIC_VECTOR (56 downto 0);
    signal leftShiftStage1_uid345_fracPostNormExt_uid88_fpAddTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage1_uid345_fracPostNormExt_uid88_fpAddTest_q : STD_LOGIC_VECTOR (56 downto 0);
    signal leftShiftStage2Idx1Rng1_uid347_fracPostNormExt_uid88_fpAddTest_in : STD_LOGIC_VECTOR (55 downto 0);
    signal leftShiftStage2Idx1Rng1_uid347_fracPostNormExt_uid88_fpAddTest_b : STD_LOGIC_VECTOR (55 downto 0);
    signal leftShiftStage2Idx1_uid348_fracPostNormExt_uid88_fpAddTest_q : STD_LOGIC_VECTOR (56 downto 0);
    signal leftShiftStage2Idx2Rng2_uid350_fracPostNormExt_uid88_fpAddTest_in : STD_LOGIC_VECTOR (54 downto 0);
    signal leftShiftStage2Idx2Rng2_uid350_fracPostNormExt_uid88_fpAddTest_b : STD_LOGIC_VECTOR (54 downto 0);
    signal leftShiftStage2Idx2_uid351_fracPostNormExt_uid88_fpAddTest_q : STD_LOGIC_VECTOR (56 downto 0);
    signal leftShiftStage2Idx3Rng3_uid353_fracPostNormExt_uid88_fpAddTest_in : STD_LOGIC_VECTOR (53 downto 0);
    signal leftShiftStage2Idx3Rng3_uid353_fracPostNormExt_uid88_fpAddTest_b : STD_LOGIC_VECTOR (53 downto 0);
    signal leftShiftStage2Idx3_uid354_fracPostNormExt_uid88_fpAddTest_q : STD_LOGIC_VECTOR (56 downto 0);
    signal leftShiftStage2_uid356_fracPostNormExt_uid88_fpAddTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage2_uid356_fracPostNormExt_uid88_fpAddTest_q : STD_LOGIC_VECTOR (56 downto 0);
    signal c0_uid188_fracXIsZero_uid25_fpAddTest_merged_bit_select_b : STD_LOGIC_VECTOR (5 downto 0);
    signal c0_uid188_fracXIsZero_uid25_fpAddTest_merged_bit_select_c : STD_LOGIC_VECTOR (5 downto 0);
    signal c0_uid188_fracXIsZero_uid25_fpAddTest_merged_bit_select_d : STD_LOGIC_VECTOR (5 downto 0);
    signal c0_uid188_fracXIsZero_uid25_fpAddTest_merged_bit_select_e : STD_LOGIC_VECTOR (5 downto 0);
    signal c0_uid188_fracXIsZero_uid25_fpAddTest_merged_bit_select_f : STD_LOGIC_VECTOR (5 downto 0);
    signal c0_uid188_fracXIsZero_uid25_fpAddTest_merged_bit_select_g : STD_LOGIC_VECTOR (5 downto 0);
    signal c0_uid188_fracXIsZero_uid25_fpAddTest_merged_bit_select_h : STD_LOGIC_VECTOR (5 downto 0);
    signal c0_uid188_fracXIsZero_uid25_fpAddTest_merged_bit_select_i : STD_LOGIC_VECTOR (5 downto 0);
    signal c0_uid188_fracXIsZero_uid25_fpAddTest_merged_bit_select_j : STD_LOGIC_VECTOR (3 downto 0);
    signal z0_uid187_fracXIsZero_uid25_fpAddTest_merged_bit_select_b : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid187_fracXIsZero_uid25_fpAddTest_merged_bit_select_c : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid187_fracXIsZero_uid25_fpAddTest_merged_bit_select_d : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid187_fracXIsZero_uid25_fpAddTest_merged_bit_select_e : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid187_fracXIsZero_uid25_fpAddTest_merged_bit_select_f : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid187_fracXIsZero_uid25_fpAddTest_merged_bit_select_g : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid187_fracXIsZero_uid25_fpAddTest_merged_bit_select_h : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid187_fracXIsZero_uid25_fpAddTest_merged_bit_select_i : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid187_fracXIsZero_uid25_fpAddTest_merged_bit_select_j : STD_LOGIC_VECTOR (3 downto 0);
    signal z0_uid217_fracXIsZero_uid39_fpAddTest_merged_bit_select_b : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid217_fracXIsZero_uid39_fpAddTest_merged_bit_select_c : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid217_fracXIsZero_uid39_fpAddTest_merged_bit_select_d : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid217_fracXIsZero_uid39_fpAddTest_merged_bit_select_e : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid217_fracXIsZero_uid39_fpAddTest_merged_bit_select_f : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid217_fracXIsZero_uid39_fpAddTest_merged_bit_select_g : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid217_fracXIsZero_uid39_fpAddTest_merged_bit_select_h : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid217_fracXIsZero_uid39_fpAddTest_merged_bit_select_i : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid217_fracXIsZero_uid39_fpAddTest_merged_bit_select_j : STD_LOGIC_VECTOR (3 downto 0);
    signal rightShiftStageSel0Dto0_uid260_alignmentShifter_uid64_fpAddTest_merged_bit_select_in : STD_LOGIC_VECTOR (6 downto 0);
    signal rightShiftStageSel0Dto0_uid260_alignmentShifter_uid64_fpAddTest_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStageSel0Dto0_uid260_alignmentShifter_uid64_fpAddTest_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStageSel0Dto0_uid260_alignmentShifter_uid64_fpAddTest_merged_bit_select_d : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStageSel0Dto0_uid260_alignmentShifter_uid64_fpAddTest_merged_bit_select_e : STD_LOGIC_VECTOR (0 downto 0);
    signal stickyBits_uid69_fpAddTest_merged_bit_select_b : STD_LOGIC_VECTOR (51 downto 0);
    signal stickyBits_uid69_fpAddTest_merged_bit_select_c : STD_LOGIC_VECTOR (54 downto 0);
    signal rVStage_uid159_lzCountVal_uid85_fpAddTest_merged_bit_select_b : STD_LOGIC_VECTOR (15 downto 0);
    signal rVStage_uid159_lzCountVal_uid85_fpAddTest_merged_bit_select_c : STD_LOGIC_VECTOR (15 downto 0);
    signal rVStage_uid165_lzCountVal_uid85_fpAddTest_merged_bit_select_b : STD_LOGIC_VECTOR (7 downto 0);
    signal rVStage_uid165_lzCountVal_uid85_fpAddTest_merged_bit_select_c : STD_LOGIC_VECTOR (7 downto 0);
    signal rVStage_uid171_lzCountVal_uid85_fpAddTest_merged_bit_select_b : STD_LOGIC_VECTOR (3 downto 0);
    signal rVStage_uid171_lzCountVal_uid85_fpAddTest_merged_bit_select_c : STD_LOGIC_VECTOR (3 downto 0);
    signal rVStage_uid177_lzCountVal_uid85_fpAddTest_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rVStage_uid177_lzCountVal_uid85_fpAddTest_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStageSel0Dto4_uid333_fracPostNormExt_uid88_fpAddTest_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStageSel0Dto4_uid333_fracPostNormExt_uid88_fpAddTest_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStageSel0Dto4_uid333_fracPostNormExt_uid88_fpAddTest_merged_bit_select_d : STD_LOGIC_VECTOR (1 downto 0);
    signal z0_uid292_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_merged_bit_select_b : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid292_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_merged_bit_select_c : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid292_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_merged_bit_select_d : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid292_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_merged_bit_select_e : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid292_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_merged_bit_select_f : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid292_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_merged_bit_select_g : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid292_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_merged_bit_select_h : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid292_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_merged_bit_select_i : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid292_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_merged_bit_select_j : STD_LOGIC_VECTOR (3 downto 0);
    signal redist0_leftShiftStageSel0Dto4_uid333_fracPostNormExt_uid88_fpAddTest_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist1_leftShiftStageSel0Dto4_uid333_fracPostNormExt_uid88_fpAddTest_merged_bit_select_d_1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist2_rVStage_uid177_lzCountVal_uid85_fpAddTest_merged_bit_select_b_1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist3_rVStage_uid177_lzCountVal_uid85_fpAddTest_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist4_rVStage_uid171_lzCountVal_uid85_fpAddTest_merged_bit_select_b_1_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist5_rVStage_uid171_lzCountVal_uid85_fpAddTest_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist6_rVStage_uid165_lzCountVal_uid85_fpAddTest_merged_bit_select_b_1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist7_rVStage_uid165_lzCountVal_uid85_fpAddTest_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist8_rVStage_uid159_lzCountVal_uid85_fpAddTest_merged_bit_select_b_1_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist9_rVStage_uid159_lzCountVal_uid85_fpAddTest_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist10_stickyBits_uid69_fpAddTest_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (54 downto 0);
    signal redist11_rightShiftStageSel0Dto0_uid260_alignmentShifter_uid64_fpAddTest_merged_bit_select_b_1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist12_rightShiftStageSel0Dto0_uid260_alignmentShifter_uid64_fpAddTest_merged_bit_select_c_2_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist12_rightShiftStageSel0Dto0_uid260_alignmentShifter_uid64_fpAddTest_merged_bit_select_c_2_delay_0 : STD_LOGIC_VECTOR (1 downto 0);
    signal redist13_rightShiftStageSel0Dto0_uid260_alignmentShifter_uid64_fpAddTest_merged_bit_select_d_3_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist13_rightShiftStageSel0Dto0_uid260_alignmentShifter_uid64_fpAddTest_merged_bit_select_d_3_delay_0 : STD_LOGIC_VECTOR (1 downto 0);
    signal redist13_rightShiftStageSel0Dto0_uid260_alignmentShifter_uid64_fpAddTest_merged_bit_select_d_3_delay_1 : STD_LOGIC_VECTOR (1 downto 0);
    signal redist14_rightShiftStageSel0Dto0_uid260_alignmentShifter_uid64_fpAddTest_merged_bit_select_e_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_rightShiftStageSel0Dto0_uid260_alignmentShifter_uid64_fpAddTest_merged_bit_select_e_4_delay_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_rightShiftStageSel0Dto0_uid260_alignmentShifter_uid64_fpAddTest_merged_bit_select_e_4_delay_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_rightShiftStageSel0Dto0_uid260_alignmentShifter_uid64_fpAddTest_merged_bit_select_e_4_delay_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_shiftedOut_uid250_alignmentShifter_uid64_fpAddTest_n_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_shiftedOut_uid250_alignmentShifter_uid64_fpAddTest_n_4_delay_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_shiftedOut_uid250_alignmentShifter_uid64_fpAddTest_n_4_delay_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_and_lev1_uid246_fracXIsZero_uid39_fpAddTest_q_14_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_and_lev1_uid216_fracXIsZero_uid25_fpAddTest_q_7_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist18_r_uid185_lzCountVal_uid85_fpAddTest_q_1_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist19_vCount_uid172_lzCountVal_uid85_fpAddTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist20_vCount_uid166_lzCountVal_uid85_fpAddTest_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist20_vCount_uid166_lzCountVal_uid85_fpAddTest_q_3_delay_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal redist21_vCount_uid160_lzCountVal_uid85_fpAddTest_q_5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist21_vCount_uid160_lzCountVal_uid85_fpAddTest_q_5_delay_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal redist21_vCount_uid160_lzCountVal_uid85_fpAddTest_q_5_delay_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal redist21_vCount_uid160_lzCountVal_uid85_fpAddTest_q_5_delay_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal redist22_vStage_uid154_lzCountVal_uid85_fpAddTest_b_6_q : STD_LOGIC_VECTOR (24 downto 0);
    signal redist22_vStage_uid154_lzCountVal_uid85_fpAddTest_b_6_delay_0 : STD_LOGIC_VECTOR (24 downto 0);
    signal redist22_vStage_uid154_lzCountVal_uid85_fpAddTest_b_6_delay_1 : STD_LOGIC_VECTOR (24 downto 0);
    signal redist22_vStage_uid154_lzCountVal_uid85_fpAddTest_b_6_delay_2 : STD_LOGIC_VECTOR (24 downto 0);
    signal redist23_vCount_uid152_lzCountVal_uid85_fpAddTest_q_7_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist24_rVStage_uid151_lzCountVal_uid85_fpAddTest_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist25_signRInfRZRReg_uid137_fpAddTest_q_5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist25_signRInfRZRReg_uid137_fpAddTest_q_5_delay_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal redist25_signRInfRZRReg_uid137_fpAddTest_q_5_delay_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal redist25_signRInfRZRReg_uid137_fpAddTest_q_5_delay_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal redist26_regInputs_uid118_fpAddTest_q_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist26_regInputs_uid118_fpAddTest_q_4_delay_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal redist26_regInputs_uid118_fpAddTest_q_4_delay_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal redist27_expRPreExc_uid117_fpAddTest_b_2_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist27_expRPreExc_uid117_fpAddTest_b_2_delay_0 : STD_LOGIC_VECTOR (10 downto 0);
    signal redist28_fracRPreExc_uid116_fpAddTest_b_2_q : STD_LOGIC_VECTOR (51 downto 0);
    signal redist28_fracRPreExc_uid116_fpAddTest_b_2_delay_0 : STD_LOGIC_VECTOR (51 downto 0);
    signal redist29_fracPostNormRndRange_uid102_fpAddTest_b_1_q : STD_LOGIC_VECTOR (52 downto 0);
    signal redist30_expPostNorm_uid92_fpAddTest_q_2_q : STD_LOGIC_VECTOR (12 downto 0);
    signal redist31_aMinusA_uid87_fpAddTest_q_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist31_aMinusA_uid87_fpAddTest_q_4_delay_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal redist31_aMinusA_uid87_fpAddTest_q_4_delay_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal redist31_aMinusA_uid87_fpAddTest_q_4_delay_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal redist32_fracGRS_uid84_fpAddTest_q_1_q : STD_LOGIC_VECTOR (56 downto 0);
    signal redist34_rangeFracAddResultMwfp3Dto0_uid83_fpAddTest_b_1_q : STD_LOGIC_VECTOR (55 downto 0);
    signal redist35_invCmpEQ_stickyBits_cZwF_uid72_fpAddTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist36_shiftedOut_uid63_fpAddTest_c_5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist36_shiftedOut_uid63_fpAddTest_c_5_delay_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal redist36_shiftedOut_uid63_fpAddTest_c_5_delay_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal redist36_shiftedOut_uid63_fpAddTest_c_5_delay_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal redist37_effSub_uid52_fpAddTest_q_14_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist38_sigB_uid51_fpAddTest_b_8_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist39_sigB_uid51_fpAddTest_b_18_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist40_sigA_uid50_fpAddTest_b_8_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist41_sigA_uid50_fpAddTest_b_18_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist42_InvExpXIsZero_uid44_fpAddTest_q_14_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist43_excN_bSig_uid42_fpAddTest_q_5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist43_excN_bSig_uid42_fpAddTest_q_5_delay_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal redist43_excN_bSig_uid42_fpAddTest_q_5_delay_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal redist43_excN_bSig_uid42_fpAddTest_q_5_delay_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal redist44_excI_bSig_uid41_fpAddTest_q_5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist44_excI_bSig_uid41_fpAddTest_q_5_delay_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal redist44_excI_bSig_uid41_fpAddTest_q_5_delay_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal redist44_excI_bSig_uid41_fpAddTest_q_5_delay_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal redist45_expXIsMax_uid38_fpAddTest_q_16_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist46_excZ_bSig_uid17_uid37_fpAddTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist47_excZ_bSig_uid17_uid37_fpAddTest_q_17_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist48_excZ_bSig_uid17_uid37_fpAddTest_q_21_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist48_excZ_bSig_uid17_uid37_fpAddTest_q_21_delay_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal redist48_excZ_bSig_uid17_uid37_fpAddTest_q_21_delay_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal redist48_excZ_bSig_uid17_uid37_fpAddTest_q_21_delay_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal redist49_frac_bSig_uid36_fpAddTest_b_2_q : STD_LOGIC_VECTOR (51 downto 0);
    signal redist49_frac_bSig_uid36_fpAddTest_b_2_delay_0 : STD_LOGIC_VECTOR (51 downto 0);
    signal redist50_exp_bSig_uid35_fpAddTest_b_1_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist51_excN_aSig_uid28_fpAddTest_q_5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist51_excN_aSig_uid28_fpAddTest_q_5_delay_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal redist51_excN_aSig_uid28_fpAddTest_q_5_delay_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal redist51_excN_aSig_uid28_fpAddTest_q_5_delay_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal redist52_excI_aSig_uid27_fpAddTest_q_5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist52_excI_aSig_uid27_fpAddTest_q_5_delay_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal redist52_excI_aSig_uid27_fpAddTest_q_5_delay_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal redist52_excI_aSig_uid27_fpAddTest_q_5_delay_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal redist53_excZ_aSig_uid16_uid23_fpAddTest_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist54_excZ_aSig_uid16_uid23_fpAddTest_q_5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist54_excZ_aSig_uid16_uid23_fpAddTest_q_5_delay_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal redist54_excZ_aSig_uid16_uid23_fpAddTest_q_5_delay_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal redist54_excZ_aSig_uid16_uid23_fpAddTest_q_5_delay_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal redist56_exp_aSig_uid21_fpAddTest_b_1_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist58_sigY_uid11_fpAddTest_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist59_expY_uid10_fpAddTest_b_1_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist60_fracY_uid9_fpAddTest_b_1_q : STD_LOGIC_VECTOR (51 downto 0);
    signal redist61_xIn_a_1_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist22_vStage_uid154_lzCountVal_uid85_fpAddTest_b_6_inputreg1_q : STD_LOGIC_VECTOR (24 downto 0);
    signal redist22_vStage_uid154_lzCountVal_uid85_fpAddTest_b_6_inputreg0_q : STD_LOGIC_VECTOR (24 downto 0);
    signal redist33_fracGRS_uid84_fpAddTest_q_7_inputreg1_q : STD_LOGIC_VECTOR (56 downto 0);
    signal redist33_fracGRS_uid84_fpAddTest_q_7_inputreg0_q : STD_LOGIC_VECTOR (56 downto 0);
    signal redist33_fracGRS_uid84_fpAddTest_q_7_mem_reset0 : std_logic;
    signal redist33_fracGRS_uid84_fpAddTest_q_7_mem_ia : STD_LOGIC_VECTOR (56 downto 0);
    signal redist33_fracGRS_uid84_fpAddTest_q_7_mem_aa : STD_LOGIC_VECTOR (1 downto 0);
    signal redist33_fracGRS_uid84_fpAddTest_q_7_mem_ab : STD_LOGIC_VECTOR (1 downto 0);
    signal redist33_fracGRS_uid84_fpAddTest_q_7_mem_iq : STD_LOGIC_VECTOR (56 downto 0);
    signal redist33_fracGRS_uid84_fpAddTest_q_7_mem_q : STD_LOGIC_VECTOR (56 downto 0);
    signal redist33_fracGRS_uid84_fpAddTest_q_7_rdcnt_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist33_fracGRS_uid84_fpAddTest_q_7_rdcnt_i : UNSIGNED (1 downto 0);
    attribute preserve_syn_only : boolean;
    attribute preserve_syn_only of redist33_fracGRS_uid84_fpAddTest_q_7_rdcnt_i : signal is true;
    signal redist33_fracGRS_uid84_fpAddTest_q_7_rdcnt_eq : std_logic;
    attribute preserve_syn_only of redist33_fracGRS_uid84_fpAddTest_q_7_rdcnt_eq : signal is true;
    signal redist33_fracGRS_uid84_fpAddTest_q_7_wraddr_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist33_fracGRS_uid84_fpAddTest_q_7_mem_last_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist33_fracGRS_uid84_fpAddTest_q_7_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist33_fracGRS_uid84_fpAddTest_q_7_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist33_fracGRS_uid84_fpAddTest_q_7_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist33_fracGRS_uid84_fpAddTest_q_7_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist33_fracGRS_uid84_fpAddTest_q_7_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist33_fracGRS_uid84_fpAddTest_q_7_sticky_ena_q : signal is true;
    signal redist33_fracGRS_uid84_fpAddTest_q_7_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist55_frac_aSig_uid22_fpAddTest_b_9_outputreg1_q : STD_LOGIC_VECTOR (51 downto 0);
    signal redist55_frac_aSig_uid22_fpAddTest_b_9_outputreg0_q : STD_LOGIC_VECTOR (51 downto 0);
    signal redist55_frac_aSig_uid22_fpAddTest_b_9_mem_reset0 : std_logic;
    signal redist55_frac_aSig_uid22_fpAddTest_b_9_mem_ia : STD_LOGIC_VECTOR (51 downto 0);
    signal redist55_frac_aSig_uid22_fpAddTest_b_9_mem_aa : STD_LOGIC_VECTOR (2 downto 0);
    signal redist55_frac_aSig_uid22_fpAddTest_b_9_mem_ab : STD_LOGIC_VECTOR (2 downto 0);
    signal redist55_frac_aSig_uid22_fpAddTest_b_9_mem_iq : STD_LOGIC_VECTOR (51 downto 0);
    signal redist55_frac_aSig_uid22_fpAddTest_b_9_mem_q : STD_LOGIC_VECTOR (51 downto 0);
    signal redist55_frac_aSig_uid22_fpAddTest_b_9_rdcnt_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist55_frac_aSig_uid22_fpAddTest_b_9_rdcnt_i : UNSIGNED (2 downto 0);
    attribute preserve_syn_only of redist55_frac_aSig_uid22_fpAddTest_b_9_rdcnt_i : signal is true;
    signal redist55_frac_aSig_uid22_fpAddTest_b_9_rdcnt_eq : std_logic;
    attribute preserve_syn_only of redist55_frac_aSig_uid22_fpAddTest_b_9_rdcnt_eq : signal is true;
    signal redist55_frac_aSig_uid22_fpAddTest_b_9_wraddr_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist55_frac_aSig_uid22_fpAddTest_b_9_mem_last_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist55_frac_aSig_uid22_fpAddTest_b_9_cmp_b : STD_LOGIC_VECTOR (3 downto 0);
    signal redist55_frac_aSig_uid22_fpAddTest_b_9_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist55_frac_aSig_uid22_fpAddTest_b_9_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist55_frac_aSig_uid22_fpAddTest_b_9_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist55_frac_aSig_uid22_fpAddTest_b_9_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist55_frac_aSig_uid22_fpAddTest_b_9_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist55_frac_aSig_uid22_fpAddTest_b_9_sticky_ena_q : signal is true;
    signal redist55_frac_aSig_uid22_fpAddTest_b_9_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist57_exp_aSig_uid21_fpAddTest_b_17_mem_reset0 : std_logic;
    signal redist57_exp_aSig_uid21_fpAddTest_b_17_mem_ia : STD_LOGIC_VECTOR (10 downto 0);
    signal redist57_exp_aSig_uid21_fpAddTest_b_17_mem_aa : STD_LOGIC_VECTOR (3 downto 0);
    signal redist57_exp_aSig_uid21_fpAddTest_b_17_mem_ab : STD_LOGIC_VECTOR (3 downto 0);
    signal redist57_exp_aSig_uid21_fpAddTest_b_17_mem_iq : STD_LOGIC_VECTOR (10 downto 0);
    signal redist57_exp_aSig_uid21_fpAddTest_b_17_mem_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist57_exp_aSig_uid21_fpAddTest_b_17_rdcnt_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist57_exp_aSig_uid21_fpAddTest_b_17_rdcnt_i : UNSIGNED (3 downto 0);
    attribute preserve_syn_only of redist57_exp_aSig_uid21_fpAddTest_b_17_rdcnt_i : signal is true;
    signal redist57_exp_aSig_uid21_fpAddTest_b_17_rdcnt_eq : std_logic;
    attribute preserve_syn_only of redist57_exp_aSig_uid21_fpAddTest_b_17_rdcnt_eq : signal is true;
    signal redist57_exp_aSig_uid21_fpAddTest_b_17_wraddr_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist57_exp_aSig_uid21_fpAddTest_b_17_mem_last_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist57_exp_aSig_uid21_fpAddTest_b_17_cmp_b : STD_LOGIC_VECTOR (4 downto 0);
    signal redist57_exp_aSig_uid21_fpAddTest_b_17_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist57_exp_aSig_uid21_fpAddTest_b_17_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist57_exp_aSig_uid21_fpAddTest_b_17_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist57_exp_aSig_uid21_fpAddTest_b_17_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist57_exp_aSig_uid21_fpAddTest_b_17_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist57_exp_aSig_uid21_fpAddTest_b_17_sticky_ena_q : signal is true;
    signal redist57_exp_aSig_uid21_fpAddTest_b_17_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- cAmA_uid86_fpAddTest(CONSTANT,85)
    cAmA_uid86_fpAddTest_q <= "111001";

    -- zs_uid150_lzCountVal_uid85_fpAddTest(CONSTANT,149)
    zs_uid150_lzCountVal_uid85_fpAddTest_q <= "00000000000000000000000000000000";

    -- sigY_uid11_fpAddTest(BITSELECT,10)@0
    sigY_uid11_fpAddTest_b <= STD_LOGIC_VECTOR(b(63 downto 63));

    -- redist58_sigY_uid11_fpAddTest_b_1(DELAY,426)
    redist58_sigY_uid11_fpAddTest_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist58_sigY_uid11_fpAddTest_b_1_q <= (others => '0');
            ELSE
                redist58_sigY_uid11_fpAddTest_b_1_q <= STD_LOGIC_VECTOR(sigY_uid11_fpAddTest_b);
            END IF;
        END IF;
    END PROCESS;

    -- expY_uid10_fpAddTest(BITSELECT,9)@0
    expY_uid10_fpAddTest_b <= b(62 downto 52);

    -- redist59_expY_uid10_fpAddTest_b_1(DELAY,427)
    redist59_expY_uid10_fpAddTest_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist59_expY_uid10_fpAddTest_b_1_q <= (others => '0');
            ELSE
                redist59_expY_uid10_fpAddTest_b_1_q <= STD_LOGIC_VECTOR(expY_uid10_fpAddTest_b);
            END IF;
        END IF;
    END PROCESS;

    -- fracY_uid9_fpAddTest(BITSELECT,8)@0
    fracY_uid9_fpAddTest_b <= b(51 downto 0);

    -- redist60_fracY_uid9_fpAddTest_b_1(DELAY,428)
    redist60_fracY_uid9_fpAddTest_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist60_fracY_uid9_fpAddTest_b_1_q <= (others => '0');
            ELSE
                redist60_fracY_uid9_fpAddTest_b_1_q <= STD_LOGIC_VECTOR(fracY_uid9_fpAddTest_b);
            END IF;
        END IF;
    END PROCESS;

    -- ypn_uid12_fpAddTest(BITJOIN,11)@1
    ypn_uid12_fpAddTest_q <= redist58_sigY_uid11_fpAddTest_b_1_q & redist59_expY_uid10_fpAddTest_b_1_q & redist60_fracY_uid9_fpAddTest_b_1_q;

    -- redist61_xIn_a_1(DELAY,429)
    redist61_xIn_a_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist61_xIn_a_1_q <= (others => '0');
            ELSE
                redist61_xIn_a_1_q <= STD_LOGIC_VECTOR(a);
            END IF;
        END IF;
    END PROCESS;

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- expFracY_uid7_fpAddTest(BITSELECT,6)@0
    expFracY_uid7_fpAddTest_b <= b(62 downto 0);

    -- expFracX_uid6_fpAddTest(BITSELECT,5)@0
    expFracX_uid6_fpAddTest_b <= a(62 downto 0);

    -- xGTEy_uid8_fpAddTest(COMPARE,7)@0 + 1
    xGTEy_uid8_fpAddTest_a <= STD_LOGIC_VECTOR("00" & expFracX_uid6_fpAddTest_b);
    xGTEy_uid8_fpAddTest_b <= STD_LOGIC_VECTOR("00" & expFracY_uid7_fpAddTest_b);
    xGTEy_uid8_fpAddTest_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                xGTEy_uid8_fpAddTest_o <= (others => '0');
            ELSE
                xGTEy_uid8_fpAddTest_o <= STD_LOGIC_VECTOR(UNSIGNED(xGTEy_uid8_fpAddTest_a) - UNSIGNED(xGTEy_uid8_fpAddTest_b));
            END IF;
        END IF;
    END PROCESS;
    xGTEy_uid8_fpAddTest_n(0) <= not (xGTEy_uid8_fpAddTest_o(64));

    -- bSig_uid17_fpAddTest(MUX,16)@1
    bSig_uid17_fpAddTest_s <= xGTEy_uid8_fpAddTest_n;
    bSig_uid17_fpAddTest_combproc: PROCESS (bSig_uid17_fpAddTest_s, redist61_xIn_a_1_q, ypn_uid12_fpAddTest_q)
    BEGIN
        CASE (bSig_uid17_fpAddTest_s) IS
            WHEN "0" => bSig_uid17_fpAddTest_q <= redist61_xIn_a_1_q;
            WHEN "1" => bSig_uid17_fpAddTest_q <= ypn_uid12_fpAddTest_q;
            WHEN OTHERS => bSig_uid17_fpAddTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- sigB_uid51_fpAddTest(BITSELECT,50)@1
    sigB_uid51_fpAddTest_b <= STD_LOGIC_VECTOR(bSig_uid17_fpAddTest_q(63 downto 63));

    -- redist38_sigB_uid51_fpAddTest_b_8(DELAY,406)
    redist38_sigB_uid51_fpAddTest_b_8 : dspba_delay
    GENERIC MAP ( width => 1, depth => 8, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => sigB_uid51_fpAddTest_b, xout => redist38_sigB_uid51_fpAddTest_b_8_q, clk => clk, aclr => areset, ena => '1' );

    -- aSig_uid16_fpAddTest(MUX,15)@1
    aSig_uid16_fpAddTest_s <= xGTEy_uid8_fpAddTest_n;
    aSig_uid16_fpAddTest_combproc: PROCESS (aSig_uid16_fpAddTest_s, ypn_uid12_fpAddTest_q, redist61_xIn_a_1_q)
    BEGIN
        CASE (aSig_uid16_fpAddTest_s) IS
            WHEN "0" => aSig_uid16_fpAddTest_q <= ypn_uid12_fpAddTest_q;
            WHEN "1" => aSig_uid16_fpAddTest_q <= redist61_xIn_a_1_q;
            WHEN OTHERS => aSig_uid16_fpAddTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- sigA_uid50_fpAddTest(BITSELECT,49)@1
    sigA_uid50_fpAddTest_b <= STD_LOGIC_VECTOR(aSig_uid16_fpAddTest_q(63 downto 63));

    -- redist40_sigA_uid50_fpAddTest_b_8(DELAY,408)
    redist40_sigA_uid50_fpAddTest_b_8 : dspba_delay
    GENERIC MAP ( width => 1, depth => 8, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => sigA_uid50_fpAddTest_b, xout => redist40_sigA_uid50_fpAddTest_b_8_q, clk => clk, aclr => areset, ena => '1' );

    -- effSub_uid52_fpAddTest(LOGICAL,51)@9
    effSub_uid52_fpAddTest_q <= redist40_sigA_uid50_fpAddTest_b_8_q xor redist38_sigB_uid51_fpAddTest_b_8_q;

    -- exp_bSig_uid35_fpAddTest(BITSELECT,34)@1
    exp_bSig_uid35_fpAddTest_in <= bSig_uid17_fpAddTest_q(62 downto 0);
    exp_bSig_uid35_fpAddTest_b <= exp_bSig_uid35_fpAddTest_in(62 downto 52);

    -- redist50_exp_bSig_uid35_fpAddTest_b_1(DELAY,418)
    redist50_exp_bSig_uid35_fpAddTest_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist50_exp_bSig_uid35_fpAddTest_b_1_q <= (others => '0');
            ELSE
                redist50_exp_bSig_uid35_fpAddTest_b_1_q <= STD_LOGIC_VECTOR(exp_bSig_uid35_fpAddTest_b);
            END IF;
        END IF;
    END PROCESS;

    -- exp_aSig_uid21_fpAddTest(BITSELECT,20)@1
    exp_aSig_uid21_fpAddTest_in <= aSig_uid16_fpAddTest_q(62 downto 0);
    exp_aSig_uid21_fpAddTest_b <= exp_aSig_uid21_fpAddTest_in(62 downto 52);

    -- redist56_exp_aSig_uid21_fpAddTest_b_1(DELAY,424)
    redist56_exp_aSig_uid21_fpAddTest_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist56_exp_aSig_uid21_fpAddTest_b_1_q <= (others => '0');
            ELSE
                redist56_exp_aSig_uid21_fpAddTest_b_1_q <= STD_LOGIC_VECTOR(exp_aSig_uid21_fpAddTest_b);
            END IF;
        END IF;
    END PROCESS;

    -- expAmExpB_uid60_fpAddTest(SUB,59)@2 + 1
    expAmExpB_uid60_fpAddTest_a <= STD_LOGIC_VECTOR("0" & redist56_exp_aSig_uid21_fpAddTest_b_1_q);
    expAmExpB_uid60_fpAddTest_b <= STD_LOGIC_VECTOR("0" & redist50_exp_bSig_uid35_fpAddTest_b_1_q);
    expAmExpB_uid60_fpAddTest_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                expAmExpB_uid60_fpAddTest_o <= (others => '0');
            ELSE
                expAmExpB_uid60_fpAddTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expAmExpB_uid60_fpAddTest_a) - UNSIGNED(expAmExpB_uid60_fpAddTest_b));
            END IF;
        END IF;
    END PROCESS;
    expAmExpB_uid60_fpAddTest_q <= expAmExpB_uid60_fpAddTest_o(11 downto 0);

    -- cWFP2_uid61_fpAddTest(CONSTANT,60)
    cWFP2_uid61_fpAddTest_q <= "110110";

    -- shiftedOut_uid63_fpAddTest(COMPARE,62)@3 + 1
    shiftedOut_uid63_fpAddTest_a <= STD_LOGIC_VECTOR("00000000" & cWFP2_uid61_fpAddTest_q);
    shiftedOut_uid63_fpAddTest_b <= STD_LOGIC_VECTOR("00" & expAmExpB_uid60_fpAddTest_q);
    shiftedOut_uid63_fpAddTest_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                shiftedOut_uid63_fpAddTest_o <= (others => '0');
            ELSE
                shiftedOut_uid63_fpAddTest_o <= STD_LOGIC_VECTOR(UNSIGNED(shiftedOut_uid63_fpAddTest_a) - UNSIGNED(shiftedOut_uid63_fpAddTest_b));
            END IF;
        END IF;
    END PROCESS;
    shiftedOut_uid63_fpAddTest_c(0) <= shiftedOut_uid63_fpAddTest_o(13);

    -- redist36_shiftedOut_uid63_fpAddTest_c_5(DELAY,404)
    redist36_shiftedOut_uid63_fpAddTest_c_5_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist36_shiftedOut_uid63_fpAddTest_c_5_delay_0 <= (others => '0');
                redist36_shiftedOut_uid63_fpAddTest_c_5_delay_1 <= (others => '0');
                redist36_shiftedOut_uid63_fpAddTest_c_5_delay_2 <= (others => '0');
                redist36_shiftedOut_uid63_fpAddTest_c_5_q <= (others => '0');
            ELSE
                redist36_shiftedOut_uid63_fpAddTest_c_5_delay_0 <= STD_LOGIC_VECTOR(shiftedOut_uid63_fpAddTest_c);
                redist36_shiftedOut_uid63_fpAddTest_c_5_delay_1 <= redist36_shiftedOut_uid63_fpAddTest_c_5_delay_0;
                redist36_shiftedOut_uid63_fpAddTest_c_5_delay_2 <= redist36_shiftedOut_uid63_fpAddTest_c_5_delay_1;
                redist36_shiftedOut_uid63_fpAddTest_c_5_q <= redist36_shiftedOut_uid63_fpAddTest_c_5_delay_2;
            END IF;
        END IF;
    END PROCESS;

    -- iShiftedOut_uid67_fpAddTest(LOGICAL,66)@8
    iShiftedOut_uid67_fpAddTest_q <= not (redist36_shiftedOut_uid63_fpAddTest_c_5_q);

    -- zeroOutCst_uid289_alignmentShifter_uid64_fpAddTest(CONSTANT,288)
    zeroOutCst_uid289_alignmentShifter_uid64_fpAddTest_q <= "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";

    -- rightShiftStage3Idx1Pad64_uid285_alignmentShifter_uid64_fpAddTest(CONSTANT,284)
    rightShiftStage3Idx1Pad64_uid285_alignmentShifter_uid64_fpAddTest_q <= "0000000000000000000000000000000000000000000000000000000000000000";

    -- rightShiftStage3Idx1Rng64_uid284_alignmentShifter_uid64_fpAddTest(BITSELECT,283)@7
    rightShiftStage3Idx1Rng64_uid284_alignmentShifter_uid64_fpAddTest_b <= rightShiftStage2_uid283_alignmentShifter_uid64_fpAddTest_q(106 downto 64);

    -- rightShiftStage3Idx1_uid286_alignmentShifter_uid64_fpAddTest(BITJOIN,285)@7
    rightShiftStage3Idx1_uid286_alignmentShifter_uid64_fpAddTest_q <= rightShiftStage3Idx1Pad64_uid285_alignmentShifter_uid64_fpAddTest_q & rightShiftStage3Idx1Rng64_uid284_alignmentShifter_uid64_fpAddTest_b;

    -- rightShiftStage2Idx3Pad48_uid280_alignmentShifter_uid64_fpAddTest(CONSTANT,279)
    rightShiftStage2Idx3Pad48_uid280_alignmentShifter_uid64_fpAddTest_q <= "000000000000000000000000000000000000000000000000";

    -- rightShiftStage2Idx3Rng48_uid279_alignmentShifter_uid64_fpAddTest(BITSELECT,278)@6
    rightShiftStage2Idx3Rng48_uid279_alignmentShifter_uid64_fpAddTest_b <= rightShiftStage1_uid272_alignmentShifter_uid64_fpAddTest_q(106 downto 48);

    -- rightShiftStage2Idx3_uid281_alignmentShifter_uid64_fpAddTest(BITJOIN,280)@6
    rightShiftStage2Idx3_uid281_alignmentShifter_uid64_fpAddTest_q <= rightShiftStage2Idx3Pad48_uid280_alignmentShifter_uid64_fpAddTest_q & rightShiftStage2Idx3Rng48_uid279_alignmentShifter_uid64_fpAddTest_b;

    -- rightShiftStage2Idx2Rng32_uid276_alignmentShifter_uid64_fpAddTest(BITSELECT,275)@6
    rightShiftStage2Idx2Rng32_uid276_alignmentShifter_uid64_fpAddTest_b <= rightShiftStage1_uid272_alignmentShifter_uid64_fpAddTest_q(106 downto 32);

    -- rightShiftStage2Idx2_uid278_alignmentShifter_uid64_fpAddTest(BITJOIN,277)@6
    rightShiftStage2Idx2_uid278_alignmentShifter_uid64_fpAddTest_q <= zs_uid150_lzCountVal_uid85_fpAddTest_q & rightShiftStage2Idx2Rng32_uid276_alignmentShifter_uid64_fpAddTest_b;

    -- zs_uid158_lzCountVal_uid85_fpAddTest(CONSTANT,157)
    zs_uid158_lzCountVal_uid85_fpAddTest_q <= "0000000000000000";

    -- rightShiftStage2Idx1Rng16_uid273_alignmentShifter_uid64_fpAddTest(BITSELECT,272)@6
    rightShiftStage2Idx1Rng16_uid273_alignmentShifter_uid64_fpAddTest_b <= rightShiftStage1_uid272_alignmentShifter_uid64_fpAddTest_q(106 downto 16);

    -- rightShiftStage2Idx1_uid275_alignmentShifter_uid64_fpAddTest(BITJOIN,274)@6
    rightShiftStage2Idx1_uid275_alignmentShifter_uid64_fpAddTest_q <= zs_uid158_lzCountVal_uid85_fpAddTest_q & rightShiftStage2Idx1Rng16_uid273_alignmentShifter_uid64_fpAddTest_b;

    -- rightShiftStage1Idx3Pad12_uid269_alignmentShifter_uid64_fpAddTest(CONSTANT,268)
    rightShiftStage1Idx3Pad12_uid269_alignmentShifter_uid64_fpAddTest_q <= "000000000000";

    -- rightShiftStage1Idx3Rng12_uid268_alignmentShifter_uid64_fpAddTest(BITSELECT,267)@5
    rightShiftStage1Idx3Rng12_uid268_alignmentShifter_uid64_fpAddTest_b <= rightShiftStage0_uid261_alignmentShifter_uid64_fpAddTest_q(106 downto 12);

    -- rightShiftStage1Idx3_uid270_alignmentShifter_uid64_fpAddTest(BITJOIN,269)@5
    rightShiftStage1Idx3_uid270_alignmentShifter_uid64_fpAddTest_q <= rightShiftStage1Idx3Pad12_uid269_alignmentShifter_uid64_fpAddTest_q & rightShiftStage1Idx3Rng12_uid268_alignmentShifter_uid64_fpAddTest_b;

    -- zs_uid164_lzCountVal_uid85_fpAddTest(CONSTANT,163)
    zs_uid164_lzCountVal_uid85_fpAddTest_q <= "00000000";

    -- rightShiftStage1Idx2Rng8_uid265_alignmentShifter_uid64_fpAddTest(BITSELECT,264)@5
    rightShiftStage1Idx2Rng8_uid265_alignmentShifter_uid64_fpAddTest_b <= rightShiftStage0_uid261_alignmentShifter_uid64_fpAddTest_q(106 downto 8);

    -- rightShiftStage1Idx2_uid267_alignmentShifter_uid64_fpAddTest(BITJOIN,266)@5
    rightShiftStage1Idx2_uid267_alignmentShifter_uid64_fpAddTest_q <= zs_uid164_lzCountVal_uid85_fpAddTest_q & rightShiftStage1Idx2Rng8_uid265_alignmentShifter_uid64_fpAddTest_b;

    -- zs_uid170_lzCountVal_uid85_fpAddTest(CONSTANT,169)
    zs_uid170_lzCountVal_uid85_fpAddTest_q <= "0000";

    -- rightShiftStage1Idx1Rng4_uid262_alignmentShifter_uid64_fpAddTest(BITSELECT,261)@5
    rightShiftStage1Idx1Rng4_uid262_alignmentShifter_uid64_fpAddTest_b <= rightShiftStage0_uid261_alignmentShifter_uid64_fpAddTest_q(106 downto 4);

    -- rightShiftStage1Idx1_uid264_alignmentShifter_uid64_fpAddTest(BITJOIN,263)@5
    rightShiftStage1Idx1_uid264_alignmentShifter_uid64_fpAddTest_q <= zs_uid170_lzCountVal_uid85_fpAddTest_q & rightShiftStage1Idx1Rng4_uid262_alignmentShifter_uid64_fpAddTest_b;

    -- rightShiftStage0Idx3Pad3_uid258_alignmentShifter_uid64_fpAddTest(CONSTANT,257)
    rightShiftStage0Idx3Pad3_uid258_alignmentShifter_uid64_fpAddTest_q <= "000";

    -- rightShiftStage0Idx3Rng3_uid257_alignmentShifter_uid64_fpAddTest(BITSELECT,256)@4
    rightShiftStage0Idx3Rng3_uid257_alignmentShifter_uid64_fpAddTest_b <= rightPaddedIn_uid65_fpAddTest_q(106 downto 3);

    -- rightShiftStage0Idx3_uid259_alignmentShifter_uid64_fpAddTest(BITJOIN,258)@4
    rightShiftStage0Idx3_uid259_alignmentShifter_uid64_fpAddTest_q <= rightShiftStage0Idx3Pad3_uid258_alignmentShifter_uid64_fpAddTest_q & rightShiftStage0Idx3Rng3_uid257_alignmentShifter_uid64_fpAddTest_b;

    -- zs_uid176_lzCountVal_uid85_fpAddTest(CONSTANT,175)
    zs_uid176_lzCountVal_uid85_fpAddTest_q <= "00";

    -- rightShiftStage0Idx2Rng2_uid254_alignmentShifter_uid64_fpAddTest(BITSELECT,253)@4
    rightShiftStage0Idx2Rng2_uid254_alignmentShifter_uid64_fpAddTest_b <= rightPaddedIn_uid65_fpAddTest_q(106 downto 2);

    -- rightShiftStage0Idx2_uid256_alignmentShifter_uid64_fpAddTest(BITJOIN,255)@4
    rightShiftStage0Idx2_uid256_alignmentShifter_uid64_fpAddTest_q <= zs_uid176_lzCountVal_uid85_fpAddTest_q & rightShiftStage0Idx2Rng2_uid254_alignmentShifter_uid64_fpAddTest_b;

    -- rightShiftStage0Idx1Rng1_uid251_alignmentShifter_uid64_fpAddTest(BITSELECT,250)@4
    rightShiftStage0Idx1Rng1_uid251_alignmentShifter_uid64_fpAddTest_b <= rightPaddedIn_uid65_fpAddTest_q(106 downto 1);

    -- rightShiftStage0Idx1_uid253_alignmentShifter_uid64_fpAddTest(BITJOIN,252)@4
    rightShiftStage0Idx1_uid253_alignmentShifter_uid64_fpAddTest_q <= GND_q & rightShiftStage0Idx1Rng1_uid251_alignmentShifter_uid64_fpAddTest_b;

    -- cstAllZWE_uid20_fpAddTest(CONSTANT,19)
    cstAllZWE_uid20_fpAddTest_q <= "00000000000";

    -- excZ_bSig_uid17_uid37_fpAddTest(LOGICAL,36)@2 + 1
    excZ_bSig_uid17_uid37_fpAddTest_qi <= "1" WHEN redist50_exp_bSig_uid35_fpAddTest_b_1_q = cstAllZWE_uid20_fpAddTest_q ELSE "0";
    excZ_bSig_uid17_uid37_fpAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => excZ_bSig_uid17_uid37_fpAddTest_qi, xout => excZ_bSig_uid17_uid37_fpAddTest_q, clk => clk, aclr => areset, ena => '1' );

    -- redist46_excZ_bSig_uid17_uid37_fpAddTest_q_2(DELAY,414)
    redist46_excZ_bSig_uid17_uid37_fpAddTest_q_2_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist46_excZ_bSig_uid17_uid37_fpAddTest_q_2_q <= (others => '0');
            ELSE
                redist46_excZ_bSig_uid17_uid37_fpAddTest_q_2_q <= STD_LOGIC_VECTOR(excZ_bSig_uid17_uid37_fpAddTest_q);
            END IF;
        END IF;
    END PROCESS;

    -- InvExpXIsZero_uid44_fpAddTest(LOGICAL,43)@4
    InvExpXIsZero_uid44_fpAddTest_q <= not (redist46_excZ_bSig_uid17_uid37_fpAddTest_q_2_q);

    -- cstZeroWF_uid19_fpAddTest(CONSTANT,18)
    cstZeroWF_uid19_fpAddTest_q <= "0000000000000000000000000000000000000000000000000000";

    -- frac_bSig_uid36_fpAddTest(BITSELECT,35)@1
    frac_bSig_uid36_fpAddTest_in <= bSig_uid17_fpAddTest_q(51 downto 0);
    frac_bSig_uid36_fpAddTest_b <= frac_bSig_uid36_fpAddTest_in(51 downto 0);

    -- redist49_frac_bSig_uid36_fpAddTest_b_2(DELAY,417)
    redist49_frac_bSig_uid36_fpAddTest_b_2_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist49_frac_bSig_uid36_fpAddTest_b_2_delay_0 <= (others => '0');
                redist49_frac_bSig_uid36_fpAddTest_b_2_q <= (others => '0');
            ELSE
                redist49_frac_bSig_uid36_fpAddTest_b_2_delay_0 <= STD_LOGIC_VECTOR(frac_bSig_uid36_fpAddTest_b);
                redist49_frac_bSig_uid36_fpAddTest_b_2_q <= redist49_frac_bSig_uid36_fpAddTest_b_2_delay_0;
            END IF;
        END IF;
    END PROCESS;

    -- fracBz_uid56_fpAddTest(MUX,55)@3 + 1
    fracBz_uid56_fpAddTest_s <= excZ_bSig_uid17_uid37_fpAddTest_q;
    fracBz_uid56_fpAddTest_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                fracBz_uid56_fpAddTest_q <= (others => '0');
            ELSE
                CASE (fracBz_uid56_fpAddTest_s) IS
                    WHEN "0" => fracBz_uid56_fpAddTest_q <= redist49_frac_bSig_uid36_fpAddTest_b_2_q;
                    WHEN "1" => fracBz_uid56_fpAddTest_q <= cstZeroWF_uid19_fpAddTest_q;
                    WHEN OTHERS => fracBz_uid56_fpAddTest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;

    -- oFracB_uid59_fpAddTest(BITJOIN,58)@4
    oFracB_uid59_fpAddTest_q <= InvExpXIsZero_uid44_fpAddTest_q & fracBz_uid56_fpAddTest_q;

    -- padConst_uid64_fpAddTest(CONSTANT,63)
    padConst_uid64_fpAddTest_q <= "000000000000000000000000000000000000000000000000000000";

    -- rightPaddedIn_uid65_fpAddTest(BITJOIN,64)@4
    rightPaddedIn_uid65_fpAddTest_q <= oFracB_uid59_fpAddTest_q & padConst_uid64_fpAddTest_q;

    -- rightShiftStageSel0Dto0_uid260_alignmentShifter_uid64_fpAddTest_merged_bit_select(BITSELECT,360)@3
    rightShiftStageSel0Dto0_uid260_alignmentShifter_uid64_fpAddTest_merged_bit_select_in <= expAmExpB_uid60_fpAddTest_q(6 downto 0);
    rightShiftStageSel0Dto0_uid260_alignmentShifter_uid64_fpAddTest_merged_bit_select_b <= rightShiftStageSel0Dto0_uid260_alignmentShifter_uid64_fpAddTest_merged_bit_select_in(1 downto 0);
    rightShiftStageSel0Dto0_uid260_alignmentShifter_uid64_fpAddTest_merged_bit_select_c <= rightShiftStageSel0Dto0_uid260_alignmentShifter_uid64_fpAddTest_merged_bit_select_in(3 downto 2);
    rightShiftStageSel0Dto0_uid260_alignmentShifter_uid64_fpAddTest_merged_bit_select_d <= rightShiftStageSel0Dto0_uid260_alignmentShifter_uid64_fpAddTest_merged_bit_select_in(5 downto 4);
    rightShiftStageSel0Dto0_uid260_alignmentShifter_uid64_fpAddTest_merged_bit_select_e <= rightShiftStageSel0Dto0_uid260_alignmentShifter_uid64_fpAddTest_merged_bit_select_in(6 downto 6);

    -- redist11_rightShiftStageSel0Dto0_uid260_alignmentShifter_uid64_fpAddTest_merged_bit_select_b_1(DELAY,379)
    redist11_rightShiftStageSel0Dto0_uid260_alignmentShifter_uid64_fpAddTest_merged_bit_select_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist11_rightShiftStageSel0Dto0_uid260_alignmentShifter_uid64_fpAddTest_merged_bit_select_b_1_q <= (others => '0');
            ELSE
                redist11_rightShiftStageSel0Dto0_uid260_alignmentShifter_uid64_fpAddTest_merged_bit_select_b_1_q <= STD_LOGIC_VECTOR(rightShiftStageSel0Dto0_uid260_alignmentShifter_uid64_fpAddTest_merged_bit_select_b);
            END IF;
        END IF;
    END PROCESS;

    -- rightShiftStage0_uid261_alignmentShifter_uid64_fpAddTest(MUX,260)@4 + 1
    rightShiftStage0_uid261_alignmentShifter_uid64_fpAddTest_s <= redist11_rightShiftStageSel0Dto0_uid260_alignmentShifter_uid64_fpAddTest_merged_bit_select_b_1_q;
    rightShiftStage0_uid261_alignmentShifter_uid64_fpAddTest_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                rightShiftStage0_uid261_alignmentShifter_uid64_fpAddTest_q <= (others => '0');
            ELSE
                CASE (rightShiftStage0_uid261_alignmentShifter_uid64_fpAddTest_s) IS
                    WHEN "00" => rightShiftStage0_uid261_alignmentShifter_uid64_fpAddTest_q <= rightPaddedIn_uid65_fpAddTest_q;
                    WHEN "01" => rightShiftStage0_uid261_alignmentShifter_uid64_fpAddTest_q <= rightShiftStage0Idx1_uid253_alignmentShifter_uid64_fpAddTest_q;
                    WHEN "10" => rightShiftStage0_uid261_alignmentShifter_uid64_fpAddTest_q <= rightShiftStage0Idx2_uid256_alignmentShifter_uid64_fpAddTest_q;
                    WHEN "11" => rightShiftStage0_uid261_alignmentShifter_uid64_fpAddTest_q <= rightShiftStage0Idx3_uid259_alignmentShifter_uid64_fpAddTest_q;
                    WHEN OTHERS => rightShiftStage0_uid261_alignmentShifter_uid64_fpAddTest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;

    -- redist12_rightShiftStageSel0Dto0_uid260_alignmentShifter_uid64_fpAddTest_merged_bit_select_c_2(DELAY,380)
    redist12_rightShiftStageSel0Dto0_uid260_alignmentShifter_uid64_fpAddTest_merged_bit_select_c_2_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist12_rightShiftStageSel0Dto0_uid260_alignmentShifter_uid64_fpAddTest_merged_bit_select_c_2_delay_0 <= (others => '0');
                redist12_rightShiftStageSel0Dto0_uid260_alignmentShifter_uid64_fpAddTest_merged_bit_select_c_2_q <= (others => '0');
            ELSE
                redist12_rightShiftStageSel0Dto0_uid260_alignmentShifter_uid64_fpAddTest_merged_bit_select_c_2_delay_0 <= STD_LOGIC_VECTOR(rightShiftStageSel0Dto0_uid260_alignmentShifter_uid64_fpAddTest_merged_bit_select_c);
                redist12_rightShiftStageSel0Dto0_uid260_alignmentShifter_uid64_fpAddTest_merged_bit_select_c_2_q <= redist12_rightShiftStageSel0Dto0_uid260_alignmentShifter_uid64_fpAddTest_merged_bit_select_c_2_delay_0;
            END IF;
        END IF;
    END PROCESS;

    -- rightShiftStage1_uid272_alignmentShifter_uid64_fpAddTest(MUX,271)@5 + 1
    rightShiftStage1_uid272_alignmentShifter_uid64_fpAddTest_s <= redist12_rightShiftStageSel0Dto0_uid260_alignmentShifter_uid64_fpAddTest_merged_bit_select_c_2_q;
    rightShiftStage1_uid272_alignmentShifter_uid64_fpAddTest_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                rightShiftStage1_uid272_alignmentShifter_uid64_fpAddTest_q <= (others => '0');
            ELSE
                CASE (rightShiftStage1_uid272_alignmentShifter_uid64_fpAddTest_s) IS
                    WHEN "00" => rightShiftStage1_uid272_alignmentShifter_uid64_fpAddTest_q <= rightShiftStage0_uid261_alignmentShifter_uid64_fpAddTest_q;
                    WHEN "01" => rightShiftStage1_uid272_alignmentShifter_uid64_fpAddTest_q <= rightShiftStage1Idx1_uid264_alignmentShifter_uid64_fpAddTest_q;
                    WHEN "10" => rightShiftStage1_uid272_alignmentShifter_uid64_fpAddTest_q <= rightShiftStage1Idx2_uid267_alignmentShifter_uid64_fpAddTest_q;
                    WHEN "11" => rightShiftStage1_uid272_alignmentShifter_uid64_fpAddTest_q <= rightShiftStage1Idx3_uid270_alignmentShifter_uid64_fpAddTest_q;
                    WHEN OTHERS => rightShiftStage1_uid272_alignmentShifter_uid64_fpAddTest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;

    -- redist13_rightShiftStageSel0Dto0_uid260_alignmentShifter_uid64_fpAddTest_merged_bit_select_d_3(DELAY,381)
    redist13_rightShiftStageSel0Dto0_uid260_alignmentShifter_uid64_fpAddTest_merged_bit_select_d_3_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist13_rightShiftStageSel0Dto0_uid260_alignmentShifter_uid64_fpAddTest_merged_bit_select_d_3_delay_0 <= (others => '0');
                redist13_rightShiftStageSel0Dto0_uid260_alignmentShifter_uid64_fpAddTest_merged_bit_select_d_3_delay_1 <= (others => '0');
                redist13_rightShiftStageSel0Dto0_uid260_alignmentShifter_uid64_fpAddTest_merged_bit_select_d_3_q <= (others => '0');
            ELSE
                redist13_rightShiftStageSel0Dto0_uid260_alignmentShifter_uid64_fpAddTest_merged_bit_select_d_3_delay_0 <= STD_LOGIC_VECTOR(rightShiftStageSel0Dto0_uid260_alignmentShifter_uid64_fpAddTest_merged_bit_select_d);
                redist13_rightShiftStageSel0Dto0_uid260_alignmentShifter_uid64_fpAddTest_merged_bit_select_d_3_delay_1 <= redist13_rightShiftStageSel0Dto0_uid260_alignmentShifter_uid64_fpAddTest_merged_bit_select_d_3_delay_0;
                redist13_rightShiftStageSel0Dto0_uid260_alignmentShifter_uid64_fpAddTest_merged_bit_select_d_3_q <= redist13_rightShiftStageSel0Dto0_uid260_alignmentShifter_uid64_fpAddTest_merged_bit_select_d_3_delay_1;
            END IF;
        END IF;
    END PROCESS;

    -- rightShiftStage2_uid283_alignmentShifter_uid64_fpAddTest(MUX,282)@6 + 1
    rightShiftStage2_uid283_alignmentShifter_uid64_fpAddTest_s <= redist13_rightShiftStageSel0Dto0_uid260_alignmentShifter_uid64_fpAddTest_merged_bit_select_d_3_q;
    rightShiftStage2_uid283_alignmentShifter_uid64_fpAddTest_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                rightShiftStage2_uid283_alignmentShifter_uid64_fpAddTest_q <= (others => '0');
            ELSE
                CASE (rightShiftStage2_uid283_alignmentShifter_uid64_fpAddTest_s) IS
                    WHEN "00" => rightShiftStage2_uid283_alignmentShifter_uid64_fpAddTest_q <= rightShiftStage1_uid272_alignmentShifter_uid64_fpAddTest_q;
                    WHEN "01" => rightShiftStage2_uid283_alignmentShifter_uid64_fpAddTest_q <= rightShiftStage2Idx1_uid275_alignmentShifter_uid64_fpAddTest_q;
                    WHEN "10" => rightShiftStage2_uid283_alignmentShifter_uid64_fpAddTest_q <= rightShiftStage2Idx2_uid278_alignmentShifter_uid64_fpAddTest_q;
                    WHEN "11" => rightShiftStage2_uid283_alignmentShifter_uid64_fpAddTest_q <= rightShiftStage2Idx3_uid281_alignmentShifter_uid64_fpAddTest_q;
                    WHEN OTHERS => rightShiftStage2_uid283_alignmentShifter_uid64_fpAddTest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;

    -- redist14_rightShiftStageSel0Dto0_uid260_alignmentShifter_uid64_fpAddTest_merged_bit_select_e_4(DELAY,382)
    redist14_rightShiftStageSel0Dto0_uid260_alignmentShifter_uid64_fpAddTest_merged_bit_select_e_4_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist14_rightShiftStageSel0Dto0_uid260_alignmentShifter_uid64_fpAddTest_merged_bit_select_e_4_delay_0 <= (others => '0');
                redist14_rightShiftStageSel0Dto0_uid260_alignmentShifter_uid64_fpAddTest_merged_bit_select_e_4_delay_1 <= (others => '0');
                redist14_rightShiftStageSel0Dto0_uid260_alignmentShifter_uid64_fpAddTest_merged_bit_select_e_4_delay_2 <= (others => '0');
                redist14_rightShiftStageSel0Dto0_uid260_alignmentShifter_uid64_fpAddTest_merged_bit_select_e_4_q <= (others => '0');
            ELSE
                redist14_rightShiftStageSel0Dto0_uid260_alignmentShifter_uid64_fpAddTest_merged_bit_select_e_4_delay_0 <= STD_LOGIC_VECTOR(rightShiftStageSel0Dto0_uid260_alignmentShifter_uid64_fpAddTest_merged_bit_select_e);
                redist14_rightShiftStageSel0Dto0_uid260_alignmentShifter_uid64_fpAddTest_merged_bit_select_e_4_delay_1 <= redist14_rightShiftStageSel0Dto0_uid260_alignmentShifter_uid64_fpAddTest_merged_bit_select_e_4_delay_0;
                redist14_rightShiftStageSel0Dto0_uid260_alignmentShifter_uid64_fpAddTest_merged_bit_select_e_4_delay_2 <= redist14_rightShiftStageSel0Dto0_uid260_alignmentShifter_uid64_fpAddTest_merged_bit_select_e_4_delay_1;
                redist14_rightShiftStageSel0Dto0_uid260_alignmentShifter_uid64_fpAddTest_merged_bit_select_e_4_q <= redist14_rightShiftStageSel0Dto0_uid260_alignmentShifter_uid64_fpAddTest_merged_bit_select_e_4_delay_2;
            END IF;
        END IF;
    END PROCESS;

    -- rightShiftStage3_uid288_alignmentShifter_uid64_fpAddTest(MUX,287)@7
    rightShiftStage3_uid288_alignmentShifter_uid64_fpAddTest_s <= redist14_rightShiftStageSel0Dto0_uid260_alignmentShifter_uid64_fpAddTest_merged_bit_select_e_4_q;
    rightShiftStage3_uid288_alignmentShifter_uid64_fpAddTest_combproc: PROCESS (rightShiftStage3_uid288_alignmentShifter_uid64_fpAddTest_s, rightShiftStage2_uid283_alignmentShifter_uid64_fpAddTest_q, rightShiftStage3Idx1_uid286_alignmentShifter_uid64_fpAddTest_q)
    BEGIN
        CASE (rightShiftStage3_uid288_alignmentShifter_uid64_fpAddTest_s) IS
            WHEN "0" => rightShiftStage3_uid288_alignmentShifter_uid64_fpAddTest_q <= rightShiftStage2_uid283_alignmentShifter_uid64_fpAddTest_q;
            WHEN "1" => rightShiftStage3_uid288_alignmentShifter_uid64_fpAddTest_q <= rightShiftStage3Idx1_uid286_alignmentShifter_uid64_fpAddTest_q;
            WHEN OTHERS => rightShiftStage3_uid288_alignmentShifter_uid64_fpAddTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- wIntCst_uid249_alignmentShifter_uid64_fpAddTest(CONSTANT,248)
    wIntCst_uid249_alignmentShifter_uid64_fpAddTest_q <= "1101011";

    -- shiftedOut_uid250_alignmentShifter_uid64_fpAddTest(COMPARE,249)@3 + 1
    shiftedOut_uid250_alignmentShifter_uid64_fpAddTest_a <= STD_LOGIC_VECTOR("00" & expAmExpB_uid60_fpAddTest_q);
    shiftedOut_uid250_alignmentShifter_uid64_fpAddTest_b <= STD_LOGIC_VECTOR("0000000" & wIntCst_uid249_alignmentShifter_uid64_fpAddTest_q);
    shiftedOut_uid250_alignmentShifter_uid64_fpAddTest_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                shiftedOut_uid250_alignmentShifter_uid64_fpAddTest_o <= (others => '0');
            ELSE
                shiftedOut_uid250_alignmentShifter_uid64_fpAddTest_o <= STD_LOGIC_VECTOR(UNSIGNED(shiftedOut_uid250_alignmentShifter_uid64_fpAddTest_a) - UNSIGNED(shiftedOut_uid250_alignmentShifter_uid64_fpAddTest_b));
            END IF;
        END IF;
    END PROCESS;
    shiftedOut_uid250_alignmentShifter_uid64_fpAddTest_n(0) <= not (shiftedOut_uid250_alignmentShifter_uid64_fpAddTest_o(13));

    -- redist15_shiftedOut_uid250_alignmentShifter_uid64_fpAddTest_n_4(DELAY,383)
    redist15_shiftedOut_uid250_alignmentShifter_uid64_fpAddTest_n_4_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist15_shiftedOut_uid250_alignmentShifter_uid64_fpAddTest_n_4_delay_0 <= (others => '0');
                redist15_shiftedOut_uid250_alignmentShifter_uid64_fpAddTest_n_4_delay_1 <= (others => '0');
                redist15_shiftedOut_uid250_alignmentShifter_uid64_fpAddTest_n_4_q <= (others => '0');
            ELSE
                redist15_shiftedOut_uid250_alignmentShifter_uid64_fpAddTest_n_4_delay_0 <= STD_LOGIC_VECTOR(shiftedOut_uid250_alignmentShifter_uid64_fpAddTest_n);
                redist15_shiftedOut_uid250_alignmentShifter_uid64_fpAddTest_n_4_delay_1 <= redist15_shiftedOut_uid250_alignmentShifter_uid64_fpAddTest_n_4_delay_0;
                redist15_shiftedOut_uid250_alignmentShifter_uid64_fpAddTest_n_4_q <= redist15_shiftedOut_uid250_alignmentShifter_uid64_fpAddTest_n_4_delay_1;
            END IF;
        END IF;
    END PROCESS;

    -- r_uid290_alignmentShifter_uid64_fpAddTest(MUX,289)@7 + 1
    r_uid290_alignmentShifter_uid64_fpAddTest_s <= redist15_shiftedOut_uid250_alignmentShifter_uid64_fpAddTest_n_4_q;
    r_uid290_alignmentShifter_uid64_fpAddTest_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                r_uid290_alignmentShifter_uid64_fpAddTest_q <= (others => '0');
            ELSE
                CASE (r_uid290_alignmentShifter_uid64_fpAddTest_s) IS
                    WHEN "0" => r_uid290_alignmentShifter_uid64_fpAddTest_q <= rightShiftStage3_uid288_alignmentShifter_uid64_fpAddTest_q;
                    WHEN "1" => r_uid290_alignmentShifter_uid64_fpAddTest_q <= zeroOutCst_uid289_alignmentShifter_uid64_fpAddTest_q;
                    WHEN OTHERS => r_uid290_alignmentShifter_uid64_fpAddTest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;

    -- alignFracBPostShiftOut_uid68_fpAddTest(LOGICAL,67)@8
    alignFracBPostShiftOut_uid68_fpAddTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((106 downto 1 => iShiftedOut_uid67_fpAddTest_q(0)) & iShiftedOut_uid67_fpAddTest_q));
    alignFracBPostShiftOut_uid68_fpAddTest_q <= r_uid290_alignmentShifter_uid64_fpAddTest_q and alignFracBPostShiftOut_uid68_fpAddTest_b;

    -- stickyBits_uid69_fpAddTest_merged_bit_select(BITSELECT,361)@8
    stickyBits_uid69_fpAddTest_merged_bit_select_b <= alignFracBPostShiftOut_uid68_fpAddTest_q(51 downto 0);
    stickyBits_uid69_fpAddTest_merged_bit_select_c <= alignFracBPostShiftOut_uid68_fpAddTest_q(106 downto 52);

    -- redist10_stickyBits_uid69_fpAddTest_merged_bit_select_c_1(DELAY,378)
    redist10_stickyBits_uid69_fpAddTest_merged_bit_select_c_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist10_stickyBits_uid69_fpAddTest_merged_bit_select_c_1_q <= (others => '0');
            ELSE
                redist10_stickyBits_uid69_fpAddTest_merged_bit_select_c_1_q <= STD_LOGIC_VECTOR(stickyBits_uid69_fpAddTest_merged_bit_select_c);
            END IF;
        END IF;
    END PROCESS;

    -- fracBAddOp_uid80_fpAddTest(BITJOIN,79)@9
    fracBAddOp_uid80_fpAddTest_q <= GND_q & redist10_stickyBits_uid69_fpAddTest_merged_bit_select_c_1_q;

    -- fracBAddOpPostXor_uid81_fpAddTest(LOGICAL,80)@9 + 1
    fracBAddOpPostXor_uid81_fpAddTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((55 downto 1 => effSub_uid52_fpAddTest_q(0)) & effSub_uid52_fpAddTest_q));
    fracBAddOpPostXor_uid81_fpAddTest_qi <= fracBAddOp_uid80_fpAddTest_q xor fracBAddOpPostXor_uid81_fpAddTest_b;
    fracBAddOpPostXor_uid81_fpAddTest_delay : dspba_delay
    GENERIC MAP ( width => 56, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => fracBAddOpPostXor_uid81_fpAddTest_qi, xout => fracBAddOpPostXor_uid81_fpAddTest_q, clk => clk, aclr => areset, ena => '1' );

    -- zocst_uid76_fpAddTest(CONSTANT,75)
    zocst_uid76_fpAddTest_q <= "01";

    -- redist55_frac_aSig_uid22_fpAddTest_b_9_notEnable(LOGICAL,452)
    redist55_frac_aSig_uid22_fpAddTest_b_9_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist55_frac_aSig_uid22_fpAddTest_b_9_nor(LOGICAL,453)
    redist55_frac_aSig_uid22_fpAddTest_b_9_nor_q <= not (redist55_frac_aSig_uid22_fpAddTest_b_9_notEnable_q or redist55_frac_aSig_uid22_fpAddTest_b_9_sticky_ena_q);

    -- redist55_frac_aSig_uid22_fpAddTest_b_9_mem_last(CONSTANT,449)
    redist55_frac_aSig_uid22_fpAddTest_b_9_mem_last_q <= "0100";

    -- redist55_frac_aSig_uid22_fpAddTest_b_9_cmp(LOGICAL,450)
    redist55_frac_aSig_uid22_fpAddTest_b_9_cmp_b <= STD_LOGIC_VECTOR("0" & redist55_frac_aSig_uid22_fpAddTest_b_9_rdcnt_q);
    redist55_frac_aSig_uid22_fpAddTest_b_9_cmp_q <= "1" WHEN redist55_frac_aSig_uid22_fpAddTest_b_9_mem_last_q = redist55_frac_aSig_uid22_fpAddTest_b_9_cmp_b ELSE "0";

    -- redist55_frac_aSig_uid22_fpAddTest_b_9_cmpReg(REG,451)
    redist55_frac_aSig_uid22_fpAddTest_b_9_cmpReg_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist55_frac_aSig_uid22_fpAddTest_b_9_cmpReg_q <= "0";
            ELSE
                redist55_frac_aSig_uid22_fpAddTest_b_9_cmpReg_q <= STD_LOGIC_VECTOR(redist55_frac_aSig_uid22_fpAddTest_b_9_cmp_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist55_frac_aSig_uid22_fpAddTest_b_9_sticky_ena(REG,454)
    redist55_frac_aSig_uid22_fpAddTest_b_9_sticky_ena_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist55_frac_aSig_uid22_fpAddTest_b_9_sticky_ena_q <= "0";
            ELSE
                IF (redist55_frac_aSig_uid22_fpAddTest_b_9_nor_q = "1") THEN
                    redist55_frac_aSig_uid22_fpAddTest_b_9_sticky_ena_q <= STD_LOGIC_VECTOR(redist55_frac_aSig_uid22_fpAddTest_b_9_cmpReg_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist55_frac_aSig_uid22_fpAddTest_b_9_enaAnd(LOGICAL,455)
    redist55_frac_aSig_uid22_fpAddTest_b_9_enaAnd_q <= redist55_frac_aSig_uid22_fpAddTest_b_9_sticky_ena_q and VCC_q;

    -- redist55_frac_aSig_uid22_fpAddTest_b_9_rdcnt(COUNTER,447)
    -- low=0, high=5, step=1, init=0
    redist55_frac_aSig_uid22_fpAddTest_b_9_rdcnt_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist55_frac_aSig_uid22_fpAddTest_b_9_rdcnt_i <= TO_UNSIGNED(0, 3);
                redist55_frac_aSig_uid22_fpAddTest_b_9_rdcnt_eq <= '0';
            ELSE
                IF (redist55_frac_aSig_uid22_fpAddTest_b_9_rdcnt_i = TO_UNSIGNED(4, 3)) THEN
                    redist55_frac_aSig_uid22_fpAddTest_b_9_rdcnt_eq <= '1';
                ELSE
                    redist55_frac_aSig_uid22_fpAddTest_b_9_rdcnt_eq <= '0';
                END IF;
                IF (redist55_frac_aSig_uid22_fpAddTest_b_9_rdcnt_eq = '1') THEN
                    redist55_frac_aSig_uid22_fpAddTest_b_9_rdcnt_i <= redist55_frac_aSig_uid22_fpAddTest_b_9_rdcnt_i + 3;
                ELSE
                    redist55_frac_aSig_uid22_fpAddTest_b_9_rdcnt_i <= redist55_frac_aSig_uid22_fpAddTest_b_9_rdcnt_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    redist55_frac_aSig_uid22_fpAddTest_b_9_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist55_frac_aSig_uid22_fpAddTest_b_9_rdcnt_i, 3)));

    -- frac_aSig_uid22_fpAddTest(BITSELECT,21)@1
    frac_aSig_uid22_fpAddTest_in <= aSig_uid16_fpAddTest_q(51 downto 0);
    frac_aSig_uid22_fpAddTest_b <= frac_aSig_uid22_fpAddTest_in(51 downto 0);

    -- redist55_frac_aSig_uid22_fpAddTest_b_9_wraddr(REG,448)
    redist55_frac_aSig_uid22_fpAddTest_b_9_wraddr_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist55_frac_aSig_uid22_fpAddTest_b_9_wraddr_q <= "101";
            ELSE
                redist55_frac_aSig_uid22_fpAddTest_b_9_wraddr_q <= STD_LOGIC_VECTOR(redist55_frac_aSig_uid22_fpAddTest_b_9_rdcnt_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist55_frac_aSig_uid22_fpAddTest_b_9_mem(DUALMEM,446)
    redist55_frac_aSig_uid22_fpAddTest_b_9_mem_ia <= STD_LOGIC_VECTOR(frac_aSig_uid22_fpAddTest_b);
    redist55_frac_aSig_uid22_fpAddTest_b_9_mem_aa <= redist55_frac_aSig_uid22_fpAddTest_b_9_wraddr_q;
    redist55_frac_aSig_uid22_fpAddTest_b_9_mem_ab <= redist55_frac_aSig_uid22_fpAddTest_b_9_rdcnt_q;
    redist55_frac_aSig_uid22_fpAddTest_b_9_mem_reset0 <= areset;
    redist55_frac_aSig_uid22_fpAddTest_b_9_mem_dmem : altera_syncram
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
        clocken1 => redist55_frac_aSig_uid22_fpAddTest_b_9_enaAnd_q(0),
        clocken0 => '1',
        clock0 => clk,
        sclr => redist55_frac_aSig_uid22_fpAddTest_b_9_mem_reset0,
        clock1 => clk,
        address_a => redist55_frac_aSig_uid22_fpAddTest_b_9_mem_aa,
        data_a => redist55_frac_aSig_uid22_fpAddTest_b_9_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist55_frac_aSig_uid22_fpAddTest_b_9_mem_ab,
        q_b => redist55_frac_aSig_uid22_fpAddTest_b_9_mem_iq
    );
    redist55_frac_aSig_uid22_fpAddTest_b_9_mem_q <= redist55_frac_aSig_uid22_fpAddTest_b_9_mem_iq(51 downto 0);

    -- redist55_frac_aSig_uid22_fpAddTest_b_9_outputreg0(DELAY,445)
    redist55_frac_aSig_uid22_fpAddTest_b_9_outputreg0_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist55_frac_aSig_uid22_fpAddTest_b_9_outputreg0_q <= (others => '0');
            ELSE
                redist55_frac_aSig_uid22_fpAddTest_b_9_outputreg0_q <= STD_LOGIC_VECTOR(redist55_frac_aSig_uid22_fpAddTest_b_9_mem_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist55_frac_aSig_uid22_fpAddTest_b_9_outputreg1(DELAY,444)
    redist55_frac_aSig_uid22_fpAddTest_b_9_outputreg1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist55_frac_aSig_uid22_fpAddTest_b_9_outputreg1_q <= (others => '0');
            ELSE
                redist55_frac_aSig_uid22_fpAddTest_b_9_outputreg1_q <= STD_LOGIC_VECTOR(redist55_frac_aSig_uid22_fpAddTest_b_9_outputreg0_q);
            END IF;
        END IF;
    END PROCESS;

    -- c0_uid188_fracXIsZero_uid25_fpAddTest_merged_bit_select(BITSELECT,357)
    c0_uid188_fracXIsZero_uid25_fpAddTest_merged_bit_select_b <= cstZeroWF_uid19_fpAddTest_q(5 downto 0);
    c0_uid188_fracXIsZero_uid25_fpAddTest_merged_bit_select_c <= cstZeroWF_uid19_fpAddTest_q(11 downto 6);
    c0_uid188_fracXIsZero_uid25_fpAddTest_merged_bit_select_d <= cstZeroWF_uid19_fpAddTest_q(17 downto 12);
    c0_uid188_fracXIsZero_uid25_fpAddTest_merged_bit_select_e <= cstZeroWF_uid19_fpAddTest_q(23 downto 18);
    c0_uid188_fracXIsZero_uid25_fpAddTest_merged_bit_select_f <= cstZeroWF_uid19_fpAddTest_q(29 downto 24);
    c0_uid188_fracXIsZero_uid25_fpAddTest_merged_bit_select_g <= cstZeroWF_uid19_fpAddTest_q(35 downto 30);
    c0_uid188_fracXIsZero_uid25_fpAddTest_merged_bit_select_h <= cstZeroWF_uid19_fpAddTest_q(41 downto 36);
    c0_uid188_fracXIsZero_uid25_fpAddTest_merged_bit_select_i <= cstZeroWF_uid19_fpAddTest_q(47 downto 42);
    c0_uid188_fracXIsZero_uid25_fpAddTest_merged_bit_select_j <= cstZeroWF_uid19_fpAddTest_q(51 downto 48);

    -- z0_uid292_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_merged_bit_select(BITSELECT,367)@8
    z0_uid292_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_merged_bit_select_b <= stickyBits_uid69_fpAddTest_merged_bit_select_b(5 downto 0);
    z0_uid292_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_merged_bit_select_c <= stickyBits_uid69_fpAddTest_merged_bit_select_b(11 downto 6);
    z0_uid292_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_merged_bit_select_d <= stickyBits_uid69_fpAddTest_merged_bit_select_b(17 downto 12);
    z0_uid292_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_merged_bit_select_e <= stickyBits_uid69_fpAddTest_merged_bit_select_b(23 downto 18);
    z0_uid292_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_merged_bit_select_f <= stickyBits_uid69_fpAddTest_merged_bit_select_b(29 downto 24);
    z0_uid292_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_merged_bit_select_g <= stickyBits_uid69_fpAddTest_merged_bit_select_b(35 downto 30);
    z0_uid292_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_merged_bit_select_h <= stickyBits_uid69_fpAddTest_merged_bit_select_b(41 downto 36);
    z0_uid292_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_merged_bit_select_i <= stickyBits_uid69_fpAddTest_merged_bit_select_b(47 downto 42);
    z0_uid292_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_merged_bit_select_j <= stickyBits_uid69_fpAddTest_merged_bit_select_b(51 downto 48);

    -- eq8_uid318_cmpEQ_stickyBits_cZwF_uid71_fpAddTest(LOGICAL,317)@8 + 1
    eq8_uid318_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_qi <= "1" WHEN z0_uid292_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_merged_bit_select_j = c0_uid188_fracXIsZero_uid25_fpAddTest_merged_bit_select_j ELSE "0";
    eq8_uid318_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => eq8_uid318_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_qi, xout => eq8_uid318_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_q, clk => clk, aclr => areset, ena => '1' );

    -- eq7_uid315_cmpEQ_stickyBits_cZwF_uid71_fpAddTest(LOGICAL,314)@8 + 1
    eq7_uid315_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_qi <= "1" WHEN z0_uid292_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_merged_bit_select_i = c0_uid188_fracXIsZero_uid25_fpAddTest_merged_bit_select_i ELSE "0";
    eq7_uid315_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => eq7_uid315_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_qi, xout => eq7_uid315_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_q, clk => clk, aclr => areset, ena => '1' );

    -- eq6_uid312_cmpEQ_stickyBits_cZwF_uid71_fpAddTest(LOGICAL,311)@8 + 1
    eq6_uid312_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_qi <= "1" WHEN z0_uid292_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_merged_bit_select_h = c0_uid188_fracXIsZero_uid25_fpAddTest_merged_bit_select_h ELSE "0";
    eq6_uid312_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => eq6_uid312_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_qi, xout => eq6_uid312_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_q, clk => clk, aclr => areset, ena => '1' );

    -- and_lev0_uid320_cmpEQ_stickyBits_cZwF_uid71_fpAddTest(LOGICAL,319)@9
    and_lev0_uid320_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_q <= eq6_uid312_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_q and eq7_uid315_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_q and eq8_uid318_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_q;

    -- eq5_uid309_cmpEQ_stickyBits_cZwF_uid71_fpAddTest(LOGICAL,308)@8 + 1
    eq5_uid309_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_qi <= "1" WHEN z0_uid292_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_merged_bit_select_g = c0_uid188_fracXIsZero_uid25_fpAddTest_merged_bit_select_g ELSE "0";
    eq5_uid309_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => eq5_uid309_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_qi, xout => eq5_uid309_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_q, clk => clk, aclr => areset, ena => '1' );

    -- eq4_uid306_cmpEQ_stickyBits_cZwF_uid71_fpAddTest(LOGICAL,305)@8 + 1
    eq4_uid306_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_qi <= "1" WHEN z0_uid292_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_merged_bit_select_f = c0_uid188_fracXIsZero_uid25_fpAddTest_merged_bit_select_f ELSE "0";
    eq4_uid306_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => eq4_uid306_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_qi, xout => eq4_uid306_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_q, clk => clk, aclr => areset, ena => '1' );

    -- eq3_uid303_cmpEQ_stickyBits_cZwF_uid71_fpAddTest(LOGICAL,302)@8 + 1
    eq3_uid303_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_qi <= "1" WHEN z0_uid292_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_merged_bit_select_e = c0_uid188_fracXIsZero_uid25_fpAddTest_merged_bit_select_e ELSE "0";
    eq3_uid303_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => eq3_uid303_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_qi, xout => eq3_uid303_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_q, clk => clk, aclr => areset, ena => '1' );

    -- eq2_uid300_cmpEQ_stickyBits_cZwF_uid71_fpAddTest(LOGICAL,299)@8 + 1
    eq2_uid300_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_qi <= "1" WHEN z0_uid292_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_merged_bit_select_d = c0_uid188_fracXIsZero_uid25_fpAddTest_merged_bit_select_d ELSE "0";
    eq2_uid300_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => eq2_uid300_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_qi, xout => eq2_uid300_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_q, clk => clk, aclr => areset, ena => '1' );

    -- eq1_uid297_cmpEQ_stickyBits_cZwF_uid71_fpAddTest(LOGICAL,296)@8 + 1
    eq1_uid297_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_qi <= "1" WHEN z0_uid292_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_merged_bit_select_c = c0_uid188_fracXIsZero_uid25_fpAddTest_merged_bit_select_c ELSE "0";
    eq1_uid297_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => eq1_uid297_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_qi, xout => eq1_uid297_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_q, clk => clk, aclr => areset, ena => '1' );

    -- eq0_uid294_cmpEQ_stickyBits_cZwF_uid71_fpAddTest(LOGICAL,293)@8 + 1
    eq0_uid294_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_qi <= "1" WHEN z0_uid292_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_merged_bit_select_b = c0_uid188_fracXIsZero_uid25_fpAddTest_merged_bit_select_b ELSE "0";
    eq0_uid294_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => eq0_uid294_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_qi, xout => eq0_uid294_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_q, clk => clk, aclr => areset, ena => '1' );

    -- and_lev0_uid319_cmpEQ_stickyBits_cZwF_uid71_fpAddTest(LOGICAL,318)@9
    and_lev0_uid319_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_q <= eq0_uid294_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_q and eq1_uid297_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_q and eq2_uid300_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_q and eq3_uid303_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_q and eq4_uid306_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_q and eq5_uid309_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_q;

    -- and_lev1_uid321_cmpEQ_stickyBits_cZwF_uid71_fpAddTest(LOGICAL,320)@9
    and_lev1_uid321_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_q <= and_lev0_uid319_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_q and and_lev0_uid320_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_q;

    -- effSubInvSticky_uid74_fpAddTest(LOGICAL,73)@9 + 1
    effSubInvSticky_uid74_fpAddTest_qi <= effSub_uid52_fpAddTest_q and and_lev1_uid321_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_q;
    effSubInvSticky_uid74_fpAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => effSubInvSticky_uid74_fpAddTest_qi, xout => effSubInvSticky_uid74_fpAddTest_q, clk => clk, aclr => areset, ena => '1' );

    -- fracAAddOp_uid77_fpAddTest(BITJOIN,76)@10
    fracAAddOp_uid77_fpAddTest_q <= zocst_uid76_fpAddTest_q & redist55_frac_aSig_uid22_fpAddTest_b_9_outputreg1_q & GND_q & effSubInvSticky_uid74_fpAddTest_q;

    -- fracAddResult_uid82_fpAddTest(ADD,81)@10
    fracAddResult_uid82_fpAddTest_a <= STD_LOGIC_VECTOR("0" & fracAAddOp_uid77_fpAddTest_q);
    fracAddResult_uid82_fpAddTest_b <= STD_LOGIC_VECTOR("0" & fracBAddOpPostXor_uid81_fpAddTest_q);
    fracAddResult_uid82_fpAddTest_o <= STD_LOGIC_VECTOR(UNSIGNED(fracAddResult_uid82_fpAddTest_a) + UNSIGNED(fracAddResult_uid82_fpAddTest_b));
    fracAddResult_uid82_fpAddTest_q <= fracAddResult_uid82_fpAddTest_o(56 downto 0);

    -- rangeFracAddResultMwfp3Dto0_uid83_fpAddTest(BITSELECT,82)@10
    rangeFracAddResultMwfp3Dto0_uid83_fpAddTest_in <= fracAddResult_uid82_fpAddTest_q(55 downto 0);
    rangeFracAddResultMwfp3Dto0_uid83_fpAddTest_b <= rangeFracAddResultMwfp3Dto0_uid83_fpAddTest_in(55 downto 0);

    -- redist34_rangeFracAddResultMwfp3Dto0_uid83_fpAddTest_b_1(DELAY,402)
    redist34_rangeFracAddResultMwfp3Dto0_uid83_fpAddTest_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist34_rangeFracAddResultMwfp3Dto0_uid83_fpAddTest_b_1_q <= (others => '0');
            ELSE
                redist34_rangeFracAddResultMwfp3Dto0_uid83_fpAddTest_b_1_q <= STD_LOGIC_VECTOR(rangeFracAddResultMwfp3Dto0_uid83_fpAddTest_b);
            END IF;
        END IF;
    END PROCESS;

    -- invCmpEQ_stickyBits_cZwF_uid72_fpAddTest(LOGICAL,71)@9 + 1
    invCmpEQ_stickyBits_cZwF_uid72_fpAddTest_qi <= not (and_lev1_uid321_cmpEQ_stickyBits_cZwF_uid71_fpAddTest_q);
    invCmpEQ_stickyBits_cZwF_uid72_fpAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => invCmpEQ_stickyBits_cZwF_uid72_fpAddTest_qi, xout => invCmpEQ_stickyBits_cZwF_uid72_fpAddTest_q, clk => clk, aclr => areset, ena => '1' );

    -- redist35_invCmpEQ_stickyBits_cZwF_uid72_fpAddTest_q_2(DELAY,403)
    redist35_invCmpEQ_stickyBits_cZwF_uid72_fpAddTest_q_2_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist35_invCmpEQ_stickyBits_cZwF_uid72_fpAddTest_q_2_q <= (others => '0');
            ELSE
                redist35_invCmpEQ_stickyBits_cZwF_uid72_fpAddTest_q_2_q <= STD_LOGIC_VECTOR(invCmpEQ_stickyBits_cZwF_uid72_fpAddTest_q);
            END IF;
        END IF;
    END PROCESS;

    -- fracGRS_uid84_fpAddTest(BITJOIN,83)@11
    fracGRS_uid84_fpAddTest_q <= redist34_rangeFracAddResultMwfp3Dto0_uid83_fpAddTest_b_1_q & redist35_invCmpEQ_stickyBits_cZwF_uid72_fpAddTest_q_2_q;

    -- rVStage_uid151_lzCountVal_uid85_fpAddTest(BITSELECT,150)@11
    rVStage_uid151_lzCountVal_uid85_fpAddTest_b <= fracGRS_uid84_fpAddTest_q(56 downto 25);

    -- vCount_uid152_lzCountVal_uid85_fpAddTest(LOGICAL,151)@11 + 1
    vCount_uid152_lzCountVal_uid85_fpAddTest_qi <= "1" WHEN rVStage_uid151_lzCountVal_uid85_fpAddTest_b = zs_uid150_lzCountVal_uid85_fpAddTest_q ELSE "0";
    vCount_uid152_lzCountVal_uid85_fpAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => vCount_uid152_lzCountVal_uid85_fpAddTest_qi, xout => vCount_uid152_lzCountVal_uid85_fpAddTest_q, clk => clk, aclr => areset, ena => '1' );

    -- redist23_vCount_uid152_lzCountVal_uid85_fpAddTest_q_7(DELAY,391)
    redist23_vCount_uid152_lzCountVal_uid85_fpAddTest_q_7 : dspba_delay
    GENERIC MAP ( width => 1, depth => 6, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => vCount_uid152_lzCountVal_uid85_fpAddTest_q, xout => redist23_vCount_uid152_lzCountVal_uid85_fpAddTest_q_7_q, clk => clk, aclr => areset, ena => '1' );

    -- redist32_fracGRS_uid84_fpAddTest_q_1(DELAY,400)
    redist32_fracGRS_uid84_fpAddTest_q_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist32_fracGRS_uid84_fpAddTest_q_1_q <= (others => '0');
            ELSE
                redist32_fracGRS_uid84_fpAddTest_q_1_q <= STD_LOGIC_VECTOR(fracGRS_uid84_fpAddTest_q);
            END IF;
        END IF;
    END PROCESS;

    -- vStage_uid154_lzCountVal_uid85_fpAddTest(BITSELECT,153)@12
    vStage_uid154_lzCountVal_uid85_fpAddTest_in <= redist32_fracGRS_uid84_fpAddTest_q_1_q(24 downto 0);
    vStage_uid154_lzCountVal_uid85_fpAddTest_b <= vStage_uid154_lzCountVal_uid85_fpAddTest_in(24 downto 0);

    -- mO_uid153_lzCountVal_uid85_fpAddTest(CONSTANT,152)
    mO_uid153_lzCountVal_uid85_fpAddTest_q <= "1111111";

    -- cStage_uid155_lzCountVal_uid85_fpAddTest(BITJOIN,154)@12
    cStage_uid155_lzCountVal_uid85_fpAddTest_q <= vStage_uid154_lzCountVal_uid85_fpAddTest_b & mO_uid153_lzCountVal_uid85_fpAddTest_q;

    -- redist24_rVStage_uid151_lzCountVal_uid85_fpAddTest_b_1(DELAY,392)
    redist24_rVStage_uid151_lzCountVal_uid85_fpAddTest_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist24_rVStage_uid151_lzCountVal_uid85_fpAddTest_b_1_q <= (others => '0');
            ELSE
                redist24_rVStage_uid151_lzCountVal_uid85_fpAddTest_b_1_q <= STD_LOGIC_VECTOR(rVStage_uid151_lzCountVal_uid85_fpAddTest_b);
            END IF;
        END IF;
    END PROCESS;

    -- vStagei_uid157_lzCountVal_uid85_fpAddTest(MUX,156)@12 + 1
    vStagei_uid157_lzCountVal_uid85_fpAddTest_s <= vCount_uid152_lzCountVal_uid85_fpAddTest_q;
    vStagei_uid157_lzCountVal_uid85_fpAddTest_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                vStagei_uid157_lzCountVal_uid85_fpAddTest_q <= (others => '0');
            ELSE
                CASE (vStagei_uid157_lzCountVal_uid85_fpAddTest_s) IS
                    WHEN "0" => vStagei_uid157_lzCountVal_uid85_fpAddTest_q <= redist24_rVStage_uid151_lzCountVal_uid85_fpAddTest_b_1_q;
                    WHEN "1" => vStagei_uid157_lzCountVal_uid85_fpAddTest_q <= cStage_uid155_lzCountVal_uid85_fpAddTest_q;
                    WHEN OTHERS => vStagei_uid157_lzCountVal_uid85_fpAddTest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;

    -- rVStage_uid159_lzCountVal_uid85_fpAddTest_merged_bit_select(BITSELECT,362)@13
    rVStage_uid159_lzCountVal_uid85_fpAddTest_merged_bit_select_b <= vStagei_uid157_lzCountVal_uid85_fpAddTest_q(31 downto 16);
    rVStage_uid159_lzCountVal_uid85_fpAddTest_merged_bit_select_c <= vStagei_uid157_lzCountVal_uid85_fpAddTest_q(15 downto 0);

    -- vCount_uid160_lzCountVal_uid85_fpAddTest(LOGICAL,159)@13 + 1
    vCount_uid160_lzCountVal_uid85_fpAddTest_qi <= "1" WHEN rVStage_uid159_lzCountVal_uid85_fpAddTest_merged_bit_select_b = zs_uid158_lzCountVal_uid85_fpAddTest_q ELSE "0";
    vCount_uid160_lzCountVal_uid85_fpAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => vCount_uid160_lzCountVal_uid85_fpAddTest_qi, xout => vCount_uid160_lzCountVal_uid85_fpAddTest_q, clk => clk, aclr => areset, ena => '1' );

    -- redist21_vCount_uid160_lzCountVal_uid85_fpAddTest_q_5(DELAY,389)
    redist21_vCount_uid160_lzCountVal_uid85_fpAddTest_q_5_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist21_vCount_uid160_lzCountVal_uid85_fpAddTest_q_5_delay_0 <= (others => '0');
                redist21_vCount_uid160_lzCountVal_uid85_fpAddTest_q_5_delay_1 <= (others => '0');
                redist21_vCount_uid160_lzCountVal_uid85_fpAddTest_q_5_delay_2 <= (others => '0');
                redist21_vCount_uid160_lzCountVal_uid85_fpAddTest_q_5_q <= (others => '0');
            ELSE
                redist21_vCount_uid160_lzCountVal_uid85_fpAddTest_q_5_delay_0 <= STD_LOGIC_VECTOR(vCount_uid160_lzCountVal_uid85_fpAddTest_q);
                redist21_vCount_uid160_lzCountVal_uid85_fpAddTest_q_5_delay_1 <= redist21_vCount_uid160_lzCountVal_uid85_fpAddTest_q_5_delay_0;
                redist21_vCount_uid160_lzCountVal_uid85_fpAddTest_q_5_delay_2 <= redist21_vCount_uid160_lzCountVal_uid85_fpAddTest_q_5_delay_1;
                redist21_vCount_uid160_lzCountVal_uid85_fpAddTest_q_5_q <= redist21_vCount_uid160_lzCountVal_uid85_fpAddTest_q_5_delay_2;
            END IF;
        END IF;
    END PROCESS;

    -- redist9_rVStage_uid159_lzCountVal_uid85_fpAddTest_merged_bit_select_c_1(DELAY,377)
    redist9_rVStage_uid159_lzCountVal_uid85_fpAddTest_merged_bit_select_c_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist9_rVStage_uid159_lzCountVal_uid85_fpAddTest_merged_bit_select_c_1_q <= (others => '0');
            ELSE
                redist9_rVStage_uid159_lzCountVal_uid85_fpAddTest_merged_bit_select_c_1_q <= STD_LOGIC_VECTOR(rVStage_uid159_lzCountVal_uid85_fpAddTest_merged_bit_select_c);
            END IF;
        END IF;
    END PROCESS;

    -- redist8_rVStage_uid159_lzCountVal_uid85_fpAddTest_merged_bit_select_b_1(DELAY,376)
    redist8_rVStage_uid159_lzCountVal_uid85_fpAddTest_merged_bit_select_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist8_rVStage_uid159_lzCountVal_uid85_fpAddTest_merged_bit_select_b_1_q <= (others => '0');
            ELSE
                redist8_rVStage_uid159_lzCountVal_uid85_fpAddTest_merged_bit_select_b_1_q <= STD_LOGIC_VECTOR(rVStage_uid159_lzCountVal_uid85_fpAddTest_merged_bit_select_b);
            END IF;
        END IF;
    END PROCESS;

    -- vStagei_uid163_lzCountVal_uid85_fpAddTest(MUX,162)@14 + 1
    vStagei_uid163_lzCountVal_uid85_fpAddTest_s <= vCount_uid160_lzCountVal_uid85_fpAddTest_q;
    vStagei_uid163_lzCountVal_uid85_fpAddTest_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                vStagei_uid163_lzCountVal_uid85_fpAddTest_q <= (others => '0');
            ELSE
                CASE (vStagei_uid163_lzCountVal_uid85_fpAddTest_s) IS
                    WHEN "0" => vStagei_uid163_lzCountVal_uid85_fpAddTest_q <= redist8_rVStage_uid159_lzCountVal_uid85_fpAddTest_merged_bit_select_b_1_q;
                    WHEN "1" => vStagei_uid163_lzCountVal_uid85_fpAddTest_q <= redist9_rVStage_uid159_lzCountVal_uid85_fpAddTest_merged_bit_select_c_1_q;
                    WHEN OTHERS => vStagei_uid163_lzCountVal_uid85_fpAddTest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;

    -- rVStage_uid165_lzCountVal_uid85_fpAddTest_merged_bit_select(BITSELECT,363)@15
    rVStage_uid165_lzCountVal_uid85_fpAddTest_merged_bit_select_b <= vStagei_uid163_lzCountVal_uid85_fpAddTest_q(15 downto 8);
    rVStage_uid165_lzCountVal_uid85_fpAddTest_merged_bit_select_c <= vStagei_uid163_lzCountVal_uid85_fpAddTest_q(7 downto 0);

    -- vCount_uid166_lzCountVal_uid85_fpAddTest(LOGICAL,165)@15 + 1
    vCount_uid166_lzCountVal_uid85_fpAddTest_qi <= "1" WHEN rVStage_uid165_lzCountVal_uid85_fpAddTest_merged_bit_select_b = zs_uid164_lzCountVal_uid85_fpAddTest_q ELSE "0";
    vCount_uid166_lzCountVal_uid85_fpAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => vCount_uid166_lzCountVal_uid85_fpAddTest_qi, xout => vCount_uid166_lzCountVal_uid85_fpAddTest_q, clk => clk, aclr => areset, ena => '1' );

    -- redist20_vCount_uid166_lzCountVal_uid85_fpAddTest_q_3(DELAY,388)
    redist20_vCount_uid166_lzCountVal_uid85_fpAddTest_q_3_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist20_vCount_uid166_lzCountVal_uid85_fpAddTest_q_3_delay_0 <= (others => '0');
                redist20_vCount_uid166_lzCountVal_uid85_fpAddTest_q_3_q <= (others => '0');
            ELSE
                redist20_vCount_uid166_lzCountVal_uid85_fpAddTest_q_3_delay_0 <= STD_LOGIC_VECTOR(vCount_uid166_lzCountVal_uid85_fpAddTest_q);
                redist20_vCount_uid166_lzCountVal_uid85_fpAddTest_q_3_q <= redist20_vCount_uid166_lzCountVal_uid85_fpAddTest_q_3_delay_0;
            END IF;
        END IF;
    END PROCESS;

    -- redist7_rVStage_uid165_lzCountVal_uid85_fpAddTest_merged_bit_select_c_1(DELAY,375)
    redist7_rVStage_uid165_lzCountVal_uid85_fpAddTest_merged_bit_select_c_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist7_rVStage_uid165_lzCountVal_uid85_fpAddTest_merged_bit_select_c_1_q <= (others => '0');
            ELSE
                redist7_rVStage_uid165_lzCountVal_uid85_fpAddTest_merged_bit_select_c_1_q <= STD_LOGIC_VECTOR(rVStage_uid165_lzCountVal_uid85_fpAddTest_merged_bit_select_c);
            END IF;
        END IF;
    END PROCESS;

    -- redist6_rVStage_uid165_lzCountVal_uid85_fpAddTest_merged_bit_select_b_1(DELAY,374)
    redist6_rVStage_uid165_lzCountVal_uid85_fpAddTest_merged_bit_select_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist6_rVStage_uid165_lzCountVal_uid85_fpAddTest_merged_bit_select_b_1_q <= (others => '0');
            ELSE
                redist6_rVStage_uid165_lzCountVal_uid85_fpAddTest_merged_bit_select_b_1_q <= STD_LOGIC_VECTOR(rVStage_uid165_lzCountVal_uid85_fpAddTest_merged_bit_select_b);
            END IF;
        END IF;
    END PROCESS;

    -- vStagei_uid169_lzCountVal_uid85_fpAddTest(MUX,168)@16
    vStagei_uid169_lzCountVal_uid85_fpAddTest_s <= vCount_uid166_lzCountVal_uid85_fpAddTest_q;
    vStagei_uid169_lzCountVal_uid85_fpAddTest_combproc: PROCESS (vStagei_uid169_lzCountVal_uid85_fpAddTest_s, redist6_rVStage_uid165_lzCountVal_uid85_fpAddTest_merged_bit_select_b_1_q, redist7_rVStage_uid165_lzCountVal_uid85_fpAddTest_merged_bit_select_c_1_q)
    BEGIN
        CASE (vStagei_uid169_lzCountVal_uid85_fpAddTest_s) IS
            WHEN "0" => vStagei_uid169_lzCountVal_uid85_fpAddTest_q <= redist6_rVStage_uid165_lzCountVal_uid85_fpAddTest_merged_bit_select_b_1_q;
            WHEN "1" => vStagei_uid169_lzCountVal_uid85_fpAddTest_q <= redist7_rVStage_uid165_lzCountVal_uid85_fpAddTest_merged_bit_select_c_1_q;
            WHEN OTHERS => vStagei_uid169_lzCountVal_uid85_fpAddTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid171_lzCountVal_uid85_fpAddTest_merged_bit_select(BITSELECT,364)@16
    rVStage_uid171_lzCountVal_uid85_fpAddTest_merged_bit_select_b <= vStagei_uid169_lzCountVal_uid85_fpAddTest_q(7 downto 4);
    rVStage_uid171_lzCountVal_uid85_fpAddTest_merged_bit_select_c <= vStagei_uid169_lzCountVal_uid85_fpAddTest_q(3 downto 0);

    -- vCount_uid172_lzCountVal_uid85_fpAddTest(LOGICAL,171)@16 + 1
    vCount_uid172_lzCountVal_uid85_fpAddTest_qi <= "1" WHEN rVStage_uid171_lzCountVal_uid85_fpAddTest_merged_bit_select_b = zs_uid170_lzCountVal_uid85_fpAddTest_q ELSE "0";
    vCount_uid172_lzCountVal_uid85_fpAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => vCount_uid172_lzCountVal_uid85_fpAddTest_qi, xout => vCount_uid172_lzCountVal_uid85_fpAddTest_q, clk => clk, aclr => areset, ena => '1' );

    -- redist19_vCount_uid172_lzCountVal_uid85_fpAddTest_q_2(DELAY,387)
    redist19_vCount_uid172_lzCountVal_uid85_fpAddTest_q_2_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist19_vCount_uid172_lzCountVal_uid85_fpAddTest_q_2_q <= (others => '0');
            ELSE
                redist19_vCount_uid172_lzCountVal_uid85_fpAddTest_q_2_q <= STD_LOGIC_VECTOR(vCount_uid172_lzCountVal_uid85_fpAddTest_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist5_rVStage_uid171_lzCountVal_uid85_fpAddTest_merged_bit_select_c_1(DELAY,373)
    redist5_rVStage_uid171_lzCountVal_uid85_fpAddTest_merged_bit_select_c_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist5_rVStage_uid171_lzCountVal_uid85_fpAddTest_merged_bit_select_c_1_q <= (others => '0');
            ELSE
                redist5_rVStage_uid171_lzCountVal_uid85_fpAddTest_merged_bit_select_c_1_q <= STD_LOGIC_VECTOR(rVStage_uid171_lzCountVal_uid85_fpAddTest_merged_bit_select_c);
            END IF;
        END IF;
    END PROCESS;

    -- redist4_rVStage_uid171_lzCountVal_uid85_fpAddTest_merged_bit_select_b_1(DELAY,372)
    redist4_rVStage_uid171_lzCountVal_uid85_fpAddTest_merged_bit_select_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist4_rVStage_uid171_lzCountVal_uid85_fpAddTest_merged_bit_select_b_1_q <= (others => '0');
            ELSE
                redist4_rVStage_uid171_lzCountVal_uid85_fpAddTest_merged_bit_select_b_1_q <= STD_LOGIC_VECTOR(rVStage_uid171_lzCountVal_uid85_fpAddTest_merged_bit_select_b);
            END IF;
        END IF;
    END PROCESS;

    -- vStagei_uid175_lzCountVal_uid85_fpAddTest(MUX,174)@17
    vStagei_uid175_lzCountVal_uid85_fpAddTest_s <= vCount_uid172_lzCountVal_uid85_fpAddTest_q;
    vStagei_uid175_lzCountVal_uid85_fpAddTest_combproc: PROCESS (vStagei_uid175_lzCountVal_uid85_fpAddTest_s, redist4_rVStage_uid171_lzCountVal_uid85_fpAddTest_merged_bit_select_b_1_q, redist5_rVStage_uid171_lzCountVal_uid85_fpAddTest_merged_bit_select_c_1_q)
    BEGIN
        CASE (vStagei_uid175_lzCountVal_uid85_fpAddTest_s) IS
            WHEN "0" => vStagei_uid175_lzCountVal_uid85_fpAddTest_q <= redist4_rVStage_uid171_lzCountVal_uid85_fpAddTest_merged_bit_select_b_1_q;
            WHEN "1" => vStagei_uid175_lzCountVal_uid85_fpAddTest_q <= redist5_rVStage_uid171_lzCountVal_uid85_fpAddTest_merged_bit_select_c_1_q;
            WHEN OTHERS => vStagei_uid175_lzCountVal_uid85_fpAddTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid177_lzCountVal_uid85_fpAddTest_merged_bit_select(BITSELECT,365)@17
    rVStage_uid177_lzCountVal_uid85_fpAddTest_merged_bit_select_b <= vStagei_uid175_lzCountVal_uid85_fpAddTest_q(3 downto 2);
    rVStage_uid177_lzCountVal_uid85_fpAddTest_merged_bit_select_c <= vStagei_uid175_lzCountVal_uid85_fpAddTest_q(1 downto 0);

    -- vCount_uid178_lzCountVal_uid85_fpAddTest(LOGICAL,177)@17 + 1
    vCount_uid178_lzCountVal_uid85_fpAddTest_qi <= "1" WHEN rVStage_uid177_lzCountVal_uid85_fpAddTest_merged_bit_select_b = zs_uid176_lzCountVal_uid85_fpAddTest_q ELSE "0";
    vCount_uid178_lzCountVal_uid85_fpAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => vCount_uid178_lzCountVal_uid85_fpAddTest_qi, xout => vCount_uid178_lzCountVal_uid85_fpAddTest_q, clk => clk, aclr => areset, ena => '1' );

    -- redist3_rVStage_uid177_lzCountVal_uid85_fpAddTest_merged_bit_select_c_1(DELAY,371)
    redist3_rVStage_uid177_lzCountVal_uid85_fpAddTest_merged_bit_select_c_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist3_rVStage_uid177_lzCountVal_uid85_fpAddTest_merged_bit_select_c_1_q <= (others => '0');
            ELSE
                redist3_rVStage_uid177_lzCountVal_uid85_fpAddTest_merged_bit_select_c_1_q <= STD_LOGIC_VECTOR(rVStage_uid177_lzCountVal_uid85_fpAddTest_merged_bit_select_c);
            END IF;
        END IF;
    END PROCESS;

    -- redist2_rVStage_uid177_lzCountVal_uid85_fpAddTest_merged_bit_select_b_1(DELAY,370)
    redist2_rVStage_uid177_lzCountVal_uid85_fpAddTest_merged_bit_select_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist2_rVStage_uid177_lzCountVal_uid85_fpAddTest_merged_bit_select_b_1_q <= (others => '0');
            ELSE
                redist2_rVStage_uid177_lzCountVal_uid85_fpAddTest_merged_bit_select_b_1_q <= STD_LOGIC_VECTOR(rVStage_uid177_lzCountVal_uid85_fpAddTest_merged_bit_select_b);
            END IF;
        END IF;
    END PROCESS;

    -- vStagei_uid181_lzCountVal_uid85_fpAddTest(MUX,180)@18
    vStagei_uid181_lzCountVal_uid85_fpAddTest_s <= vCount_uid178_lzCountVal_uid85_fpAddTest_q;
    vStagei_uid181_lzCountVal_uid85_fpAddTest_combproc: PROCESS (vStagei_uid181_lzCountVal_uid85_fpAddTest_s, redist2_rVStage_uid177_lzCountVal_uid85_fpAddTest_merged_bit_select_b_1_q, redist3_rVStage_uid177_lzCountVal_uid85_fpAddTest_merged_bit_select_c_1_q)
    BEGIN
        CASE (vStagei_uid181_lzCountVal_uid85_fpAddTest_s) IS
            WHEN "0" => vStagei_uid181_lzCountVal_uid85_fpAddTest_q <= redist2_rVStage_uid177_lzCountVal_uid85_fpAddTest_merged_bit_select_b_1_q;
            WHEN "1" => vStagei_uid181_lzCountVal_uid85_fpAddTest_q <= redist3_rVStage_uid177_lzCountVal_uid85_fpAddTest_merged_bit_select_c_1_q;
            WHEN OTHERS => vStagei_uid181_lzCountVal_uid85_fpAddTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid183_lzCountVal_uid85_fpAddTest(BITSELECT,182)@18
    rVStage_uid183_lzCountVal_uid85_fpAddTest_b <= vStagei_uid181_lzCountVal_uid85_fpAddTest_q(1 downto 1);

    -- vCount_uid184_lzCountVal_uid85_fpAddTest(LOGICAL,183)@18
    vCount_uid184_lzCountVal_uid85_fpAddTest_q <= "1" WHEN rVStage_uid183_lzCountVal_uid85_fpAddTest_b = GND_q ELSE "0";

    -- r_uid185_lzCountVal_uid85_fpAddTest(BITJOIN,184)@18
    r_uid185_lzCountVal_uid85_fpAddTest_q <= redist23_vCount_uid152_lzCountVal_uid85_fpAddTest_q_7_q & redist21_vCount_uid160_lzCountVal_uid85_fpAddTest_q_5_q & redist20_vCount_uid166_lzCountVal_uid85_fpAddTest_q_3_q & redist19_vCount_uid172_lzCountVal_uid85_fpAddTest_q_2_q & vCount_uid178_lzCountVal_uid85_fpAddTest_q & vCount_uid184_lzCountVal_uid85_fpAddTest_q;

    -- redist18_r_uid185_lzCountVal_uid85_fpAddTest_q_1(DELAY,386)
    redist18_r_uid185_lzCountVal_uid85_fpAddTest_q_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist18_r_uid185_lzCountVal_uid85_fpAddTest_q_1_q <= (others => '0');
            ELSE
                redist18_r_uid185_lzCountVal_uid85_fpAddTest_q_1_q <= STD_LOGIC_VECTOR(r_uid185_lzCountVal_uid85_fpAddTest_q);
            END IF;
        END IF;
    END PROCESS;

    -- aMinusA_uid87_fpAddTest(LOGICAL,86)@19
    aMinusA_uid87_fpAddTest_q <= "1" WHEN redist18_r_uid185_lzCountVal_uid85_fpAddTest_q_1_q = cAmA_uid86_fpAddTest_q ELSE "0";

    -- invAMinusA_uid129_fpAddTest(LOGICAL,128)@19
    invAMinusA_uid129_fpAddTest_q <= not (aMinusA_uid87_fpAddTest_q);

    -- redist41_sigA_uid50_fpAddTest_b_18(DELAY,409)
    redist41_sigA_uid50_fpAddTest_b_18 : dspba_delay
    GENERIC MAP ( width => 1, depth => 10, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => redist40_sigA_uid50_fpAddTest_b_8_q, xout => redist41_sigA_uid50_fpAddTest_b_18_q, clk => clk, aclr => areset, ena => '1' );

    -- cstAllOWE_uid18_fpAddTest(CONSTANT,17)
    cstAllOWE_uid18_fpAddTest_q <= "11111111111";

    -- expXIsMax_uid38_fpAddTest(LOGICAL,37)@2 + 1
    expXIsMax_uid38_fpAddTest_qi <= "1" WHEN redist50_exp_bSig_uid35_fpAddTest_b_1_q = cstAllOWE_uid18_fpAddTest_q ELSE "0";
    expXIsMax_uid38_fpAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => expXIsMax_uid38_fpAddTest_qi, xout => expXIsMax_uid38_fpAddTest_q, clk => clk, aclr => areset, ena => '1' );

    -- redist45_expXIsMax_uid38_fpAddTest_q_16(DELAY,413)
    redist45_expXIsMax_uid38_fpAddTest_q_16 : dspba_delay
    GENERIC MAP ( width => 1, depth => 15, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => expXIsMax_uid38_fpAddTest_q, xout => redist45_expXIsMax_uid38_fpAddTest_q_16_q, clk => clk, aclr => areset, ena => '1' );

    -- invExpXIsMax_uid43_fpAddTest(LOGICAL,42)@18
    invExpXIsMax_uid43_fpAddTest_q <= not (redist45_expXIsMax_uid38_fpAddTest_q_16_q);

    -- redist42_InvExpXIsZero_uid44_fpAddTest_q_14(DELAY,410)
    redist42_InvExpXIsZero_uid44_fpAddTest_q_14 : dspba_delay
    GENERIC MAP ( width => 1, depth => 14, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => InvExpXIsZero_uid44_fpAddTest_q, xout => redist42_InvExpXIsZero_uid44_fpAddTest_q_14_q, clk => clk, aclr => areset, ena => '1' );

    -- excR_bSig_uid45_fpAddTest(LOGICAL,44)@18 + 1
    excR_bSig_uid45_fpAddTest_qi <= redist42_InvExpXIsZero_uid44_fpAddTest_q_14_q and invExpXIsMax_uid43_fpAddTest_q;
    excR_bSig_uid45_fpAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => excR_bSig_uid45_fpAddTest_qi, xout => excR_bSig_uid45_fpAddTest_q, clk => clk, aclr => areset, ena => '1' );

    -- redist57_exp_aSig_uid21_fpAddTest_b_17_notEnable(LOGICAL,462)
    redist57_exp_aSig_uid21_fpAddTest_b_17_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist57_exp_aSig_uid21_fpAddTest_b_17_nor(LOGICAL,463)
    redist57_exp_aSig_uid21_fpAddTest_b_17_nor_q <= not (redist57_exp_aSig_uid21_fpAddTest_b_17_notEnable_q or redist57_exp_aSig_uid21_fpAddTest_b_17_sticky_ena_q);

    -- redist57_exp_aSig_uid21_fpAddTest_b_17_mem_last(CONSTANT,459)
    redist57_exp_aSig_uid21_fpAddTest_b_17_mem_last_q <= "01101";

    -- redist57_exp_aSig_uid21_fpAddTest_b_17_cmp(LOGICAL,460)
    redist57_exp_aSig_uid21_fpAddTest_b_17_cmp_b <= STD_LOGIC_VECTOR("0" & redist57_exp_aSig_uid21_fpAddTest_b_17_rdcnt_q);
    redist57_exp_aSig_uid21_fpAddTest_b_17_cmp_q <= "1" WHEN redist57_exp_aSig_uid21_fpAddTest_b_17_mem_last_q = redist57_exp_aSig_uid21_fpAddTest_b_17_cmp_b ELSE "0";

    -- redist57_exp_aSig_uid21_fpAddTest_b_17_cmpReg(REG,461)
    redist57_exp_aSig_uid21_fpAddTest_b_17_cmpReg_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist57_exp_aSig_uid21_fpAddTest_b_17_cmpReg_q <= "0";
            ELSE
                redist57_exp_aSig_uid21_fpAddTest_b_17_cmpReg_q <= STD_LOGIC_VECTOR(redist57_exp_aSig_uid21_fpAddTest_b_17_cmp_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist57_exp_aSig_uid21_fpAddTest_b_17_sticky_ena(REG,464)
    redist57_exp_aSig_uid21_fpAddTest_b_17_sticky_ena_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist57_exp_aSig_uid21_fpAddTest_b_17_sticky_ena_q <= "0";
            ELSE
                IF (redist57_exp_aSig_uid21_fpAddTest_b_17_nor_q = "1") THEN
                    redist57_exp_aSig_uid21_fpAddTest_b_17_sticky_ena_q <= STD_LOGIC_VECTOR(redist57_exp_aSig_uid21_fpAddTest_b_17_cmpReg_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist57_exp_aSig_uid21_fpAddTest_b_17_enaAnd(LOGICAL,465)
    redist57_exp_aSig_uid21_fpAddTest_b_17_enaAnd_q <= redist57_exp_aSig_uid21_fpAddTest_b_17_sticky_ena_q and VCC_q;

    -- redist57_exp_aSig_uid21_fpAddTest_b_17_rdcnt(COUNTER,457)
    -- low=0, high=14, step=1, init=0
    redist57_exp_aSig_uid21_fpAddTest_b_17_rdcnt_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist57_exp_aSig_uid21_fpAddTest_b_17_rdcnt_i <= TO_UNSIGNED(0, 4);
                redist57_exp_aSig_uid21_fpAddTest_b_17_rdcnt_eq <= '0';
            ELSE
                IF (redist57_exp_aSig_uid21_fpAddTest_b_17_rdcnt_i = TO_UNSIGNED(13, 4)) THEN
                    redist57_exp_aSig_uid21_fpAddTest_b_17_rdcnt_eq <= '1';
                ELSE
                    redist57_exp_aSig_uid21_fpAddTest_b_17_rdcnt_eq <= '0';
                END IF;
                IF (redist57_exp_aSig_uid21_fpAddTest_b_17_rdcnt_eq = '1') THEN
                    redist57_exp_aSig_uid21_fpAddTest_b_17_rdcnt_i <= redist57_exp_aSig_uid21_fpAddTest_b_17_rdcnt_i + 2;
                ELSE
                    redist57_exp_aSig_uid21_fpAddTest_b_17_rdcnt_i <= redist57_exp_aSig_uid21_fpAddTest_b_17_rdcnt_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    redist57_exp_aSig_uid21_fpAddTest_b_17_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist57_exp_aSig_uid21_fpAddTest_b_17_rdcnt_i, 4)));

    -- redist57_exp_aSig_uid21_fpAddTest_b_17_wraddr(REG,458)
    redist57_exp_aSig_uid21_fpAddTest_b_17_wraddr_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist57_exp_aSig_uid21_fpAddTest_b_17_wraddr_q <= "1110";
            ELSE
                redist57_exp_aSig_uid21_fpAddTest_b_17_wraddr_q <= STD_LOGIC_VECTOR(redist57_exp_aSig_uid21_fpAddTest_b_17_rdcnt_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist57_exp_aSig_uid21_fpAddTest_b_17_mem(DUALMEM,456)
    redist57_exp_aSig_uid21_fpAddTest_b_17_mem_ia <= STD_LOGIC_VECTOR(redist56_exp_aSig_uid21_fpAddTest_b_1_q);
    redist57_exp_aSig_uid21_fpAddTest_b_17_mem_aa <= redist57_exp_aSig_uid21_fpAddTest_b_17_wraddr_q;
    redist57_exp_aSig_uid21_fpAddTest_b_17_mem_ab <= redist57_exp_aSig_uid21_fpAddTest_b_17_rdcnt_q;
    redist57_exp_aSig_uid21_fpAddTest_b_17_mem_reset0 <= areset;
    redist57_exp_aSig_uid21_fpAddTest_b_17_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 11,
        widthad_a => 4,
        numwords_a => 15,
        width_b => 11,
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
        clocken1 => redist57_exp_aSig_uid21_fpAddTest_b_17_enaAnd_q(0),
        clocken0 => '1',
        clock0 => clk,
        sclr => redist57_exp_aSig_uid21_fpAddTest_b_17_mem_reset0,
        clock1 => clk,
        address_a => redist57_exp_aSig_uid21_fpAddTest_b_17_mem_aa,
        data_a => redist57_exp_aSig_uid21_fpAddTest_b_17_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist57_exp_aSig_uid21_fpAddTest_b_17_mem_ab,
        q_b => redist57_exp_aSig_uid21_fpAddTest_b_17_mem_iq
    );
    redist57_exp_aSig_uid21_fpAddTest_b_17_mem_q <= redist57_exp_aSig_uid21_fpAddTest_b_17_mem_iq(10 downto 0);

    -- expXIsMax_uid24_fpAddTest(LOGICAL,23)@18
    expXIsMax_uid24_fpAddTest_q <= "1" WHEN redist57_exp_aSig_uid21_fpAddTest_b_17_mem_q = cstAllOWE_uid18_fpAddTest_q ELSE "0";

    -- invExpXIsMax_uid29_fpAddTest(LOGICAL,28)@18
    invExpXIsMax_uid29_fpAddTest_q <= not (expXIsMax_uid24_fpAddTest_q);

    -- excZ_aSig_uid16_uid23_fpAddTest(LOGICAL,22)@18
    excZ_aSig_uid16_uid23_fpAddTest_q <= "1" WHEN redist57_exp_aSig_uid21_fpAddTest_b_17_mem_q = cstAllZWE_uid20_fpAddTest_q ELSE "0";

    -- InvExpXIsZero_uid30_fpAddTest(LOGICAL,29)@18
    InvExpXIsZero_uid30_fpAddTest_q <= not (excZ_aSig_uid16_uid23_fpAddTest_q);

    -- excR_aSig_uid31_fpAddTest(LOGICAL,30)@18 + 1
    excR_aSig_uid31_fpAddTest_qi <= InvExpXIsZero_uid30_fpAddTest_q and invExpXIsMax_uid29_fpAddTest_q;
    excR_aSig_uid31_fpAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => excR_aSig_uid31_fpAddTest_qi, xout => excR_aSig_uid31_fpAddTest_q, clk => clk, aclr => areset, ena => '1' );

    -- signRReg_uid130_fpAddTest(LOGICAL,129)@19
    signRReg_uid130_fpAddTest_q <= excR_aSig_uid31_fpAddTest_q and excR_bSig_uid45_fpAddTest_q and redist41_sigA_uid50_fpAddTest_b_18_q and invAMinusA_uid129_fpAddTest_q;

    -- redist39_sigB_uid51_fpAddTest_b_18(DELAY,407)
    redist39_sigB_uid51_fpAddTest_b_18 : dspba_delay
    GENERIC MAP ( width => 1, depth => 10, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => redist38_sigB_uid51_fpAddTest_b_8_q, xout => redist39_sigB_uid51_fpAddTest_b_18_q, clk => clk, aclr => areset, ena => '1' );

    -- redist47_excZ_bSig_uid17_uid37_fpAddTest_q_17(DELAY,415)
    redist47_excZ_bSig_uid17_uid37_fpAddTest_q_17 : dspba_delay
    GENERIC MAP ( width => 1, depth => 15, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => redist46_excZ_bSig_uid17_uid37_fpAddTest_q_2_q, xout => redist47_excZ_bSig_uid17_uid37_fpAddTest_q_17_q, clk => clk, aclr => areset, ena => '1' );

    -- redist53_excZ_aSig_uid16_uid23_fpAddTest_q_1(DELAY,421)
    redist53_excZ_aSig_uid16_uid23_fpAddTest_q_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist53_excZ_aSig_uid16_uid23_fpAddTest_q_1_q <= (others => '0');
            ELSE
                redist53_excZ_aSig_uid16_uid23_fpAddTest_q_1_q <= STD_LOGIC_VECTOR(excZ_aSig_uid16_uid23_fpAddTest_q);
            END IF;
        END IF;
    END PROCESS;

    -- excAZBZSigASigB_uid134_fpAddTest(LOGICAL,133)@19
    excAZBZSigASigB_uid134_fpAddTest_q <= redist53_excZ_aSig_uid16_uid23_fpAddTest_q_1_q and redist47_excZ_bSig_uid17_uid37_fpAddTest_q_17_q and redist41_sigA_uid50_fpAddTest_b_18_q and redist39_sigB_uid51_fpAddTest_b_18_q;

    -- excBZARSigA_uid135_fpAddTest(LOGICAL,134)@19
    excBZARSigA_uid135_fpAddTest_q <= redist47_excZ_bSig_uid17_uid37_fpAddTest_q_17_q and excR_aSig_uid31_fpAddTest_q and redist41_sigA_uid50_fpAddTest_b_18_q;

    -- signRZero_uid136_fpAddTest(LOGICAL,135)@19
    signRZero_uid136_fpAddTest_q <= excBZARSigA_uid135_fpAddTest_q or excAZBZSigASigB_uid134_fpAddTest_q;

    -- z0_uid217_fracXIsZero_uid39_fpAddTest_merged_bit_select(BITSELECT,359)@3
    z0_uid217_fracXIsZero_uid39_fpAddTest_merged_bit_select_b <= redist49_frac_bSig_uid36_fpAddTest_b_2_q(5 downto 0);
    z0_uid217_fracXIsZero_uid39_fpAddTest_merged_bit_select_c <= redist49_frac_bSig_uid36_fpAddTest_b_2_q(11 downto 6);
    z0_uid217_fracXIsZero_uid39_fpAddTest_merged_bit_select_d <= redist49_frac_bSig_uid36_fpAddTest_b_2_q(17 downto 12);
    z0_uid217_fracXIsZero_uid39_fpAddTest_merged_bit_select_e <= redist49_frac_bSig_uid36_fpAddTest_b_2_q(23 downto 18);
    z0_uid217_fracXIsZero_uid39_fpAddTest_merged_bit_select_f <= redist49_frac_bSig_uid36_fpAddTest_b_2_q(29 downto 24);
    z0_uid217_fracXIsZero_uid39_fpAddTest_merged_bit_select_g <= redist49_frac_bSig_uid36_fpAddTest_b_2_q(35 downto 30);
    z0_uid217_fracXIsZero_uid39_fpAddTest_merged_bit_select_h <= redist49_frac_bSig_uid36_fpAddTest_b_2_q(41 downto 36);
    z0_uid217_fracXIsZero_uid39_fpAddTest_merged_bit_select_i <= redist49_frac_bSig_uid36_fpAddTest_b_2_q(47 downto 42);
    z0_uid217_fracXIsZero_uid39_fpAddTest_merged_bit_select_j <= redist49_frac_bSig_uid36_fpAddTest_b_2_q(51 downto 48);

    -- eq8_uid243_fracXIsZero_uid39_fpAddTest(LOGICAL,242)@3
    eq8_uid243_fracXIsZero_uid39_fpAddTest_q <= "1" WHEN z0_uid217_fracXIsZero_uid39_fpAddTest_merged_bit_select_j = c0_uid188_fracXIsZero_uid25_fpAddTest_merged_bit_select_j ELSE "0";

    -- eq7_uid240_fracXIsZero_uid39_fpAddTest(LOGICAL,239)@3
    eq7_uid240_fracXIsZero_uid39_fpAddTest_q <= "1" WHEN z0_uid217_fracXIsZero_uid39_fpAddTest_merged_bit_select_i = c0_uid188_fracXIsZero_uid25_fpAddTest_merged_bit_select_i ELSE "0";

    -- eq6_uid237_fracXIsZero_uid39_fpAddTest(LOGICAL,236)@3
    eq6_uid237_fracXIsZero_uid39_fpAddTest_q <= "1" WHEN z0_uid217_fracXIsZero_uid39_fpAddTest_merged_bit_select_h = c0_uid188_fracXIsZero_uid25_fpAddTest_merged_bit_select_h ELSE "0";

    -- and_lev0_uid245_fracXIsZero_uid39_fpAddTest(LOGICAL,244)@3 + 1
    and_lev0_uid245_fracXIsZero_uid39_fpAddTest_qi <= eq6_uid237_fracXIsZero_uid39_fpAddTest_q and eq7_uid240_fracXIsZero_uid39_fpAddTest_q and eq8_uid243_fracXIsZero_uid39_fpAddTest_q;
    and_lev0_uid245_fracXIsZero_uid39_fpAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => and_lev0_uid245_fracXIsZero_uid39_fpAddTest_qi, xout => and_lev0_uid245_fracXIsZero_uid39_fpAddTest_q, clk => clk, aclr => areset, ena => '1' );

    -- eq5_uid234_fracXIsZero_uid39_fpAddTest(LOGICAL,233)@3
    eq5_uid234_fracXIsZero_uid39_fpAddTest_q <= "1" WHEN z0_uid217_fracXIsZero_uid39_fpAddTest_merged_bit_select_g = c0_uid188_fracXIsZero_uid25_fpAddTest_merged_bit_select_g ELSE "0";

    -- eq4_uid231_fracXIsZero_uid39_fpAddTest(LOGICAL,230)@3
    eq4_uid231_fracXIsZero_uid39_fpAddTest_q <= "1" WHEN z0_uid217_fracXIsZero_uid39_fpAddTest_merged_bit_select_f = c0_uid188_fracXIsZero_uid25_fpAddTest_merged_bit_select_f ELSE "0";

    -- eq3_uid228_fracXIsZero_uid39_fpAddTest(LOGICAL,227)@3
    eq3_uid228_fracXIsZero_uid39_fpAddTest_q <= "1" WHEN z0_uid217_fracXIsZero_uid39_fpAddTest_merged_bit_select_e = c0_uid188_fracXIsZero_uid25_fpAddTest_merged_bit_select_e ELSE "0";

    -- eq2_uid225_fracXIsZero_uid39_fpAddTest(LOGICAL,224)@3
    eq2_uid225_fracXIsZero_uid39_fpAddTest_q <= "1" WHEN z0_uid217_fracXIsZero_uid39_fpAddTest_merged_bit_select_d = c0_uid188_fracXIsZero_uid25_fpAddTest_merged_bit_select_d ELSE "0";

    -- eq1_uid222_fracXIsZero_uid39_fpAddTest(LOGICAL,221)@3
    eq1_uid222_fracXIsZero_uid39_fpAddTest_q <= "1" WHEN z0_uid217_fracXIsZero_uid39_fpAddTest_merged_bit_select_c = c0_uid188_fracXIsZero_uid25_fpAddTest_merged_bit_select_c ELSE "0";

    -- eq0_uid219_fracXIsZero_uid39_fpAddTest(LOGICAL,218)@3
    eq0_uid219_fracXIsZero_uid39_fpAddTest_q <= "1" WHEN z0_uid217_fracXIsZero_uid39_fpAddTest_merged_bit_select_b = c0_uid188_fracXIsZero_uid25_fpAddTest_merged_bit_select_b ELSE "0";

    -- and_lev0_uid244_fracXIsZero_uid39_fpAddTest(LOGICAL,243)@3 + 1
    and_lev0_uid244_fracXIsZero_uid39_fpAddTest_qi <= eq0_uid219_fracXIsZero_uid39_fpAddTest_q and eq1_uid222_fracXIsZero_uid39_fpAddTest_q and eq2_uid225_fracXIsZero_uid39_fpAddTest_q and eq3_uid228_fracXIsZero_uid39_fpAddTest_q and eq4_uid231_fracXIsZero_uid39_fpAddTest_q and eq5_uid234_fracXIsZero_uid39_fpAddTest_q;
    and_lev0_uid244_fracXIsZero_uid39_fpAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => and_lev0_uid244_fracXIsZero_uid39_fpAddTest_qi, xout => and_lev0_uid244_fracXIsZero_uid39_fpAddTest_q, clk => clk, aclr => areset, ena => '1' );

    -- and_lev1_uid246_fracXIsZero_uid39_fpAddTest(LOGICAL,245)@4 + 1
    and_lev1_uid246_fracXIsZero_uid39_fpAddTest_qi <= and_lev0_uid244_fracXIsZero_uid39_fpAddTest_q and and_lev0_uid245_fracXIsZero_uid39_fpAddTest_q;
    and_lev1_uid246_fracXIsZero_uid39_fpAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => and_lev1_uid246_fracXIsZero_uid39_fpAddTest_qi, xout => and_lev1_uid246_fracXIsZero_uid39_fpAddTest_q, clk => clk, aclr => areset, ena => '1' );

    -- redist16_and_lev1_uid246_fracXIsZero_uid39_fpAddTest_q_14(DELAY,384)
    redist16_and_lev1_uid246_fracXIsZero_uid39_fpAddTest_q_14 : dspba_delay
    GENERIC MAP ( width => 1, depth => 13, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => and_lev1_uid246_fracXIsZero_uid39_fpAddTest_q, xout => redist16_and_lev1_uid246_fracXIsZero_uid39_fpAddTest_q_14_q, clk => clk, aclr => areset, ena => '1' );

    -- excI_bSig_uid41_fpAddTest(LOGICAL,40)@18 + 1
    excI_bSig_uid41_fpAddTest_qi <= redist45_expXIsMax_uid38_fpAddTest_q_16_q and redist16_and_lev1_uid246_fracXIsZero_uid39_fpAddTest_q_14_q;
    excI_bSig_uid41_fpAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => excI_bSig_uid41_fpAddTest_qi, xout => excI_bSig_uid41_fpAddTest_q, clk => clk, aclr => areset, ena => '1' );

    -- sigBBInf_uid131_fpAddTest(LOGICAL,130)@19
    sigBBInf_uid131_fpAddTest_q <= redist39_sigB_uid51_fpAddTest_b_18_q and excI_bSig_uid41_fpAddTest_q;

    -- z0_uid187_fracXIsZero_uid25_fpAddTest_merged_bit_select(BITSELECT,358)@10
    z0_uid187_fracXIsZero_uid25_fpAddTest_merged_bit_select_b <= redist55_frac_aSig_uid22_fpAddTest_b_9_outputreg1_q(5 downto 0);
    z0_uid187_fracXIsZero_uid25_fpAddTest_merged_bit_select_c <= redist55_frac_aSig_uid22_fpAddTest_b_9_outputreg1_q(11 downto 6);
    z0_uid187_fracXIsZero_uid25_fpAddTest_merged_bit_select_d <= redist55_frac_aSig_uid22_fpAddTest_b_9_outputreg1_q(17 downto 12);
    z0_uid187_fracXIsZero_uid25_fpAddTest_merged_bit_select_e <= redist55_frac_aSig_uid22_fpAddTest_b_9_outputreg1_q(23 downto 18);
    z0_uid187_fracXIsZero_uid25_fpAddTest_merged_bit_select_f <= redist55_frac_aSig_uid22_fpAddTest_b_9_outputreg1_q(29 downto 24);
    z0_uid187_fracXIsZero_uid25_fpAddTest_merged_bit_select_g <= redist55_frac_aSig_uid22_fpAddTest_b_9_outputreg1_q(35 downto 30);
    z0_uid187_fracXIsZero_uid25_fpAddTest_merged_bit_select_h <= redist55_frac_aSig_uid22_fpAddTest_b_9_outputreg1_q(41 downto 36);
    z0_uid187_fracXIsZero_uid25_fpAddTest_merged_bit_select_i <= redist55_frac_aSig_uid22_fpAddTest_b_9_outputreg1_q(47 downto 42);
    z0_uid187_fracXIsZero_uid25_fpAddTest_merged_bit_select_j <= redist55_frac_aSig_uid22_fpAddTest_b_9_outputreg1_q(51 downto 48);

    -- eq8_uid213_fracXIsZero_uid25_fpAddTest(LOGICAL,212)@10
    eq8_uid213_fracXIsZero_uid25_fpAddTest_q <= "1" WHEN z0_uid187_fracXIsZero_uid25_fpAddTest_merged_bit_select_j = c0_uid188_fracXIsZero_uid25_fpAddTest_merged_bit_select_j ELSE "0";

    -- eq7_uid210_fracXIsZero_uid25_fpAddTest(LOGICAL,209)@10
    eq7_uid210_fracXIsZero_uid25_fpAddTest_q <= "1" WHEN z0_uid187_fracXIsZero_uid25_fpAddTest_merged_bit_select_i = c0_uid188_fracXIsZero_uid25_fpAddTest_merged_bit_select_i ELSE "0";

    -- eq6_uid207_fracXIsZero_uid25_fpAddTest(LOGICAL,206)@10
    eq6_uid207_fracXIsZero_uid25_fpAddTest_q <= "1" WHEN z0_uid187_fracXIsZero_uid25_fpAddTest_merged_bit_select_h = c0_uid188_fracXIsZero_uid25_fpAddTest_merged_bit_select_h ELSE "0";

    -- and_lev0_uid215_fracXIsZero_uid25_fpAddTest(LOGICAL,214)@10 + 1
    and_lev0_uid215_fracXIsZero_uid25_fpAddTest_qi <= eq6_uid207_fracXIsZero_uid25_fpAddTest_q and eq7_uid210_fracXIsZero_uid25_fpAddTest_q and eq8_uid213_fracXIsZero_uid25_fpAddTest_q;
    and_lev0_uid215_fracXIsZero_uid25_fpAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => and_lev0_uid215_fracXIsZero_uid25_fpAddTest_qi, xout => and_lev0_uid215_fracXIsZero_uid25_fpAddTest_q, clk => clk, aclr => areset, ena => '1' );

    -- eq5_uid204_fracXIsZero_uid25_fpAddTest(LOGICAL,203)@10
    eq5_uid204_fracXIsZero_uid25_fpAddTest_q <= "1" WHEN z0_uid187_fracXIsZero_uid25_fpAddTest_merged_bit_select_g = c0_uid188_fracXIsZero_uid25_fpAddTest_merged_bit_select_g ELSE "0";

    -- eq4_uid201_fracXIsZero_uid25_fpAddTest(LOGICAL,200)@10
    eq4_uid201_fracXIsZero_uid25_fpAddTest_q <= "1" WHEN z0_uid187_fracXIsZero_uid25_fpAddTest_merged_bit_select_f = c0_uid188_fracXIsZero_uid25_fpAddTest_merged_bit_select_f ELSE "0";

    -- eq3_uid198_fracXIsZero_uid25_fpAddTest(LOGICAL,197)@10
    eq3_uid198_fracXIsZero_uid25_fpAddTest_q <= "1" WHEN z0_uid187_fracXIsZero_uid25_fpAddTest_merged_bit_select_e = c0_uid188_fracXIsZero_uid25_fpAddTest_merged_bit_select_e ELSE "0";

    -- eq2_uid195_fracXIsZero_uid25_fpAddTest(LOGICAL,194)@10
    eq2_uid195_fracXIsZero_uid25_fpAddTest_q <= "1" WHEN z0_uid187_fracXIsZero_uid25_fpAddTest_merged_bit_select_d = c0_uid188_fracXIsZero_uid25_fpAddTest_merged_bit_select_d ELSE "0";

    -- eq1_uid192_fracXIsZero_uid25_fpAddTest(LOGICAL,191)@10
    eq1_uid192_fracXIsZero_uid25_fpAddTest_q <= "1" WHEN z0_uid187_fracXIsZero_uid25_fpAddTest_merged_bit_select_c = c0_uid188_fracXIsZero_uid25_fpAddTest_merged_bit_select_c ELSE "0";

    -- eq0_uid189_fracXIsZero_uid25_fpAddTest(LOGICAL,188)@10
    eq0_uid189_fracXIsZero_uid25_fpAddTest_q <= "1" WHEN z0_uid187_fracXIsZero_uid25_fpAddTest_merged_bit_select_b = c0_uid188_fracXIsZero_uid25_fpAddTest_merged_bit_select_b ELSE "0";

    -- and_lev0_uid214_fracXIsZero_uid25_fpAddTest(LOGICAL,213)@10 + 1
    and_lev0_uid214_fracXIsZero_uid25_fpAddTest_qi <= eq0_uid189_fracXIsZero_uid25_fpAddTest_q and eq1_uid192_fracXIsZero_uid25_fpAddTest_q and eq2_uid195_fracXIsZero_uid25_fpAddTest_q and eq3_uid198_fracXIsZero_uid25_fpAddTest_q and eq4_uid201_fracXIsZero_uid25_fpAddTest_q and eq5_uid204_fracXIsZero_uid25_fpAddTest_q;
    and_lev0_uid214_fracXIsZero_uid25_fpAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => and_lev0_uid214_fracXIsZero_uid25_fpAddTest_qi, xout => and_lev0_uid214_fracXIsZero_uid25_fpAddTest_q, clk => clk, aclr => areset, ena => '1' );

    -- and_lev1_uid216_fracXIsZero_uid25_fpAddTest(LOGICAL,215)@11 + 1
    and_lev1_uid216_fracXIsZero_uid25_fpAddTest_qi <= and_lev0_uid214_fracXIsZero_uid25_fpAddTest_q and and_lev0_uid215_fracXIsZero_uid25_fpAddTest_q;
    and_lev1_uid216_fracXIsZero_uid25_fpAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => and_lev1_uid216_fracXIsZero_uid25_fpAddTest_qi, xout => and_lev1_uid216_fracXIsZero_uid25_fpAddTest_q, clk => clk, aclr => areset, ena => '1' );

    -- redist17_and_lev1_uid216_fracXIsZero_uid25_fpAddTest_q_7(DELAY,385)
    redist17_and_lev1_uid216_fracXIsZero_uid25_fpAddTest_q_7 : dspba_delay
    GENERIC MAP ( width => 1, depth => 6, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => and_lev1_uid216_fracXIsZero_uid25_fpAddTest_q, xout => redist17_and_lev1_uid216_fracXIsZero_uid25_fpAddTest_q_7_q, clk => clk, aclr => areset, ena => '1' );

    -- excI_aSig_uid27_fpAddTest(LOGICAL,26)@18 + 1
    excI_aSig_uid27_fpAddTest_qi <= expXIsMax_uid24_fpAddTest_q and redist17_and_lev1_uid216_fracXIsZero_uid25_fpAddTest_q_7_q;
    excI_aSig_uid27_fpAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => excI_aSig_uid27_fpAddTest_qi, xout => excI_aSig_uid27_fpAddTest_q, clk => clk, aclr => areset, ena => '1' );

    -- sigAAInf_uid132_fpAddTest(LOGICAL,131)@19
    sigAAInf_uid132_fpAddTest_q <= redist41_sigA_uid50_fpAddTest_b_18_q and excI_aSig_uid27_fpAddTest_q;

    -- signRInf_uid133_fpAddTest(LOGICAL,132)@19
    signRInf_uid133_fpAddTest_q <= sigAAInf_uid132_fpAddTest_q or sigBBInf_uid131_fpAddTest_q;

    -- signRInfRZRReg_uid137_fpAddTest(LOGICAL,136)@19 + 1
    signRInfRZRReg_uid137_fpAddTest_qi <= signRInf_uid133_fpAddTest_q or signRZero_uid136_fpAddTest_q or signRReg_uid130_fpAddTest_q;
    signRInfRZRReg_uid137_fpAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => signRInfRZRReg_uid137_fpAddTest_qi, xout => signRInfRZRReg_uid137_fpAddTest_q, clk => clk, aclr => areset, ena => '1' );

    -- redist25_signRInfRZRReg_uid137_fpAddTest_q_5(DELAY,393)
    redist25_signRInfRZRReg_uid137_fpAddTest_q_5_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist25_signRInfRZRReg_uid137_fpAddTest_q_5_delay_0 <= (others => '0');
                redist25_signRInfRZRReg_uid137_fpAddTest_q_5_delay_1 <= (others => '0');
                redist25_signRInfRZRReg_uid137_fpAddTest_q_5_delay_2 <= (others => '0');
                redist25_signRInfRZRReg_uid137_fpAddTest_q_5_q <= (others => '0');
            ELSE
                redist25_signRInfRZRReg_uid137_fpAddTest_q_5_delay_0 <= STD_LOGIC_VECTOR(signRInfRZRReg_uid137_fpAddTest_q);
                redist25_signRInfRZRReg_uid137_fpAddTest_q_5_delay_1 <= redist25_signRInfRZRReg_uid137_fpAddTest_q_5_delay_0;
                redist25_signRInfRZRReg_uid137_fpAddTest_q_5_delay_2 <= redist25_signRInfRZRReg_uid137_fpAddTest_q_5_delay_1;
                redist25_signRInfRZRReg_uid137_fpAddTest_q_5_q <= redist25_signRInfRZRReg_uid137_fpAddTest_q_5_delay_2;
            END IF;
        END IF;
    END PROCESS;

    -- fracXIsNotZero_uid40_fpAddTest(LOGICAL,39)@18
    fracXIsNotZero_uid40_fpAddTest_q <= not (redist16_and_lev1_uid246_fracXIsZero_uid39_fpAddTest_q_14_q);

    -- excN_bSig_uid42_fpAddTest(LOGICAL,41)@18 + 1
    excN_bSig_uid42_fpAddTest_qi <= redist45_expXIsMax_uid38_fpAddTest_q_16_q and fracXIsNotZero_uid40_fpAddTest_q;
    excN_bSig_uid42_fpAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => excN_bSig_uid42_fpAddTest_qi, xout => excN_bSig_uid42_fpAddTest_q, clk => clk, aclr => areset, ena => '1' );

    -- redist43_excN_bSig_uid42_fpAddTest_q_5(DELAY,411)
    redist43_excN_bSig_uid42_fpAddTest_q_5_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist43_excN_bSig_uid42_fpAddTest_q_5_delay_0 <= (others => '0');
                redist43_excN_bSig_uid42_fpAddTest_q_5_delay_1 <= (others => '0');
                redist43_excN_bSig_uid42_fpAddTest_q_5_delay_2 <= (others => '0');
                redist43_excN_bSig_uid42_fpAddTest_q_5_q <= (others => '0');
            ELSE
                redist43_excN_bSig_uid42_fpAddTest_q_5_delay_0 <= STD_LOGIC_VECTOR(excN_bSig_uid42_fpAddTest_q);
                redist43_excN_bSig_uid42_fpAddTest_q_5_delay_1 <= redist43_excN_bSig_uid42_fpAddTest_q_5_delay_0;
                redist43_excN_bSig_uid42_fpAddTest_q_5_delay_2 <= redist43_excN_bSig_uid42_fpAddTest_q_5_delay_1;
                redist43_excN_bSig_uid42_fpAddTest_q_5_q <= redist43_excN_bSig_uid42_fpAddTest_q_5_delay_2;
            END IF;
        END IF;
    END PROCESS;

    -- fracXIsNotZero_uid26_fpAddTest(LOGICAL,25)@18
    fracXIsNotZero_uid26_fpAddTest_q <= not (redist17_and_lev1_uid216_fracXIsZero_uid25_fpAddTest_q_7_q);

    -- excN_aSig_uid28_fpAddTest(LOGICAL,27)@18 + 1
    excN_aSig_uid28_fpAddTest_qi <= expXIsMax_uid24_fpAddTest_q and fracXIsNotZero_uid26_fpAddTest_q;
    excN_aSig_uid28_fpAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => excN_aSig_uid28_fpAddTest_qi, xout => excN_aSig_uid28_fpAddTest_q, clk => clk, aclr => areset, ena => '1' );

    -- redist51_excN_aSig_uid28_fpAddTest_q_5(DELAY,419)
    redist51_excN_aSig_uid28_fpAddTest_q_5_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist51_excN_aSig_uid28_fpAddTest_q_5_delay_0 <= (others => '0');
                redist51_excN_aSig_uid28_fpAddTest_q_5_delay_1 <= (others => '0');
                redist51_excN_aSig_uid28_fpAddTest_q_5_delay_2 <= (others => '0');
                redist51_excN_aSig_uid28_fpAddTest_q_5_q <= (others => '0');
            ELSE
                redist51_excN_aSig_uid28_fpAddTest_q_5_delay_0 <= STD_LOGIC_VECTOR(excN_aSig_uid28_fpAddTest_q);
                redist51_excN_aSig_uid28_fpAddTest_q_5_delay_1 <= redist51_excN_aSig_uid28_fpAddTest_q_5_delay_0;
                redist51_excN_aSig_uid28_fpAddTest_q_5_delay_2 <= redist51_excN_aSig_uid28_fpAddTest_q_5_delay_1;
                redist51_excN_aSig_uid28_fpAddTest_q_5_q <= redist51_excN_aSig_uid28_fpAddTest_q_5_delay_2;
            END IF;
        END IF;
    END PROCESS;

    -- excRNaN2_uid124_fpAddTest(LOGICAL,123)@23
    excRNaN2_uid124_fpAddTest_q <= redist51_excN_aSig_uid28_fpAddTest_q_5_q or redist43_excN_bSig_uid42_fpAddTest_q_5_q;

    -- redist37_effSub_uid52_fpAddTest_q_14(DELAY,405)
    redist37_effSub_uid52_fpAddTest_q_14 : dspba_delay
    GENERIC MAP ( width => 1, depth => 14, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => effSub_uid52_fpAddTest_q, xout => redist37_effSub_uid52_fpAddTest_q_14_q, clk => clk, aclr => areset, ena => '1' );

    -- redist44_excI_bSig_uid41_fpAddTest_q_5(DELAY,412)
    redist44_excI_bSig_uid41_fpAddTest_q_5_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist44_excI_bSig_uid41_fpAddTest_q_5_delay_0 <= (others => '0');
                redist44_excI_bSig_uid41_fpAddTest_q_5_delay_1 <= (others => '0');
                redist44_excI_bSig_uid41_fpAddTest_q_5_delay_2 <= (others => '0');
                redist44_excI_bSig_uid41_fpAddTest_q_5_q <= (others => '0');
            ELSE
                redist44_excI_bSig_uid41_fpAddTest_q_5_delay_0 <= STD_LOGIC_VECTOR(excI_bSig_uid41_fpAddTest_q);
                redist44_excI_bSig_uid41_fpAddTest_q_5_delay_1 <= redist44_excI_bSig_uid41_fpAddTest_q_5_delay_0;
                redist44_excI_bSig_uid41_fpAddTest_q_5_delay_2 <= redist44_excI_bSig_uid41_fpAddTest_q_5_delay_1;
                redist44_excI_bSig_uid41_fpAddTest_q_5_q <= redist44_excI_bSig_uid41_fpAddTest_q_5_delay_2;
            END IF;
        END IF;
    END PROCESS;

    -- redist52_excI_aSig_uid27_fpAddTest_q_5(DELAY,420)
    redist52_excI_aSig_uid27_fpAddTest_q_5_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist52_excI_aSig_uid27_fpAddTest_q_5_delay_0 <= (others => '0');
                redist52_excI_aSig_uid27_fpAddTest_q_5_delay_1 <= (others => '0');
                redist52_excI_aSig_uid27_fpAddTest_q_5_delay_2 <= (others => '0');
                redist52_excI_aSig_uid27_fpAddTest_q_5_q <= (others => '0');
            ELSE
                redist52_excI_aSig_uid27_fpAddTest_q_5_delay_0 <= STD_LOGIC_VECTOR(excI_aSig_uid27_fpAddTest_q);
                redist52_excI_aSig_uid27_fpAddTest_q_5_delay_1 <= redist52_excI_aSig_uid27_fpAddTest_q_5_delay_0;
                redist52_excI_aSig_uid27_fpAddTest_q_5_delay_2 <= redist52_excI_aSig_uid27_fpAddTest_q_5_delay_1;
                redist52_excI_aSig_uid27_fpAddTest_q_5_q <= redist52_excI_aSig_uid27_fpAddTest_q_5_delay_2;
            END IF;
        END IF;
    END PROCESS;

    -- excAIBISub_uid125_fpAddTest(LOGICAL,124)@23
    excAIBISub_uid125_fpAddTest_q <= redist52_excI_aSig_uid27_fpAddTest_q_5_q and redist44_excI_bSig_uid41_fpAddTest_q_5_q and redist37_effSub_uid52_fpAddTest_q_14_q;

    -- excRNaN_uid126_fpAddTest(LOGICAL,125)@23 + 1
    excRNaN_uid126_fpAddTest_qi <= excAIBISub_uid125_fpAddTest_q or excRNaN2_uid124_fpAddTest_q;
    excRNaN_uid126_fpAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => excRNaN_uid126_fpAddTest_qi, xout => excRNaN_uid126_fpAddTest_q, clk => clk, aclr => areset, ena => '1' );

    -- invExcRNaN_uid138_fpAddTest(LOGICAL,137)@24
    invExcRNaN_uid138_fpAddTest_q <= not (excRNaN_uid126_fpAddTest_q);

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- signRPostExc_uid139_fpAddTest(LOGICAL,138)@24
    signRPostExc_uid139_fpAddTest_q <= invExcRNaN_uid138_fpAddTest_q and redist25_signRInfRZRReg_uid137_fpAddTest_q_5_q;

    -- cRBit_uid99_fpAddTest(CONSTANT,98)
    cRBit_uid99_fpAddTest_q <= "01000";

    -- leftShiftStage2Idx3Rng3_uid353_fracPostNormExt_uid88_fpAddTest(BITSELECT,352)@19
    leftShiftStage2Idx3Rng3_uid353_fracPostNormExt_uid88_fpAddTest_in <= leftShiftStage1_uid345_fracPostNormExt_uid88_fpAddTest_q(53 downto 0);
    leftShiftStage2Idx3Rng3_uid353_fracPostNormExt_uid88_fpAddTest_b <= leftShiftStage2Idx3Rng3_uid353_fracPostNormExt_uid88_fpAddTest_in(53 downto 0);

    -- leftShiftStage2Idx3_uid354_fracPostNormExt_uid88_fpAddTest(BITJOIN,353)@19
    leftShiftStage2Idx3_uid354_fracPostNormExt_uid88_fpAddTest_q <= leftShiftStage2Idx3Rng3_uid353_fracPostNormExt_uid88_fpAddTest_b & rightShiftStage0Idx3Pad3_uid258_alignmentShifter_uid64_fpAddTest_q;

    -- leftShiftStage2Idx2Rng2_uid350_fracPostNormExt_uid88_fpAddTest(BITSELECT,349)@19
    leftShiftStage2Idx2Rng2_uid350_fracPostNormExt_uid88_fpAddTest_in <= leftShiftStage1_uid345_fracPostNormExt_uid88_fpAddTest_q(54 downto 0);
    leftShiftStage2Idx2Rng2_uid350_fracPostNormExt_uid88_fpAddTest_b <= leftShiftStage2Idx2Rng2_uid350_fracPostNormExt_uid88_fpAddTest_in(54 downto 0);

    -- leftShiftStage2Idx2_uid351_fracPostNormExt_uid88_fpAddTest(BITJOIN,350)@19
    leftShiftStage2Idx2_uid351_fracPostNormExt_uid88_fpAddTest_q <= leftShiftStage2Idx2Rng2_uid350_fracPostNormExt_uid88_fpAddTest_b & zs_uid176_lzCountVal_uid85_fpAddTest_q;

    -- leftShiftStage2Idx1Rng1_uid347_fracPostNormExt_uid88_fpAddTest(BITSELECT,346)@19
    leftShiftStage2Idx1Rng1_uid347_fracPostNormExt_uid88_fpAddTest_in <= leftShiftStage1_uid345_fracPostNormExt_uid88_fpAddTest_q(55 downto 0);
    leftShiftStage2Idx1Rng1_uid347_fracPostNormExt_uid88_fpAddTest_b <= leftShiftStage2Idx1Rng1_uid347_fracPostNormExt_uid88_fpAddTest_in(55 downto 0);

    -- leftShiftStage2Idx1_uid348_fracPostNormExt_uid88_fpAddTest(BITJOIN,347)@19
    leftShiftStage2Idx1_uid348_fracPostNormExt_uid88_fpAddTest_q <= leftShiftStage2Idx1Rng1_uid347_fracPostNormExt_uid88_fpAddTest_b & GND_q;

    -- leftShiftStage1Idx3Rng12_uid342_fracPostNormExt_uid88_fpAddTest(BITSELECT,341)@19
    leftShiftStage1Idx3Rng12_uid342_fracPostNormExt_uid88_fpAddTest_in <= leftShiftStage0_uid334_fracPostNormExt_uid88_fpAddTest_q(44 downto 0);
    leftShiftStage1Idx3Rng12_uid342_fracPostNormExt_uid88_fpAddTest_b <= leftShiftStage1Idx3Rng12_uid342_fracPostNormExt_uid88_fpAddTest_in(44 downto 0);

    -- leftShiftStage1Idx3_uid343_fracPostNormExt_uid88_fpAddTest(BITJOIN,342)@19
    leftShiftStage1Idx3_uid343_fracPostNormExt_uid88_fpAddTest_q <= leftShiftStage1Idx3Rng12_uid342_fracPostNormExt_uid88_fpAddTest_b & rightShiftStage1Idx3Pad12_uid269_alignmentShifter_uid64_fpAddTest_q;

    -- leftShiftStage1Idx2Rng8_uid339_fracPostNormExt_uid88_fpAddTest(BITSELECT,338)@19
    leftShiftStage1Idx2Rng8_uid339_fracPostNormExt_uid88_fpAddTest_in <= leftShiftStage0_uid334_fracPostNormExt_uid88_fpAddTest_q(48 downto 0);
    leftShiftStage1Idx2Rng8_uid339_fracPostNormExt_uid88_fpAddTest_b <= leftShiftStage1Idx2Rng8_uid339_fracPostNormExt_uid88_fpAddTest_in(48 downto 0);

    -- leftShiftStage1Idx2_uid340_fracPostNormExt_uid88_fpAddTest(BITJOIN,339)@19
    leftShiftStage1Idx2_uid340_fracPostNormExt_uid88_fpAddTest_q <= leftShiftStage1Idx2Rng8_uid339_fracPostNormExt_uid88_fpAddTest_b & zs_uid164_lzCountVal_uid85_fpAddTest_q;

    -- leftShiftStage1Idx1Rng4_uid336_fracPostNormExt_uid88_fpAddTest(BITSELECT,335)@19
    leftShiftStage1Idx1Rng4_uid336_fracPostNormExt_uid88_fpAddTest_in <= leftShiftStage0_uid334_fracPostNormExt_uid88_fpAddTest_q(52 downto 0);
    leftShiftStage1Idx1Rng4_uid336_fracPostNormExt_uid88_fpAddTest_b <= leftShiftStage1Idx1Rng4_uid336_fracPostNormExt_uid88_fpAddTest_in(52 downto 0);

    -- leftShiftStage1Idx1_uid337_fracPostNormExt_uid88_fpAddTest(BITJOIN,336)@19
    leftShiftStage1Idx1_uid337_fracPostNormExt_uid88_fpAddTest_q <= leftShiftStage1Idx1Rng4_uid336_fracPostNormExt_uid88_fpAddTest_b & zs_uid170_lzCountVal_uid85_fpAddTest_q;

    -- leftShiftStage0Idx3Rng48_uid331_fracPostNormExt_uid88_fpAddTest(BITSELECT,330)@18
    leftShiftStage0Idx3Rng48_uid331_fracPostNormExt_uid88_fpAddTest_in <= redist33_fracGRS_uid84_fpAddTest_q_7_mem_q(8 downto 0);
    leftShiftStage0Idx3Rng48_uid331_fracPostNormExt_uid88_fpAddTest_b <= leftShiftStage0Idx3Rng48_uid331_fracPostNormExt_uid88_fpAddTest_in(8 downto 0);

    -- leftShiftStage0Idx3_uid332_fracPostNormExt_uid88_fpAddTest(BITJOIN,331)@18
    leftShiftStage0Idx3_uid332_fracPostNormExt_uid88_fpAddTest_q <= leftShiftStage0Idx3Rng48_uid331_fracPostNormExt_uid88_fpAddTest_b & rightShiftStage2Idx3Pad48_uid280_alignmentShifter_uid64_fpAddTest_q;

    -- redist22_vStage_uid154_lzCountVal_uid85_fpAddTest_b_6_inputreg1(DELAY,430)
    redist22_vStage_uid154_lzCountVal_uid85_fpAddTest_b_6_inputreg1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist22_vStage_uid154_lzCountVal_uid85_fpAddTest_b_6_inputreg1_q <= (others => '0');
            ELSE
                redist22_vStage_uid154_lzCountVal_uid85_fpAddTest_b_6_inputreg1_q <= STD_LOGIC_VECTOR(vStage_uid154_lzCountVal_uid85_fpAddTest_b);
            END IF;
        END IF;
    END PROCESS;

    -- redist22_vStage_uid154_lzCountVal_uid85_fpAddTest_b_6_inputreg0(DELAY,431)
    redist22_vStage_uid154_lzCountVal_uid85_fpAddTest_b_6_inputreg0_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist22_vStage_uid154_lzCountVal_uid85_fpAddTest_b_6_inputreg0_q <= (others => '0');
            ELSE
                redist22_vStage_uid154_lzCountVal_uid85_fpAddTest_b_6_inputreg0_q <= STD_LOGIC_VECTOR(redist22_vStage_uid154_lzCountVal_uid85_fpAddTest_b_6_inputreg1_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist22_vStage_uid154_lzCountVal_uid85_fpAddTest_b_6(DELAY,390)
    redist22_vStage_uid154_lzCountVal_uid85_fpAddTest_b_6_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist22_vStage_uid154_lzCountVal_uid85_fpAddTest_b_6_delay_0 <= (others => '0');
                redist22_vStage_uid154_lzCountVal_uid85_fpAddTest_b_6_delay_1 <= (others => '0');
                redist22_vStage_uid154_lzCountVal_uid85_fpAddTest_b_6_delay_2 <= (others => '0');
                redist22_vStage_uid154_lzCountVal_uid85_fpAddTest_b_6_q <= (others => '0');
            ELSE
                redist22_vStage_uid154_lzCountVal_uid85_fpAddTest_b_6_delay_0 <= STD_LOGIC_VECTOR(redist22_vStage_uid154_lzCountVal_uid85_fpAddTest_b_6_inputreg0_q);
                redist22_vStage_uid154_lzCountVal_uid85_fpAddTest_b_6_delay_1 <= redist22_vStage_uid154_lzCountVal_uid85_fpAddTest_b_6_delay_0;
                redist22_vStage_uid154_lzCountVal_uid85_fpAddTest_b_6_delay_2 <= redist22_vStage_uid154_lzCountVal_uid85_fpAddTest_b_6_delay_1;
                redist22_vStage_uid154_lzCountVal_uid85_fpAddTest_b_6_q <= redist22_vStage_uid154_lzCountVal_uid85_fpAddTest_b_6_delay_2;
            END IF;
        END IF;
    END PROCESS;

    -- leftShiftStage0Idx2_uid329_fracPostNormExt_uid88_fpAddTest(BITJOIN,328)@18
    leftShiftStage0Idx2_uid329_fracPostNormExt_uid88_fpAddTest_q <= redist22_vStage_uid154_lzCountVal_uid85_fpAddTest_b_6_q & zs_uid150_lzCountVal_uid85_fpAddTest_q;

    -- leftShiftStage0Idx1Rng16_uid325_fracPostNormExt_uid88_fpAddTest(BITSELECT,324)@18
    leftShiftStage0Idx1Rng16_uid325_fracPostNormExt_uid88_fpAddTest_in <= redist33_fracGRS_uid84_fpAddTest_q_7_mem_q(40 downto 0);
    leftShiftStage0Idx1Rng16_uid325_fracPostNormExt_uid88_fpAddTest_b <= leftShiftStage0Idx1Rng16_uid325_fracPostNormExt_uid88_fpAddTest_in(40 downto 0);

    -- leftShiftStage0Idx1_uid326_fracPostNormExt_uid88_fpAddTest(BITJOIN,325)@18
    leftShiftStage0Idx1_uid326_fracPostNormExt_uid88_fpAddTest_q <= leftShiftStage0Idx1Rng16_uid325_fracPostNormExt_uid88_fpAddTest_b & zs_uid158_lzCountVal_uid85_fpAddTest_q;

    -- redist33_fracGRS_uid84_fpAddTest_q_7_notEnable(LOGICAL,440)
    redist33_fracGRS_uid84_fpAddTest_q_7_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist33_fracGRS_uid84_fpAddTest_q_7_nor(LOGICAL,441)
    redist33_fracGRS_uid84_fpAddTest_q_7_nor_q <= not (redist33_fracGRS_uid84_fpAddTest_q_7_notEnable_q or redist33_fracGRS_uid84_fpAddTest_q_7_sticky_ena_q);

    -- redist33_fracGRS_uid84_fpAddTest_q_7_mem_last(CONSTANT,437)
    redist33_fracGRS_uid84_fpAddTest_q_7_mem_last_q <= "01";

    -- redist33_fracGRS_uid84_fpAddTest_q_7_cmp(LOGICAL,438)
    redist33_fracGRS_uid84_fpAddTest_q_7_cmp_q <= "1" WHEN redist33_fracGRS_uid84_fpAddTest_q_7_mem_last_q = redist33_fracGRS_uid84_fpAddTest_q_7_rdcnt_q ELSE "0";

    -- redist33_fracGRS_uid84_fpAddTest_q_7_cmpReg(REG,439)
    redist33_fracGRS_uid84_fpAddTest_q_7_cmpReg_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist33_fracGRS_uid84_fpAddTest_q_7_cmpReg_q <= "0";
            ELSE
                redist33_fracGRS_uid84_fpAddTest_q_7_cmpReg_q <= STD_LOGIC_VECTOR(redist33_fracGRS_uid84_fpAddTest_q_7_cmp_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist33_fracGRS_uid84_fpAddTest_q_7_sticky_ena(REG,442)
    redist33_fracGRS_uid84_fpAddTest_q_7_sticky_ena_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist33_fracGRS_uid84_fpAddTest_q_7_sticky_ena_q <= "0";
            ELSE
                IF (redist33_fracGRS_uid84_fpAddTest_q_7_nor_q = "1") THEN
                    redist33_fracGRS_uid84_fpAddTest_q_7_sticky_ena_q <= STD_LOGIC_VECTOR(redist33_fracGRS_uid84_fpAddTest_q_7_cmpReg_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist33_fracGRS_uid84_fpAddTest_q_7_enaAnd(LOGICAL,443)
    redist33_fracGRS_uid84_fpAddTest_q_7_enaAnd_q <= redist33_fracGRS_uid84_fpAddTest_q_7_sticky_ena_q and VCC_q;

    -- redist33_fracGRS_uid84_fpAddTest_q_7_rdcnt(COUNTER,435)
    -- low=0, high=2, step=1, init=0
    redist33_fracGRS_uid84_fpAddTest_q_7_rdcnt_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist33_fracGRS_uid84_fpAddTest_q_7_rdcnt_i <= TO_UNSIGNED(0, 2);
                redist33_fracGRS_uid84_fpAddTest_q_7_rdcnt_eq <= '0';
            ELSE
                IF (redist33_fracGRS_uid84_fpAddTest_q_7_rdcnt_i = TO_UNSIGNED(1, 2)) THEN
                    redist33_fracGRS_uid84_fpAddTest_q_7_rdcnt_eq <= '1';
                ELSE
                    redist33_fracGRS_uid84_fpAddTest_q_7_rdcnt_eq <= '0';
                END IF;
                IF (redist33_fracGRS_uid84_fpAddTest_q_7_rdcnt_eq = '1') THEN
                    redist33_fracGRS_uid84_fpAddTest_q_7_rdcnt_i <= redist33_fracGRS_uid84_fpAddTest_q_7_rdcnt_i + 2;
                ELSE
                    redist33_fracGRS_uid84_fpAddTest_q_7_rdcnt_i <= redist33_fracGRS_uid84_fpAddTest_q_7_rdcnt_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    redist33_fracGRS_uid84_fpAddTest_q_7_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist33_fracGRS_uid84_fpAddTest_q_7_rdcnt_i, 2)));

    -- redist33_fracGRS_uid84_fpAddTest_q_7_inputreg1(DELAY,432)
    redist33_fracGRS_uid84_fpAddTest_q_7_inputreg1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist33_fracGRS_uid84_fpAddTest_q_7_inputreg1_q <= (others => '0');
            ELSE
                redist33_fracGRS_uid84_fpAddTest_q_7_inputreg1_q <= STD_LOGIC_VECTOR(redist32_fracGRS_uid84_fpAddTest_q_1_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist33_fracGRS_uid84_fpAddTest_q_7_inputreg0(DELAY,433)
    redist33_fracGRS_uid84_fpAddTest_q_7_inputreg0_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist33_fracGRS_uid84_fpAddTest_q_7_inputreg0_q <= (others => '0');
            ELSE
                redist33_fracGRS_uid84_fpAddTest_q_7_inputreg0_q <= STD_LOGIC_VECTOR(redist33_fracGRS_uid84_fpAddTest_q_7_inputreg1_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist33_fracGRS_uid84_fpAddTest_q_7_wraddr(REG,436)
    redist33_fracGRS_uid84_fpAddTest_q_7_wraddr_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist33_fracGRS_uid84_fpAddTest_q_7_wraddr_q <= "10";
            ELSE
                redist33_fracGRS_uid84_fpAddTest_q_7_wraddr_q <= STD_LOGIC_VECTOR(redist33_fracGRS_uid84_fpAddTest_q_7_rdcnt_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist33_fracGRS_uid84_fpAddTest_q_7_mem(DUALMEM,434)
    redist33_fracGRS_uid84_fpAddTest_q_7_mem_ia <= STD_LOGIC_VECTOR(redist33_fracGRS_uid84_fpAddTest_q_7_inputreg0_q);
    redist33_fracGRS_uid84_fpAddTest_q_7_mem_aa <= redist33_fracGRS_uid84_fpAddTest_q_7_wraddr_q;
    redist33_fracGRS_uid84_fpAddTest_q_7_mem_ab <= redist33_fracGRS_uid84_fpAddTest_q_7_rdcnt_q;
    redist33_fracGRS_uid84_fpAddTest_q_7_mem_reset0 <= areset;
    redist33_fracGRS_uid84_fpAddTest_q_7_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 57,
        widthad_a => 2,
        numwords_a => 3,
        width_b => 57,
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
        clocken1 => redist33_fracGRS_uid84_fpAddTest_q_7_enaAnd_q(0),
        clocken0 => '1',
        clock0 => clk,
        sclr => redist33_fracGRS_uid84_fpAddTest_q_7_mem_reset0,
        clock1 => clk,
        address_a => redist33_fracGRS_uid84_fpAddTest_q_7_mem_aa,
        data_a => redist33_fracGRS_uid84_fpAddTest_q_7_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist33_fracGRS_uid84_fpAddTest_q_7_mem_ab,
        q_b => redist33_fracGRS_uid84_fpAddTest_q_7_mem_iq
    );
    redist33_fracGRS_uid84_fpAddTest_q_7_mem_q <= redist33_fracGRS_uid84_fpAddTest_q_7_mem_iq(56 downto 0);

    -- leftShiftStageSel0Dto4_uid333_fracPostNormExt_uid88_fpAddTest_merged_bit_select(BITSELECT,366)@18
    leftShiftStageSel0Dto4_uid333_fracPostNormExt_uid88_fpAddTest_merged_bit_select_b <= r_uid185_lzCountVal_uid85_fpAddTest_q(5 downto 4);
    leftShiftStageSel0Dto4_uid333_fracPostNormExt_uid88_fpAddTest_merged_bit_select_c <= r_uid185_lzCountVal_uid85_fpAddTest_q(3 downto 2);
    leftShiftStageSel0Dto4_uid333_fracPostNormExt_uid88_fpAddTest_merged_bit_select_d <= r_uid185_lzCountVal_uid85_fpAddTest_q(1 downto 0);

    -- leftShiftStage0_uid334_fracPostNormExt_uid88_fpAddTest(MUX,333)@18 + 1
    leftShiftStage0_uid334_fracPostNormExt_uid88_fpAddTest_s <= leftShiftStageSel0Dto4_uid333_fracPostNormExt_uid88_fpAddTest_merged_bit_select_b;
    leftShiftStage0_uid334_fracPostNormExt_uid88_fpAddTest_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                leftShiftStage0_uid334_fracPostNormExt_uid88_fpAddTest_q <= (others => '0');
            ELSE
                CASE (leftShiftStage0_uid334_fracPostNormExt_uid88_fpAddTest_s) IS
                    WHEN "00" => leftShiftStage0_uid334_fracPostNormExt_uid88_fpAddTest_q <= redist33_fracGRS_uid84_fpAddTest_q_7_mem_q;
                    WHEN "01" => leftShiftStage0_uid334_fracPostNormExt_uid88_fpAddTest_q <= leftShiftStage0Idx1_uid326_fracPostNormExt_uid88_fpAddTest_q;
                    WHEN "10" => leftShiftStage0_uid334_fracPostNormExt_uid88_fpAddTest_q <= leftShiftStage0Idx2_uid329_fracPostNormExt_uid88_fpAddTest_q;
                    WHEN "11" => leftShiftStage0_uid334_fracPostNormExt_uid88_fpAddTest_q <= leftShiftStage0Idx3_uid332_fracPostNormExt_uid88_fpAddTest_q;
                    WHEN OTHERS => leftShiftStage0_uid334_fracPostNormExt_uid88_fpAddTest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;

    -- redist0_leftShiftStageSel0Dto4_uid333_fracPostNormExt_uid88_fpAddTest_merged_bit_select_c_1(DELAY,368)
    redist0_leftShiftStageSel0Dto4_uid333_fracPostNormExt_uid88_fpAddTest_merged_bit_select_c_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist0_leftShiftStageSel0Dto4_uid333_fracPostNormExt_uid88_fpAddTest_merged_bit_select_c_1_q <= (others => '0');
            ELSE
                redist0_leftShiftStageSel0Dto4_uid333_fracPostNormExt_uid88_fpAddTest_merged_bit_select_c_1_q <= STD_LOGIC_VECTOR(leftShiftStageSel0Dto4_uid333_fracPostNormExt_uid88_fpAddTest_merged_bit_select_c);
            END IF;
        END IF;
    END PROCESS;

    -- leftShiftStage1_uid345_fracPostNormExt_uid88_fpAddTest(MUX,344)@19
    leftShiftStage1_uid345_fracPostNormExt_uid88_fpAddTest_s <= redist0_leftShiftStageSel0Dto4_uid333_fracPostNormExt_uid88_fpAddTest_merged_bit_select_c_1_q;
    leftShiftStage1_uid345_fracPostNormExt_uid88_fpAddTest_combproc: PROCESS (leftShiftStage1_uid345_fracPostNormExt_uid88_fpAddTest_s, leftShiftStage0_uid334_fracPostNormExt_uid88_fpAddTest_q, leftShiftStage1Idx1_uid337_fracPostNormExt_uid88_fpAddTest_q, leftShiftStage1Idx2_uid340_fracPostNormExt_uid88_fpAddTest_q, leftShiftStage1Idx3_uid343_fracPostNormExt_uid88_fpAddTest_q)
    BEGIN
        CASE (leftShiftStage1_uid345_fracPostNormExt_uid88_fpAddTest_s) IS
            WHEN "00" => leftShiftStage1_uid345_fracPostNormExt_uid88_fpAddTest_q <= leftShiftStage0_uid334_fracPostNormExt_uid88_fpAddTest_q;
            WHEN "01" => leftShiftStage1_uid345_fracPostNormExt_uid88_fpAddTest_q <= leftShiftStage1Idx1_uid337_fracPostNormExt_uid88_fpAddTest_q;
            WHEN "10" => leftShiftStage1_uid345_fracPostNormExt_uid88_fpAddTest_q <= leftShiftStage1Idx2_uid340_fracPostNormExt_uid88_fpAddTest_q;
            WHEN "11" => leftShiftStage1_uid345_fracPostNormExt_uid88_fpAddTest_q <= leftShiftStage1Idx3_uid343_fracPostNormExt_uid88_fpAddTest_q;
            WHEN OTHERS => leftShiftStage1_uid345_fracPostNormExt_uid88_fpAddTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist1_leftShiftStageSel0Dto4_uid333_fracPostNormExt_uid88_fpAddTest_merged_bit_select_d_1(DELAY,369)
    redist1_leftShiftStageSel0Dto4_uid333_fracPostNormExt_uid88_fpAddTest_merged_bit_select_d_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist1_leftShiftStageSel0Dto4_uid333_fracPostNormExt_uid88_fpAddTest_merged_bit_select_d_1_q <= (others => '0');
            ELSE
                redist1_leftShiftStageSel0Dto4_uid333_fracPostNormExt_uid88_fpAddTest_merged_bit_select_d_1_q <= STD_LOGIC_VECTOR(leftShiftStageSel0Dto4_uid333_fracPostNormExt_uid88_fpAddTest_merged_bit_select_d);
            END IF;
        END IF;
    END PROCESS;

    -- leftShiftStage2_uid356_fracPostNormExt_uid88_fpAddTest(MUX,355)@19 + 1
    leftShiftStage2_uid356_fracPostNormExt_uid88_fpAddTest_s <= redist1_leftShiftStageSel0Dto4_uid333_fracPostNormExt_uid88_fpAddTest_merged_bit_select_d_1_q;
    leftShiftStage2_uid356_fracPostNormExt_uid88_fpAddTest_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                leftShiftStage2_uid356_fracPostNormExt_uid88_fpAddTest_q <= (others => '0');
            ELSE
                CASE (leftShiftStage2_uid356_fracPostNormExt_uid88_fpAddTest_s) IS
                    WHEN "00" => leftShiftStage2_uid356_fracPostNormExt_uid88_fpAddTest_q <= leftShiftStage1_uid345_fracPostNormExt_uid88_fpAddTest_q;
                    WHEN "01" => leftShiftStage2_uid356_fracPostNormExt_uid88_fpAddTest_q <= leftShiftStage2Idx1_uid348_fracPostNormExt_uid88_fpAddTest_q;
                    WHEN "10" => leftShiftStage2_uid356_fracPostNormExt_uid88_fpAddTest_q <= leftShiftStage2Idx2_uid351_fracPostNormExt_uid88_fpAddTest_q;
                    WHEN "11" => leftShiftStage2_uid356_fracPostNormExt_uid88_fpAddTest_q <= leftShiftStage2Idx3_uid354_fracPostNormExt_uid88_fpAddTest_q;
                    WHEN OTHERS => leftShiftStage2_uid356_fracPostNormExt_uid88_fpAddTest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;

    -- LSB_uid97_fpAddTest(BITSELECT,96)@20
    LSB_uid97_fpAddTest_in <= STD_LOGIC_VECTOR(leftShiftStage2_uid356_fracPostNormExt_uid88_fpAddTest_q(4 downto 0));
    LSB_uid97_fpAddTest_b <= STD_LOGIC_VECTOR(LSB_uid97_fpAddTest_in(4 downto 4));

    -- Guard_uid96_fpAddTest(BITSELECT,95)@20
    Guard_uid96_fpAddTest_in <= STD_LOGIC_VECTOR(leftShiftStage2_uid356_fracPostNormExt_uid88_fpAddTest_q(3 downto 0));
    Guard_uid96_fpAddTest_b <= STD_LOGIC_VECTOR(Guard_uid96_fpAddTest_in(3 downto 3));

    -- Round_uid95_fpAddTest(BITSELECT,94)@20
    Round_uid95_fpAddTest_in <= STD_LOGIC_VECTOR(leftShiftStage2_uid356_fracPostNormExt_uid88_fpAddTest_q(2 downto 0));
    Round_uid95_fpAddTest_b <= STD_LOGIC_VECTOR(Round_uid95_fpAddTest_in(2 downto 2));

    -- Sticky1_uid94_fpAddTest(BITSELECT,93)@20
    Sticky1_uid94_fpAddTest_in <= STD_LOGIC_VECTOR(leftShiftStage2_uid356_fracPostNormExt_uid88_fpAddTest_q(1 downto 0));
    Sticky1_uid94_fpAddTest_b <= STD_LOGIC_VECTOR(Sticky1_uid94_fpAddTest_in(1 downto 1));

    -- Sticky0_uid93_fpAddTest(BITSELECT,92)@20
    Sticky0_uid93_fpAddTest_in <= STD_LOGIC_VECTOR(leftShiftStage2_uid356_fracPostNormExt_uid88_fpAddTest_q(0 downto 0));
    Sticky0_uid93_fpAddTest_b <= STD_LOGIC_VECTOR(Sticky0_uid93_fpAddTest_in(0 downto 0));

    -- rndBitCond_uid98_fpAddTest(BITJOIN,97)@20
    rndBitCond_uid98_fpAddTest_q <= LSB_uid97_fpAddTest_b & Guard_uid96_fpAddTest_b & Round_uid95_fpAddTest_b & Sticky1_uid94_fpAddTest_b & Sticky0_uid93_fpAddTest_b;

    -- rBi_uid100_fpAddTest(LOGICAL,99)@20 + 1
    rBi_uid100_fpAddTest_qi <= "1" WHEN rndBitCond_uid98_fpAddTest_q = cRBit_uid99_fpAddTest_q ELSE "0";
    rBi_uid100_fpAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => rBi_uid100_fpAddTest_qi, xout => rBi_uid100_fpAddTest_q, clk => clk, aclr => areset, ena => '1' );

    -- roundBit_uid101_fpAddTest(LOGICAL,100)@21
    roundBit_uid101_fpAddTest_q <= not (rBi_uid100_fpAddTest_q);

    -- oneCST_uid90_fpAddTest(CONSTANT,89)
    oneCST_uid90_fpAddTest_q <= "00000000001";

    -- expInc_uid91_fpAddTest(ADD,90)@18 + 1
    expInc_uid91_fpAddTest_a <= STD_LOGIC_VECTOR("0" & redist57_exp_aSig_uid21_fpAddTest_b_17_mem_q);
    expInc_uid91_fpAddTest_b <= STD_LOGIC_VECTOR("0" & oneCST_uid90_fpAddTest_q);
    expInc_uid91_fpAddTest_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                expInc_uid91_fpAddTest_o <= (others => '0');
            ELSE
                expInc_uid91_fpAddTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expInc_uid91_fpAddTest_a) + UNSIGNED(expInc_uid91_fpAddTest_b));
            END IF;
        END IF;
    END PROCESS;
    expInc_uid91_fpAddTest_q <= expInc_uid91_fpAddTest_o(11 downto 0);

    -- expPostNorm_uid92_fpAddTest(SUB,91)@19 + 1
    expPostNorm_uid92_fpAddTest_a <= STD_LOGIC_VECTOR("0" & expInc_uid91_fpAddTest_q);
    expPostNorm_uid92_fpAddTest_b <= STD_LOGIC_VECTOR("0000000" & redist18_r_uid185_lzCountVal_uid85_fpAddTest_q_1_q);
    expPostNorm_uid92_fpAddTest_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                expPostNorm_uid92_fpAddTest_o <= (others => '0');
            ELSE
                expPostNorm_uid92_fpAddTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expPostNorm_uid92_fpAddTest_a) - UNSIGNED(expPostNorm_uid92_fpAddTest_b));
            END IF;
        END IF;
    END PROCESS;
    expPostNorm_uid92_fpAddTest_q <= expPostNorm_uid92_fpAddTest_o(12 downto 0);

    -- redist30_expPostNorm_uid92_fpAddTest_q_2(DELAY,398)
    redist30_expPostNorm_uid92_fpAddTest_q_2_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist30_expPostNorm_uid92_fpAddTest_q_2_q <= (others => '0');
            ELSE
                redist30_expPostNorm_uid92_fpAddTest_q_2_q <= STD_LOGIC_VECTOR(expPostNorm_uid92_fpAddTest_q);
            END IF;
        END IF;
    END PROCESS;

    -- fracPostNorm_uid89_fpAddTest(BITSELECT,88)@20
    fracPostNorm_uid89_fpAddTest_b <= leftShiftStage2_uid356_fracPostNormExt_uid88_fpAddTest_q(56 downto 1);

    -- fracPostNormRndRange_uid102_fpAddTest(BITSELECT,101)@20
    fracPostNormRndRange_uid102_fpAddTest_in <= fracPostNorm_uid89_fpAddTest_b(54 downto 0);
    fracPostNormRndRange_uid102_fpAddTest_b <= fracPostNormRndRange_uid102_fpAddTest_in(54 downto 2);

    -- redist29_fracPostNormRndRange_uid102_fpAddTest_b_1(DELAY,397)
    redist29_fracPostNormRndRange_uid102_fpAddTest_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist29_fracPostNormRndRange_uid102_fpAddTest_b_1_q <= (others => '0');
            ELSE
                redist29_fracPostNormRndRange_uid102_fpAddTest_b_1_q <= STD_LOGIC_VECTOR(fracPostNormRndRange_uid102_fpAddTest_b);
            END IF;
        END IF;
    END PROCESS;

    -- expFracR_uid103_fpAddTest(BITJOIN,102)@21
    expFracR_uid103_fpAddTest_q <= redist30_expPostNorm_uid92_fpAddTest_q_2_q & redist29_fracPostNormRndRange_uid102_fpAddTest_b_1_q;

    -- rndExpFrac_uid104_fpAddTest(ADD,103)@21 + 1
    rndExpFrac_uid104_fpAddTest_a <= STD_LOGIC_VECTOR("0" & expFracR_uid103_fpAddTest_q);
    rndExpFrac_uid104_fpAddTest_b <= STD_LOGIC_VECTOR("000000000000000000000000000000000000000000000000000000000000000000" & roundBit_uid101_fpAddTest_q);
    rndExpFrac_uid104_fpAddTest_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                rndExpFrac_uid104_fpAddTest_o <= (others => '0');
            ELSE
                rndExpFrac_uid104_fpAddTest_o <= STD_LOGIC_VECTOR(UNSIGNED(rndExpFrac_uid104_fpAddTest_a) + UNSIGNED(rndExpFrac_uid104_fpAddTest_b));
            END IF;
        END IF;
    END PROCESS;
    rndExpFrac_uid104_fpAddTest_q <= rndExpFrac_uid104_fpAddTest_o(66 downto 0);

    -- expRPreExc_uid117_fpAddTest(BITSELECT,116)@22
    expRPreExc_uid117_fpAddTest_in <= rndExpFrac_uid104_fpAddTest_q(63 downto 0);
    expRPreExc_uid117_fpAddTest_b <= expRPreExc_uid117_fpAddTest_in(63 downto 53);

    -- redist27_expRPreExc_uid117_fpAddTest_b_2(DELAY,395)
    redist27_expRPreExc_uid117_fpAddTest_b_2_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist27_expRPreExc_uid117_fpAddTest_b_2_delay_0 <= (others => '0');
                redist27_expRPreExc_uid117_fpAddTest_b_2_q <= (others => '0');
            ELSE
                redist27_expRPreExc_uid117_fpAddTest_b_2_delay_0 <= STD_LOGIC_VECTOR(expRPreExc_uid117_fpAddTest_b);
                redist27_expRPreExc_uid117_fpAddTest_b_2_q <= redist27_expRPreExc_uid117_fpAddTest_b_2_delay_0;
            END IF;
        END IF;
    END PROCESS;

    -- rndExpFracOvfBits_uid109_fpAddTest(BITSELECT,108)@22
    rndExpFracOvfBits_uid109_fpAddTest_in <= rndExpFrac_uid104_fpAddTest_q(65 downto 0);
    rndExpFracOvfBits_uid109_fpAddTest_b <= rndExpFracOvfBits_uid109_fpAddTest_in(65 downto 64);

    -- rOvfExtraBits_uid110_fpAddTest(LOGICAL,109)@22
    rOvfExtraBits_uid110_fpAddTest_q <= "1" WHEN rndExpFracOvfBits_uid109_fpAddTest_b = zocst_uid76_fpAddTest_q ELSE "0";

    -- wEP2AllOwE_uid105_fpAddTest(CONSTANT,104)
    wEP2AllOwE_uid105_fpAddTest_q <= "0011111111111";

    -- rndExp_uid106_fpAddTest(BITSELECT,105)@22
    rndExp_uid106_fpAddTest_in <= rndExpFrac_uid104_fpAddTest_q(65 downto 0);
    rndExp_uid106_fpAddTest_b <= rndExp_uid106_fpAddTest_in(65 downto 53);

    -- rOvfEQMax_uid107_fpAddTest(LOGICAL,106)@22
    rOvfEQMax_uid107_fpAddTest_q <= "1" WHEN rndExp_uid106_fpAddTest_b = wEP2AllOwE_uid105_fpAddTest_q ELSE "0";

    -- rOvf_uid111_fpAddTest(LOGICAL,110)@22 + 1
    rOvf_uid111_fpAddTest_qi <= rOvfEQMax_uid107_fpAddTest_q or rOvfExtraBits_uid110_fpAddTest_q;
    rOvf_uid111_fpAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => rOvf_uid111_fpAddTest_qi, xout => rOvf_uid111_fpAddTest_q, clk => clk, aclr => areset, ena => '1' );

    -- regInputs_uid118_fpAddTest(LOGICAL,117)@19 + 1
    regInputs_uid118_fpAddTest_qi <= excR_aSig_uid31_fpAddTest_q and excR_bSig_uid45_fpAddTest_q;
    regInputs_uid118_fpAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => regInputs_uid118_fpAddTest_qi, xout => regInputs_uid118_fpAddTest_q, clk => clk, aclr => areset, ena => '1' );

    -- redist26_regInputs_uid118_fpAddTest_q_4(DELAY,394)
    redist26_regInputs_uid118_fpAddTest_q_4_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist26_regInputs_uid118_fpAddTest_q_4_delay_0 <= (others => '0');
                redist26_regInputs_uid118_fpAddTest_q_4_delay_1 <= (others => '0');
                redist26_regInputs_uid118_fpAddTest_q_4_q <= (others => '0');
            ELSE
                redist26_regInputs_uid118_fpAddTest_q_4_delay_0 <= STD_LOGIC_VECTOR(regInputs_uid118_fpAddTest_q);
                redist26_regInputs_uid118_fpAddTest_q_4_delay_1 <= redist26_regInputs_uid118_fpAddTest_q_4_delay_0;
                redist26_regInputs_uid118_fpAddTest_q_4_q <= redist26_regInputs_uid118_fpAddTest_q_4_delay_1;
            END IF;
        END IF;
    END PROCESS;

    -- rInfOvf_uid121_fpAddTest(LOGICAL,120)@23
    rInfOvf_uid121_fpAddTest_q <= redist26_regInputs_uid118_fpAddTest_q_4_q and rOvf_uid111_fpAddTest_q;

    -- excRInfVInC_uid122_fpAddTest(BITJOIN,121)@23
    excRInfVInC_uid122_fpAddTest_q <= rInfOvf_uid121_fpAddTest_q & redist43_excN_bSig_uid42_fpAddTest_q_5_q & redist51_excN_aSig_uid28_fpAddTest_q_5_q & redist44_excI_bSig_uid41_fpAddTest_q_5_q & redist52_excI_aSig_uid27_fpAddTest_q_5_q & redist37_effSub_uid52_fpAddTest_q_14_q;

    -- excRInf_uid123_fpAddTest(LOOKUP,122)@23 + 1
    excRInf_uid123_fpAddTest_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                excRInf_uid123_fpAddTest_q <= "0";
            ELSE
                CASE (excRInfVInC_uid122_fpAddTest_q) IS
                    WHEN "000000" => excRInf_uid123_fpAddTest_q <= "0";
                    WHEN "000001" => excRInf_uid123_fpAddTest_q <= "0";
                    WHEN "000010" => excRInf_uid123_fpAddTest_q <= "1";
                    WHEN "000011" => excRInf_uid123_fpAddTest_q <= "1";
                    WHEN "000100" => excRInf_uid123_fpAddTest_q <= "1";
                    WHEN "000101" => excRInf_uid123_fpAddTest_q <= "1";
                    WHEN "000110" => excRInf_uid123_fpAddTest_q <= "1";
                    WHEN "000111" => excRInf_uid123_fpAddTest_q <= "0";
                    WHEN "001000" => excRInf_uid123_fpAddTest_q <= "0";
                    WHEN "001001" => excRInf_uid123_fpAddTest_q <= "0";
                    WHEN "001010" => excRInf_uid123_fpAddTest_q <= "0";
                    WHEN "001011" => excRInf_uid123_fpAddTest_q <= "0";
                    WHEN "001100" => excRInf_uid123_fpAddTest_q <= "0";
                    WHEN "001101" => excRInf_uid123_fpAddTest_q <= "0";
                    WHEN "001110" => excRInf_uid123_fpAddTest_q <= "0";
                    WHEN "001111" => excRInf_uid123_fpAddTest_q <= "0";
                    WHEN "010000" => excRInf_uid123_fpAddTest_q <= "0";
                    WHEN "010001" => excRInf_uid123_fpAddTest_q <= "0";
                    WHEN "010010" => excRInf_uid123_fpAddTest_q <= "0";
                    WHEN "010011" => excRInf_uid123_fpAddTest_q <= "0";
                    WHEN "010100" => excRInf_uid123_fpAddTest_q <= "0";
                    WHEN "010101" => excRInf_uid123_fpAddTest_q <= "0";
                    WHEN "010110" => excRInf_uid123_fpAddTest_q <= "0";
                    WHEN "010111" => excRInf_uid123_fpAddTest_q <= "0";
                    WHEN "011000" => excRInf_uid123_fpAddTest_q <= "0";
                    WHEN "011001" => excRInf_uid123_fpAddTest_q <= "0";
                    WHEN "011010" => excRInf_uid123_fpAddTest_q <= "0";
                    WHEN "011011" => excRInf_uid123_fpAddTest_q <= "0";
                    WHEN "011100" => excRInf_uid123_fpAddTest_q <= "0";
                    WHEN "011101" => excRInf_uid123_fpAddTest_q <= "0";
                    WHEN "011110" => excRInf_uid123_fpAddTest_q <= "0";
                    WHEN "011111" => excRInf_uid123_fpAddTest_q <= "0";
                    WHEN "100000" => excRInf_uid123_fpAddTest_q <= "1";
                    WHEN "100001" => excRInf_uid123_fpAddTest_q <= "0";
                    WHEN "100010" => excRInf_uid123_fpAddTest_q <= "0";
                    WHEN "100011" => excRInf_uid123_fpAddTest_q <= "0";
                    WHEN "100100" => excRInf_uid123_fpAddTest_q <= "0";
                    WHEN "100101" => excRInf_uid123_fpAddTest_q <= "0";
                    WHEN "100110" => excRInf_uid123_fpAddTest_q <= "0";
                    WHEN "100111" => excRInf_uid123_fpAddTest_q <= "0";
                    WHEN "101000" => excRInf_uid123_fpAddTest_q <= "0";
                    WHEN "101001" => excRInf_uid123_fpAddTest_q <= "0";
                    WHEN "101010" => excRInf_uid123_fpAddTest_q <= "0";
                    WHEN "101011" => excRInf_uid123_fpAddTest_q <= "0";
                    WHEN "101100" => excRInf_uid123_fpAddTest_q <= "0";
                    WHEN "101101" => excRInf_uid123_fpAddTest_q <= "0";
                    WHEN "101110" => excRInf_uid123_fpAddTest_q <= "0";
                    WHEN "101111" => excRInf_uid123_fpAddTest_q <= "0";
                    WHEN "110000" => excRInf_uid123_fpAddTest_q <= "0";
                    WHEN "110001" => excRInf_uid123_fpAddTest_q <= "0";
                    WHEN "110010" => excRInf_uid123_fpAddTest_q <= "0";
                    WHEN "110011" => excRInf_uid123_fpAddTest_q <= "0";
                    WHEN "110100" => excRInf_uid123_fpAddTest_q <= "0";
                    WHEN "110101" => excRInf_uid123_fpAddTest_q <= "0";
                    WHEN "110110" => excRInf_uid123_fpAddTest_q <= "0";
                    WHEN "110111" => excRInf_uid123_fpAddTest_q <= "0";
                    WHEN "111000" => excRInf_uid123_fpAddTest_q <= "0";
                    WHEN "111001" => excRInf_uid123_fpAddTest_q <= "0";
                    WHEN "111010" => excRInf_uid123_fpAddTest_q <= "0";
                    WHEN "111011" => excRInf_uid123_fpAddTest_q <= "0";
                    WHEN "111100" => excRInf_uid123_fpAddTest_q <= "0";
                    WHEN "111101" => excRInf_uid123_fpAddTest_q <= "0";
                    WHEN "111110" => excRInf_uid123_fpAddTest_q <= "0";
                    WHEN "111111" => excRInf_uid123_fpAddTest_q <= "0";
                    WHEN OTHERS => -- unreachable
                                   excRInf_uid123_fpAddTest_q <= (others => '-');
                END CASE;
            END IF;
        END IF;
    END PROCESS;

    -- redist31_aMinusA_uid87_fpAddTest_q_4(DELAY,399)
    redist31_aMinusA_uid87_fpAddTest_q_4_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist31_aMinusA_uid87_fpAddTest_q_4_delay_0 <= (others => '0');
                redist31_aMinusA_uid87_fpAddTest_q_4_delay_1 <= (others => '0');
                redist31_aMinusA_uid87_fpAddTest_q_4_delay_2 <= (others => '0');
                redist31_aMinusA_uid87_fpAddTest_q_4_q <= (others => '0');
            ELSE
                redist31_aMinusA_uid87_fpAddTest_q_4_delay_0 <= STD_LOGIC_VECTOR(aMinusA_uid87_fpAddTest_q);
                redist31_aMinusA_uid87_fpAddTest_q_4_delay_1 <= redist31_aMinusA_uid87_fpAddTest_q_4_delay_0;
                redist31_aMinusA_uid87_fpAddTest_q_4_delay_2 <= redist31_aMinusA_uid87_fpAddTest_q_4_delay_1;
                redist31_aMinusA_uid87_fpAddTest_q_4_q <= redist31_aMinusA_uid87_fpAddTest_q_4_delay_2;
            END IF;
        END IF;
    END PROCESS;

    -- rUdfExtraBit_uid114_fpAddTest(BITSELECT,113)@22
    rUdfExtraBit_uid114_fpAddTest_in <= STD_LOGIC_VECTOR(rndExpFrac_uid104_fpAddTest_q(65 downto 0));
    rUdfExtraBit_uid114_fpAddTest_b <= STD_LOGIC_VECTOR(rUdfExtraBit_uid114_fpAddTest_in(65 downto 65));

    -- wEP2AllZ_uid112_fpAddTest(CONSTANT,111)
    wEP2AllZ_uid112_fpAddTest_q <= "0000000000000";

    -- rUdfEQMin_uid113_fpAddTest(LOGICAL,112)@22
    rUdfEQMin_uid113_fpAddTest_q <= "1" WHEN rndExp_uid106_fpAddTest_b = wEP2AllZ_uid112_fpAddTest_q ELSE "0";

    -- rUdf_uid115_fpAddTest(LOGICAL,114)@22 + 1
    rUdf_uid115_fpAddTest_qi <= rUdfEQMin_uid113_fpAddTest_q or rUdfExtraBit_uid114_fpAddTest_b;
    rUdf_uid115_fpAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => rUdf_uid115_fpAddTest_qi, xout => rUdf_uid115_fpAddTest_q, clk => clk, aclr => areset, ena => '1' );

    -- redist48_excZ_bSig_uid17_uid37_fpAddTest_q_21(DELAY,416)
    redist48_excZ_bSig_uid17_uid37_fpAddTest_q_21_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist48_excZ_bSig_uid17_uid37_fpAddTest_q_21_delay_0 <= (others => '0');
                redist48_excZ_bSig_uid17_uid37_fpAddTest_q_21_delay_1 <= (others => '0');
                redist48_excZ_bSig_uid17_uid37_fpAddTest_q_21_delay_2 <= (others => '0');
                redist48_excZ_bSig_uid17_uid37_fpAddTest_q_21_q <= (others => '0');
            ELSE
                redist48_excZ_bSig_uid17_uid37_fpAddTest_q_21_delay_0 <= STD_LOGIC_VECTOR(redist47_excZ_bSig_uid17_uid37_fpAddTest_q_17_q);
                redist48_excZ_bSig_uid17_uid37_fpAddTest_q_21_delay_1 <= redist48_excZ_bSig_uid17_uid37_fpAddTest_q_21_delay_0;
                redist48_excZ_bSig_uid17_uid37_fpAddTest_q_21_delay_2 <= redist48_excZ_bSig_uid17_uid37_fpAddTest_q_21_delay_1;
                redist48_excZ_bSig_uid17_uid37_fpAddTest_q_21_q <= redist48_excZ_bSig_uid17_uid37_fpAddTest_q_21_delay_2;
            END IF;
        END IF;
    END PROCESS;

    -- redist54_excZ_aSig_uid16_uid23_fpAddTest_q_5(DELAY,422)
    redist54_excZ_aSig_uid16_uid23_fpAddTest_q_5_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist54_excZ_aSig_uid16_uid23_fpAddTest_q_5_delay_0 <= (others => '0');
                redist54_excZ_aSig_uid16_uid23_fpAddTest_q_5_delay_1 <= (others => '0');
                redist54_excZ_aSig_uid16_uid23_fpAddTest_q_5_delay_2 <= (others => '0');
                redist54_excZ_aSig_uid16_uid23_fpAddTest_q_5_q <= (others => '0');
            ELSE
                redist54_excZ_aSig_uid16_uid23_fpAddTest_q_5_delay_0 <= STD_LOGIC_VECTOR(redist53_excZ_aSig_uid16_uid23_fpAddTest_q_1_q);
                redist54_excZ_aSig_uid16_uid23_fpAddTest_q_5_delay_1 <= redist54_excZ_aSig_uid16_uid23_fpAddTest_q_5_delay_0;
                redist54_excZ_aSig_uid16_uid23_fpAddTest_q_5_delay_2 <= redist54_excZ_aSig_uid16_uid23_fpAddTest_q_5_delay_1;
                redist54_excZ_aSig_uid16_uid23_fpAddTest_q_5_q <= redist54_excZ_aSig_uid16_uid23_fpAddTest_q_5_delay_2;
            END IF;
        END IF;
    END PROCESS;

    -- excRZeroVInC_uid119_fpAddTest(BITJOIN,118)@23
    excRZeroVInC_uid119_fpAddTest_q <= redist31_aMinusA_uid87_fpAddTest_q_4_q & rUdf_uid115_fpAddTest_q & redist26_regInputs_uid118_fpAddTest_q_4_q & redist48_excZ_bSig_uid17_uid37_fpAddTest_q_21_q & redist54_excZ_aSig_uid16_uid23_fpAddTest_q_5_q;

    -- excRZero_uid120_fpAddTest(LOOKUP,119)@23 + 1
    excRZero_uid120_fpAddTest_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                excRZero_uid120_fpAddTest_q <= "0";
            ELSE
                CASE (excRZeroVInC_uid119_fpAddTest_q) IS
                    WHEN "00000" => excRZero_uid120_fpAddTest_q <= "0";
                    WHEN "00001" => excRZero_uid120_fpAddTest_q <= "0";
                    WHEN "00010" => excRZero_uid120_fpAddTest_q <= "0";
                    WHEN "00011" => excRZero_uid120_fpAddTest_q <= "1";
                    WHEN "00100" => excRZero_uid120_fpAddTest_q <= "0";
                    WHEN "00101" => excRZero_uid120_fpAddTest_q <= "0";
                    WHEN "00110" => excRZero_uid120_fpAddTest_q <= "0";
                    WHEN "00111" => excRZero_uid120_fpAddTest_q <= "0";
                    WHEN "01000" => excRZero_uid120_fpAddTest_q <= "0";
                    WHEN "01001" => excRZero_uid120_fpAddTest_q <= "0";
                    WHEN "01010" => excRZero_uid120_fpAddTest_q <= "0";
                    WHEN "01011" => excRZero_uid120_fpAddTest_q <= "1";
                    WHEN "01100" => excRZero_uid120_fpAddTest_q <= "1";
                    WHEN "01101" => excRZero_uid120_fpAddTest_q <= "0";
                    WHEN "01110" => excRZero_uid120_fpAddTest_q <= "0";
                    WHEN "01111" => excRZero_uid120_fpAddTest_q <= "0";
                    WHEN "10000" => excRZero_uid120_fpAddTest_q <= "0";
                    WHEN "10001" => excRZero_uid120_fpAddTest_q <= "0";
                    WHEN "10010" => excRZero_uid120_fpAddTest_q <= "0";
                    WHEN "10011" => excRZero_uid120_fpAddTest_q <= "1";
                    WHEN "10100" => excRZero_uid120_fpAddTest_q <= "1";
                    WHEN "10101" => excRZero_uid120_fpAddTest_q <= "0";
                    WHEN "10110" => excRZero_uid120_fpAddTest_q <= "0";
                    WHEN "10111" => excRZero_uid120_fpAddTest_q <= "0";
                    WHEN "11000" => excRZero_uid120_fpAddTest_q <= "0";
                    WHEN "11001" => excRZero_uid120_fpAddTest_q <= "0";
                    WHEN "11010" => excRZero_uid120_fpAddTest_q <= "0";
                    WHEN "11011" => excRZero_uid120_fpAddTest_q <= "1";
                    WHEN "11100" => excRZero_uid120_fpAddTest_q <= "1";
                    WHEN "11101" => excRZero_uid120_fpAddTest_q <= "0";
                    WHEN "11110" => excRZero_uid120_fpAddTest_q <= "0";
                    WHEN "11111" => excRZero_uid120_fpAddTest_q <= "0";
                    WHEN OTHERS => -- unreachable
                                   excRZero_uid120_fpAddTest_q <= (others => '-');
                END CASE;
            END IF;
        END IF;
    END PROCESS;

    -- concExc_uid127_fpAddTest(BITJOIN,126)@24
    concExc_uid127_fpAddTest_q <= excRNaN_uid126_fpAddTest_q & excRInf_uid123_fpAddTest_q & excRZero_uid120_fpAddTest_q;

    -- excREnc_uid128_fpAddTest(LOOKUP,127)@24
    excREnc_uid128_fpAddTest_combproc: PROCESS (concExc_uid127_fpAddTest_q)
    BEGIN
        -- Begin reserved scope level
        CASE (concExc_uid127_fpAddTest_q) IS
            WHEN "000" => excREnc_uid128_fpAddTest_q <= "01";
            WHEN "001" => excREnc_uid128_fpAddTest_q <= "00";
            WHEN "010" => excREnc_uid128_fpAddTest_q <= "10";
            WHEN "011" => excREnc_uid128_fpAddTest_q <= "10";
            WHEN "100" => excREnc_uid128_fpAddTest_q <= "11";
            WHEN "101" => excREnc_uid128_fpAddTest_q <= "11";
            WHEN "110" => excREnc_uid128_fpAddTest_q <= "11";
            WHEN "111" => excREnc_uid128_fpAddTest_q <= "11";
            WHEN OTHERS => -- unreachable
                           excREnc_uid128_fpAddTest_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- expRPostExc_uid147_fpAddTest(MUX,146)@24
    expRPostExc_uid147_fpAddTest_s <= excREnc_uid128_fpAddTest_q;
    expRPostExc_uid147_fpAddTest_combproc: PROCESS (expRPostExc_uid147_fpAddTest_s, cstAllZWE_uid20_fpAddTest_q, redist27_expRPreExc_uid117_fpAddTest_b_2_q, cstAllOWE_uid18_fpAddTest_q)
    BEGIN
        CASE (expRPostExc_uid147_fpAddTest_s) IS
            WHEN "00" => expRPostExc_uid147_fpAddTest_q <= cstAllZWE_uid20_fpAddTest_q;
            WHEN "01" => expRPostExc_uid147_fpAddTest_q <= redist27_expRPreExc_uid117_fpAddTest_b_2_q;
            WHEN "10" => expRPostExc_uid147_fpAddTest_q <= cstAllOWE_uid18_fpAddTest_q;
            WHEN "11" => expRPostExc_uid147_fpAddTest_q <= cstAllOWE_uid18_fpAddTest_q;
            WHEN OTHERS => expRPostExc_uid147_fpAddTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- oneFracRPostExc2_uid140_fpAddTest(CONSTANT,139)
    oneFracRPostExc2_uid140_fpAddTest_q <= "0000000000000000000000000000000000000000000000000001";

    -- fracRPreExc_uid116_fpAddTest(BITSELECT,115)@22
    fracRPreExc_uid116_fpAddTest_in <= rndExpFrac_uid104_fpAddTest_q(52 downto 0);
    fracRPreExc_uid116_fpAddTest_b <= fracRPreExc_uid116_fpAddTest_in(52 downto 1);

    -- redist28_fracRPreExc_uid116_fpAddTest_b_2(DELAY,396)
    redist28_fracRPreExc_uid116_fpAddTest_b_2_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist28_fracRPreExc_uid116_fpAddTest_b_2_delay_0 <= (others => '0');
                redist28_fracRPreExc_uid116_fpAddTest_b_2_q <= (others => '0');
            ELSE
                redist28_fracRPreExc_uid116_fpAddTest_b_2_delay_0 <= STD_LOGIC_VECTOR(fracRPreExc_uid116_fpAddTest_b);
                redist28_fracRPreExc_uid116_fpAddTest_b_2_q <= redist28_fracRPreExc_uid116_fpAddTest_b_2_delay_0;
            END IF;
        END IF;
    END PROCESS;

    -- fracRPostExc_uid143_fpAddTest(MUX,142)@24
    fracRPostExc_uid143_fpAddTest_s <= excREnc_uid128_fpAddTest_q;
    fracRPostExc_uid143_fpAddTest_combproc: PROCESS (fracRPostExc_uid143_fpAddTest_s, cstZeroWF_uid19_fpAddTest_q, redist28_fracRPreExc_uid116_fpAddTest_b_2_q, oneFracRPostExc2_uid140_fpAddTest_q)
    BEGIN
        CASE (fracRPostExc_uid143_fpAddTest_s) IS
            WHEN "00" => fracRPostExc_uid143_fpAddTest_q <= cstZeroWF_uid19_fpAddTest_q;
            WHEN "01" => fracRPostExc_uid143_fpAddTest_q <= redist28_fracRPreExc_uid116_fpAddTest_b_2_q;
            WHEN "10" => fracRPostExc_uid143_fpAddTest_q <= cstZeroWF_uid19_fpAddTest_q;
            WHEN "11" => fracRPostExc_uid143_fpAddTest_q <= oneFracRPostExc2_uid140_fpAddTest_q;
            WHEN OTHERS => fracRPostExc_uid143_fpAddTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- R_uid148_fpAddTest(BITJOIN,147)@24
    R_uid148_fpAddTest_q <= signRPostExc_uid139_fpAddTest_q & expRPostExc_uid147_fpAddTest_q & fracRPostExc_uid143_fpAddTest_q;

    -- xOut(GPOUT,4)@24
    q <= R_uid148_fpAddTest_q;

END normal;
