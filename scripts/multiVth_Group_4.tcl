proc create_priority_list {} {
    set all_cells [get_cells]
    set priority_list [list]
    foreach_in_collection cell $all_cells {
        set this_cell_list [list $cell]
        set this_wrst_path [get_timing_paths -through $cell -slack_greater_than 0.0 -nworst 1]
        set this_slack [get_attribute $this_wrst_path slack]
        lappend this_cell_list $this_slack
        lappend priority_list $this_cell_list

    }
    set priority_list [lsort -index 1 -real $priority_list]
    return $priority_list
}

proc swap_vt {cell original_vt new_vt} {
    set library_name "CORE65LP${new_vt}VT"
    set ref_name [get_attribute $cell ref_name]
    regsub "_L${original_vt}" $ref_name "_L${new_vt}" new_ref_name
    size_cell $cell "${library_name}/${new_ref_name}"

    return
}

proc binary_swap {original_vt new_vt} {
    # case 1 swap L to H then L to S
    # case 2 swap L to S then S to H
    # if the number of swaps in the current cycle is 0, return
    set priority_list [create_priority_list]
    set percentage 0.5
    set vt_cells [get_cells -quiet -filter "lib_cell.threshold_voltage_group == $original_vt\VT"]
    set num_cells [sizeof_collection $vt_cells]
    set num_swaps [expr {int($num_cells * $percentage)}]
    while {$num_swaps > 0} {
        set success 0
        set swapped_cells [list]
        ##########################################################################
        #                          LOGIC FOR SWAPPING                            #
        ##########################################################################
        # swap $num_swaps cells according to priority list
        # update swapped_cells list

        # call this to update the timing of the combinational circuit (recalculate slack foreach cell)
        update_timing -full
        # get critical path with slack lesser than 0
        # if no such path exists, set success to 1


        if {$success} {
            set percentage [expr {$percentage + ($percentage / 2)}]
            # update priority_list
            set priority_list [create_priority_list]
        }
        else {
            # revert operations using swapped_cells list
            set percentage [expr {$percentage - ($percentage / 2)}]
            # i think there's no need to update timing again in this case since we're reverting the operations
        }
        # update next cycle's number of swaps
        set num_swaps [expr {int($num_cells * $percentage)}]
    }
    return
}


proc multiVth {} {
    set lvt_cells [get_cells -quiet -filter "lib_cell.threshold_voltage_group == LVT"]
    if {0} {
        # stupid Valentino solution
        set C 100
        for {set i 0} {$i < $C} {incr i} {
            set cell [index_collection $lvt_cells $i]
            swap_vt $cell "L" "H"
        }
    }
    return 1
}

# proc get_cells_in_path_test {} {
#     set path [get_timing_paths -nworst 1 -slack_greater_than 0.0]
#     set timing_points [get_attribute $path points]
#     foreach_in_collection timing_point $timing_points {
#         set timing_point_object [get_attribute $timing_point object]
#         set timing_point_object_class [get_attribute $timing_point_object object_class]
#         set port_pin [get_attribute $timing_point_object full_name]
#         set cells_name_list [get_cells -of_objects $port_pin]
#         puts "$timing_point_object_class $port_pin"
#         foreach_in_collection cell $cells_name_list {
#             set cell_ref_name [get_attribute $cell ref_name]
#             set cell_full_name [get_attribute $cell full_name]
#             puts "    FULL_NAME: $cell_full_name REF_NAME: $cell_ref_name"
#         }
#         puts "---------------"
#     }
#     return
# }
