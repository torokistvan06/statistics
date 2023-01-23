% Török István-Dániel, tiim2094, 534 csoport

function feladat4()

Ax = -2;
Ay = 5;
Bx = 3;
By = 5;
Cx = 3;
Cy = 0;
Dx = 6;
Dy = 0;
Ex = 0;
Ey = -6;
Fx = -4;
Fy = -2;
Gx = -5;
Gy = 2;

Hx = (Dx + Ex) / 2;
Hy = (Dy + Ey) / 2;

Ix = (Ex + Fx) / 2;
Iy = (Ey + Fy) / 2;

Ox = 0;
Oy = 0;
Or = 3;

abcfg = equationsOfPolygon([Ax Ay Bx By Cx Cy Fx Fy Gx Gy]);
cdef = equationsOfPolygon([Cx Cy Dx Dy Ex Ey Fx Fy]);
afh = equationsOfPolygon([Ax Ay Fx Fy Hx Hy]);

hold on;

i = 1;
n = 30000;

a = 0;

while(i <= n)
    x = URealRNG(1, 4, -6, 6, 1);
    y = URealRNG(1, 4, -6, 6, 1);
    if (isInPolygon(abcfg,x,y,0,2) || isInPolygon(cdef,x,y,0,-2))
       i = i + 1; 
       if (isInPolygon(afh,x,y,0,-2) == 0)
          a = a + 1; 
          % plot(x,y,'r.');
       else
          % plot(x,y,'g.');
       end
    end
end

disp(a/n);
figure
hold on

i = 1;
b = [];
dg = equationOfLine(Dx, Dy, Gx, Gy);
bi = equationOfLine(Bx, By, Ix, Iy);
n = 1000;

while(i <= n)
    j = 0;
    kedvezo = 0;
    while(j < 35)
        x = URealRNG(1, 4, -6, 6, 1);
        y = URealRNG(1, 4, -6, 6, 1);
        if (isInPolygon(abcfg,x,y,0,2) || isInPolygon(cdef,x,y,0,-2))
           j = j + 1; 
           if (isInCircle(Ox, Oy, Or, x, y) && isOnTheSameSide(dg, x, y, 0, -2) && isOnTheSameSide(bi, x, y,2,-2))
              kedvezo = kedvezo + 1; 
              % plot(x,y,'r.');
           elseif (isInCircle(Ox, Oy, Or, x ,y) == 0 && isOnTheSameSide(dg, x, y, 4, 4) && isOnTheSameSide(bi, x, y, -2, 4))
              kedvezo = kedvezo + 1; 
              % plot(x,y,'r.');
           else
              % plot(x,y,'g.');
           end
        end
    end
    b(i) = kedvezo;
    i = i + 1;
end

disp(mean(b));
end