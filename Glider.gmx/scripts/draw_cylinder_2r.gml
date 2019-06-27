///draw_cylinder_2r(x,y,x2,y2,r1,r2)

var x1,x2,y1,y2,r1,r2,;

r1 = max(argument4,argument5)
r2 = min(argument4,argument5)

if argument4 >= argument5 {
    x1 = argument0
    y1 = argument1
    x2 = argument2
    y2 = argument3
} else {
    x1 = argument2
    y1 = argument3
    x2 = argument0
    y2 = argument1
}

var height = point_distance(x1,y1,x2,y2)
var dir = point_direction(x1,y1,x2,y2)

var m = sqrt(sqr(height)-sqr(r1-r2))
var a1 = darcsin(m/height)
var a2 = 180-a1


//var sf_cyl = surface_create(max(r1,r2),height+r1+r2)

draw_circle(x1,y1,r1,false)
draw_circle(x2,y2,r2,false)

var p1x,p1y,
    p2x,p2y,
    p3x,p3y,
    p4x,p4y;

p1x = x1+dcos(dir+a1)*r1
p1y = y1-dsin(dir+a1)*r1

p2x = x1+dcos(dir-a1)*r1
p2y = y1-dsin(dir-a1)*r1

p3x = x2+dcos(dir+180-a2)*r2
p3y = y2-dsin(dir+180-a2)*r2

p4x = x2+dcos(dir+180+a2)*r2
p4y = y2-dsin(dir+180+a2)*r2

draw_triangle(p1x,p1y,p2x,p2y,p3x,p3y,false)
draw_triangle(p2x,p2y,p3x,p3y,p4x,p4y,false)

