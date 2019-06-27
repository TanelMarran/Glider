///Draw the animations of the player
var s = round((dir_act)/45);
var which_directional_index = (s-floor(s/8)*8)*2;

//Slingshot/Stretching technique
if(hook_stretching_time == hook_stretching_quickturn_frames[0]/*hook_stretching_time != 0*/) {
    switch(which_directional_index) {
        case 0:
            break;
        case 1:
            break;
        case 2:
            break;
        case 3:
            break;
        case 4:
            break;
        case 5:
            break;
        case 6:
            break;
        case 7:
            break;
    }
    image_speed = 0;
    image_index = movement_speed/(hook_stretching*0.1)
    //sprite_index = spr_mbunny_idle
} else { //Gliding
    sprite_index = spr_pla;
    image_speed = 0.1;
    image_index = which_directional_index+loop_value_range(image_index+image_speed,1);
}

draw_sprite(spr_shadow,0,x,y);
draw_sprite(sprite_index,image_index,round(x),round(y));
