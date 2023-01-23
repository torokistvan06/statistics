function f = equationsOfPolygon(p)
%EUQATIONSOFPOLYGON Summary of this function goes here
%   Detailed explanation goes here
n= length(p) / 2;
f = cell(1, n);
for i = 1:n-1
    f{i} = equationOfLine(p(i*2-1), p(i*2), p(i*2+1), p(i*2+2));
end
f{n} = equationOfLine(p(length(p)-1) , p(length(p)), p(1), p(2));
end

