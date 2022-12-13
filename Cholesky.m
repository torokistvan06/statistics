function [L] = Cholesky(A)

[n,m] = size(A);

if(n ~= m)
    disp('Nem negyzetes matrix!');
    return;
end

for i = 1:n
    if(A(i,:) ~= A(:,i))
        disp('Nem szimmetrikus matrix!');
        return;
    end
    if(A(i,i) < 0)
        disp('Ne pozitiv definitiv!');
        return;
    end
end

L = zeros(n,m);

for i = 1:n
    for j = 1: i - 1
        osszeg = 0;
        for k = 1:j - 1
           osszeg = osszeg + L(i,k)*L(j,k); 
        end
    L(i,j) =(A(i,j) - osszeg) / L(j,j);
    end
    osszeg = 0;
    for k = 1:i-1
        osszeg = osszeg + L(i,k)^2; 
    end
    ertek = A(i,i) - osszeg;
    L(i,i) = sqrt(ertek);
end
end

