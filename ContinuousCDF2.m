function F = ContinuousCDF2(x_min, x_max ,y_min, y_max)
n = 100;
F = zeros(n+1, n+1);
x= linspace(x_min, x_max, n);
y = linspace(y_min, y_max, n);
f =@(X, Y) 4/9 .* (X .^ 3 + 2 .* Y .^ 2 .* (X + 1/2) - Y .^ 2 + 1);  
[X, Y] = meshgrid(x, y);

F(1, 1) = integral2(f,X(1, 1), X(1, 2), Y(1, 1), Y(2, 1));

for i = 1:n-1
    F(1, i+1) = F(1, i) + integral2(f, X(1,i), X(2, i+1), Y(1, i), Y(2, i+1));
end

for i = 1:n-1
     F(i + 1, 2) = F(i,2) + integral2(f, X(i, 1), X(i+1, 2), Y(i, 1), Y(i+1,2));
    for j = 1:n-1
        F(i+1, j+1) = F(i, j+1) + F(i+1, j) - F(i, j) +  integral2(f,X(i, j), X(i+1, j+1), Y(i, j), Y(i+1, j+1));
    end
end

end