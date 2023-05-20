# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
namespace eval ::optrace {
  variable script "/media/psf/TAUV-Playground/zybo-z7-tdoa/zybo-z7-tdoa/zybo-z7-tdoa.runs/synth_1/tdoa.tcl"
  variable category "vivado_synth"
}

# Try to connect to running dispatch if we haven't done so already.
# This code assumes that the Tcl interpreter is not using threads,
# since the ::dispatch::connected variable isn't mutex protected.
if {![info exists ::dispatch::connected]} {
  namespace eval ::dispatch {
    variable connected false
    if {[llength [array get env XILINX_CD_CONNECT_ID]] > 0} {
      set result "true"
      if {[catch {
        if {[lsearch -exact [package names] DispatchTcl] < 0} {
          set result [load librdi_cd_clienttcl[info sharedlibextension]] 
        }
        if {$result eq "false"} {
          puts "WARNING: Could not load dispatch client library"
        }
        set connect_id [ ::dispatch::init_client -mode EXISTING_SERVER ]
        if { $connect_id eq "" } {
          puts "WARNING: Could not initialize dispatch client"
        } else {
          puts "INFO: Dispatch client connection id - $connect_id"
          set connected true
        }
      } catch_res]} {
        puts "WARNING: failed to connect to dispatch server - $catch_res"
      }
    }
  }
}
if {$::dispatch::connected} {
  # Remove the dummy proc if it exists.
  if { [expr {[llength [info procs ::OPTRACE]] > 0}] } {
    rename ::OPTRACE ""
  }
  proc ::OPTRACE { task action {tags {} } } {
    ::vitis_log::op_trace "$task" $action -tags $tags -script $::optrace::script -category $::optrace::category
  }
  # dispatch is generic. We specifically want to attach logging.
  ::vitis_log::connect_client
} else {
  # Add dummy proc if it doesn't exist.
  if { [expr {[llength [info procs ::OPTRACE]] == 0}] } {
    proc ::OPTRACE {{arg1 \"\" } {arg2 \"\"} {arg3 \"\" } {arg4 \"\"} {arg5 \"\" } {arg6 \"\"}} {
        # Do nothing
    }
  }
}

proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
OPTRACE "synth_1" START { ROLLUP_AUTO }
set_msg_config -id {HDL-1065} -limit 10000
set_msg_config  -id {[Timing 38-191]}  -suppress 
set_msg_config  -id {[Common 17-14]}  -suppress 
set_msg_config  -id {[Timing 38-91]}  -suppress 
set_msg_config  -id {[Timing 38-35]}  -suppress 
set_msg_config  -id {[Timing 38-78]}  -suppress 
set_msg_config  -id {[Timing 38-314]}  -suppress 
set_msg_config  -id {[Timing 38-102]}  -suppress 
set_msg_config  -id {[Timing 38-164]}  -suppress 
set_msg_config  -id {[Timing 38-127]}  -suppress 
set_msg_config  -id {[Timing 38-3]}  -suppress 
OPTRACE "Creating in-memory project" START { }
create_project -in_memory -part xc7z020clg400-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir /media/psf/TAUV-Playground/zybo-z7-tdoa/zybo-z7-tdoa/zybo-z7-tdoa.cache/wt [current_project]
set_property parent.project_path /media/psf/TAUV-Playground/zybo-z7-tdoa/zybo-z7-tdoa/zybo-z7-tdoa.xpr [current_project]
set_property XPM_LIBRARIES {XPM_CDC XPM_FIFO XPM_MEMORY} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property board_part digilentinc.com:zybo-z7-20:part0:1.1 [current_project]
set_property ip_repo_paths {
  /media/psf/TAUV-Playground/zybo-z7-tdoa/ip_repo/axi_xadc_sampler_1_0
  /media/psf/TAUV-Playground/zybo-z7-tdoa/ip_repo/axi_fsk_sdft_1_0
  /media/psf/TAUV-Playground/zybo-z7-tdoa/ip_repo/axi_channel_demux
  /media/psf/TAUV-Playground/zybo-z7-tdoa/ip_repo/axi_fsk_demod
  /media/psf/TAUV-Playground/zybo-z7-tdoa/ip_repo/led_debug
  /media/psf/TAUV-Playground/zybo-z7-tdoa/ip_repo/edge_detector
} [current_project]
update_ip_catalog
set_property ip_output_repo /media/psf/TAUV-Playground/zybo-z7-tdoa/zybo-z7-tdoa/zybo-z7-tdoa.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
OPTRACE "Creating in-memory project" END { }
OPTRACE "Adding files" START { }
read_verilog -library xil_defaultlib /media/psf/TAUV-Playground/zybo-z7-tdoa/zybo-z7-tdoa/zybo-z7-tdoa.gen/sources_1/bd/tdoa/hdl/tdoa_wrapper.v
add_files /media/psf/TAUV-Playground/zybo-z7-tdoa/zybo-z7-tdoa/zybo-z7-tdoa.srcs/sources_1/bd/tdoa/tdoa.bd
set_property used_in_implementation false [get_files -all /media/psf/TAUV-Playground/zybo-z7-tdoa/zybo-z7-tdoa/zybo-z7-tdoa.gen/sources_1/bd/tdoa/ip/tdoa_processing_system7_0_2/tdoa_processing_system7_0_2.xdc]
set_property used_in_implementation false [get_files -all /media/psf/TAUV-Playground/zybo-z7-tdoa/zybo-z7-tdoa/zybo-z7-tdoa.gen/sources_1/bd/tdoa/ip/tdoa_proc_sys_reset_0_0/tdoa_proc_sys_reset_0_0_board.xdc]
set_property used_in_implementation false [get_files -all /media/psf/TAUV-Playground/zybo-z7-tdoa/zybo-z7-tdoa/zybo-z7-tdoa.gen/sources_1/bd/tdoa/ip/tdoa_proc_sys_reset_0_0/tdoa_proc_sys_reset_0_0.xdc]
set_property used_in_implementation false [get_files -all /media/psf/TAUV-Playground/zybo-z7-tdoa/zybo-z7-tdoa/zybo-z7-tdoa.gen/sources_1/bd/tdoa/ip/tdoa_axi_xadc_sampler_0_3/src/xadc_wiz_0_3/xadc_wiz_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /media/psf/TAUV-Playground/zybo-z7-tdoa/zybo-z7-tdoa/zybo-z7-tdoa.gen/sources_1/bd/tdoa/ip/tdoa_axi_xadc_sampler_0_3/src/xadc_wiz_0_3/xadc_wiz_0.xdc]
set_property used_in_implementation false [get_files -all /media/psf/TAUV-Playground/zybo-z7-tdoa/zybo-z7-tdoa/zybo-z7-tdoa.gen/sources_1/bd/tdoa/ip/tdoa_axis_broadcaster_0_0/tdoa_axis_broadcaster_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /media/psf/TAUV-Playground/zybo-z7-tdoa/zybo-z7-tdoa/zybo-z7-tdoa.gen/sources_1/bd/tdoa/ip/tdoa_axis_broadcaster_0_1/tdoa_axis_broadcaster_0_1_ooc.xdc]
set_property used_in_implementation false [get_files -all /media/psf/TAUV-Playground/zybo-z7-tdoa/zybo-z7-tdoa/zybo-z7-tdoa.gen/sources_1/bd/tdoa/ip/tdoa_axis_broadcaster_0_2/tdoa_axis_broadcaster_0_2_ooc.xdc]
set_property used_in_implementation false [get_files -all /media/psf/TAUV-Playground/zybo-z7-tdoa/zybo-z7-tdoa/zybo-z7-tdoa.gen/sources_1/bd/tdoa/ip/tdoa_axis_broadcaster_0_3/tdoa_axis_broadcaster_0_3_ooc.xdc]
set_property used_in_synthesis false [get_files -all /media/psf/TAUV-Playground/zybo-z7-tdoa/zybo-z7-tdoa/zybo-z7-tdoa.gen/sources_1/bd/tdoa/ip/tdoa_system_ila_0_1/bd_0/ip/ip_0/ila_v6_2/constraints/ila_impl.xdc]
set_property used_in_implementation false [get_files -all /media/psf/TAUV-Playground/zybo-z7-tdoa/zybo-z7-tdoa/zybo-z7-tdoa.gen/sources_1/bd/tdoa/ip/tdoa_system_ila_0_1/bd_0/ip/ip_0/ila_v6_2/constraints/ila_impl.xdc]
set_property used_in_implementation false [get_files -all /media/psf/TAUV-Playground/zybo-z7-tdoa/zybo-z7-tdoa/zybo-z7-tdoa.gen/sources_1/bd/tdoa/ip/tdoa_system_ila_0_1/bd_0/ip/ip_0/ila_v6_2/constraints/ila.xdc]
set_property used_in_implementation false [get_files -all /media/psf/TAUV-Playground/zybo-z7-tdoa/zybo-z7-tdoa/zybo-z7-tdoa.gen/sources_1/bd/tdoa/ip/tdoa_system_ila_0_1/bd_0/ip/ip_0/bd_a434_ila_lib_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /media/psf/TAUV-Playground/zybo-z7-tdoa/zybo-z7-tdoa/zybo-z7-tdoa.gen/sources_1/bd/tdoa/ip/tdoa_system_ila_0_1/bd_0/bd_a434_ooc.xdc]
set_property used_in_implementation false [get_files -all /media/psf/TAUV-Playground/zybo-z7-tdoa/zybo-z7-tdoa/zybo-z7-tdoa.gen/sources_1/bd/tdoa/ip/tdoa_system_ila_0_1/tdoa_system_ila_0_1_ooc.xdc]
set_property used_in_implementation false [get_files -all /media/psf/TAUV-Playground/zybo-z7-tdoa/zybo-z7-tdoa/zybo-z7-tdoa.gen/sources_1/bd/tdoa/ip/tdoa_auto_pc_1/tdoa_auto_pc_1_ooc.xdc]
set_property used_in_implementation false [get_files -all /media/psf/TAUV-Playground/zybo-z7-tdoa/zybo-z7-tdoa/zybo-z7-tdoa.gen/sources_1/bd/tdoa/ip/tdoa_auto_pc_0/tdoa_auto_pc_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /media/psf/TAUV-Playground/zybo-z7-tdoa/zybo-z7-tdoa/zybo-z7-tdoa.gen/sources_1/bd/tdoa/tdoa_ooc.xdc]

OPTRACE "Adding files" END { }
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc /media/psf/TAUV-Playground/zybo-z7-tdoa/zybo-z7-tdoa/zybo-z7-tdoa.srcs/constrs_1/imports/digilent-xdc-master/Zybo-Z7-Master.xdc
set_property used_in_implementation false [get_files /media/psf/TAUV-Playground/zybo-z7-tdoa/zybo-z7-tdoa/zybo-z7-tdoa.srcs/constrs_1/imports/digilent-xdc-master/Zybo-Z7-Master.xdc]

read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]
set_param ips.enableIPCacheLiteLoad 1

read_checkpoint -auto_incremental -incremental /media/psf/TAUV-Playground/zybo-z7-tdoa/zybo-z7-tdoa/zybo-z7-tdoa.srcs/utils_1/imports/synth_1/tdoa.dcp
close [open __synthesis_is_running__ w]

OPTRACE "synth_design" START { }
synth_design -top tdoa -part xc7z020clg400-1
OPTRACE "synth_design" END { }
if { [get_msg_config -count -severity {CRITICAL WARNING}] > 0 } {
 send_msg_id runtcl-6 info "Synthesis results are not added to the cache due to CRITICAL_WARNING"
}


OPTRACE "write_checkpoint" START { CHECKPOINT }
# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef tdoa.dcp
OPTRACE "write_checkpoint" END { }
OPTRACE "synth reports" START { REPORT }
create_report "synth_1_synth_report_utilization_0" "report_utilization -file tdoa_utilization_synth.rpt -pb tdoa_utilization_synth.pb"
OPTRACE "synth reports" END { }
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
OPTRACE "synth_1" END { }
