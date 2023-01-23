function b = isInPolygon(f, innerX, innerY, x, y)
b = 1;
for i = 1:length(f)
    b = b && isOnTheSameSide(f{i}, innerX, innerY, x, y);
end
end

