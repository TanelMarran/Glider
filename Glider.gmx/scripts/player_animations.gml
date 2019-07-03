///Draw the animations of the player
var nb_of_sprites_per_dir = 3
var s = round((dir_act)/45);
var which_directional_index = (s-floor(s/8)*8)*nb_of_sprites_per_dir;
var which_state = 0

//Slingshot/Stretching technique
if(hook_stretching_time != 0) {
    if(hook_stretching_time < hook_stretching_quickturn_frames[0]) {
        which_state = 1
    } else {
        which_state = 2
    }
}

draw_sprite(spr_shadow,0,x,y);
draw_sprite(sprite_index,which_directional_index+which_state,round(x),round(y));
