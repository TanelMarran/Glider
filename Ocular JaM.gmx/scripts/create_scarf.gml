///create_scarf(obj_id,length,distance,movement_speed)

with(instance_create(x,y,obj_scarf)) {
    follow_id = argument0
    segment_left = argument1
    scarf_distance = argument2
    min_movement_speed = argument3
    acc_amount = min_movement_speed
    if other.object_index != object_index {
        scarf_nr = 1
        scarf_total = segment_left+1
    } else {
        scarf_nr = other.scarf_nr+1
        scarf_total = other.scarf_total
    }
    if segment_left != 0 {
        create_scarf(id,segment_left-1,scarf_distance,min_movement_speed)
    }
}
