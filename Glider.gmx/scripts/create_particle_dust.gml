///create_particle_dust(speed_modif)
with(instance_create(x,y,obj_dust)) {
    axis_x = other.axis_x*argument0+sign(other.axis_x)*random_range(-0.8,0.2)
    axis_y = other.axis_y*argument0+sign(other.axis_y)*random_range(-0.8,0.2)
}
