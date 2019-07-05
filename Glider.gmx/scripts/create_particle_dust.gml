///create_particle_dust(x,y,angle,speed,lifetime,acc_amount,/speed_randomness,angle_randomness)
var v_x, v_y, v_angle, v_speed, v_lifetime, v_acc_amount, v_speed_randomness, v_angle_randomness;
v_x = argument[0];
v_y = argument[1];
v_angle = argument[2];
v_speed = argument[3];
v_lifetime = argument[4];
v_acc_amount = argument[5]
v_speed_randomness = argument[6];
v_angle_randomness = argument[7];

with(instance_create(v_x,v_y,obj_dust)) {
    var rand_speed = v_speed+random_range(-v_speed_randomness,v_speed_randomness);
    var rand_angle = v_angle+random_range(-v_angle_randomness,v_angle_randomness);
    axis_x = dcos(rand_angle)*rand_speed;
    axis_y = -dsin(rand_angle)*rand_speed;
    lifetime = v_lifetime;
    acc_amount = v_acc_amount
}
return id
