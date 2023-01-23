function b = isInPolygon(f, innerX, innerY, x, y)
%ISINPOLYNOM Summary of this function goes here
%   Detailed explanation goes here
b = 1;
for i = 1:length(f)
    b = b && isOnTheSameSide(f{i}, innerX, innerY, x, y);
end
end

