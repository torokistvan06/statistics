function b = isInCircle(xc, yc, r, x, y)
%ISINCIRCLE Summary of this function goes here
%   Detailed explanation goes here
b = (x - xc) ^ 2  + (y - yc) ^ 2 <= r^2;
end

