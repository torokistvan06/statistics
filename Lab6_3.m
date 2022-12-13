function [L, Y] = Lab6_3(d, mu, A, n)

L = Cholesky(A);
Y = zeros(n,d);

for i = 1:n
    X = Kozrefogas(d);
    X = X';
    Y(i,:) = L*X + mu; 
end
end

