//Apply movement

t_axis_x = dcos(dir_act)*movement_speed
t_axis_y = -dsin(dir_act)*movement_speed

var x_dist = t_axis_x-axis_x
var y_dist = t_axis_y-axis_y

var x_ratio = abs(x_dist+0.001)/(abs(x_dist)+abs(y_dist)+0.001)
var y_ratio = abs(y_dist+0.001)/(abs(x_dist)+abs(y_dist)+0.001)

var x_add = min(abs(x_dist),acc_amount*x_ratio)*sign(x_dist)
var y_add = min(abs(y_dist),acc_amount*y_ratio)*sign(y_dist)

axis_x = axis_x+x_add
axis_y = axis_y+y_add
