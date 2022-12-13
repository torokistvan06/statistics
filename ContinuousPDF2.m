function f = ContinuousPDF2(x, y)

n = length(x);
m = length(y);

if ( n ~= m)
    disp('Nem egymeretu vektorok!');
    return;
end

f = zeros(n,n);

for i = 1:n
    for j = 1:m
        if(x(j) > 0 && x(j) < 1 && y(i) > -1/2 && y(i) < 1)
            f(i,j) = 4/9 * (x(j) ^ 3 + 2 * y(i) ^ 2 * (x(j) + 1/2) - y(i)^2 + 1);
        else
            f(i,j) = 0;
        end
    end
end
end