##	+----------------------------------------------------------------
##	|		 Synthesis and Optimization of Digital Systems			|
##	|				Politecnico di Torino - TO - Italy				|
##	|						DAUIN - EDA GROUP						|
##	+----------------------------------------------------------------
##	|	author: Valentino Peluso									|
##	|	mail:	valentino.peluso@polito.it							|
##	|	title:	pt_contest.tcl										|
##	+----------------------------------------------------------------
##	| 	Copyright 2024 DAUIN - EDA GROUP							|
##	+----------------------------------------------------------------

######################################################################
##
## SPECIFY LIBRARIES
##
######################################################################

# SOURCE SETUP FILE
source "./tech/STcmos65/synopsys_pt.setup"

# DEFINE OPTIONS
set report_default_significant_digits 6
set power_enable_analysis true
set timing_save_pin_arrival_and_slack true

# SUPPRESS WARNING MESSAGES
suppress_message RC-004
suppress_message PTE-003
suppress_message UID-401
suppress_message ENV-003
suppress_message UITE-489
suppress_message CMD-041
suppress_message NED-045
suppress_message LNK-041
suppress_message UITE-502
suppress_message PTE-139
suppress_message PTE-018
suppress_message PWR-246
suppress_message PWR-601
suppress_message PWR-602

######################################################################
##
## READ DESIGN
##
######################################################################
# DEFINE CIRCUITS
set blockName "c1908"
# set blockName "c5315"

# DEFINE INPUT FILES
set dir "./saved/${blockName}_2.0/synthesis"
# set dir "./saved/${blockName}_1.5/synthesis"
# set dir "./saved/${blockName}_1.0/synthesis"
set in_verilog_filename "${dir}/${blockName}_postsyn.v"
set in_sdc_filename "${dir}/${blockName}_postsyn.sdc"

# READ
read_verilog $in_verilog_filename
read_sdc -version 1.3 $in_sdc_filename

update_timing -full

######################################################################
##
## MULTI-VTH OPTIMIZATION
##
######################################################################

set_user_attribute [find library CORE65LPLVT] default_threshold_voltage_group LVT
set_user_attribute [find library CORE65LPSVT] default_threshold_voltage_group SVT
set_user_attribute [find library CORE65LPHVT] default_threshold_voltage_group HVT

set leakage_initial [get_attribute [current_design] leakage_power]

set original_cells ""
foreach_in_collection cell [get_cells] {
    set full_name [get_attribute $cell full_name]
    set ref_name [get_attribute $cell ref_name]
    lappend original_cells "$full_name $ref_name"
}

# Run multiVth assignment
# Please, replace N with the Group ID
source ./scripts/multiVth_Group_N.tcl
set start_time [clock milliseconds]
multiVth
set end_time [clock milliseconds]

# Force full timing update
update_timing -full

# Check: The slack of the most critical path of the circuit is positive (>= 0).
set wrt_slack [get_attribute [get_timing_paths] slack]

if {$wrt_slack < 0} {
    error "Slack is negative: $wrt_slack"
} else {
    puts "(OK) Slack is positive: $wrt_slack"
}

# Check: Logic gates must mantain the same cell footprint, i.e., same size and area as before optimization.
foreach cell_footprint $original_cells {
    set full_name [lindex $cell_footprint 0]
    set original_ref_name [lindex $cell_footprint 1]
    set cell [get_cell $full_name]
    set ref_name [get_attribute $cell ref_name]
    regsub -all {_L[HS]} $ref_name "_LL" ref_name
    if {($original_ref_name eq $ref_name) == 0} {
        error "The cell $full_name has a different footprint."
    }
}

puts "(OK) All the cells mantained the same footprint."

set run_time [expr ($end_time - $start_time) / 1000.0]

if {$run_time > 180.0} {
    error "Maximum Optimization Run Time exceeded: ${run_time}s."
} 
puts "(OK) Optimization Run Time: ${run_time}s."

# Reporting
report_threshold_voltage_group
set leakage_final [get_attribute [current_design] leakage_power]
set savings [expr {100 * ($leakage_initial - $leakage_final) / $leakage_initial}]

puts "Leakage Power Savings=$savings %"

######################################################################
##
## EXIT
##
######################################################################

exit
