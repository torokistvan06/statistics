function f = equationOfLine(x1, y1, x2, y2)
%EGYNESEGYENLETE Summary of this function goes here
%   Detailed explanation goes here
    m = (y2-y1)/(x2-x1);
    f = @(x) m .*(x - x1) + y1;
end

