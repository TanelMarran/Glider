///Player Move State
var quickturn_check = (mouse_check_button_released(mb_left) && value_in_range(hook_stretching_time,hook_stretching_quickturn_frames));

if !mouse_check_button(mb_left) {
    hook_circling = false;
}

//Count down purify_speed_loss_pause
speed_loss_pause = max(0,speed_loss_pause-1);

movement_speed = movement_speed+
                 sign(min_movement_speed-movement_speed)*
                 min(abs(min_movement_speed-movement_speed),
                 (speed_loss_pause==0)*(speed_loss+(movement_speed-min_movement_speed)*speed_loss_percent));

//Apply the grapple point
if mouse_check_button_pressed(mb_left) && hook_active = false {
    hook_x = mouse_x
    hook_y = mouse_y
    hook_radius = max(point_distance(x,y,hook_x,hook_y)+1,20)
    hook_active = true
    hook_time = 0
    
    dir_change = stat_dir_change
    dir_change_first = 0
    
    if hook_radius < 20 or ((sqrt(sqr(axis_x)+sqr(axis_y))) > 2*hook_radius) {
        hook_active = false
    }
}

pyth_movement = sqrt(sqr(axis_x)+sqr(axis_y))

if mouse_check_button_released(mb_left) && hook_stretching = 0 {
    hook_active = false
    hook_time = 0
}

if hook_active = true {
    hook_radius_act = point_distance(x,y,hook_x,hook_y)
    
    var angle_to_center = point_direction(x,y,hook_x,hook_y);
    var a = angle_to_center+sign(angle_difference(point_direction(0,0,axis_x,axis_y),angle_to_center))*darccos((pyth_movement)/(2*hook_radius))
    var an_x = hook_x+dcos(point_direction(hook_x,hook_y,x,y))*hook_radius+dcos(a)*(movement_speed+hook_radius*2.5*max(0,hook_radius_act-hook_radius)/hook_radius)
    var an_y = hook_y-dsin(point_direction(hook_x,hook_y,x,y))*hook_radius-dsin(a)*(movement_speed+hook_radius*2.5*max(0,hook_radius_act-hook_radius)/hook_radius)
    
    if hook_radius_act > hook_radius {
        //If the player meets the required conditions, start using the slingshot/stretching technique
        if abs(angle_difference(point_direction(0,0,axis_x,axis_y),angle_to_center)) > 160 && hook_rite = noone {
            if hook_stretching == 0 {
                hook_stretching = movement_speed
            }
            hook_stretching_time++;
            movement_speed = movement_speed*0.9;
            dir = angle_to_center;
            dir_change = 0;
            if (movement_speed < 0.1*hook_stretching or quickturn_check) {
                hook_time = 0
                hook_active = false
                movement_speed = hook_stretching
                hook_stretching = 0
                dir_act = dir
                hook_stretching_time = 0;
                if(quickturn_check) {
                    g.freeze = 8;
                    instance_create(x,y,obj_quickturn_image)
                }
            } else if mouse_check_button_released(mb_left) {
                //Set a variable that shows if the player failed the quickturn tech this time
            }
        } else { //...otherwise start circling
            dir_change = min(180,dir_change+(power(movement_speed,1.8)/power(hook_radius,0.5))/*(power(1.1,dir_change_first))!*/)
            dir = point_direction(x,y,an_x,an_y);
            hook_circling = true;
            hook_circling_dir = -sign(angle_difference(dir,angle_to_center)); //Set which way were circling
        }
    }
} else {
    dir = dir_act;
}

//Defeat player
with(instance_place(x,y,obj_enemy)) {
    if(targeted_by == noone) {
        obj_player.death_source = id;
        other.player_state = state_player_falling;
        other.image_index = 0;
        g.freeze = 30;
    }
}

//Apply movement

dir_act = dir_act+min(dir_change,abs(angle_difference(dir_act,dir)))*-sign(angle_difference(dir_act,dir));

movement_logic();

x = x+axis_x
y = y+axis_y

if hook_active = true {
    hook_time++
    //movement_speed += max(0,circling_start_boost_time-hook_time)*power(0.15,max(1,circling_start_boost_time-hook_time)) //Add speedboost at the start of circling
    if hook_rite = noone && hook_stretching = 0 && hook_radius_act >= hook_radius {
        with(instance_create(hook_x,hook_y,obj_rite_completion)) {
            hook_radius = other.hook_radius
            hook_rite_start = point_direction(x,y,other.x,other.y) //Defines, where the circle began. Used in drawing the compelted portion of the circle rite.
        }
        hook_rite = true
    }
} else {
    hook_time--
}

dir_act = dir_act-floor(dir_act/360)*360






