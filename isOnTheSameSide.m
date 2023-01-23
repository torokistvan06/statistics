function b = isOnTheSameSide(f, x1, y1, x2, y2)
sign1 = sign(f(x1) - y1);
sign2 = sign(f(x2) - y2);
b = sign1 == sign2 || sign2 == 0;
end

