///bezier_point(x1,y1,x2,y2,x3,y3,percent)
x1 = argument[0];
y1 = argument[1];
x2 = argument[2];
y2 = argument[3];
x3 = argument[4];
y3 = argument[5];
percent = argument[6];

x1 = x1+(x3-x1)*percent;
y1 = y1+(y3-y1)*percent;

x2 = x2+(x3-x2)*percent;
y2 = y2+(y3-y2)*percent;

x3 = x1+(x2-x1)*percent;
y3 = y1+(y2-y1)*percent;

return array(x3,y3);
