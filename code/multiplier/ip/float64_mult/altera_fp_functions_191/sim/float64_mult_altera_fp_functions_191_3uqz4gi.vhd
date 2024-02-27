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

-- VHDL created from float64_mult_altera_fp_functions_191_3uqz4gi
-- VHDL created on Mon Sep 26 21:02:59 2022


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

entity float64_mult_altera_fp_functions_191_3uqz4gi is
    port (
        a : in std_logic_vector(63 downto 0);  -- float64_m52
        b : in std_logic_vector(63 downto 0);  -- float64_m52
        q : out std_logic_vector(63 downto 0);  -- float64_m52
        clk : in std_logic;
        areset : in std_logic
    );
end float64_mult_altera_fp_functions_191_3uqz4gi;

architecture normal of float64_mult_altera_fp_functions_191_3uqz4gi is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expX_uid6_fpMulTest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal expY_uid7_fpMulTest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal signX_uid8_fpMulTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signY_uid9_fpMulTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal cstAllOWE_uid10_fpMulTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal cstZeroWF_uid11_fpMulTest_q : STD_LOGIC_VECTOR (51 downto 0);
    signal cstAllZWE_uid12_fpMulTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal frac_x_uid14_fpMulTest_b : STD_LOGIC_VECTOR (51 downto 0);
    signal excZ_x_uid15_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_x_uid15_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid16_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid16_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid18_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_x_uid19_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid20_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid20_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid21_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid22_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_x_uid23_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal frac_y_uid28_fpMulTest_b : STD_LOGIC_VECTOR (51 downto 0);
    signal excZ_y_uid29_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_y_uid29_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid30_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid30_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid32_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_y_uid33_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_y_uid34_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_y_uid34_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid35_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid36_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_y_uid37_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal ofracX_uid40_fpMulTest_q : STD_LOGIC_VECTOR (52 downto 0);
    signal ofracY_uid43_fpMulTest_q : STD_LOGIC_VECTOR (52 downto 0);
    signal expSum_uid44_fpMulTest_a : STD_LOGIC_VECTOR (11 downto 0);
    signal expSum_uid44_fpMulTest_b : STD_LOGIC_VECTOR (11 downto 0);
    signal expSum_uid44_fpMulTest_o : STD_LOGIC_VECTOR (11 downto 0);
    signal expSum_uid44_fpMulTest_q : STD_LOGIC_VECTOR (11 downto 0);
    signal biasInc_uid45_fpMulTest_q : STD_LOGIC_VECTOR (12 downto 0);
    signal expSumMBias_uid46_fpMulTest_a : STD_LOGIC_VECTOR (14 downto 0);
    signal expSumMBias_uid46_fpMulTest_b : STD_LOGIC_VECTOR (14 downto 0);
    signal expSumMBias_uid46_fpMulTest_o : STD_LOGIC_VECTOR (14 downto 0);
    signal expSumMBias_uid46_fpMulTest_q : STD_LOGIC_VECTOR (13 downto 0);
    signal signR_uid48_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal signR_uid48_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal normalizeBit_uid49_fpMulTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPostNormHigh_uid51_fpMulTest_in : STD_LOGIC_VECTOR (104 downto 0);
    signal fracRPostNormHigh_uid51_fpMulTest_b : STD_LOGIC_VECTOR (52 downto 0);
    signal fracRPostNormLow_uid52_fpMulTest_in : STD_LOGIC_VECTOR (103 downto 0);
    signal fracRPostNormLow_uid52_fpMulTest_b : STD_LOGIC_VECTOR (52 downto 0);
    signal fracRPostNorm_uid53_fpMulTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPostNorm_uid53_fpMulTest_q : STD_LOGIC_VECTOR (52 downto 0);
    signal stickyRange_uid54_fpMulTest_in : STD_LOGIC_VECTOR (50 downto 0);
    signal stickyRange_uid54_fpMulTest_b : STD_LOGIC_VECTOR (50 downto 0);
    signal extraStickyBitOfProd_uid55_fpMulTest_in : STD_LOGIC_VECTOR (51 downto 0);
    signal extraStickyBitOfProd_uid55_fpMulTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal extraStickyBit_uid56_fpMulTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal extraStickyBit_uid56_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal stickyExtendedRange_uid57_fpMulTest_q : STD_LOGIC_VECTOR (51 downto 0);
    signal sticky_uid60_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPostNorm1dto0_uid61_fpMulTest_in : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostNorm1dto0_uid61_fpMulTest_b : STD_LOGIC_VECTOR (1 downto 0);
    signal lrs_uid62_fpMulTest_q : STD_LOGIC_VECTOR (2 downto 0);
    signal roundBitDetectionConstant_uid63_fpMulTest_q : STD_LOGIC_VECTOR (2 downto 0);
    signal roundBitDetectionPattern_uid64_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal roundBitDetectionPattern_uid64_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal roundBit_uid65_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracPreRound_uid66_fpMulTest_q : STD_LOGIC_VECTOR (66 downto 0);
    signal roundBitAndNormalizationOp_uid68_fpMulTest_q : STD_LOGIC_VECTOR (54 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_a : STD_LOGIC_VECTOR (68 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_b : STD_LOGIC_VECTOR (68 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_o : STD_LOGIC_VECTOR (68 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_q : STD_LOGIC_VECTOR (67 downto 0);
    signal fracRPreExc_uid70_fpMulTest_in : STD_LOGIC_VECTOR (52 downto 0);
    signal fracRPreExc_uid70_fpMulTest_b : STD_LOGIC_VECTOR (51 downto 0);
    signal expRPreExcExt_uid71_fpMulTest_b : STD_LOGIC_VECTOR (14 downto 0);
    signal expRPreExc_uid72_fpMulTest_in : STD_LOGIC_VECTOR (10 downto 0);
    signal expRPreExc_uid72_fpMulTest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal expUdf_uid73_fpMulTest_a : STD_LOGIC_VECTOR (16 downto 0);
    signal expUdf_uid73_fpMulTest_b : STD_LOGIC_VECTOR (16 downto 0);
    signal expUdf_uid73_fpMulTest_o : STD_LOGIC_VECTOR (16 downto 0);
    signal expUdf_uid73_fpMulTest_n : STD_LOGIC_VECTOR (0 downto 0);
    signal expOvf_uid75_fpMulTest_a : STD_LOGIC_VECTOR (16 downto 0);
    signal expOvf_uid75_fpMulTest_b : STD_LOGIC_VECTOR (16 downto 0);
    signal expOvf_uid75_fpMulTest_o : STD_LOGIC_VECTOR (16 downto 0);
    signal expOvf_uid75_fpMulTest_n : STD_LOGIC_VECTOR (0 downto 0);
    signal excXZAndExcYZ_uid76_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excXZAndExcYZ_uid76_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXZAndExcYR_uid77_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excXZAndExcYR_uid77_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excYZAndExcXR_uid78_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excYZAndExcXR_uid78_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excZC3_uid79_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excZC3_uid79_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZero_uid80_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXIAndExcYI_uid81_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excXIAndExcYI_uid81_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXRAndExcYI_uid82_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excXRAndExcYI_uid82_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excYRAndExcXI_uid83_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excYRAndExcXI_uid83_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal ExcROvfAndInReg_uid84_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal ExcROvfAndInReg_uid84_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRInf_uid85_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excYZAndExcXI_uid86_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXZAndExcYI_uid87_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal ZeroTimesInf_uid88_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal ZeroTimesInf_uid88_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid89_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal concExc_uid90_fpMulTest_q : STD_LOGIC_VECTOR (2 downto 0);
    signal excREnc_uid91_fpMulTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal oneFracRPostExc2_uid92_fpMulTest_q : STD_LOGIC_VECTOR (51 downto 0);
    signal fracRPostExc_uid95_fpMulTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid95_fpMulTest_q : STD_LOGIC_VECTOR (51 downto 0);
    signal expRPostExc_uid100_fpMulTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal expRPostExc_uid100_fpMulTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal invExcRNaN_uid101_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRPostExc_uid102_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal signRPostExc_uid102_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal R_uid103_fpMulTest_q : STD_LOGIC_VECTOR (63 downto 0);
    signal aboveLeftY_mergedSignalTM_uid111_prod_uid47_fpMulTest_q : STD_LOGIC_VECTOR (26 downto 0);
    signal rightBottomX_mergedSignalTM_uid115_prod_uid47_fpMulTest_q : STD_LOGIC_VECTOR (26 downto 0);
    signal add0_uid129_prod_uid47_fpMulTest_q : STD_LOGIC_VECTOR (107 downto 0);
    signal lowRangeB_uid130_prod_uid47_fpMulTest_in : STD_LOGIC_VECTOR (26 downto 0);
    signal lowRangeB_uid130_prod_uid47_fpMulTest_b : STD_LOGIC_VECTOR (26 downto 0);
    signal add1_uid133_prod_uid47_fpMulTest_q : STD_LOGIC_VECTOR (108 downto 0);
    signal osig_uid134_prod_uid47_fpMulTest_in : STD_LOGIC_VECTOR (107 downto 0);
    signal osig_uid134_prod_uid47_fpMulTest_b : STD_LOGIC_VECTOR (105 downto 0);
    signal eq0_uid138_fracXIsZero_uid17_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid141_fracXIsZero_uid17_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq2_uid144_fracXIsZero_uid17_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq3_uid147_fracXIsZero_uid17_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq4_uid150_fracXIsZero_uid17_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq5_uid153_fracXIsZero_uid17_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq6_uid156_fracXIsZero_uid17_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq7_uid159_fracXIsZero_uid17_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq8_uid162_fracXIsZero_uid17_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid163_fracXIsZero_uid17_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid163_fracXIsZero_uid17_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid164_fracXIsZero_uid17_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid164_fracXIsZero_uid17_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev1_uid165_fracXIsZero_uid17_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev1_uid165_fracXIsZero_uid17_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid168_fracXIsZero_uid31_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid171_fracXIsZero_uid31_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq2_uid174_fracXIsZero_uid31_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq3_uid177_fracXIsZero_uid31_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq4_uid180_fracXIsZero_uid31_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq5_uid183_fracXIsZero_uid31_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq6_uid186_fracXIsZero_uid31_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq7_uid189_fracXIsZero_uid31_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq8_uid192_fracXIsZero_uid31_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid193_fracXIsZero_uid31_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid193_fracXIsZero_uid31_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid194_fracXIsZero_uid31_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid194_fracXIsZero_uid31_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev1_uid195_fracXIsZero_uid31_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev1_uid195_fracXIsZero_uid31_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid198_stickyRangeComparator_uid59_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid201_stickyRangeComparator_uid59_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq2_uid204_stickyRangeComparator_uid59_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq3_uid207_stickyRangeComparator_uid59_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq4_uid210_stickyRangeComparator_uid59_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq5_uid213_stickyRangeComparator_uid59_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq6_uid216_stickyRangeComparator_uid59_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq7_uid219_stickyRangeComparator_uid59_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq8_uid222_stickyRangeComparator_uid59_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid223_stickyRangeComparator_uid59_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid223_stickyRangeComparator_uid59_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid224_stickyRangeComparator_uid59_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid224_stickyRangeComparator_uid59_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev1_uid225_stickyRangeComparator_uid59_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal topProd_uid107_prod_uid47_fpMulTest_cma_reset : std_logic;
    type topProd_uid107_prod_uid47_fpMulTest_cma_ahtype is array(NATURAL range <>) of UNSIGNED(26 downto 0);
    signal topProd_uid107_prod_uid47_fpMulTest_cma_ah : topProd_uid107_prod_uid47_fpMulTest_cma_ahtype(0 to 0);
    attribute preserve_syn_only : boolean;
    attribute preserve_syn_only of topProd_uid107_prod_uid47_fpMulTest_cma_ah : signal is true;
    signal topProd_uid107_prod_uid47_fpMulTest_cma_ch : topProd_uid107_prod_uid47_fpMulTest_cma_ahtype(0 to 0);
    attribute preserve_syn_only of topProd_uid107_prod_uid47_fpMulTest_cma_ch : signal is true;
    signal topProd_uid107_prod_uid47_fpMulTest_cma_a0 : STD_LOGIC_VECTOR (26 downto 0);
    signal topProd_uid107_prod_uid47_fpMulTest_cma_c0 : STD_LOGIC_VECTOR (26 downto 0);
    signal topProd_uid107_prod_uid47_fpMulTest_cma_s0 : STD_LOGIC_VECTOR (53 downto 0);
    signal topProd_uid107_prod_uid47_fpMulTest_cma_qq : STD_LOGIC_VECTOR (53 downto 0);
    signal topProd_uid107_prod_uid47_fpMulTest_cma_q : STD_LOGIC_VECTOR (53 downto 0);
    signal topProd_uid107_prod_uid47_fpMulTest_cma_ena0 : std_logic;
    signal topProd_uid107_prod_uid47_fpMulTest_cma_ena1 : std_logic;
    signal topProd_uid107_prod_uid47_fpMulTest_cma_ena2 : std_logic;
    signal sm0_uid128_prod_uid47_fpMulTest_cma_reset : std_logic;
    signal sm0_uid128_prod_uid47_fpMulTest_cma_ah : topProd_uid107_prod_uid47_fpMulTest_cma_ahtype(0 to 0);
    attribute preserve_syn_only of sm0_uid128_prod_uid47_fpMulTest_cma_ah : signal is true;
    signal sm0_uid128_prod_uid47_fpMulTest_cma_ch : topProd_uid107_prod_uid47_fpMulTest_cma_ahtype(0 to 0);
    attribute preserve_syn_only of sm0_uid128_prod_uid47_fpMulTest_cma_ch : signal is true;
    signal sm0_uid128_prod_uid47_fpMulTest_cma_a0 : STD_LOGIC_VECTOR (26 downto 0);
    signal sm0_uid128_prod_uid47_fpMulTest_cma_c0 : STD_LOGIC_VECTOR (26 downto 0);
    signal sm0_uid128_prod_uid47_fpMulTest_cma_s0 : STD_LOGIC_VECTOR (53 downto 0);
    signal sm0_uid128_prod_uid47_fpMulTest_cma_qq : STD_LOGIC_VECTOR (53 downto 0);
    signal sm0_uid128_prod_uid47_fpMulTest_cma_q : STD_LOGIC_VECTOR (53 downto 0);
    signal sm0_uid128_prod_uid47_fpMulTest_cma_ena0 : std_logic;
    signal sm0_uid128_prod_uid47_fpMulTest_cma_ena1 : std_logic;
    signal sm0_uid128_prod_uid47_fpMulTest_cma_ena2 : std_logic;
    signal multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_reset : std_logic;
    signal multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_ah : topProd_uid107_prod_uid47_fpMulTest_cma_ahtype(0 to 1);
    attribute preserve_syn_only of multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_ah : signal is true;
    signal multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_ch : topProd_uid107_prod_uid47_fpMulTest_cma_ahtype(0 to 1);
    attribute preserve_syn_only of multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_ch : signal is true;
    signal multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_a0 : STD_LOGIC_VECTOR (26 downto 0);
    signal multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_c0 : STD_LOGIC_VECTOR (26 downto 0);
    signal multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_a1 : STD_LOGIC_VECTOR (26 downto 0);
    signal multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_c1 : STD_LOGIC_VECTOR (26 downto 0);
    signal multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_s0 : STD_LOGIC_VECTOR (54 downto 0);
    signal multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_s1 : STD_LOGIC_VECTOR (63 downto 0);
    signal multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_qq : STD_LOGIC_VECTOR (54 downto 0);
    signal multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_q : STD_LOGIC_VECTOR (54 downto 0);
    signal multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_ena0 : std_logic;
    signal multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_ena1 : std_logic;
    signal multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_ena2 : std_logic;
    signal add1sumAHighB_uid132_prod_uid47_fpMulTest_UpperBits_for_a_q : STD_LOGIC_VECTOR (26 downto 0);
    signal add1sumAHighB_uid132_prod_uid47_fpMulTest_p1_of_2_a : STD_LOGIC_VECTOR (78 downto 0);
    signal add1sumAHighB_uid132_prod_uid47_fpMulTest_p1_of_2_b : STD_LOGIC_VECTOR (78 downto 0);
    signal add1sumAHighB_uid132_prod_uid47_fpMulTest_p1_of_2_o : STD_LOGIC_VECTOR (78 downto 0);
    signal add1sumAHighB_uid132_prod_uid47_fpMulTest_p1_of_2_c : STD_LOGIC_VECTOR (0 downto 0);
    signal add1sumAHighB_uid132_prod_uid47_fpMulTest_p1_of_2_q : STD_LOGIC_VECTOR (77 downto 0);
    signal add1sumAHighB_uid132_prod_uid47_fpMulTest_p2_of_2_a : STD_LOGIC_VECTOR (5 downto 0);
    signal add1sumAHighB_uid132_prod_uid47_fpMulTest_p2_of_2_b : STD_LOGIC_VECTOR (5 downto 0);
    signal add1sumAHighB_uid132_prod_uid47_fpMulTest_p2_of_2_o : STD_LOGIC_VECTOR (5 downto 0);
    signal add1sumAHighB_uid132_prod_uid47_fpMulTest_p2_of_2_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal add1sumAHighB_uid132_prod_uid47_fpMulTest_p2_of_2_q : STD_LOGIC_VECTOR (3 downto 0);
    signal add1sumAHighB_uid132_prod_uid47_fpMulTest_BitJoin_for_q_q : STD_LOGIC_VECTOR (81 downto 0);
    signal add1sumAHighB_uid132_prod_uid47_fpMulTest_BitSelect_for_a_BitJoin_for_b_q : STD_LOGIC_VECTOR (77 downto 0);
    signal add1sumAHighB_uid132_prod_uid47_fpMulTest_BitSelect_for_b_tessel0_0_b : STD_LOGIC_VECTOR (26 downto 0);
    signal add1sumAHighB_uid132_prod_uid47_fpMulTest_BitSelect_for_b_BitJoin_for_b_q : STD_LOGIC_VECTOR (77 downto 0);
    signal add1sumAHighB_uid132_prod_uid47_fpMulTest_BitSelect_for_b_BitJoin_for_c_q : STD_LOGIC_VECTOR (3 downto 0);
    signal c0_uid137_fracXIsZero_uid17_fpMulTest_merged_bit_select_b : STD_LOGIC_VECTOR (5 downto 0);
    signal c0_uid137_fracXIsZero_uid17_fpMulTest_merged_bit_select_c : STD_LOGIC_VECTOR (5 downto 0);
    signal c0_uid137_fracXIsZero_uid17_fpMulTest_merged_bit_select_d : STD_LOGIC_VECTOR (5 downto 0);
    signal c0_uid137_fracXIsZero_uid17_fpMulTest_merged_bit_select_e : STD_LOGIC_VECTOR (5 downto 0);
    signal c0_uid137_fracXIsZero_uid17_fpMulTest_merged_bit_select_f : STD_LOGIC_VECTOR (5 downto 0);
    signal c0_uid137_fracXIsZero_uid17_fpMulTest_merged_bit_select_g : STD_LOGIC_VECTOR (5 downto 0);
    signal c0_uid137_fracXIsZero_uid17_fpMulTest_merged_bit_select_h : STD_LOGIC_VECTOR (5 downto 0);
    signal c0_uid137_fracXIsZero_uid17_fpMulTest_merged_bit_select_i : STD_LOGIC_VECTOR (5 downto 0);
    signal c0_uid137_fracXIsZero_uid17_fpMulTest_merged_bit_select_j : STD_LOGIC_VECTOR (3 downto 0);
    signal z0_uid136_fracXIsZero_uid17_fpMulTest_merged_bit_select_b : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid136_fracXIsZero_uid17_fpMulTest_merged_bit_select_c : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid136_fracXIsZero_uid17_fpMulTest_merged_bit_select_d : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid136_fracXIsZero_uid17_fpMulTest_merged_bit_select_e : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid136_fracXIsZero_uid17_fpMulTest_merged_bit_select_f : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid136_fracXIsZero_uid17_fpMulTest_merged_bit_select_g : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid136_fracXIsZero_uid17_fpMulTest_merged_bit_select_h : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid136_fracXIsZero_uid17_fpMulTest_merged_bit_select_i : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid136_fracXIsZero_uid17_fpMulTest_merged_bit_select_j : STD_LOGIC_VECTOR (3 downto 0);
    signal z0_uid166_fracXIsZero_uid31_fpMulTest_merged_bit_select_b : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid166_fracXIsZero_uid31_fpMulTest_merged_bit_select_c : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid166_fracXIsZero_uid31_fpMulTest_merged_bit_select_d : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid166_fracXIsZero_uid31_fpMulTest_merged_bit_select_e : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid166_fracXIsZero_uid31_fpMulTest_merged_bit_select_f : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid166_fracXIsZero_uid31_fpMulTest_merged_bit_select_g : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid166_fracXIsZero_uid31_fpMulTest_merged_bit_select_h : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid166_fracXIsZero_uid31_fpMulTest_merged_bit_select_i : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid166_fracXIsZero_uid31_fpMulTest_merged_bit_select_j : STD_LOGIC_VECTOR (3 downto 0);
    signal topRangeX_uid105_prod_uid47_fpMulTest_merged_bit_select_b : STD_LOGIC_VECTOR (26 downto 0);
    signal topRangeX_uid105_prod_uid47_fpMulTest_merged_bit_select_c : STD_LOGIC_VECTOR (25 downto 0);
    signal topRangeY_uid106_prod_uid47_fpMulTest_merged_bit_select_b : STD_LOGIC_VECTOR (26 downto 0);
    signal topRangeY_uid106_prod_uid47_fpMulTest_merged_bit_select_c : STD_LOGIC_VECTOR (25 downto 0);
    signal z0_uid196_stickyRangeComparator_uid59_fpMulTest_merged_bit_select_b : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid196_stickyRangeComparator_uid59_fpMulTest_merged_bit_select_c : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid196_stickyRangeComparator_uid59_fpMulTest_merged_bit_select_d : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid196_stickyRangeComparator_uid59_fpMulTest_merged_bit_select_e : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid196_stickyRangeComparator_uid59_fpMulTest_merged_bit_select_f : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid196_stickyRangeComparator_uid59_fpMulTest_merged_bit_select_g : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid196_stickyRangeComparator_uid59_fpMulTest_merged_bit_select_h : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid196_stickyRangeComparator_uid59_fpMulTest_merged_bit_select_i : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid196_stickyRangeComparator_uid59_fpMulTest_merged_bit_select_j : STD_LOGIC_VECTOR (3 downto 0);
    signal add1sumAHighB_uid132_prod_uid47_fpMulTest_BitSelect_for_b_tessel0_1_merged_bit_select_b : STD_LOGIC_VECTOR (50 downto 0);
    signal add1sumAHighB_uid132_prod_uid47_fpMulTest_BitSelect_for_b_tessel0_1_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal add1sumAHighB_uid132_prod_uid47_fpMulTest_BitSelect_for_a_tessel0_1_merged_bit_select_b : STD_LOGIC_VECTOR (22 downto 0);
    signal add1sumAHighB_uid132_prod_uid47_fpMulTest_BitSelect_for_a_tessel0_1_merged_bit_select_c : STD_LOGIC_VECTOR (3 downto 0);
    signal redist0_add1sumAHighB_uid132_prod_uid47_fpMulTest_BitSelect_for_b_tessel0_1_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist1_topRangeY_uid106_prod_uid47_fpMulTest_merged_bit_select_b_1_q : STD_LOGIC_VECTOR (26 downto 0);
    signal redist2_topRangeX_uid105_prod_uid47_fpMulTest_merged_bit_select_b_1_q : STD_LOGIC_VECTOR (26 downto 0);
    signal redist3_topRangeX_uid105_prod_uid47_fpMulTest_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (25 downto 0);
    signal redist4_add1sumAHighB_uid132_prod_uid47_fpMulTest_BitSelect_for_b_tessel0_0_b_1_q : STD_LOGIC_VECTOR (26 downto 0);
    signal redist5_add1sumAHighB_uid132_prod_uid47_fpMulTest_p1_of_2_q_1_q : STD_LOGIC_VECTOR (77 downto 0);
    signal redist6_multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_q_1_q : STD_LOGIC_VECTOR (54 downto 0);
    signal redist7_topProd_uid107_prod_uid47_fpMulTest_cma_q_1_q : STD_LOGIC_VECTOR (53 downto 0);
    signal redist8_and_lev1_uid195_fracXIsZero_uid31_fpMulTest_q_13_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_and_lev1_uid165_fracXIsZero_uid17_fpMulTest_q_13_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_lowRangeB_uid130_prod_uid47_fpMulTest_b_3_q : STD_LOGIC_VECTOR (26 downto 0);
    signal redist10_lowRangeB_uid130_prod_uid47_fpMulTest_b_3_delay_0 : STD_LOGIC_VECTOR (26 downto 0);
    signal redist10_lowRangeB_uid130_prod_uid47_fpMulTest_b_3_delay_1 : STD_LOGIC_VECTOR (26 downto 0);
    signal redist11_aboveLeftY_mergedSignalTM_uid111_prod_uid47_fpMulTest_q_1_q : STD_LOGIC_VECTOR (26 downto 0);
    signal redist12_expRPreExc_uid72_fpMulTest_b_2_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist12_expRPreExc_uid72_fpMulTest_b_2_delay_0 : STD_LOGIC_VECTOR (10 downto 0);
    signal redist13_expRPreExcExt_uid71_fpMulTest_b_1_q : STD_LOGIC_VECTOR (14 downto 0);
    signal redist14_fracRPreExc_uid70_fpMulTest_b_3_q : STD_LOGIC_VECTOR (51 downto 0);
    signal redist14_fracRPreExc_uid70_fpMulTest_b_3_delay_0 : STD_LOGIC_VECTOR (51 downto 0);
    signal redist14_fracRPreExc_uid70_fpMulTest_b_3_delay_1 : STD_LOGIC_VECTOR (51 downto 0);
    signal redist15_stickyRange_uid54_fpMulTest_b_1_q : STD_LOGIC_VECTOR (50 downto 0);
    signal redist16_fracRPostNorm_uid53_fpMulTest_q_2_q : STD_LOGIC_VECTOR (52 downto 0);
    signal redist17_fracRPostNorm_uid53_fpMulTest_q_3_q : STD_LOGIC_VECTOR (52 downto 0);
    signal redist18_normalizeBit_uid49_fpMulTest_b_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist18_normalizeBit_uid49_fpMulTest_b_3_delay_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal redist18_normalizeBit_uid49_fpMulTest_b_3_delay_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal redist19_signR_uid48_fpMulTest_q_15_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist21_expXIsMax_uid30_fpMulTest_q_14_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist22_excZ_y_uid29_fpMulTest_q_14_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist23_expXIsMax_uid16_fpMulTest_q_14_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist24_excZ_x_uid15_fpMulTest_q_14_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist20_expSum_uid44_fpMulTest_q_12_mem_reset0 : std_logic;
    signal redist20_expSum_uid44_fpMulTest_q_12_mem_ia : STD_LOGIC_VECTOR (11 downto 0);
    signal redist20_expSum_uid44_fpMulTest_q_12_mem_aa : STD_LOGIC_VECTOR (3 downto 0);
    signal redist20_expSum_uid44_fpMulTest_q_12_mem_ab : STD_LOGIC_VECTOR (3 downto 0);
    signal redist20_expSum_uid44_fpMulTest_q_12_mem_iq : STD_LOGIC_VECTOR (11 downto 0);
    signal redist20_expSum_uid44_fpMulTest_q_12_mem_q : STD_LOGIC_VECTOR (11 downto 0);
    signal redist20_expSum_uid44_fpMulTest_q_12_rdcnt_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist20_expSum_uid44_fpMulTest_q_12_rdcnt_i : UNSIGNED (3 downto 0);
    attribute preserve_syn_only of redist20_expSum_uid44_fpMulTest_q_12_rdcnt_i : signal is true;
    signal redist20_expSum_uid44_fpMulTest_q_12_rdcnt_eq : std_logic;
    attribute preserve_syn_only of redist20_expSum_uid44_fpMulTest_q_12_rdcnt_eq : signal is true;
    signal redist20_expSum_uid44_fpMulTest_q_12_wraddr_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist20_expSum_uid44_fpMulTest_q_12_mem_last_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist20_expSum_uid44_fpMulTest_q_12_cmp_b : STD_LOGIC_VECTOR (4 downto 0);
    signal redist20_expSum_uid44_fpMulTest_q_12_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist20_expSum_uid44_fpMulTest_q_12_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist20_expSum_uid44_fpMulTest_q_12_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist20_expSum_uid44_fpMulTest_q_12_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist20_expSum_uid44_fpMulTest_q_12_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist20_expSum_uid44_fpMulTest_q_12_sticky_ena_q : signal is true;
    signal redist20_expSum_uid44_fpMulTest_q_12_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- cstZeroWF_uid11_fpMulTest(CONSTANT,10)
    cstZeroWF_uid11_fpMulTest_q <= "0000000000000000000000000000000000000000000000000000";

    -- c0_uid137_fracXIsZero_uid17_fpMulTest_merged_bit_select(BITSELECT,248)
    c0_uid137_fracXIsZero_uid17_fpMulTest_merged_bit_select_b <= cstZeroWF_uid11_fpMulTest_q(5 downto 0);
    c0_uid137_fracXIsZero_uid17_fpMulTest_merged_bit_select_c <= cstZeroWF_uid11_fpMulTest_q(11 downto 6);
    c0_uid137_fracXIsZero_uid17_fpMulTest_merged_bit_select_d <= cstZeroWF_uid11_fpMulTest_q(17 downto 12);
    c0_uid137_fracXIsZero_uid17_fpMulTest_merged_bit_select_e <= cstZeroWF_uid11_fpMulTest_q(23 downto 18);
    c0_uid137_fracXIsZero_uid17_fpMulTest_merged_bit_select_f <= cstZeroWF_uid11_fpMulTest_q(29 downto 24);
    c0_uid137_fracXIsZero_uid17_fpMulTest_merged_bit_select_g <= cstZeroWF_uid11_fpMulTest_q(35 downto 30);
    c0_uid137_fracXIsZero_uid17_fpMulTest_merged_bit_select_h <= cstZeroWF_uid11_fpMulTest_q(41 downto 36);
    c0_uid137_fracXIsZero_uid17_fpMulTest_merged_bit_select_i <= cstZeroWF_uid11_fpMulTest_q(47 downto 42);
    c0_uid137_fracXIsZero_uid17_fpMulTest_merged_bit_select_j <= cstZeroWF_uid11_fpMulTest_q(51 downto 48);

    -- frac_x_uid14_fpMulTest(BITSELECT,13)@0
    frac_x_uid14_fpMulTest_b <= a(51 downto 0);

    -- z0_uid136_fracXIsZero_uid17_fpMulTest_merged_bit_select(BITSELECT,249)@0
    z0_uid136_fracXIsZero_uid17_fpMulTest_merged_bit_select_b <= frac_x_uid14_fpMulTest_b(5 downto 0);
    z0_uid136_fracXIsZero_uid17_fpMulTest_merged_bit_select_c <= frac_x_uid14_fpMulTest_b(11 downto 6);
    z0_uid136_fracXIsZero_uid17_fpMulTest_merged_bit_select_d <= frac_x_uid14_fpMulTest_b(17 downto 12);
    z0_uid136_fracXIsZero_uid17_fpMulTest_merged_bit_select_e <= frac_x_uid14_fpMulTest_b(23 downto 18);
    z0_uid136_fracXIsZero_uid17_fpMulTest_merged_bit_select_f <= frac_x_uid14_fpMulTest_b(29 downto 24);
    z0_uid136_fracXIsZero_uid17_fpMulTest_merged_bit_select_g <= frac_x_uid14_fpMulTest_b(35 downto 30);
    z0_uid136_fracXIsZero_uid17_fpMulTest_merged_bit_select_h <= frac_x_uid14_fpMulTest_b(41 downto 36);
    z0_uid136_fracXIsZero_uid17_fpMulTest_merged_bit_select_i <= frac_x_uid14_fpMulTest_b(47 downto 42);
    z0_uid136_fracXIsZero_uid17_fpMulTest_merged_bit_select_j <= frac_x_uid14_fpMulTest_b(51 downto 48);

    -- eq8_uid162_fracXIsZero_uid17_fpMulTest(LOGICAL,161)@0
    eq8_uid162_fracXIsZero_uid17_fpMulTest_q <= "1" WHEN z0_uid136_fracXIsZero_uid17_fpMulTest_merged_bit_select_j = c0_uid137_fracXIsZero_uid17_fpMulTest_merged_bit_select_j ELSE "0";

    -- eq7_uid159_fracXIsZero_uid17_fpMulTest(LOGICAL,158)@0
    eq7_uid159_fracXIsZero_uid17_fpMulTest_q <= "1" WHEN z0_uid136_fracXIsZero_uid17_fpMulTest_merged_bit_select_i = c0_uid137_fracXIsZero_uid17_fpMulTest_merged_bit_select_i ELSE "0";

    -- eq6_uid156_fracXIsZero_uid17_fpMulTest(LOGICAL,155)@0
    eq6_uid156_fracXIsZero_uid17_fpMulTest_q <= "1" WHEN z0_uid136_fracXIsZero_uid17_fpMulTest_merged_bit_select_h = c0_uid137_fracXIsZero_uid17_fpMulTest_merged_bit_select_h ELSE "0";

    -- and_lev0_uid164_fracXIsZero_uid17_fpMulTest(LOGICAL,163)@0 + 1
    and_lev0_uid164_fracXIsZero_uid17_fpMulTest_qi <= eq6_uid156_fracXIsZero_uid17_fpMulTest_q and eq7_uid159_fracXIsZero_uid17_fpMulTest_q and eq8_uid162_fracXIsZero_uid17_fpMulTest_q;
    and_lev0_uid164_fracXIsZero_uid17_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => and_lev0_uid164_fracXIsZero_uid17_fpMulTest_qi, xout => and_lev0_uid164_fracXIsZero_uid17_fpMulTest_q, clk => clk, aclr => areset, ena => '1' );

    -- eq5_uid153_fracXIsZero_uid17_fpMulTest(LOGICAL,152)@0
    eq5_uid153_fracXIsZero_uid17_fpMulTest_q <= "1" WHEN z0_uid136_fracXIsZero_uid17_fpMulTest_merged_bit_select_g = c0_uid137_fracXIsZero_uid17_fpMulTest_merged_bit_select_g ELSE "0";

    -- eq4_uid150_fracXIsZero_uid17_fpMulTest(LOGICAL,149)@0
    eq4_uid150_fracXIsZero_uid17_fpMulTest_q <= "1" WHEN z0_uid136_fracXIsZero_uid17_fpMulTest_merged_bit_select_f = c0_uid137_fracXIsZero_uid17_fpMulTest_merged_bit_select_f ELSE "0";

    -- eq3_uid147_fracXIsZero_uid17_fpMulTest(LOGICAL,146)@0
    eq3_uid147_fracXIsZero_uid17_fpMulTest_q <= "1" WHEN z0_uid136_fracXIsZero_uid17_fpMulTest_merged_bit_select_e = c0_uid137_fracXIsZero_uid17_fpMulTest_merged_bit_select_e ELSE "0";

    -- eq2_uid144_fracXIsZero_uid17_fpMulTest(LOGICAL,143)@0
    eq2_uid144_fracXIsZero_uid17_fpMulTest_q <= "1" WHEN z0_uid136_fracXIsZero_uid17_fpMulTest_merged_bit_select_d = c0_uid137_fracXIsZero_uid17_fpMulTest_merged_bit_select_d ELSE "0";

    -- eq1_uid141_fracXIsZero_uid17_fpMulTest(LOGICAL,140)@0
    eq1_uid141_fracXIsZero_uid17_fpMulTest_q <= "1" WHEN z0_uid136_fracXIsZero_uid17_fpMulTest_merged_bit_select_c = c0_uid137_fracXIsZero_uid17_fpMulTest_merged_bit_select_c ELSE "0";

    -- eq0_uid138_fracXIsZero_uid17_fpMulTest(LOGICAL,137)@0
    eq0_uid138_fracXIsZero_uid17_fpMulTest_q <= "1" WHEN z0_uid136_fracXIsZero_uid17_fpMulTest_merged_bit_select_b = c0_uid137_fracXIsZero_uid17_fpMulTest_merged_bit_select_b ELSE "0";

    -- and_lev0_uid163_fracXIsZero_uid17_fpMulTest(LOGICAL,162)@0 + 1
    and_lev0_uid163_fracXIsZero_uid17_fpMulTest_qi <= eq0_uid138_fracXIsZero_uid17_fpMulTest_q and eq1_uid141_fracXIsZero_uid17_fpMulTest_q and eq2_uid144_fracXIsZero_uid17_fpMulTest_q and eq3_uid147_fracXIsZero_uid17_fpMulTest_q and eq4_uid150_fracXIsZero_uid17_fpMulTest_q and eq5_uid153_fracXIsZero_uid17_fpMulTest_q;
    and_lev0_uid163_fracXIsZero_uid17_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => and_lev0_uid163_fracXIsZero_uid17_fpMulTest_qi, xout => and_lev0_uid163_fracXIsZero_uid17_fpMulTest_q, clk => clk, aclr => areset, ena => '1' );

    -- and_lev1_uid165_fracXIsZero_uid17_fpMulTest(LOGICAL,164)@1 + 1
    and_lev1_uid165_fracXIsZero_uid17_fpMulTest_qi <= and_lev0_uid163_fracXIsZero_uid17_fpMulTest_q and and_lev0_uid164_fracXIsZero_uid17_fpMulTest_q;
    and_lev1_uid165_fracXIsZero_uid17_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => and_lev1_uid165_fracXIsZero_uid17_fpMulTest_qi, xout => and_lev1_uid165_fracXIsZero_uid17_fpMulTest_q, clk => clk, aclr => areset, ena => '1' );

    -- redist9_and_lev1_uid165_fracXIsZero_uid17_fpMulTest_q_13(DELAY,265)
    redist9_and_lev1_uid165_fracXIsZero_uid17_fpMulTest_q_13 : dspba_delay
    GENERIC MAP ( width => 1, depth => 12, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => and_lev1_uid165_fracXIsZero_uid17_fpMulTest_q, xout => redist9_and_lev1_uid165_fracXIsZero_uid17_fpMulTest_q_13_q, clk => clk, aclr => areset, ena => '1' );

    -- cstAllOWE_uid10_fpMulTest(CONSTANT,9)
    cstAllOWE_uid10_fpMulTest_q <= "11111111111";

    -- expX_uid6_fpMulTest(BITSELECT,5)@0
    expX_uid6_fpMulTest_b <= a(62 downto 52);

    -- expXIsMax_uid16_fpMulTest(LOGICAL,15)@0 + 1
    expXIsMax_uid16_fpMulTest_qi <= "1" WHEN expX_uid6_fpMulTest_b = cstAllOWE_uid10_fpMulTest_q ELSE "0";
    expXIsMax_uid16_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => expXIsMax_uid16_fpMulTest_qi, xout => expXIsMax_uid16_fpMulTest_q, clk => clk, aclr => areset, ena => '1' );

    -- redist23_expXIsMax_uid16_fpMulTest_q_14(DELAY,279)
    redist23_expXIsMax_uid16_fpMulTest_q_14 : dspba_delay
    GENERIC MAP ( width => 1, depth => 13, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => expXIsMax_uid16_fpMulTest_q, xout => redist23_expXIsMax_uid16_fpMulTest_q_14_q, clk => clk, aclr => areset, ena => '1' );

    -- excI_x_uid19_fpMulTest(LOGICAL,18)@14
    excI_x_uid19_fpMulTest_q <= redist23_expXIsMax_uid16_fpMulTest_q_14_q and redist9_and_lev1_uid165_fracXIsZero_uid17_fpMulTest_q_13_q;

    -- cstAllZWE_uid12_fpMulTest(CONSTANT,11)
    cstAllZWE_uid12_fpMulTest_q <= "00000000000";

    -- expY_uid7_fpMulTest(BITSELECT,6)@0
    expY_uid7_fpMulTest_b <= b(62 downto 52);

    -- excZ_y_uid29_fpMulTest(LOGICAL,28)@0 + 1
    excZ_y_uid29_fpMulTest_qi <= "1" WHEN expY_uid7_fpMulTest_b = cstAllZWE_uid12_fpMulTest_q ELSE "0";
    excZ_y_uid29_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => excZ_y_uid29_fpMulTest_qi, xout => excZ_y_uid29_fpMulTest_q, clk => clk, aclr => areset, ena => '1' );

    -- redist22_excZ_y_uid29_fpMulTest_q_14(DELAY,278)
    redist22_excZ_y_uid29_fpMulTest_q_14 : dspba_delay
    GENERIC MAP ( width => 1, depth => 13, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => excZ_y_uid29_fpMulTest_q, xout => redist22_excZ_y_uid29_fpMulTest_q_14_q, clk => clk, aclr => areset, ena => '1' );

    -- excYZAndExcXI_uid86_fpMulTest(LOGICAL,85)@14
    excYZAndExcXI_uid86_fpMulTest_q <= redist22_excZ_y_uid29_fpMulTest_q_14_q and excI_x_uid19_fpMulTest_q;

    -- frac_y_uid28_fpMulTest(BITSELECT,27)@0
    frac_y_uid28_fpMulTest_b <= b(51 downto 0);

    -- z0_uid166_fracXIsZero_uid31_fpMulTest_merged_bit_select(BITSELECT,250)@0
    z0_uid166_fracXIsZero_uid31_fpMulTest_merged_bit_select_b <= frac_y_uid28_fpMulTest_b(5 downto 0);
    z0_uid166_fracXIsZero_uid31_fpMulTest_merged_bit_select_c <= frac_y_uid28_fpMulTest_b(11 downto 6);
    z0_uid166_fracXIsZero_uid31_fpMulTest_merged_bit_select_d <= frac_y_uid28_fpMulTest_b(17 downto 12);
    z0_uid166_fracXIsZero_uid31_fpMulTest_merged_bit_select_e <= frac_y_uid28_fpMulTest_b(23 downto 18);
    z0_uid166_fracXIsZero_uid31_fpMulTest_merged_bit_select_f <= frac_y_uid28_fpMulTest_b(29 downto 24);
    z0_uid166_fracXIsZero_uid31_fpMulTest_merged_bit_select_g <= frac_y_uid28_fpMulTest_b(35 downto 30);
    z0_uid166_fracXIsZero_uid31_fpMulTest_merged_bit_select_h <= frac_y_uid28_fpMulTest_b(41 downto 36);
    z0_uid166_fracXIsZero_uid31_fpMulTest_merged_bit_select_i <= frac_y_uid28_fpMulTest_b(47 downto 42);
    z0_uid166_fracXIsZero_uid31_fpMulTest_merged_bit_select_j <= frac_y_uid28_fpMulTest_b(51 downto 48);

    -- eq8_uid192_fracXIsZero_uid31_fpMulTest(LOGICAL,191)@0
    eq8_uid192_fracXIsZero_uid31_fpMulTest_q <= "1" WHEN z0_uid166_fracXIsZero_uid31_fpMulTest_merged_bit_select_j = c0_uid137_fracXIsZero_uid17_fpMulTest_merged_bit_select_j ELSE "0";

    -- eq7_uid189_fracXIsZero_uid31_fpMulTest(LOGICAL,188)@0
    eq7_uid189_fracXIsZero_uid31_fpMulTest_q <= "1" WHEN z0_uid166_fracXIsZero_uid31_fpMulTest_merged_bit_select_i = c0_uid137_fracXIsZero_uid17_fpMulTest_merged_bit_select_i ELSE "0";

    -- eq6_uid186_fracXIsZero_uid31_fpMulTest(LOGICAL,185)@0
    eq6_uid186_fracXIsZero_uid31_fpMulTest_q <= "1" WHEN z0_uid166_fracXIsZero_uid31_fpMulTest_merged_bit_select_h = c0_uid137_fracXIsZero_uid17_fpMulTest_merged_bit_select_h ELSE "0";

    -- and_lev0_uid194_fracXIsZero_uid31_fpMulTest(LOGICAL,193)@0 + 1
    and_lev0_uid194_fracXIsZero_uid31_fpMulTest_qi <= eq6_uid186_fracXIsZero_uid31_fpMulTest_q and eq7_uid189_fracXIsZero_uid31_fpMulTest_q and eq8_uid192_fracXIsZero_uid31_fpMulTest_q;
    and_lev0_uid194_fracXIsZero_uid31_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => and_lev0_uid194_fracXIsZero_uid31_fpMulTest_qi, xout => and_lev0_uid194_fracXIsZero_uid31_fpMulTest_q, clk => clk, aclr => areset, ena => '1' );

    -- eq5_uid183_fracXIsZero_uid31_fpMulTest(LOGICAL,182)@0
    eq5_uid183_fracXIsZero_uid31_fpMulTest_q <= "1" WHEN z0_uid166_fracXIsZero_uid31_fpMulTest_merged_bit_select_g = c0_uid137_fracXIsZero_uid17_fpMulTest_merged_bit_select_g ELSE "0";

    -- eq4_uid180_fracXIsZero_uid31_fpMulTest(LOGICAL,179)@0
    eq4_uid180_fracXIsZero_uid31_fpMulTest_q <= "1" WHEN z0_uid166_fracXIsZero_uid31_fpMulTest_merged_bit_select_f = c0_uid137_fracXIsZero_uid17_fpMulTest_merged_bit_select_f ELSE "0";

    -- eq3_uid177_fracXIsZero_uid31_fpMulTest(LOGICAL,176)@0
    eq3_uid177_fracXIsZero_uid31_fpMulTest_q <= "1" WHEN z0_uid166_fracXIsZero_uid31_fpMulTest_merged_bit_select_e = c0_uid137_fracXIsZero_uid17_fpMulTest_merged_bit_select_e ELSE "0";

    -- eq2_uid174_fracXIsZero_uid31_fpMulTest(LOGICAL,173)@0
    eq2_uid174_fracXIsZero_uid31_fpMulTest_q <= "1" WHEN z0_uid166_fracXIsZero_uid31_fpMulTest_merged_bit_select_d = c0_uid137_fracXIsZero_uid17_fpMulTest_merged_bit_select_d ELSE "0";

    -- eq1_uid171_fracXIsZero_uid31_fpMulTest(LOGICAL,170)@0
    eq1_uid171_fracXIsZero_uid31_fpMulTest_q <= "1" WHEN z0_uid166_fracXIsZero_uid31_fpMulTest_merged_bit_select_c = c0_uid137_fracXIsZero_uid17_fpMulTest_merged_bit_select_c ELSE "0";

    -- eq0_uid168_fracXIsZero_uid31_fpMulTest(LOGICAL,167)@0
    eq0_uid168_fracXIsZero_uid31_fpMulTest_q <= "1" WHEN z0_uid166_fracXIsZero_uid31_fpMulTest_merged_bit_select_b = c0_uid137_fracXIsZero_uid17_fpMulTest_merged_bit_select_b ELSE "0";

    -- and_lev0_uid193_fracXIsZero_uid31_fpMulTest(LOGICAL,192)@0 + 1
    and_lev0_uid193_fracXIsZero_uid31_fpMulTest_qi <= eq0_uid168_fracXIsZero_uid31_fpMulTest_q and eq1_uid171_fracXIsZero_uid31_fpMulTest_q and eq2_uid174_fracXIsZero_uid31_fpMulTest_q and eq3_uid177_fracXIsZero_uid31_fpMulTest_q and eq4_uid180_fracXIsZero_uid31_fpMulTest_q and eq5_uid183_fracXIsZero_uid31_fpMulTest_q;
    and_lev0_uid193_fracXIsZero_uid31_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => and_lev0_uid193_fracXIsZero_uid31_fpMulTest_qi, xout => and_lev0_uid193_fracXIsZero_uid31_fpMulTest_q, clk => clk, aclr => areset, ena => '1' );

    -- and_lev1_uid195_fracXIsZero_uid31_fpMulTest(LOGICAL,194)@1 + 1
    and_lev1_uid195_fracXIsZero_uid31_fpMulTest_qi <= and_lev0_uid193_fracXIsZero_uid31_fpMulTest_q and and_lev0_uid194_fracXIsZero_uid31_fpMulTest_q;
    and_lev1_uid195_fracXIsZero_uid31_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => and_lev1_uid195_fracXIsZero_uid31_fpMulTest_qi, xout => and_lev1_uid195_fracXIsZero_uid31_fpMulTest_q, clk => clk, aclr => areset, ena => '1' );

    -- redist8_and_lev1_uid195_fracXIsZero_uid31_fpMulTest_q_13(DELAY,264)
    redist8_and_lev1_uid195_fracXIsZero_uid31_fpMulTest_q_13 : dspba_delay
    GENERIC MAP ( width => 1, depth => 12, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => and_lev1_uid195_fracXIsZero_uid31_fpMulTest_q, xout => redist8_and_lev1_uid195_fracXIsZero_uid31_fpMulTest_q_13_q, clk => clk, aclr => areset, ena => '1' );

    -- expXIsMax_uid30_fpMulTest(LOGICAL,29)@0 + 1
    expXIsMax_uid30_fpMulTest_qi <= "1" WHEN expY_uid7_fpMulTest_b = cstAllOWE_uid10_fpMulTest_q ELSE "0";
    expXIsMax_uid30_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => expXIsMax_uid30_fpMulTest_qi, xout => expXIsMax_uid30_fpMulTest_q, clk => clk, aclr => areset, ena => '1' );

    -- redist21_expXIsMax_uid30_fpMulTest_q_14(DELAY,277)
    redist21_expXIsMax_uid30_fpMulTest_q_14 : dspba_delay
    GENERIC MAP ( width => 1, depth => 13, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => expXIsMax_uid30_fpMulTest_q, xout => redist21_expXIsMax_uid30_fpMulTest_q_14_q, clk => clk, aclr => areset, ena => '1' );

    -- excI_y_uid33_fpMulTest(LOGICAL,32)@14
    excI_y_uid33_fpMulTest_q <= redist21_expXIsMax_uid30_fpMulTest_q_14_q and redist8_and_lev1_uid195_fracXIsZero_uid31_fpMulTest_q_13_q;

    -- excZ_x_uid15_fpMulTest(LOGICAL,14)@0 + 1
    excZ_x_uid15_fpMulTest_qi <= "1" WHEN expX_uid6_fpMulTest_b = cstAllZWE_uid12_fpMulTest_q ELSE "0";
    excZ_x_uid15_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => excZ_x_uid15_fpMulTest_qi, xout => excZ_x_uid15_fpMulTest_q, clk => clk, aclr => areset, ena => '1' );

    -- redist24_excZ_x_uid15_fpMulTest_q_14(DELAY,280)
    redist24_excZ_x_uid15_fpMulTest_q_14 : dspba_delay
    GENERIC MAP ( width => 1, depth => 13, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => excZ_x_uid15_fpMulTest_q, xout => redist24_excZ_x_uid15_fpMulTest_q_14_q, clk => clk, aclr => areset, ena => '1' );

    -- excXZAndExcYI_uid87_fpMulTest(LOGICAL,86)@14
    excXZAndExcYI_uid87_fpMulTest_q <= redist24_excZ_x_uid15_fpMulTest_q_14_q and excI_y_uid33_fpMulTest_q;

    -- ZeroTimesInf_uid88_fpMulTest(LOGICAL,87)@14 + 1
    ZeroTimesInf_uid88_fpMulTest_qi <= excXZAndExcYI_uid87_fpMulTest_q or excYZAndExcXI_uid86_fpMulTest_q;
    ZeroTimesInf_uid88_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => ZeroTimesInf_uid88_fpMulTest_qi, xout => ZeroTimesInf_uid88_fpMulTest_q, clk => clk, aclr => areset, ena => '1' );

    -- fracXIsNotZero_uid32_fpMulTest(LOGICAL,31)@14
    fracXIsNotZero_uid32_fpMulTest_q <= not (redist8_and_lev1_uid195_fracXIsZero_uid31_fpMulTest_q_13_q);

    -- excN_y_uid34_fpMulTest(LOGICAL,33)@14 + 1
    excN_y_uid34_fpMulTest_qi <= redist21_expXIsMax_uid30_fpMulTest_q_14_q and fracXIsNotZero_uid32_fpMulTest_q;
    excN_y_uid34_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => excN_y_uid34_fpMulTest_qi, xout => excN_y_uid34_fpMulTest_q, clk => clk, aclr => areset, ena => '1' );

    -- fracXIsNotZero_uid18_fpMulTest(LOGICAL,17)@14
    fracXIsNotZero_uid18_fpMulTest_q <= not (redist9_and_lev1_uid165_fracXIsZero_uid17_fpMulTest_q_13_q);

    -- excN_x_uid20_fpMulTest(LOGICAL,19)@14 + 1
    excN_x_uid20_fpMulTest_qi <= redist23_expXIsMax_uid16_fpMulTest_q_14_q and fracXIsNotZero_uid18_fpMulTest_q;
    excN_x_uid20_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => excN_x_uid20_fpMulTest_qi, xout => excN_x_uid20_fpMulTest_q, clk => clk, aclr => areset, ena => '1' );

    -- excRNaN_uid89_fpMulTest(LOGICAL,88)@15
    excRNaN_uid89_fpMulTest_q <= excN_x_uid20_fpMulTest_q or excN_y_uid34_fpMulTest_q or ZeroTimesInf_uid88_fpMulTest_q;

    -- invExcRNaN_uid101_fpMulTest(LOGICAL,100)@15
    invExcRNaN_uid101_fpMulTest_q <= not (excRNaN_uid89_fpMulTest_q);

    -- signY_uid9_fpMulTest(BITSELECT,8)@0
    signY_uid9_fpMulTest_b <= STD_LOGIC_VECTOR(b(63 downto 63));

    -- signX_uid8_fpMulTest(BITSELECT,7)@0
    signX_uid8_fpMulTest_b <= STD_LOGIC_VECTOR(a(63 downto 63));

    -- signR_uid48_fpMulTest(LOGICAL,47)@0 + 1
    signR_uid48_fpMulTest_qi <= signX_uid8_fpMulTest_b xor signY_uid9_fpMulTest_b;
    signR_uid48_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => signR_uid48_fpMulTest_qi, xout => signR_uid48_fpMulTest_q, clk => clk, aclr => areset, ena => '1' );

    -- redist19_signR_uid48_fpMulTest_q_15(DELAY,275)
    redist19_signR_uid48_fpMulTest_q_15 : dspba_delay
    GENERIC MAP ( width => 1, depth => 14, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => signR_uid48_fpMulTest_q, xout => redist19_signR_uid48_fpMulTest_q_15_q, clk => clk, aclr => areset, ena => '1' );

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- signRPostExc_uid102_fpMulTest(LOGICAL,101)@15 + 1
    signRPostExc_uid102_fpMulTest_qi <= redist19_signR_uid48_fpMulTest_q_15_q and invExcRNaN_uid101_fpMulTest_q;
    signRPostExc_uid102_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => signRPostExc_uid102_fpMulTest_qi, xout => signRPostExc_uid102_fpMulTest_q, clk => clk, aclr => areset, ena => '1' );

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- ofracY_uid43_fpMulTest(BITJOIN,42)@0
    ofracY_uid43_fpMulTest_q <= VCC_q & frac_y_uid28_fpMulTest_b;

    -- topRangeY_uid106_prod_uid47_fpMulTest_merged_bit_select(BITSELECT,252)@0
    topRangeY_uid106_prod_uid47_fpMulTest_merged_bit_select_b <= ofracY_uid43_fpMulTest_q(52 downto 26);
    topRangeY_uid106_prod_uid47_fpMulTest_merged_bit_select_c <= ofracY_uid43_fpMulTest_q(25 downto 0);

    -- redist1_topRangeY_uid106_prod_uid47_fpMulTest_merged_bit_select_b_1(DELAY,257)
    redist1_topRangeY_uid106_prod_uid47_fpMulTest_merged_bit_select_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist1_topRangeY_uid106_prod_uid47_fpMulTest_merged_bit_select_b_1_q <= (others => '0');
            ELSE
                redist1_topRangeY_uid106_prod_uid47_fpMulTest_merged_bit_select_b_1_q <= STD_LOGIC_VECTOR(topRangeY_uid106_prod_uid47_fpMulTest_merged_bit_select_b);
            END IF;
        END IF;
    END PROCESS;

    -- ofracX_uid40_fpMulTest(BITJOIN,39)@0
    ofracX_uid40_fpMulTest_q <= VCC_q & frac_x_uid14_fpMulTest_b;

    -- topRangeX_uid105_prod_uid47_fpMulTest_merged_bit_select(BITSELECT,251)@0
    topRangeX_uid105_prod_uid47_fpMulTest_merged_bit_select_b <= ofracX_uid40_fpMulTest_q(52 downto 26);
    topRangeX_uid105_prod_uid47_fpMulTest_merged_bit_select_c <= ofracX_uid40_fpMulTest_q(25 downto 0);

    -- redist2_topRangeX_uid105_prod_uid47_fpMulTest_merged_bit_select_b_1(DELAY,258)
    redist2_topRangeX_uid105_prod_uid47_fpMulTest_merged_bit_select_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist2_topRangeX_uid105_prod_uid47_fpMulTest_merged_bit_select_b_1_q <= (others => '0');
            ELSE
                redist2_topRangeX_uid105_prod_uid47_fpMulTest_merged_bit_select_b_1_q <= STD_LOGIC_VECTOR(topRangeX_uid105_prod_uid47_fpMulTest_merged_bit_select_b);
            END IF;
        END IF;
    END PROCESS;

    -- topProd_uid107_prod_uid47_fpMulTest_cma(CHAINMULTADD,225)@1 + 5
    -- out q@7
    topProd_uid107_prod_uid47_fpMulTest_cma_reset <= areset;
    topProd_uid107_prod_uid47_fpMulTest_cma_ena0 <= '1';
    topProd_uid107_prod_uid47_fpMulTest_cma_ena1 <= topProd_uid107_prod_uid47_fpMulTest_cma_ena0;
    topProd_uid107_prod_uid47_fpMulTest_cma_ena2 <= topProd_uid107_prod_uid47_fpMulTest_cma_ena0;
    topProd_uid107_prod_uid47_fpMulTest_cma_chainmultadd_hyper: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (false) THEN
            ELSE
                topProd_uid107_prod_uid47_fpMulTest_cma_ah(0) <= RESIZE(UNSIGNED(redist2_topRangeX_uid105_prod_uid47_fpMulTest_merged_bit_select_b_1_q),27);
                topProd_uid107_prod_uid47_fpMulTest_cma_ch(0) <= RESIZE(UNSIGNED(redist1_topRangeY_uid106_prod_uid47_fpMulTest_merged_bit_select_b_1_q),27);
            END IF;
        END IF;
    END PROCESS;

    topProd_uid107_prod_uid47_fpMulTest_cma_a0 <= STD_LOGIC_VECTOR(topProd_uid107_prod_uid47_fpMulTest_cma_ah(0));
    topProd_uid107_prod_uid47_fpMulTest_cma_c0 <= STD_LOGIC_VECTOR(topProd_uid107_prod_uid47_fpMulTest_cma_ch(0));
    topProd_uid107_prod_uid47_fpMulTest_cma_DSP0 : fourteennm_mac
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
        ena(0) => topProd_uid107_prod_uid47_fpMulTest_cma_ena0,
        ena(1) => topProd_uid107_prod_uid47_fpMulTest_cma_ena1,
        ena(2) => topProd_uid107_prod_uid47_fpMulTest_cma_ena2,
        clr(0) => topProd_uid107_prod_uid47_fpMulTest_cma_reset,
        clr(1) => topProd_uid107_prod_uid47_fpMulTest_cma_reset,
        ay => topProd_uid107_prod_uid47_fpMulTest_cma_a0,
        ax => topProd_uid107_prod_uid47_fpMulTest_cma_c0,
        resulta => topProd_uid107_prod_uid47_fpMulTest_cma_s0
    );
    topProd_uid107_prod_uid47_fpMulTest_cma_delay : dspba_delay
    GENERIC MAP ( width => 54, depth => 1, reset_kind => "NONE", phase => 0, modulus => 1 )
    PORT MAP ( xin => topProd_uid107_prod_uid47_fpMulTest_cma_s0, xout => topProd_uid107_prod_uid47_fpMulTest_cma_qq, clk => clk, aclr => areset, ena => '1' );
    topProd_uid107_prod_uid47_fpMulTest_cma_q <= STD_LOGIC_VECTOR(topProd_uid107_prod_uid47_fpMulTest_cma_qq(53 downto 0));

    -- redist7_topProd_uid107_prod_uid47_fpMulTest_cma_q_1(DELAY,263)
    redist7_topProd_uid107_prod_uid47_fpMulTest_cma_q_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist7_topProd_uid107_prod_uid47_fpMulTest_cma_q_1_q <= (others => '0');
            ELSE
                redist7_topProd_uid107_prod_uid47_fpMulTest_cma_q_1_q <= STD_LOGIC_VECTOR(topProd_uid107_prod_uid47_fpMulTest_cma_q);
            END IF;
        END IF;
    END PROCESS;

    -- add1sumAHighB_uid132_prod_uid47_fpMulTest_BitSelect_for_b_tessel0_1_merged_bit_select(BITSELECT,254)@8
    add1sumAHighB_uid132_prod_uid47_fpMulTest_BitSelect_for_b_tessel0_1_merged_bit_select_b <= STD_LOGIC_VECTOR(redist7_topProd_uid107_prod_uid47_fpMulTest_cma_q_1_q(50 downto 0));
    add1sumAHighB_uid132_prod_uid47_fpMulTest_BitSelect_for_b_tessel0_1_merged_bit_select_c <= STD_LOGIC_VECTOR(redist7_topProd_uid107_prod_uid47_fpMulTest_cma_q_1_q(53 downto 51));

    -- aboveLeftY_mergedSignalTM_uid111_prod_uid47_fpMulTest(BITJOIN,110)@0
    aboveLeftY_mergedSignalTM_uid111_prod_uid47_fpMulTest_q <= topRangeY_uid106_prod_uid47_fpMulTest_merged_bit_select_c & GND_q;

    -- redist11_aboveLeftY_mergedSignalTM_uid111_prod_uid47_fpMulTest_q_1(DELAY,267)
    redist11_aboveLeftY_mergedSignalTM_uid111_prod_uid47_fpMulTest_q_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist11_aboveLeftY_mergedSignalTM_uid111_prod_uid47_fpMulTest_q_1_q <= (others => '0');
            ELSE
                redist11_aboveLeftY_mergedSignalTM_uid111_prod_uid47_fpMulTest_q_1_q <= STD_LOGIC_VECTOR(aboveLeftY_mergedSignalTM_uid111_prod_uid47_fpMulTest_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist3_topRangeX_uid105_prod_uid47_fpMulTest_merged_bit_select_c_1(DELAY,259)
    redist3_topRangeX_uid105_prod_uid47_fpMulTest_merged_bit_select_c_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist3_topRangeX_uid105_prod_uid47_fpMulTest_merged_bit_select_c_1_q <= (others => '0');
            ELSE
                redist3_topRangeX_uid105_prod_uid47_fpMulTest_merged_bit_select_c_1_q <= STD_LOGIC_VECTOR(topRangeX_uid105_prod_uid47_fpMulTest_merged_bit_select_c);
            END IF;
        END IF;
    END PROCESS;

    -- rightBottomX_mergedSignalTM_uid115_prod_uid47_fpMulTest(BITJOIN,114)@1
    rightBottomX_mergedSignalTM_uid115_prod_uid47_fpMulTest_q <= redist3_topRangeX_uid105_prod_uid47_fpMulTest_merged_bit_select_c_1_q & GND_q;

    -- sm0_uid128_prod_uid47_fpMulTest_cma(CHAINMULTADD,226)@1 + 5
    -- out q@7
    sm0_uid128_prod_uid47_fpMulTest_cma_reset <= areset;
    sm0_uid128_prod_uid47_fpMulTest_cma_ena0 <= '1';
    sm0_uid128_prod_uid47_fpMulTest_cma_ena1 <= sm0_uid128_prod_uid47_fpMulTest_cma_ena0;
    sm0_uid128_prod_uid47_fpMulTest_cma_ena2 <= sm0_uid128_prod_uid47_fpMulTest_cma_ena0;
    sm0_uid128_prod_uid47_fpMulTest_cma_chainmultadd_hyper: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (false) THEN
            ELSE
                sm0_uid128_prod_uid47_fpMulTest_cma_ah(0) <= RESIZE(UNSIGNED(rightBottomX_mergedSignalTM_uid115_prod_uid47_fpMulTest_q),27);
                sm0_uid128_prod_uid47_fpMulTest_cma_ch(0) <= RESIZE(UNSIGNED(redist11_aboveLeftY_mergedSignalTM_uid111_prod_uid47_fpMulTest_q_1_q),27);
            END IF;
        END IF;
    END PROCESS;

    sm0_uid128_prod_uid47_fpMulTest_cma_a0 <= STD_LOGIC_VECTOR(sm0_uid128_prod_uid47_fpMulTest_cma_ah(0));
    sm0_uid128_prod_uid47_fpMulTest_cma_c0 <= STD_LOGIC_VECTOR(sm0_uid128_prod_uid47_fpMulTest_cma_ch(0));
    sm0_uid128_prod_uid47_fpMulTest_cma_DSP0 : fourteennm_mac
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
        ena(0) => sm0_uid128_prod_uid47_fpMulTest_cma_ena0,
        ena(1) => sm0_uid128_prod_uid47_fpMulTest_cma_ena1,
        ena(2) => sm0_uid128_prod_uid47_fpMulTest_cma_ena2,
        clr(0) => sm0_uid128_prod_uid47_fpMulTest_cma_reset,
        clr(1) => sm0_uid128_prod_uid47_fpMulTest_cma_reset,
        ay => sm0_uid128_prod_uid47_fpMulTest_cma_a0,
        ax => sm0_uid128_prod_uid47_fpMulTest_cma_c0,
        resulta => sm0_uid128_prod_uid47_fpMulTest_cma_s0
    );
    sm0_uid128_prod_uid47_fpMulTest_cma_delay : dspba_delay
    GENERIC MAP ( width => 54, depth => 1, reset_kind => "NONE", phase => 0, modulus => 1 )
    PORT MAP ( xin => sm0_uid128_prod_uid47_fpMulTest_cma_s0, xout => sm0_uid128_prod_uid47_fpMulTest_cma_qq, clk => clk, aclr => areset, ena => '1' );
    sm0_uid128_prod_uid47_fpMulTest_cma_q <= STD_LOGIC_VECTOR(sm0_uid128_prod_uid47_fpMulTest_cma_qq(53 downto 0));

    -- add1sumAHighB_uid132_prod_uid47_fpMulTest_BitSelect_for_b_tessel0_0(BITSELECT,242)@7
    add1sumAHighB_uid132_prod_uid47_fpMulTest_BitSelect_for_b_tessel0_0_b <= STD_LOGIC_VECTOR(sm0_uid128_prod_uid47_fpMulTest_cma_q(53 downto 27));

    -- redist4_add1sumAHighB_uid132_prod_uid47_fpMulTest_BitSelect_for_b_tessel0_0_b_1(DELAY,260)
    redist4_add1sumAHighB_uid132_prod_uid47_fpMulTest_BitSelect_for_b_tessel0_0_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist4_add1sumAHighB_uid132_prod_uid47_fpMulTest_BitSelect_for_b_tessel0_0_b_1_q <= (others => '0');
            ELSE
                redist4_add1sumAHighB_uid132_prod_uid47_fpMulTest_BitSelect_for_b_tessel0_0_b_1_q <= STD_LOGIC_VECTOR(add1sumAHighB_uid132_prod_uid47_fpMulTest_BitSelect_for_b_tessel0_0_b);
            END IF;
        END IF;
    END PROCESS;

    -- add1sumAHighB_uid132_prod_uid47_fpMulTest_BitSelect_for_b_BitJoin_for_b(BITJOIN,244)@8
    add1sumAHighB_uid132_prod_uid47_fpMulTest_BitSelect_for_b_BitJoin_for_b_q <= add1sumAHighB_uid132_prod_uid47_fpMulTest_BitSelect_for_b_tessel0_1_merged_bit_select_b & redist4_add1sumAHighB_uid132_prod_uid47_fpMulTest_BitSelect_for_b_tessel0_0_b_1_q;

    -- multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma(CHAINMULTADD,227)@0 + 5
    -- in e@1
    -- in g@1
    -- out q@7
    multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_reset <= areset;
    multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_ena0 <= '1';
    multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_ena1 <= multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_ena0;
    multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_ena2 <= multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_ena0;
    multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_chainmultadd_hyper: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (false) THEN
            ELSE
                multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_ah(0) <= RESIZE(UNSIGNED(redist1_topRangeY_uid106_prod_uid47_fpMulTest_merged_bit_select_b_1_q),27);
                multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_ah(1) <= RESIZE(UNSIGNED(aboveLeftY_mergedSignalTM_uid111_prod_uid47_fpMulTest_q),27);
                multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_ch(0) <= RESIZE(UNSIGNED(rightBottomX_mergedSignalTM_uid115_prod_uid47_fpMulTest_q),27);
                multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_ch(1) <= RESIZE(UNSIGNED(topRangeX_uid105_prod_uid47_fpMulTest_merged_bit_select_b),27);
            END IF;
        END IF;
    END PROCESS;

    multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_a0 <= STD_LOGIC_VECTOR(multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_ah(0));
    multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_c0 <= STD_LOGIC_VECTOR(multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_ch(0));
    multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_a1 <= STD_LOGIC_VECTOR(multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_ah(1));
    multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_c1 <= STD_LOGIC_VECTOR(multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_ch(1));
    multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_DSP1 : fourteennm_mac
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
        ena(0) => multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_ena0,
        ena(1) => multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_ena1,
        ena(2) => multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_ena2,
        clr(0) => multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_reset,
        clr(1) => multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_reset,
        ay => multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_a1,
        ax => multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_c1,
        chainout => multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_s1
    );
    multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_DSP0 : fourteennm_mac
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
        ena(0) => multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_ena0,
        ena(1) => multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_ena1,
        ena(2) => multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_ena2,
        clr(0) => multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_reset,
        clr(1) => multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_reset,
        ay => multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_a0,
        ax => multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_c0,
        chainin => multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_s1,
        resulta => multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_s0
    );
    multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_delay : dspba_delay
    GENERIC MAP ( width => 55, depth => 1, reset_kind => "NONE", phase => 0, modulus => 1 )
    PORT MAP ( xin => multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_s0, xout => multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_qq, clk => clk, aclr => areset, ena => '1' );
    multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_q <= STD_LOGIC_VECTOR(multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_qq(54 downto 0));

    -- redist6_multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_q_1(DELAY,262)
    redist6_multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_q_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist6_multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_q_1_q <= (others => '0');
            ELSE
                redist6_multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_q_1_q <= STD_LOGIC_VECTOR(multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_q);
            END IF;
        END IF;
    END PROCESS;

    -- add1sumAHighB_uid132_prod_uid47_fpMulTest_BitSelect_for_a_BitJoin_for_b(BITJOIN,239)@8
    add1sumAHighB_uid132_prod_uid47_fpMulTest_BitSelect_for_a_BitJoin_for_b_q <= add1sumAHighB_uid132_prod_uid47_fpMulTest_BitSelect_for_a_tessel0_1_merged_bit_select_b & redist6_multSumOfTwoTS_uid118_prod_uid47_fpMulTest_cma_q_1_q;

    -- add1sumAHighB_uid132_prod_uid47_fpMulTest_p1_of_2(ADD,234)@8 + 1
    add1sumAHighB_uid132_prod_uid47_fpMulTest_p1_of_2_a <= STD_LOGIC_VECTOR("0" & add1sumAHighB_uid132_prod_uid47_fpMulTest_BitSelect_for_a_BitJoin_for_b_q);
    add1sumAHighB_uid132_prod_uid47_fpMulTest_p1_of_2_b <= STD_LOGIC_VECTOR("0" & add1sumAHighB_uid132_prod_uid47_fpMulTest_BitSelect_for_b_BitJoin_for_b_q);
    add1sumAHighB_uid132_prod_uid47_fpMulTest_p1_of_2_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                add1sumAHighB_uid132_prod_uid47_fpMulTest_p1_of_2_o <= (others => '0');
            ELSE
                add1sumAHighB_uid132_prod_uid47_fpMulTest_p1_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(add1sumAHighB_uid132_prod_uid47_fpMulTest_p1_of_2_a) + UNSIGNED(add1sumAHighB_uid132_prod_uid47_fpMulTest_p1_of_2_b));
            END IF;
        END IF;
    END PROCESS;
    add1sumAHighB_uid132_prod_uid47_fpMulTest_p1_of_2_c(0) <= add1sumAHighB_uid132_prod_uid47_fpMulTest_p1_of_2_o(78);
    add1sumAHighB_uid132_prod_uid47_fpMulTest_p1_of_2_q <= add1sumAHighB_uid132_prod_uid47_fpMulTest_p1_of_2_o(77 downto 0);

    -- redist0_add1sumAHighB_uid132_prod_uid47_fpMulTest_BitSelect_for_b_tessel0_1_merged_bit_select_c_1(DELAY,256)
    redist0_add1sumAHighB_uid132_prod_uid47_fpMulTest_BitSelect_for_b_tessel0_1_merged_bit_select_c_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist0_add1sumAHighB_uid132_prod_uid47_fpMulTest_BitSelect_for_b_tessel0_1_merged_bit_select_c_1_q <= (others => '0');
            ELSE
                redist0_add1sumAHighB_uid132_prod_uid47_fpMulTest_BitSelect_for_b_tessel0_1_merged_bit_select_c_1_q <= STD_LOGIC_VECTOR(add1sumAHighB_uid132_prod_uid47_fpMulTest_BitSelect_for_b_tessel0_1_merged_bit_select_c);
            END IF;
        END IF;
    END PROCESS;

    -- add1sumAHighB_uid132_prod_uid47_fpMulTest_BitSelect_for_b_BitJoin_for_c(BITJOIN,247)@9
    add1sumAHighB_uid132_prod_uid47_fpMulTest_BitSelect_for_b_BitJoin_for_c_q <= GND_q & redist0_add1sumAHighB_uid132_prod_uid47_fpMulTest_BitSelect_for_b_tessel0_1_merged_bit_select_c_1_q;

    -- add1sumAHighB_uid132_prod_uid47_fpMulTest_UpperBits_for_a(CONSTANT,229)
    add1sumAHighB_uid132_prod_uid47_fpMulTest_UpperBits_for_a_q <= "000000000000000000000000000";

    -- add1sumAHighB_uid132_prod_uid47_fpMulTest_BitSelect_for_a_tessel0_1_merged_bit_select(BITSELECT,255)
    add1sumAHighB_uid132_prod_uid47_fpMulTest_BitSelect_for_a_tessel0_1_merged_bit_select_b <= STD_LOGIC_VECTOR(add1sumAHighB_uid132_prod_uid47_fpMulTest_UpperBits_for_a_q(22 downto 0));
    add1sumAHighB_uid132_prod_uid47_fpMulTest_BitSelect_for_a_tessel0_1_merged_bit_select_c <= STD_LOGIC_VECTOR(add1sumAHighB_uid132_prod_uid47_fpMulTest_UpperBits_for_a_q(26 downto 23));

    -- add1sumAHighB_uid132_prod_uid47_fpMulTest_p2_of_2(ADD,235)@9 + 1
    add1sumAHighB_uid132_prod_uid47_fpMulTest_p2_of_2_cin <= add1sumAHighB_uid132_prod_uid47_fpMulTest_p1_of_2_c;
    add1sumAHighB_uid132_prod_uid47_fpMulTest_p2_of_2_a <= STD_LOGIC_VECTOR("0" & add1sumAHighB_uid132_prod_uid47_fpMulTest_BitSelect_for_a_tessel0_1_merged_bit_select_c) & '1';
    add1sumAHighB_uid132_prod_uid47_fpMulTest_p2_of_2_b <= STD_LOGIC_VECTOR("0" & add1sumAHighB_uid132_prod_uid47_fpMulTest_BitSelect_for_b_BitJoin_for_c_q) & add1sumAHighB_uid132_prod_uid47_fpMulTest_p2_of_2_cin(0);
    add1sumAHighB_uid132_prod_uid47_fpMulTest_p2_of_2_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                add1sumAHighB_uid132_prod_uid47_fpMulTest_p2_of_2_o <= (others => '0');
            ELSE
                add1sumAHighB_uid132_prod_uid47_fpMulTest_p2_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(add1sumAHighB_uid132_prod_uid47_fpMulTest_p2_of_2_a) + UNSIGNED(add1sumAHighB_uid132_prod_uid47_fpMulTest_p2_of_2_b));
            END IF;
        END IF;
    END PROCESS;
    add1sumAHighB_uid132_prod_uid47_fpMulTest_p2_of_2_q <= add1sumAHighB_uid132_prod_uid47_fpMulTest_p2_of_2_o(4 downto 1);

    -- redist5_add1sumAHighB_uid132_prod_uid47_fpMulTest_p1_of_2_q_1(DELAY,261)
    redist5_add1sumAHighB_uid132_prod_uid47_fpMulTest_p1_of_2_q_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist5_add1sumAHighB_uid132_prod_uid47_fpMulTest_p1_of_2_q_1_q <= (others => '0');
            ELSE
                redist5_add1sumAHighB_uid132_prod_uid47_fpMulTest_p1_of_2_q_1_q <= STD_LOGIC_VECTOR(add1sumAHighB_uid132_prod_uid47_fpMulTest_p1_of_2_q);
            END IF;
        END IF;
    END PROCESS;

    -- add1sumAHighB_uid132_prod_uid47_fpMulTest_BitJoin_for_q(BITJOIN,236)@10
    add1sumAHighB_uid132_prod_uid47_fpMulTest_BitJoin_for_q_q <= add1sumAHighB_uid132_prod_uid47_fpMulTest_p2_of_2_q & redist5_add1sumAHighB_uid132_prod_uid47_fpMulTest_p1_of_2_q_1_q;

    -- add0_uid129_prod_uid47_fpMulTest(BITJOIN,128)@7
    add0_uid129_prod_uid47_fpMulTest_q <= topProd_uid107_prod_uid47_fpMulTest_cma_q & sm0_uid128_prod_uid47_fpMulTest_cma_q;

    -- lowRangeB_uid130_prod_uid47_fpMulTest(BITSELECT,129)@7
    lowRangeB_uid130_prod_uid47_fpMulTest_in <= add0_uid129_prod_uid47_fpMulTest_q(26 downto 0);
    lowRangeB_uid130_prod_uid47_fpMulTest_b <= lowRangeB_uid130_prod_uid47_fpMulTest_in(26 downto 0);

    -- redist10_lowRangeB_uid130_prod_uid47_fpMulTest_b_3(DELAY,266)
    redist10_lowRangeB_uid130_prod_uid47_fpMulTest_b_3_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist10_lowRangeB_uid130_prod_uid47_fpMulTest_b_3_delay_0 <= (others => '0');
                redist10_lowRangeB_uid130_prod_uid47_fpMulTest_b_3_delay_1 <= (others => '0');
                redist10_lowRangeB_uid130_prod_uid47_fpMulTest_b_3_q <= (others => '0');
            ELSE
                redist10_lowRangeB_uid130_prod_uid47_fpMulTest_b_3_delay_0 <= STD_LOGIC_VECTOR(lowRangeB_uid130_prod_uid47_fpMulTest_b);
                redist10_lowRangeB_uid130_prod_uid47_fpMulTest_b_3_delay_1 <= redist10_lowRangeB_uid130_prod_uid47_fpMulTest_b_3_delay_0;
                redist10_lowRangeB_uid130_prod_uid47_fpMulTest_b_3_q <= redist10_lowRangeB_uid130_prod_uid47_fpMulTest_b_3_delay_1;
            END IF;
        END IF;
    END PROCESS;

    -- add1_uid133_prod_uid47_fpMulTest(BITJOIN,132)@10
    add1_uid133_prod_uid47_fpMulTest_q <= add1sumAHighB_uid132_prod_uid47_fpMulTest_BitJoin_for_q_q & redist10_lowRangeB_uid130_prod_uid47_fpMulTest_b_3_q;

    -- osig_uid134_prod_uid47_fpMulTest(BITSELECT,133)@10
    osig_uid134_prod_uid47_fpMulTest_in <= add1_uid133_prod_uid47_fpMulTest_q(107 downto 0);
    osig_uid134_prod_uid47_fpMulTest_b <= osig_uid134_prod_uid47_fpMulTest_in(107 downto 2);

    -- normalizeBit_uid49_fpMulTest(BITSELECT,48)@10
    normalizeBit_uid49_fpMulTest_b <= STD_LOGIC_VECTOR(osig_uid134_prod_uid47_fpMulTest_b(105 downto 105));

    -- redist18_normalizeBit_uid49_fpMulTest_b_3(DELAY,274)
    redist18_normalizeBit_uid49_fpMulTest_b_3_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist18_normalizeBit_uid49_fpMulTest_b_3_delay_0 <= (others => '0');
                redist18_normalizeBit_uid49_fpMulTest_b_3_delay_1 <= (others => '0');
                redist18_normalizeBit_uid49_fpMulTest_b_3_q <= (others => '0');
            ELSE
                redist18_normalizeBit_uid49_fpMulTest_b_3_delay_0 <= STD_LOGIC_VECTOR(normalizeBit_uid49_fpMulTest_b);
                redist18_normalizeBit_uid49_fpMulTest_b_3_delay_1 <= redist18_normalizeBit_uid49_fpMulTest_b_3_delay_0;
                redist18_normalizeBit_uid49_fpMulTest_b_3_q <= redist18_normalizeBit_uid49_fpMulTest_b_3_delay_1;
            END IF;
        END IF;
    END PROCESS;

    -- roundBitDetectionConstant_uid63_fpMulTest(CONSTANT,62)
    roundBitDetectionConstant_uid63_fpMulTest_q <= "010";

    -- fracRPostNormHigh_uid51_fpMulTest(BITSELECT,50)@10
    fracRPostNormHigh_uid51_fpMulTest_in <= osig_uid134_prod_uid47_fpMulTest_b(104 downto 0);
    fracRPostNormHigh_uid51_fpMulTest_b <= fracRPostNormHigh_uid51_fpMulTest_in(104 downto 52);

    -- fracRPostNormLow_uid52_fpMulTest(BITSELECT,51)@10
    fracRPostNormLow_uid52_fpMulTest_in <= osig_uid134_prod_uid47_fpMulTest_b(103 downto 0);
    fracRPostNormLow_uid52_fpMulTest_b <= fracRPostNormLow_uid52_fpMulTest_in(103 downto 51);

    -- fracRPostNorm_uid53_fpMulTest(MUX,52)@10 + 1
    fracRPostNorm_uid53_fpMulTest_s <= normalizeBit_uid49_fpMulTest_b;
    fracRPostNorm_uid53_fpMulTest_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                fracRPostNorm_uid53_fpMulTest_q <= (others => '0');
            ELSE
                CASE (fracRPostNorm_uid53_fpMulTest_s) IS
                    WHEN "0" => fracRPostNorm_uid53_fpMulTest_q <= fracRPostNormLow_uid52_fpMulTest_b;
                    WHEN "1" => fracRPostNorm_uid53_fpMulTest_q <= fracRPostNormHigh_uid51_fpMulTest_b;
                    WHEN OTHERS => fracRPostNorm_uid53_fpMulTest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;

    -- redist16_fracRPostNorm_uid53_fpMulTest_q_2(DELAY,272)
    redist16_fracRPostNorm_uid53_fpMulTest_q_2_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist16_fracRPostNorm_uid53_fpMulTest_q_2_q <= (others => '0');
            ELSE
                redist16_fracRPostNorm_uid53_fpMulTest_q_2_q <= STD_LOGIC_VECTOR(fracRPostNorm_uid53_fpMulTest_q);
            END IF;
        END IF;
    END PROCESS;

    -- fracRPostNorm1dto0_uid61_fpMulTest(BITSELECT,60)@12
    fracRPostNorm1dto0_uid61_fpMulTest_in <= redist16_fracRPostNorm_uid53_fpMulTest_q_2_q(1 downto 0);
    fracRPostNorm1dto0_uid61_fpMulTest_b <= fracRPostNorm1dto0_uid61_fpMulTest_in(1 downto 0);

    -- extraStickyBitOfProd_uid55_fpMulTest(BITSELECT,54)@10
    extraStickyBitOfProd_uid55_fpMulTest_in <= STD_LOGIC_VECTOR(osig_uid134_prod_uid47_fpMulTest_b(51 downto 0));
    extraStickyBitOfProd_uid55_fpMulTest_b <= STD_LOGIC_VECTOR(extraStickyBitOfProd_uid55_fpMulTest_in(51 downto 51));

    -- extraStickyBit_uid56_fpMulTest(MUX,55)@10 + 1
    extraStickyBit_uid56_fpMulTest_s <= normalizeBit_uid49_fpMulTest_b;
    extraStickyBit_uid56_fpMulTest_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                extraStickyBit_uid56_fpMulTest_q <= (others => '0');
            ELSE
                CASE (extraStickyBit_uid56_fpMulTest_s) IS
                    WHEN "0" => extraStickyBit_uid56_fpMulTest_q <= GND_q;
                    WHEN "1" => extraStickyBit_uid56_fpMulTest_q <= extraStickyBitOfProd_uid55_fpMulTest_b;
                    WHEN OTHERS => extraStickyBit_uid56_fpMulTest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;

    -- stickyRange_uid54_fpMulTest(BITSELECT,53)@10
    stickyRange_uid54_fpMulTest_in <= osig_uid134_prod_uid47_fpMulTest_b(50 downto 0);
    stickyRange_uid54_fpMulTest_b <= stickyRange_uid54_fpMulTest_in(50 downto 0);

    -- redist15_stickyRange_uid54_fpMulTest_b_1(DELAY,271)
    redist15_stickyRange_uid54_fpMulTest_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist15_stickyRange_uid54_fpMulTest_b_1_q <= (others => '0');
            ELSE
                redist15_stickyRange_uid54_fpMulTest_b_1_q <= STD_LOGIC_VECTOR(stickyRange_uid54_fpMulTest_b);
            END IF;
        END IF;
    END PROCESS;

    -- stickyExtendedRange_uid57_fpMulTest(BITJOIN,56)@11
    stickyExtendedRange_uid57_fpMulTest_q <= extraStickyBit_uid56_fpMulTest_q & redist15_stickyRange_uid54_fpMulTest_b_1_q;

    -- z0_uid196_stickyRangeComparator_uid59_fpMulTest_merged_bit_select(BITSELECT,253)@11
    z0_uid196_stickyRangeComparator_uid59_fpMulTest_merged_bit_select_b <= stickyExtendedRange_uid57_fpMulTest_q(5 downto 0);
    z0_uid196_stickyRangeComparator_uid59_fpMulTest_merged_bit_select_c <= stickyExtendedRange_uid57_fpMulTest_q(11 downto 6);
    z0_uid196_stickyRangeComparator_uid59_fpMulTest_merged_bit_select_d <= stickyExtendedRange_uid57_fpMulTest_q(17 downto 12);
    z0_uid196_stickyRangeComparator_uid59_fpMulTest_merged_bit_select_e <= stickyExtendedRange_uid57_fpMulTest_q(23 downto 18);
    z0_uid196_stickyRangeComparator_uid59_fpMulTest_merged_bit_select_f <= stickyExtendedRange_uid57_fpMulTest_q(29 downto 24);
    z0_uid196_stickyRangeComparator_uid59_fpMulTest_merged_bit_select_g <= stickyExtendedRange_uid57_fpMulTest_q(35 downto 30);
    z0_uid196_stickyRangeComparator_uid59_fpMulTest_merged_bit_select_h <= stickyExtendedRange_uid57_fpMulTest_q(41 downto 36);
    z0_uid196_stickyRangeComparator_uid59_fpMulTest_merged_bit_select_i <= stickyExtendedRange_uid57_fpMulTest_q(47 downto 42);
    z0_uid196_stickyRangeComparator_uid59_fpMulTest_merged_bit_select_j <= stickyExtendedRange_uid57_fpMulTest_q(51 downto 48);

    -- eq8_uid222_stickyRangeComparator_uid59_fpMulTest(LOGICAL,221)@11
    eq8_uid222_stickyRangeComparator_uid59_fpMulTest_q <= "1" WHEN z0_uid196_stickyRangeComparator_uid59_fpMulTest_merged_bit_select_j = c0_uid137_fracXIsZero_uid17_fpMulTest_merged_bit_select_j ELSE "0";

    -- eq7_uid219_stickyRangeComparator_uid59_fpMulTest(LOGICAL,218)@11
    eq7_uid219_stickyRangeComparator_uid59_fpMulTest_q <= "1" WHEN z0_uid196_stickyRangeComparator_uid59_fpMulTest_merged_bit_select_i = c0_uid137_fracXIsZero_uid17_fpMulTest_merged_bit_select_i ELSE "0";

    -- eq6_uid216_stickyRangeComparator_uid59_fpMulTest(LOGICAL,215)@11
    eq6_uid216_stickyRangeComparator_uid59_fpMulTest_q <= "1" WHEN z0_uid196_stickyRangeComparator_uid59_fpMulTest_merged_bit_select_h = c0_uid137_fracXIsZero_uid17_fpMulTest_merged_bit_select_h ELSE "0";

    -- and_lev0_uid224_stickyRangeComparator_uid59_fpMulTest(LOGICAL,223)@11 + 1
    and_lev0_uid224_stickyRangeComparator_uid59_fpMulTest_qi <= eq6_uid216_stickyRangeComparator_uid59_fpMulTest_q and eq7_uid219_stickyRangeComparator_uid59_fpMulTest_q and eq8_uid222_stickyRangeComparator_uid59_fpMulTest_q;
    and_lev0_uid224_stickyRangeComparator_uid59_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => and_lev0_uid224_stickyRangeComparator_uid59_fpMulTest_qi, xout => and_lev0_uid224_stickyRangeComparator_uid59_fpMulTest_q, clk => clk, aclr => areset, ena => '1' );

    -- eq5_uid213_stickyRangeComparator_uid59_fpMulTest(LOGICAL,212)@11
    eq5_uid213_stickyRangeComparator_uid59_fpMulTest_q <= "1" WHEN z0_uid196_stickyRangeComparator_uid59_fpMulTest_merged_bit_select_g = c0_uid137_fracXIsZero_uid17_fpMulTest_merged_bit_select_g ELSE "0";

    -- eq4_uid210_stickyRangeComparator_uid59_fpMulTest(LOGICAL,209)@11
    eq4_uid210_stickyRangeComparator_uid59_fpMulTest_q <= "1" WHEN z0_uid196_stickyRangeComparator_uid59_fpMulTest_merged_bit_select_f = c0_uid137_fracXIsZero_uid17_fpMulTest_merged_bit_select_f ELSE "0";

    -- eq3_uid207_stickyRangeComparator_uid59_fpMulTest(LOGICAL,206)@11
    eq3_uid207_stickyRangeComparator_uid59_fpMulTest_q <= "1" WHEN z0_uid196_stickyRangeComparator_uid59_fpMulTest_merged_bit_select_e = c0_uid137_fracXIsZero_uid17_fpMulTest_merged_bit_select_e ELSE "0";

    -- eq2_uid204_stickyRangeComparator_uid59_fpMulTest(LOGICAL,203)@11
    eq2_uid204_stickyRangeComparator_uid59_fpMulTest_q <= "1" WHEN z0_uid196_stickyRangeComparator_uid59_fpMulTest_merged_bit_select_d = c0_uid137_fracXIsZero_uid17_fpMulTest_merged_bit_select_d ELSE "0";

    -- eq1_uid201_stickyRangeComparator_uid59_fpMulTest(LOGICAL,200)@11
    eq1_uid201_stickyRangeComparator_uid59_fpMulTest_q <= "1" WHEN z0_uid196_stickyRangeComparator_uid59_fpMulTest_merged_bit_select_c = c0_uid137_fracXIsZero_uid17_fpMulTest_merged_bit_select_c ELSE "0";

    -- eq0_uid198_stickyRangeComparator_uid59_fpMulTest(LOGICAL,197)@11
    eq0_uid198_stickyRangeComparator_uid59_fpMulTest_q <= "1" WHEN z0_uid196_stickyRangeComparator_uid59_fpMulTest_merged_bit_select_b = c0_uid137_fracXIsZero_uid17_fpMulTest_merged_bit_select_b ELSE "0";

    -- and_lev0_uid223_stickyRangeComparator_uid59_fpMulTest(LOGICAL,222)@11 + 1
    and_lev0_uid223_stickyRangeComparator_uid59_fpMulTest_qi <= eq0_uid198_stickyRangeComparator_uid59_fpMulTest_q and eq1_uid201_stickyRangeComparator_uid59_fpMulTest_q and eq2_uid204_stickyRangeComparator_uid59_fpMulTest_q and eq3_uid207_stickyRangeComparator_uid59_fpMulTest_q and eq4_uid210_stickyRangeComparator_uid59_fpMulTest_q and eq5_uid213_stickyRangeComparator_uid59_fpMulTest_q;
    and_lev0_uid223_stickyRangeComparator_uid59_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => and_lev0_uid223_stickyRangeComparator_uid59_fpMulTest_qi, xout => and_lev0_uid223_stickyRangeComparator_uid59_fpMulTest_q, clk => clk, aclr => areset, ena => '1' );

    -- and_lev1_uid225_stickyRangeComparator_uid59_fpMulTest(LOGICAL,224)@12
    and_lev1_uid225_stickyRangeComparator_uid59_fpMulTest_q <= and_lev0_uid223_stickyRangeComparator_uid59_fpMulTest_q and and_lev0_uid224_stickyRangeComparator_uid59_fpMulTest_q;

    -- sticky_uid60_fpMulTest(LOGICAL,59)@12
    sticky_uid60_fpMulTest_q <= not (and_lev1_uid225_stickyRangeComparator_uid59_fpMulTest_q);

    -- lrs_uid62_fpMulTest(BITJOIN,61)@12
    lrs_uid62_fpMulTest_q <= fracRPostNorm1dto0_uid61_fpMulTest_b & sticky_uid60_fpMulTest_q;

    -- roundBitDetectionPattern_uid64_fpMulTest(LOGICAL,63)@12 + 1
    roundBitDetectionPattern_uid64_fpMulTest_qi <= "1" WHEN lrs_uid62_fpMulTest_q = roundBitDetectionConstant_uid63_fpMulTest_q ELSE "0";
    roundBitDetectionPattern_uid64_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => roundBitDetectionPattern_uid64_fpMulTest_qi, xout => roundBitDetectionPattern_uid64_fpMulTest_q, clk => clk, aclr => areset, ena => '1' );

    -- roundBit_uid65_fpMulTest(LOGICAL,64)@13
    roundBit_uid65_fpMulTest_q <= not (roundBitDetectionPattern_uid64_fpMulTest_q);

    -- roundBitAndNormalizationOp_uid68_fpMulTest(BITJOIN,67)@13
    roundBitAndNormalizationOp_uid68_fpMulTest_q <= GND_q & redist18_normalizeBit_uid49_fpMulTest_b_3_q & cstZeroWF_uid11_fpMulTest_q & roundBit_uid65_fpMulTest_q;

    -- biasInc_uid45_fpMulTest(CONSTANT,44)
    biasInc_uid45_fpMulTest_q <= "0001111111111";

    -- redist20_expSum_uid44_fpMulTest_q_12_notEnable(LOGICAL,287)
    redist20_expSum_uid44_fpMulTest_q_12_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist20_expSum_uid44_fpMulTest_q_12_nor(LOGICAL,288)
    redist20_expSum_uid44_fpMulTest_q_12_nor_q <= not (redist20_expSum_uid44_fpMulTest_q_12_notEnable_q or redist20_expSum_uid44_fpMulTest_q_12_sticky_ena_q);

    -- redist20_expSum_uid44_fpMulTest_q_12_mem_last(CONSTANT,284)
    redist20_expSum_uid44_fpMulTest_q_12_mem_last_q <= "01000";

    -- redist20_expSum_uid44_fpMulTest_q_12_cmp(LOGICAL,285)
    redist20_expSum_uid44_fpMulTest_q_12_cmp_b <= STD_LOGIC_VECTOR("0" & redist20_expSum_uid44_fpMulTest_q_12_rdcnt_q);
    redist20_expSum_uid44_fpMulTest_q_12_cmp_q <= "1" WHEN redist20_expSum_uid44_fpMulTest_q_12_mem_last_q = redist20_expSum_uid44_fpMulTest_q_12_cmp_b ELSE "0";

    -- redist20_expSum_uid44_fpMulTest_q_12_cmpReg(REG,286)
    redist20_expSum_uid44_fpMulTest_q_12_cmpReg_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist20_expSum_uid44_fpMulTest_q_12_cmpReg_q <= "0";
            ELSE
                redist20_expSum_uid44_fpMulTest_q_12_cmpReg_q <= STD_LOGIC_VECTOR(redist20_expSum_uid44_fpMulTest_q_12_cmp_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist20_expSum_uid44_fpMulTest_q_12_sticky_ena(REG,289)
    redist20_expSum_uid44_fpMulTest_q_12_sticky_ena_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist20_expSum_uid44_fpMulTest_q_12_sticky_ena_q <= "0";
            ELSE
                IF (redist20_expSum_uid44_fpMulTest_q_12_nor_q = "1") THEN
                    redist20_expSum_uid44_fpMulTest_q_12_sticky_ena_q <= STD_LOGIC_VECTOR(redist20_expSum_uid44_fpMulTest_q_12_cmpReg_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist20_expSum_uid44_fpMulTest_q_12_enaAnd(LOGICAL,290)
    redist20_expSum_uid44_fpMulTest_q_12_enaAnd_q <= redist20_expSum_uid44_fpMulTest_q_12_sticky_ena_q and VCC_q;

    -- redist20_expSum_uid44_fpMulTest_q_12_rdcnt(COUNTER,282)
    -- low=0, high=9, step=1, init=0
    redist20_expSum_uid44_fpMulTest_q_12_rdcnt_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist20_expSum_uid44_fpMulTest_q_12_rdcnt_i <= TO_UNSIGNED(0, 4);
                redist20_expSum_uid44_fpMulTest_q_12_rdcnt_eq <= '0';
            ELSE
                IF (redist20_expSum_uid44_fpMulTest_q_12_rdcnt_i = TO_UNSIGNED(8, 4)) THEN
                    redist20_expSum_uid44_fpMulTest_q_12_rdcnt_eq <= '1';
                ELSE
                    redist20_expSum_uid44_fpMulTest_q_12_rdcnt_eq <= '0';
                END IF;
                IF (redist20_expSum_uid44_fpMulTest_q_12_rdcnt_eq = '1') THEN
                    redist20_expSum_uid44_fpMulTest_q_12_rdcnt_i <= redist20_expSum_uid44_fpMulTest_q_12_rdcnt_i + 7;
                ELSE
                    redist20_expSum_uid44_fpMulTest_q_12_rdcnt_i <= redist20_expSum_uid44_fpMulTest_q_12_rdcnt_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    redist20_expSum_uid44_fpMulTest_q_12_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist20_expSum_uid44_fpMulTest_q_12_rdcnt_i, 4)));

    -- expSum_uid44_fpMulTest(ADD,43)@0 + 1
    expSum_uid44_fpMulTest_a <= STD_LOGIC_VECTOR("0" & expX_uid6_fpMulTest_b);
    expSum_uid44_fpMulTest_b <= STD_LOGIC_VECTOR("0" & expY_uid7_fpMulTest_b);
    expSum_uid44_fpMulTest_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                expSum_uid44_fpMulTest_o <= (others => '0');
            ELSE
                expSum_uid44_fpMulTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expSum_uid44_fpMulTest_a) + UNSIGNED(expSum_uid44_fpMulTest_b));
            END IF;
        END IF;
    END PROCESS;
    expSum_uid44_fpMulTest_q <= expSum_uid44_fpMulTest_o(11 downto 0);

    -- redist20_expSum_uid44_fpMulTest_q_12_wraddr(REG,283)
    redist20_expSum_uid44_fpMulTest_q_12_wraddr_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist20_expSum_uid44_fpMulTest_q_12_wraddr_q <= "1001";
            ELSE
                redist20_expSum_uid44_fpMulTest_q_12_wraddr_q <= STD_LOGIC_VECTOR(redist20_expSum_uid44_fpMulTest_q_12_rdcnt_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist20_expSum_uid44_fpMulTest_q_12_mem(DUALMEM,281)
    redist20_expSum_uid44_fpMulTest_q_12_mem_ia <= STD_LOGIC_VECTOR(expSum_uid44_fpMulTest_q);
    redist20_expSum_uid44_fpMulTest_q_12_mem_aa <= redist20_expSum_uid44_fpMulTest_q_12_wraddr_q;
    redist20_expSum_uid44_fpMulTest_q_12_mem_ab <= redist20_expSum_uid44_fpMulTest_q_12_rdcnt_q;
    redist20_expSum_uid44_fpMulTest_q_12_mem_reset0 <= areset;
    redist20_expSum_uid44_fpMulTest_q_12_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 12,
        widthad_a => 4,
        numwords_a => 10,
        width_b => 12,
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
        clocken1 => redist20_expSum_uid44_fpMulTest_q_12_enaAnd_q(0),
        clocken0 => '1',
        clock0 => clk,
        sclr => redist20_expSum_uid44_fpMulTest_q_12_mem_reset0,
        clock1 => clk,
        address_a => redist20_expSum_uid44_fpMulTest_q_12_mem_aa,
        data_a => redist20_expSum_uid44_fpMulTest_q_12_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist20_expSum_uid44_fpMulTest_q_12_mem_ab,
        q_b => redist20_expSum_uid44_fpMulTest_q_12_mem_iq
    );
    redist20_expSum_uid44_fpMulTest_q_12_mem_q <= redist20_expSum_uid44_fpMulTest_q_12_mem_iq(11 downto 0);

    -- expSumMBias_uid46_fpMulTest(SUB,45)@12 + 1
    expSumMBias_uid46_fpMulTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & redist20_expSum_uid44_fpMulTest_q_12_mem_q));
    expSumMBias_uid46_fpMulTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 13 => biasInc_uid45_fpMulTest_q(12)) & biasInc_uid45_fpMulTest_q));
    expSumMBias_uid46_fpMulTest_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                expSumMBias_uid46_fpMulTest_o <= (others => '0');
            ELSE
                expSumMBias_uid46_fpMulTest_o <= STD_LOGIC_VECTOR(SIGNED(expSumMBias_uid46_fpMulTest_a) - SIGNED(expSumMBias_uid46_fpMulTest_b));
            END IF;
        END IF;
    END PROCESS;
    expSumMBias_uid46_fpMulTest_q <= expSumMBias_uid46_fpMulTest_o(13 downto 0);

    -- redist17_fracRPostNorm_uid53_fpMulTest_q_3(DELAY,273)
    redist17_fracRPostNorm_uid53_fpMulTest_q_3_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist17_fracRPostNorm_uid53_fpMulTest_q_3_q <= (others => '0');
            ELSE
                redist17_fracRPostNorm_uid53_fpMulTest_q_3_q <= STD_LOGIC_VECTOR(redist16_fracRPostNorm_uid53_fpMulTest_q_2_q);
            END IF;
        END IF;
    END PROCESS;

    -- expFracPreRound_uid66_fpMulTest(BITJOIN,65)@13
    expFracPreRound_uid66_fpMulTest_q <= expSumMBias_uid46_fpMulTest_q & redist17_fracRPostNorm_uid53_fpMulTest_q_3_q;

    -- expFracRPostRounding_uid69_fpMulTest(ADD,68)@13
    expFracRPostRounding_uid69_fpMulTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((68 downto 67 => expFracPreRound_uid66_fpMulTest_q(66)) & expFracPreRound_uid66_fpMulTest_q));
    expFracRPostRounding_uid69_fpMulTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("00000000000000" & roundBitAndNormalizationOp_uid68_fpMulTest_q));
    expFracRPostRounding_uid69_fpMulTest_o <= STD_LOGIC_VECTOR(SIGNED(expFracRPostRounding_uid69_fpMulTest_a) + SIGNED(expFracRPostRounding_uid69_fpMulTest_b));
    expFracRPostRounding_uid69_fpMulTest_q <= expFracRPostRounding_uid69_fpMulTest_o(67 downto 0);

    -- expRPreExcExt_uid71_fpMulTest(BITSELECT,70)@13
    expRPreExcExt_uid71_fpMulTest_b <= STD_LOGIC_VECTOR(expFracRPostRounding_uid69_fpMulTest_q(67 downto 53));

    -- redist13_expRPreExcExt_uid71_fpMulTest_b_1(DELAY,269)
    redist13_expRPreExcExt_uid71_fpMulTest_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist13_expRPreExcExt_uid71_fpMulTest_b_1_q <= (others => '0');
            ELSE
                redist13_expRPreExcExt_uid71_fpMulTest_b_1_q <= STD_LOGIC_VECTOR(expRPreExcExt_uid71_fpMulTest_b);
            END IF;
        END IF;
    END PROCESS;

    -- expRPreExc_uid72_fpMulTest(BITSELECT,71)@14
    expRPreExc_uid72_fpMulTest_in <= redist13_expRPreExcExt_uid71_fpMulTest_b_1_q(10 downto 0);
    expRPreExc_uid72_fpMulTest_b <= expRPreExc_uid72_fpMulTest_in(10 downto 0);

    -- redist12_expRPreExc_uid72_fpMulTest_b_2(DELAY,268)
    redist12_expRPreExc_uid72_fpMulTest_b_2_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist12_expRPreExc_uid72_fpMulTest_b_2_delay_0 <= (others => '0');
                redist12_expRPreExc_uid72_fpMulTest_b_2_q <= (others => '0');
            ELSE
                redist12_expRPreExc_uid72_fpMulTest_b_2_delay_0 <= STD_LOGIC_VECTOR(expRPreExc_uid72_fpMulTest_b);
                redist12_expRPreExc_uid72_fpMulTest_b_2_q <= redist12_expRPreExc_uid72_fpMulTest_b_2_delay_0;
            END IF;
        END IF;
    END PROCESS;

    -- expOvf_uid75_fpMulTest(COMPARE,74)@14
    expOvf_uid75_fpMulTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 15 => redist13_expRPreExcExt_uid71_fpMulTest_b_1_q(14)) & redist13_expRPreExcExt_uid71_fpMulTest_b_1_q));
    expOvf_uid75_fpMulTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000000" & cstAllOWE_uid10_fpMulTest_q));
    expOvf_uid75_fpMulTest_o <= STD_LOGIC_VECTOR(SIGNED(expOvf_uid75_fpMulTest_a) - SIGNED(expOvf_uid75_fpMulTest_b));
    expOvf_uid75_fpMulTest_n(0) <= not (expOvf_uid75_fpMulTest_o(16));

    -- invExpXIsMax_uid35_fpMulTest(LOGICAL,34)@14
    invExpXIsMax_uid35_fpMulTest_q <= not (redist21_expXIsMax_uid30_fpMulTest_q_14_q);

    -- InvExpXIsZero_uid36_fpMulTest(LOGICAL,35)@14
    InvExpXIsZero_uid36_fpMulTest_q <= not (redist22_excZ_y_uid29_fpMulTest_q_14_q);

    -- excR_y_uid37_fpMulTest(LOGICAL,36)@14
    excR_y_uid37_fpMulTest_q <= InvExpXIsZero_uid36_fpMulTest_q and invExpXIsMax_uid35_fpMulTest_q;

    -- invExpXIsMax_uid21_fpMulTest(LOGICAL,20)@14
    invExpXIsMax_uid21_fpMulTest_q <= not (redist23_expXIsMax_uid16_fpMulTest_q_14_q);

    -- InvExpXIsZero_uid22_fpMulTest(LOGICAL,21)@14
    InvExpXIsZero_uid22_fpMulTest_q <= not (redist24_excZ_x_uid15_fpMulTest_q_14_q);

    -- excR_x_uid23_fpMulTest(LOGICAL,22)@14
    excR_x_uid23_fpMulTest_q <= InvExpXIsZero_uid22_fpMulTest_q and invExpXIsMax_uid21_fpMulTest_q;

    -- ExcROvfAndInReg_uid84_fpMulTest(LOGICAL,83)@14 + 1
    ExcROvfAndInReg_uid84_fpMulTest_qi <= excR_x_uid23_fpMulTest_q and excR_y_uid37_fpMulTest_q and expOvf_uid75_fpMulTest_n;
    ExcROvfAndInReg_uid84_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => ExcROvfAndInReg_uid84_fpMulTest_qi, xout => ExcROvfAndInReg_uid84_fpMulTest_q, clk => clk, aclr => areset, ena => '1' );

    -- excYRAndExcXI_uid83_fpMulTest(LOGICAL,82)@14 + 1
    excYRAndExcXI_uid83_fpMulTest_qi <= excR_y_uid37_fpMulTest_q and excI_x_uid19_fpMulTest_q;
    excYRAndExcXI_uid83_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => excYRAndExcXI_uid83_fpMulTest_qi, xout => excYRAndExcXI_uid83_fpMulTest_q, clk => clk, aclr => areset, ena => '1' );

    -- excXRAndExcYI_uid82_fpMulTest(LOGICAL,81)@14 + 1
    excXRAndExcYI_uid82_fpMulTest_qi <= excR_x_uid23_fpMulTest_q and excI_y_uid33_fpMulTest_q;
    excXRAndExcYI_uid82_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => excXRAndExcYI_uid82_fpMulTest_qi, xout => excXRAndExcYI_uid82_fpMulTest_q, clk => clk, aclr => areset, ena => '1' );

    -- excXIAndExcYI_uid81_fpMulTest(LOGICAL,80)@14 + 1
    excXIAndExcYI_uid81_fpMulTest_qi <= excI_x_uid19_fpMulTest_q and excI_y_uid33_fpMulTest_q;
    excXIAndExcYI_uid81_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => excXIAndExcYI_uid81_fpMulTest_qi, xout => excXIAndExcYI_uid81_fpMulTest_q, clk => clk, aclr => areset, ena => '1' );

    -- excRInf_uid85_fpMulTest(LOGICAL,84)@15
    excRInf_uid85_fpMulTest_q <= excXIAndExcYI_uid81_fpMulTest_q or excXRAndExcYI_uid82_fpMulTest_q or excYRAndExcXI_uid83_fpMulTest_q or ExcROvfAndInReg_uid84_fpMulTest_q;

    -- expUdf_uid73_fpMulTest(COMPARE,72)@14
    expUdf_uid73_fpMulTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0000000000000000" & GND_q));
    expUdf_uid73_fpMulTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 15 => redist13_expRPreExcExt_uid71_fpMulTest_b_1_q(14)) & redist13_expRPreExcExt_uid71_fpMulTest_b_1_q));
    expUdf_uid73_fpMulTest_o <= STD_LOGIC_VECTOR(SIGNED(expUdf_uid73_fpMulTest_a) - SIGNED(expUdf_uid73_fpMulTest_b));
    expUdf_uid73_fpMulTest_n(0) <= not (expUdf_uid73_fpMulTest_o(16));

    -- excZC3_uid79_fpMulTest(LOGICAL,78)@14 + 1
    excZC3_uid79_fpMulTest_qi <= excR_x_uid23_fpMulTest_q and excR_y_uid37_fpMulTest_q and expUdf_uid73_fpMulTest_n;
    excZC3_uid79_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => excZC3_uid79_fpMulTest_qi, xout => excZC3_uid79_fpMulTest_q, clk => clk, aclr => areset, ena => '1' );

    -- excYZAndExcXR_uid78_fpMulTest(LOGICAL,77)@14 + 1
    excYZAndExcXR_uid78_fpMulTest_qi <= redist22_excZ_y_uid29_fpMulTest_q_14_q and excR_x_uid23_fpMulTest_q;
    excYZAndExcXR_uid78_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => excYZAndExcXR_uid78_fpMulTest_qi, xout => excYZAndExcXR_uid78_fpMulTest_q, clk => clk, aclr => areset, ena => '1' );

    -- excXZAndExcYR_uid77_fpMulTest(LOGICAL,76)@14 + 1
    excXZAndExcYR_uid77_fpMulTest_qi <= redist24_excZ_x_uid15_fpMulTest_q_14_q and excR_y_uid37_fpMulTest_q;
    excXZAndExcYR_uid77_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => excXZAndExcYR_uid77_fpMulTest_qi, xout => excXZAndExcYR_uid77_fpMulTest_q, clk => clk, aclr => areset, ena => '1' );

    -- excXZAndExcYZ_uid76_fpMulTest(LOGICAL,75)@14 + 1
    excXZAndExcYZ_uid76_fpMulTest_qi <= redist24_excZ_x_uid15_fpMulTest_q_14_q and redist22_excZ_y_uid29_fpMulTest_q_14_q;
    excXZAndExcYZ_uid76_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => excXZAndExcYZ_uid76_fpMulTest_qi, xout => excXZAndExcYZ_uid76_fpMulTest_q, clk => clk, aclr => areset, ena => '1' );

    -- excRZero_uid80_fpMulTest(LOGICAL,79)@15
    excRZero_uid80_fpMulTest_q <= excXZAndExcYZ_uid76_fpMulTest_q or excXZAndExcYR_uid77_fpMulTest_q or excYZAndExcXR_uid78_fpMulTest_q or excZC3_uid79_fpMulTest_q;

    -- concExc_uid90_fpMulTest(BITJOIN,89)@15
    concExc_uid90_fpMulTest_q <= excRNaN_uid89_fpMulTest_q & excRInf_uid85_fpMulTest_q & excRZero_uid80_fpMulTest_q;

    -- excREnc_uid91_fpMulTest(LOOKUP,90)@15 + 1
    excREnc_uid91_fpMulTest_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                excREnc_uid91_fpMulTest_q <= "01";
            ELSE
                CASE (concExc_uid90_fpMulTest_q) IS
                    WHEN "000" => excREnc_uid91_fpMulTest_q <= "01";
                    WHEN "001" => excREnc_uid91_fpMulTest_q <= "00";
                    WHEN "010" => excREnc_uid91_fpMulTest_q <= "10";
                    WHEN "011" => excREnc_uid91_fpMulTest_q <= "00";
                    WHEN "100" => excREnc_uid91_fpMulTest_q <= "11";
                    WHEN "101" => excREnc_uid91_fpMulTest_q <= "00";
                    WHEN "110" => excREnc_uid91_fpMulTest_q <= "00";
                    WHEN "111" => excREnc_uid91_fpMulTest_q <= "00";
                    WHEN OTHERS => -- unreachable
                                   excREnc_uid91_fpMulTest_q <= (others => '-');
                END CASE;
            END IF;
        END IF;
    END PROCESS;

    -- expRPostExc_uid100_fpMulTest(MUX,99)@16
    expRPostExc_uid100_fpMulTest_s <= excREnc_uid91_fpMulTest_q;
    expRPostExc_uid100_fpMulTest_combproc: PROCESS (expRPostExc_uid100_fpMulTest_s, cstAllZWE_uid12_fpMulTest_q, redist12_expRPreExc_uid72_fpMulTest_b_2_q, cstAllOWE_uid10_fpMulTest_q)
    BEGIN
        CASE (expRPostExc_uid100_fpMulTest_s) IS
            WHEN "00" => expRPostExc_uid100_fpMulTest_q <= cstAllZWE_uid12_fpMulTest_q;
            WHEN "01" => expRPostExc_uid100_fpMulTest_q <= redist12_expRPreExc_uid72_fpMulTest_b_2_q;
            WHEN "10" => expRPostExc_uid100_fpMulTest_q <= cstAllOWE_uid10_fpMulTest_q;
            WHEN "11" => expRPostExc_uid100_fpMulTest_q <= cstAllOWE_uid10_fpMulTest_q;
            WHEN OTHERS => expRPostExc_uid100_fpMulTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- oneFracRPostExc2_uid92_fpMulTest(CONSTANT,91)
    oneFracRPostExc2_uid92_fpMulTest_q <= "0000000000000000000000000000000000000000000000000001";

    -- fracRPreExc_uid70_fpMulTest(BITSELECT,69)@13
    fracRPreExc_uid70_fpMulTest_in <= expFracRPostRounding_uid69_fpMulTest_q(52 downto 0);
    fracRPreExc_uid70_fpMulTest_b <= fracRPreExc_uid70_fpMulTest_in(52 downto 1);

    -- redist14_fracRPreExc_uid70_fpMulTest_b_3(DELAY,270)
    redist14_fracRPreExc_uid70_fpMulTest_b_3_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist14_fracRPreExc_uid70_fpMulTest_b_3_delay_0 <= (others => '0');
                redist14_fracRPreExc_uid70_fpMulTest_b_3_delay_1 <= (others => '0');
                redist14_fracRPreExc_uid70_fpMulTest_b_3_q <= (others => '0');
            ELSE
                redist14_fracRPreExc_uid70_fpMulTest_b_3_delay_0 <= STD_LOGIC_VECTOR(fracRPreExc_uid70_fpMulTest_b);
                redist14_fracRPreExc_uid70_fpMulTest_b_3_delay_1 <= redist14_fracRPreExc_uid70_fpMulTest_b_3_delay_0;
                redist14_fracRPreExc_uid70_fpMulTest_b_3_q <= redist14_fracRPreExc_uid70_fpMulTest_b_3_delay_1;
            END IF;
        END IF;
    END PROCESS;

    -- fracRPostExc_uid95_fpMulTest(MUX,94)@16
    fracRPostExc_uid95_fpMulTest_s <= excREnc_uid91_fpMulTest_q;
    fracRPostExc_uid95_fpMulTest_combproc: PROCESS (fracRPostExc_uid95_fpMulTest_s, cstZeroWF_uid11_fpMulTest_q, redist14_fracRPreExc_uid70_fpMulTest_b_3_q, oneFracRPostExc2_uid92_fpMulTest_q)
    BEGIN
        CASE (fracRPostExc_uid95_fpMulTest_s) IS
            WHEN "00" => fracRPostExc_uid95_fpMulTest_q <= cstZeroWF_uid11_fpMulTest_q;
            WHEN "01" => fracRPostExc_uid95_fpMulTest_q <= redist14_fracRPreExc_uid70_fpMulTest_b_3_q;
            WHEN "10" => fracRPostExc_uid95_fpMulTest_q <= cstZeroWF_uid11_fpMulTest_q;
            WHEN "11" => fracRPostExc_uid95_fpMulTest_q <= oneFracRPostExc2_uid92_fpMulTest_q;
            WHEN OTHERS => fracRPostExc_uid95_fpMulTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- R_uid103_fpMulTest(BITJOIN,102)@16
    R_uid103_fpMulTest_q <= signRPostExc_uid102_fpMulTest_q & expRPostExc_uid100_fpMulTest_q & fracRPostExc_uid95_fpMulTest_q;

    -- xOut(GPOUT,4)@16
    q <= R_uid103_fpMulTest_q;

END normal;
