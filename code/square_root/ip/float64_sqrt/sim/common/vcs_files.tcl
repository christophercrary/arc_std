
namespace eval float64_sqrt {
  proc get_memory_files {QSYS_SIMDIR} {
    set memory_files [list]
    lappend memory_files "$QSYS_SIMDIR/../altera_fp_functions_191/sim/float64_sqrt_altera_fp_functions_191_eshpdly_memoryC2_uid70_sqrtTables_lutmem.hex"
    lappend memory_files "$QSYS_SIMDIR/../altera_fp_functions_191/sim/float64_sqrt_altera_fp_functions_191_eshpdly_memoryC5_uid79_sqrtTables_lutmem.hex"
    lappend memory_files "$QSYS_SIMDIR/../altera_fp_functions_191/sim/float64_sqrt_altera_fp_functions_191_eshpdly_memoryC1_uid67_sqrtTables_lutmem.hex"
    lappend memory_files "$QSYS_SIMDIR/../altera_fp_functions_191/sim/float64_sqrt_altera_fp_functions_191_eshpdly_memoryC4_uid76_sqrtTables_lutmem.hex"
    lappend memory_files "$QSYS_SIMDIR/../altera_fp_functions_191/sim/float64_sqrt_altera_fp_functions_191_eshpdly_memoryC0_uid62_sqrtTables_lutmem.hex"
    lappend memory_files "$QSYS_SIMDIR/../altera_fp_functions_191/sim/float64_sqrt_altera_fp_functions_191_eshpdly_memoryC3_uid73_sqrtTables_lutmem.hex"
    lappend memory_files "$QSYS_SIMDIR/../altera_fp_functions_191/sim/float64_sqrt_altera_fp_functions_191_eshpdly_memoryC1_uid66_sqrtTables_lutmem.hex"
    lappend memory_files "$QSYS_SIMDIR/../altera_fp_functions_191/sim/float64_sqrt_altera_fp_functions_191_eshpdly_memoryC0_uid63_sqrtTables_lutmem.hex"
    return $memory_files
  }
  
  proc get_common_design_files {QSYS_SIMDIR} {
    set design_files [dict create]
    return $design_files
  }
  
  proc get_design_files {QSYS_SIMDIR} {
    set design_files [dict create]
    error "Skipping VCS script generation since VHDL file $QSYS_SIMDIR/../altera_fp_functions_191/sim/dspba_library_package.vhd is required for simulation"
  }
  
  proc get_elab_options {SIMULATOR_TOOL_BITNESS} {
    set ELAB_OPTIONS ""
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $ELAB_OPTIONS
  }
  
  
  proc get_sim_options {SIMULATOR_TOOL_BITNESS} {
    set SIM_OPTIONS ""
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $SIM_OPTIONS
  }
  
  
  proc get_env_variables {SIMULATOR_TOOL_BITNESS} {
    set ENV_VARIABLES [dict create]
    set LD_LIBRARY_PATH [dict create]
    dict set ENV_VARIABLES "LD_LIBRARY_PATH" $LD_LIBRARY_PATH
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $ENV_VARIABLES
  }
  
  
}
