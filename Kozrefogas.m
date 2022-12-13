function X = Kozrefogas(n)

alfa = 1/exp(1/2);
beta = 1/2;
gamma = sqrt(2);

X = zeros(1, n);
db = 0;
ossz = 0;
for i = 1:n
    U = UMersenneTwisterRNG();
    V = UMersenneTwisterRNG();
    Y = tan(pi*V);
    S = beta * Y^2;
    W = (alfa*U)/(beta + S);
    if(abs(Y) > gamma)
        L = 0;
    else
        L = (W <= 1 - S); 
    end
    if(L == 0)
        L = (W <= exp(-S));
    end
    while(L == 0)
        U = UMersenneTwisterRNG();
        V = UMersenneTwisterRNG();
        Y = tan(pi*V);
        S = beta * Y^2;
        W = (alfa*U)/(beta + S);
        if(abs(Y) > gamma)
            L = 0;
        else
            L = (W <= 1 - S);
        end
        if(L == 0)
            L = (W <= exp(-S));
        end
    end
    X(i) = Y;
end

end


