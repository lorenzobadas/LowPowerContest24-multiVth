proc create_priority_list {vt} {
    set all_cells [get_cells -quiet -filter "lib_cell.threshold_voltage_group == ${vt}VT"]
    set priority_list [list]
    foreach_in_collection cell $all_cells {
        set this_cell_list [list $cell]
        set this_wrst_path [get_timing_paths -through $cell]
        set this_slack [get_attribute $this_wrst_path slack]
        lappend this_cell_list $this_slack
        lappend priority_list $this_cell_list

    }
    set priority_list [lsort -index 1 -real $priority_list]
    return [lreverse $priority_list]
}

proc swap_vt {cell original_vt new_vt} {
    set library_name "CORE65LP${new_vt}VT"
    set ref_name [get_attribute $cell ref_name]
    regsub "_L${original_vt}" $ref_name "_L${new_vt}" new_ref_name
    size_cell $cell "${library_name}/${new_ref_name}"
    return
}

proc binary_swap {original_vt new_vt} {
    # if the number of swaps in the current cycle is 0, return
    set priority_list [create_priority_list $original_vt]
    set percentage 0.5
    set vt_cells [get_cells -quiet -filter "lib_cell.threshold_voltage_group == ${original_vt}VT"]
    set num_cells [sizeof_collection $vt_cells]
    set num_swaps [expr {int($num_cells * $percentage)}]
    while {$num_swaps > 0} {
        set success 0
        set swapped_cells [list]
        ##########################################################################
        #                          LOGIC FOR SWAPPING                            #
        ##########################################################################
        # swap $num_swaps cells according to priority list
        for {set i 0} {$i < $num_swaps} {incr i} {
            set cell [lindex [lindex $priority_list $i] 0]
            swap_vt $cell $original_vt $new_vt
            # update swapped_cells list
            lappend swapped_cells $cell
        }

        # call this to update the timing of the combinational circuit (recalculate slack foreach cell)
        update_timing -full
        # get critical path with slack lesser than 0
        # if no such path exists, set success to 1
        set result_timing [get_timing_paths -slack_lesser_than 0.0 -max_paths 1]
        if {[sizeof_collection $result_timing] == 0} {
            set success 1
        }

        if {$success} {
            # update priority_list
            set priority_list [create_priority_list $original_vt]
        } else {
            # revert operations using swapped_cells list
            for {set i 0} {$i < $num_swaps} {incr i} {
                set cell [lindex $swapped_cells $i]
                swap_vt $cell $new_vt $original_vt
            }
        }
        # update next cycle's number of swaps
        set percentage [expr {$percentage / 2}]
        set num_swaps [expr {int($num_cells * $percentage)}]
    }
    return
}

proc linear_swap {step original_vt new_vt max_consecutive_fails} {
    set priority_list [create_priority_list $original_vt]
    set num_cells [llength $priority_list]
    set consecutive_fails 0
    set skipped_cells 0
    while {$skipped_cells < $num_cells} {
        set success 0
        set swapped_cells [list]
        for {set i $skipped_cells} {$i < [expr {$skipped_cells + $step}]} {incr i} {
            if {$i >= $num_cells} {
                break
            }
            set cell [lindex [lindex $priority_list $i] 0]
            swap_vt $cell $original_vt $new_vt
            lappend swapped_cells $cell
        }
        update_timing -full
        set result_timing [get_timing_paths -slack_lesser_than 0.0 -max_paths 1]
        if {[sizeof_collection $result_timing] == 0} {
            set success 1
        }

        if {$success} {
            # update priority_list
            set consecutive_fails 0
            set priority_list [create_priority_list $original_vt]
            set num_cells [llength $priority_list]
            set skipped_cells 0
        } else {
            # revert operations using swapped_cells list
            for {set i 0} {$i < [llength $swapped_cells]} {incr i} {
                set cell [lindex $swapped_cells $i]
                swap_vt $cell $new_vt $original_vt
            }
            # update consecutive_fails
            incr consecutive_fails
            if {$consecutive_fails == $max_consecutive_fails} {
                break
            }
            # set skipped_cells [expr {$skipped_cells + $step}]
            set skipped_cells [expr {$skipped_cells + int($step * 0.5)}]
        }
        # # print debug info
        # puts "num_cells: $num_cells skipped_cells: $skipped_cells"
        # puts "step: $step"
        # puts "consecutive_fails: $consecutive_fails, max_consecutive_fails: $max_consecutive_fails"
        # puts "------------------------------------------------"
    }
}

proc logarithmic_decrease {start_value n end_value} {
    set log_sequence {}
    
    set log_start [expr {log($start_value) / log(10)}]
    set log_end [expr {log($end_value) / log(10)}]
    
    for {set i 0} {$i < $n} {incr i} {
        set t [expr {$i / double($n - 1)}]
        set log_val [expr {pow(10, (1 - $t) * $log_start + $t * $log_end)}]
        lappend log_sequence [expr {int(ceil($log_val))}]
    }
    
    return $log_sequence
}

proc multiVth {} {
    set case1 0

    if {$case1} {
        set original_vt1 L
        set new_vt1 H
        set original_vt2 L
        set new_vt2 S
    } else {
        set original_vt1 L
        set new_vt1 S
        set original_vt2 S
        set new_vt2 H
    }
    binary_swap $original_vt1 $new_vt1
    binary_swap $original_vt2 $new_vt2
    set cells [get_cells]
    set num_cells [sizeof_collection $cells]
    set steps [lrange [logarithmic_decrease $num_cells 9 3] 5 8]
    foreach step $steps {
        linear_swap $step $original_vt1 $new_vt1 15
        linear_swap 15 $original_vt2 $new_vt2 7
    }
    return 1
}
