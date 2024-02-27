
namespace eval float64_sqrt {
  proc get_design_libraries {} {
    set libraries [dict create]
    dict set libraries altera_fp_functions_191 1
    dict set libraries float64_sqrt            1
    return $libraries
  }
  
  proc get_memory_files {QSYS_SIMDIR} {
    set memory_files [list]
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../altera_fp_functions_191/sim/float64_sqrt_altera_fp_functions_191_eshpdly_memoryC2_uid70_sqrtTables_lutmem.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../altera_fp_functions_191/sim/float64_sqrt_altera_fp_functions_191_eshpdly_memoryC5_uid79_sqrtTables_lutmem.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../altera_fp_functions_191/sim/float64_sqrt_altera_fp_functions_191_eshpdly_memoryC1_uid67_sqrtTables_lutmem.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../altera_fp_functions_191/sim/float64_sqrt_altera_fp_functions_191_eshpdly_memoryC4_uid76_sqrtTables_lutmem.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../altera_fp_functions_191/sim/float64_sqrt_altera_fp_functions_191_eshpdly_memoryC0_uid62_sqrtTables_lutmem.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../altera_fp_functions_191/sim/float64_sqrt_altera_fp_functions_191_eshpdly_memoryC3_uid73_sqrtTables_lutmem.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../altera_fp_functions_191/sim/float64_sqrt_altera_fp_functions_191_eshpdly_memoryC1_uid66_sqrtTables_lutmem.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../altera_fp_functions_191/sim/float64_sqrt_altera_fp_functions_191_eshpdly_memoryC0_uid63_sqrtTables_lutmem.hex"]"
    return $memory_files
  }
  
  proc get_common_design_files {USER_DEFINED_COMPILE_OPTIONS USER_DEFINED_VERILOG_COMPILE_OPTIONS USER_DEFINED_VHDL_COMPILE_OPTIONS QSYS_SIMDIR} {
    set design_files [dict create]
    return $design_files
  }
  
  proc get_design_files {USER_DEFINED_COMPILE_OPTIONS USER_DEFINED_VERILOG_COMPILE_OPTIONS USER_DEFINED_VHDL_COMPILE_OPTIONS QSYS_SIMDIR} {
    set design_files [list]
    lappend design_files "vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_fp_functions_191/sim/dspba_library_package.vhd"]\"  -work altera_fp_functions_191"                       
    lappend design_files "vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_fp_functions_191/sim/dspba_library.vhd"]\"  -work altera_fp_functions_191"                               
    lappend design_files "vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_fp_functions_191/sim/float64_sqrt_altera_fp_functions_191_eshpdly.vhd"]\"  -work altera_fp_functions_191"
    lappend design_files "vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/float64_sqrt.vhd"]\"  -work float64_sqrt"                                                                          
    return $design_files
  }
  
  proc get_elab_options {SIMULATOR_TOOL_BITNESS} {
    set ELAB_OPTIONS ""
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    append ELAB_OPTIONS { -t fs}
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
  
  
  proc normalize_path {FILEPATH} {
      if {[catch { package require fileutil } err]} { 
          return $FILEPATH 
      } 
      set path [fileutil::lexnormalize [file join [pwd] $FILEPATH]]  
      if {[file pathtype $FILEPATH] eq "relative"} { 
          set path [fileutil::relative [pwd] $path] 
      } 
      return $path 
  } 
}
