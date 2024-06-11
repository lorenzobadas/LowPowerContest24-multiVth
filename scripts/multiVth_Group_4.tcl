proc get_cells_in_path {path} {
    set timing_points [get_attribute $path points]
    set result_cells_list [list]
    set cells_name_list [list]
    foreach_in_collection timing_point $timing_points {
        set timing_point_object [get_attribute $timing_point object]
        set timing_point_object_class [get_attribute $timing_point_object object_class]
        # if timing_point_object_class is pin then get the cell
        if {$timing_point_object_class eq "pin"} {
            set pin [get_attribute $timing_point_object full_name]
            set cells_list [get_cells -of_objects $pin]
            foreach_in_collection cell $cells_list {
                set cell_full_name [get_attribute $cell full_name]
                # if cell is not in the list add it
                if {[lsearch -exact $cells_name_list $cell_full_name] == -1} {
                    lappend cells_name_list $cell_full_name
                    lappend result_cells_list $cell
                }
            }
        }
    }
    return $result_cells_list
}

proc create_priority_list {} {
    # count number of cells
    set all_cells [get_cells]
    set cell_count [sizeof_collection $all_cells]
    set priority_list [list]
    # get $cell_count paths from the worst to the best
    foreach_in_collection path [get_timing_paths -slack_greater_than 0.0 -nworst $cell_count] {
        set new_cells [get_cells_in_path $path]
        foreach cell $new_cells {
            set found 0
            set cell_full_name [get_attribute $cell full_name]
            foreach cell_in_list $priority_list {
                set cell_in_list_full_name [get_attribute $cell_in_list full_name]
                if {$cell_full_name eq $cell_in_list_full_name} {
                    set found 1
                    break
                }
            }
            if {$found == 0} {
                lappend priority_list $cell
            }
        }
        # break if length of priority_list is equal to cell_count
        if {[sizeof_collection $priority_list] == $cell_count} {
            break
        }
    }
    return $priority_list
}

proc swap_vt {cell vt} {
    set library_name "CORE65LP${vt}VT"
    set ref_name [get_attribute $cell ref_name]
    regsub {_LL} $ref_name "_L${vt}" new_ref_name
    size_cell $cell "${library_name}/${new_ref_name}"

    return
}

proc binary_swap {...} {
    # case 1 swap L to H then L to S
    # case 2 swap L to S then S to H

    # call this to update the timing of the combinational circuit (recalculate slack foreach cell)
    # update_timing -full
}


proc multiVth {} {
    set lvt_cells [get_cells -quiet -filter "lib_cell.threshold_voltage_group == LVT"]
    if {0} {
    # stupid Valentino solution
    set C 100
    for {set i 0} {$i < $C} {incr i} {
        set cell [index_collection $lvt_cells $i]
        swap_vt $cell "H"
    }
    }
    return 1
}

proc get_cells_in_path_test {} {
    set path [get_timing_paths -nworst 1 -slack_greater_than 0.0]
    set timing_points [get_attribute $path points]
    foreach_in_collection timing_point $timing_points {
        set timing_point_object [get_attribute $timing_point object]
        set timing_point_object_class [get_attribute $timing_point_object object_class]
        set port_pin [get_attribute $timing_point_object full_name]
        set cells_name_list [get_cells -of_objects $port_pin]
        puts "$timing_point_object_class $port_pin"
        foreach_in_collection cell $cells_name_list {
            set cell_ref_name [get_attribute $cell ref_name]
            set cell_full_name [get_attribute $cell full_name]
            puts "    FULL_NAME: $cell_full_name REF_NAME: $cell_ref_name"
        }
        puts "---------------"
    }
    return
}


set path [get_timing_paths -nworst 1 -slack_greater_than 0.0]
set this_list [get_cells_in_path $path]
foreach cell $this_list {
    set cell_ref_name [get_attribute $cell ref_name]
    set cell_full_name [get_attribute $cell full_name]
    puts "FULL_NAME: $cell_full_name REF_NAME: $cell_ref_name"
}