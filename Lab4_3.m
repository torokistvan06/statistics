function X = Lab4_3(n)    
    lambda = 3/4;
    f = @(x) 27/7 .* (x.^3) .*exp(-3 .* x);
    g = @(x) lambda .* exp(-lambda .* x);
    k = 3/(3-lambda);
    c = f(k)/g(k);
    
    X = zeros(1,n);
    lepes = 0;

    for i=1:n
        Y = ExactInversion('exponencialis', lambda, 1);        
        U = ULEcuyerRNG(1);                             
        lepes = lepes + 1;
        while (U > f(Y(1)) / (c*g(Y(1))) )
            lepes = lepes + 1;
            Y = ExactInversion('exponencialis', lambda, 1);
            U = ULEcuyerRNG(1);
        end
        X(i) = Y(1);
    end

   disp(lepes\n)
end

