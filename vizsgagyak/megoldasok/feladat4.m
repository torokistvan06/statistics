function feladat4()

Ox = 0;
Oy = 0;
Or = 10;

Ax = 8;
Ay = 0;
Bx = 4;
By = -4;
Cx = -7;
Cy = -4;
Dx = -8;
Dy = 0;
Ex = 0;
Ey = 4;

Fx = (Ax + Bx) / 2;
Fy = (Ay + By) / 2;
Fr = sqrt((Bx - Ax)^2 + (By - Ay)^2) / 2;

Gx = (Cx + Bx) / 2;
Gy = (Cy + By) / 2;
Gr = sqrt((Cx - Bx)^2 + (Cy - By)^2) / 2;

Hx = (Cx + Dx) / 2;
Hy = (Cy + Dy) / 2;
Hr = sqrt((Dx - Cx)^2 + (Dy - Cy)^2) / 2;

Ix = (Dx + Ex) / 2;
Iy = (Dy + Ey) / 2;
Ir = sqrt((Ex - Dx)^2 + (Ey - Dy)^2) / 2;

Jx = (Ax + Ex) / 2;
Jy = (Ay + Ey) / 2;
Jr = sqrt((Ax - Ex)^2 + (Ay - Ey)^2) / 2;

Mx = -8;
My = -6;

Nx = 8;
Ny = -6;

Px = 0;
Py = 10;

max_it = 10000;
i = 0;
a = 0;

ab = equationOfLine(Ax, Ay, Bx, By);
bc = equationOfLine(Bx, By, Cx, Cy);
cd = equationOfLine(Cx, Cy, Dx, Dy);
de = equationOfLine(Dx, Dy, Ex, Ey);
ea = equationOfLine(Ex, Ey, Ax, Ay);


% while(i < max_it)
%     disp(i)
%     j = 0;
%     kedvezo = 0;
%     while(j < 26)
%         x = URealRNG(1,4,-10,10,1);
%         y = URealRNG(1,4,-10,10,1);
%         if (isInCircle(Ox, Oy, Or, x, y))
%             if ((isInCircle(Fx, Fy, Fr, x, y) && isOnTheSameSide(ab,8,-4,x,y)) || (isInCircle(Gx, Gy, Gr, x, y) && isOnTheSameSide(bc, 0, -6, x ,y)) || (isInCircle(Hx, Hy, Hr, x, y) && isOnTheSameSide(cd, -8, -4, x ,y)) || (isInCircle(Ix, Iy, Ir, x, y) && isOnTheSameSide(de, -8, 4, x, y)) || (isInCircle(Jx, Jy, Jr, x, y) && isOnTheSameSide(ea, 8, 4, x, y)))
%                 kedvezo = kedvezo + 1;
%                 % plot(x, y, 'r.')
%                 % hold on
%             else
%                 % plot(x, y, 'g.');
%                 % hold on
%             end
%             j = j + 1; 
%         end
%     end
%     if (5 <= kedvezo && kedvezo <= 10) 
%         a = a + 1;
%     end
%     i = i + 1;
% end
% 
% disp(a/max_it);
i = 1;

abcde = equationsOfPolygon([Ax, Ay, Bx, By, Cx, Cy, Dx, Dy, Ex, Ey]);
mnp = equationsOfPolygon([Mx, My, Nx, Ny, Px, Py]);

b = [];

while(i < max_it)
    j = 0;
    disp(i)
    kedvezo = 0;
    while(j < 12)
        x = URealRNG(1,4,-10,10,1);
        y = URealRNG(1,4,-10,10,1);
        if (isInCircle(Ox, Oy, Or, x, y))
            if (isInPolygon(abcde, 0, 0, x ,y) == 0 && isInPolygon(mnp, 0, 0, x, y))
                kedvezo = kedvezo + 1;
                plot(x, y, 'r.')
                hold on
            else
                plot(x, y, 'g.');
                hold on
            end
            b(i) = kedvezo;
            j = j + 1; 
        end
    end
    i = i + 1;
end

disp(var(b));
disp(mean(b));

end