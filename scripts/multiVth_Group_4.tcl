proc create_priority_list {...} {
    # get attribute slack and sort by it
    # return sorted list
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

    # stupid Valentino solution
    set C 100
    for {set i 0} {$i < $C} {incr i} {
        set cell [index_collection $lvt_cells $i]
        swap_vt $cell "H"
    }
    

    return 1
}