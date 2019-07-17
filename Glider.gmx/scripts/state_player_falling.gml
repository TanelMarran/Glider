//Apply movement

if(image_tween = 3) {
    movement_speed *= 0.75;
    g.freeze = 5;
}
if(image_tween = 8) {
    g.freeze = 5;
}
if(image_index > 8) {
    movement_speed *= 0.9;
}

movement_logic();

x = x+axis_x
y = y+axis_y
