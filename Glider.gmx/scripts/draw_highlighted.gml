///draw_highlighted(object_array)
var object_array = argument[0];

draw_set_color(c_black);
draw_rectangle(view_xview[0],view_yview[0],view_xview[0]+view_wview[0],view_yview[0]+view_hview[0],false);
for(var i = 0; i < array_length_1d(object_array); i++) {
    with(object_array[i]) {
        draw_self();
    }
}
