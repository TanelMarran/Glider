if irandom(120) = 1 && sprite_index = spr_mbunny_idle {
    sprite_index = spr_mbunny_hop
    image_index = 0
}

if sprite_index = spr_mbunny_hop && image_tween = 7 {
    dir = irandom(360)
    if ceil(x/room_width) != 1 or ceil(y/room_height) != 1 {
        dir = point_direction(x,y,room_width/2,room_height/2)+irandom_range(-30,30)
    }
    movement_speed = min_movement_speed
}
if sprite_index = spr_mbunny_hop && image_tween = 12 {
    movement_speed = 0
    sprite_index = spr_mbunny_idle
}

movement_logic()

x = x+axis_x
y = y+axis_y
