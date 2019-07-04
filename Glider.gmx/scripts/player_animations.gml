///Draw the animations of the player
var nb_of_sprites_per_dir = 3;
var s = round((dir_act)/45);
var which_directional_index = (s-floor(s/8)*8);

sprite_index = spr_player;
image_xscale = 1;
image_index = which_directional_index*nb_of_sprites_per_dir;
image_speed = 0;

if(hook_circling) { //Turning
    sprite_index = spr_player_turning;
    image_index = (hook_circling_dir==1)*which_directional_index+(hook_circling_dir==-1)*(4-which_directional_index);
    image_xscale = hook_circling_dir;
} else if(hook_stretching_time != 0) { //Slingshot/Stretching technique
    image_index += 2;
}

draw_sprite(spr_shadow,0,x,y);
draw_sprite_ext(sprite_index,image_index,round(x),round(y),image_xscale,image_yscale,image_angle,c_white,image_alpha);
