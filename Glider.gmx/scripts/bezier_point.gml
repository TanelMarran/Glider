///bezier_point(start_coord,interm_coord,target_coord,percent)
x1 = argument[0];
y1 = x1[1];
x1 = x1[0];

x2 = argument[1];
y2 = x2[1];
x2 = x2[0];

x3 = argument[2];
y3 = x3[1];
x3 = x3[0];

percent = argument[3];

x1 = x1+(x3-x1)*percent;
y1 = y1+(y3-y1)*percent;

x2 = x2+(x3-x2)*percent;
y2 = y2+(y3-y2)*percent;

x3 = x1+(x2-x1)*percent;
y3 = y1+(y2-y1)*percent;

return array(x3,y3);
