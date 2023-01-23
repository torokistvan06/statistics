function ValamiTetel()

Ax = 6;
Ay = 0;
Bx = 10;
By = -4;
Cx = -2;
Cy = -4;
Dx = -6;
Dy = 0;
Ex = 2;
Ey = 8;
Fx = (Bx + Cx) / 2;
Fy = (By + Cy) / 2;
Gx = (Dx + Ex) / 2;
Gy = (Dy + Ey) / 2;
Hx = (Ex + Ax) / 2;
Hy = (Ey + Ay) / 2;

max_it = 10000;
i = 0;

a = 0;
b = 0;

aedc = equationsOfPolygon([Ax Ay Ex Ey Dx Dy Cx Cy]);
abc = equationsOfPolygon([Ax Ay Bx By Cx Cy]);

afd = equationsOfPolygon([Ax Ay Fx Fy Dx Dy]);
fgh = equationsOfPolygon([Fx Fy Gx Gy Hx Hy]);

while(i < max_it)
 x = URealRNG(1, 4, -6, 10, 1);
 y = URealRNG(1, 4, -4, 8, 1);
 if (isInPolygon(aedc,0,0,x,y) == 1 || isInPolygon(abc, 6, -2,x,y) == 1)
     if (isInPolygon(afd,2,-2,x,y) == 1 && isInPolygon(fgh,2,0,x,y) == 0)
         a = a + 1;
     end
     if (isInPolygon(afd,2,-2,x,y) == 0 && isInPolygon(fgh,2,0,x,y) == 1)
        a = a + 1;
     end
     i = i + 1;
 end
end

disp(a / max_it)

bd = equationOfLine(Bx, By, Dx, Dy);
f = @(x)((1/3)*(x^2) - (2/3)*x - 8/3);

Ix = 1;
Iy = 0;

i = 0;

while(i < max_it)
 x = URealRNG(1, 4, -6, 10, 1);
 y = URealRNG(1, 4, -4, 8, 1);
 if (isInPolygon(aedc,0,0,x,y) == 1 || isInPolygon(abc, 6, -2,x,y) == 1)
     if (isInCircle(Ix, Iy, 4, x, y) && isOnTheSameSide(bd, 0, 0, x, y) && f(x) < y)
         b = b + 1;
     end
     i = i + 1;
 end
end

disp(b/max_it);

end