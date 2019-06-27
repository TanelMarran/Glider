///Scarf logic

follow_x = follow_id.x
follow_y = follow_id.y
        
if scarf_nr = 1 {
    with(obj_player) {
        var d = dcos(dir_act)*-60*movement_speed/min_movement_speed
        var bob = 0.9+0.1*dcos(dir_act*2)
        var rx = round(x)
        var ry = round(y)
        var nx = round(rx+dcos(dir_act)*12*movement_speed/min_movement_speed)
        var ny = round(ry-dcos(d)*sprite_get_height(spr_player2)*(bob))
        other.follow_x = nx
        other.follow_y = ny
    }
}

dir = point_direction(other.x,other.y,follow_x,follow_y)+random_range(-5,5)
movement_speed = min(min_movement_speed,point_distance(other.x,other.y,follow_x,follow_y)*0.25)+random_range(-1.5,1.5)
acc_amount = min_movement_speed*0.1

movement_logic()


x = x+axis_x
y = y+axis_y

if point_distance(x,y,follow_x,follow_y) > scarf_distance {
    x = follow_x+dcos(point_direction(follow_x,follow_y,x,y))*scarf_distance
    y = follow_y-dsin(point_direction(follow_x,follow_y,x,y))*scarf_distance
}
