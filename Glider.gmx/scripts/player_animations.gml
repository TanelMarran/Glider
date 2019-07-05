///Draw the animations of the player
var nb_of_sprites_per_dir = 3;
var which_directional_index = round((dir_act)/45);
var reaction_buffer = 4
var qt_offset_start = hook_stretching_quickturn_frames[0];
var qt_offset_end = hook_stretching_quickturn_frames[1];
var quickturn_frames = value_in_range(hook_stretching_time,array(qt_offset_start,qt_offset_end));

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

//Draw shadow
draw_sprite(spr_shadow,0,x,y);

//Draw player
var uniform_ColorFactor = shader_get_uniform(shd_pureWhite,"ColorFactor");
var frames = hook_stretching_quickturn_frames[1]-hook_stretching_quickturn_frames[0];

if(quickturn_frames) {
    shader_set(shd_pureWhite);
    shader_set_uniform_f(uniform_ColorFactor,1.0+1-(hook_stretching_time-qt_offset_start)/frames);
}
draw_sprite_ext(sprite_index,image_index,round(x),round(y),image_xscale,image_yscale,image_angle,c_white,image_alpha);

shader_reset();

/*/Draw glare effect
if(value_in_range(hook_stretching_time,hook_stretching_quickturn_frames)) {
    var frames = hook_stretching_quickturn_frames[1]-hook_stretching_quickturn_frames[0]+reaction_buffer;
    var dust_len = 6;
    var dust_dir = 180+which_directional_index*45;
    draw_sprite(spr_glare,(hook_stretching_time/frames)*sprite_get_number(spr_glare),x+lengthdir_x(dust_len,dust_dir),y-4+lengthdir_y(dust_len*0.9,dust_dir));
}
