function Lab7_1(n)

    %Exponencialis
    lambda = 5;
    X = ExactInversion('exponencialis', lambda, n);
    x = mean(X);

    y = var(X);
    fprintf("KOD - EXPONENCIALIS:\n");
    fprintf("E(X)=%d\n",x);
    fprintf("D^2(X)=%d\n",y);
    fprintf("EREDETI:\n");
    fprintf("E(X)=%d\n",1/lambda);
    fprintf("D^2(X)=%d\n",1/(lambda^2));
    fprintf("------------------------\n");

    %Normalis
    sigma = -16;
    mu = 2;
    X = norm_cauchy(mu,sigma,n);
    x = mean(X);
    y = var(X);
    fprintf("KOD - NORMALIS:\n");
    fprintf("E(X)=%d\n",x);
    fprintf("D^2(X)=%d\n",y);
    fprintf("EREDETI:\n");
    fprintf("E(X)=%d\n",mu);
    fprintf("D^2(X)=%d\n",sigma^2);
    fprintf("------------------------\n");

    %Egyenletes
    a = -2;
    b = 4;
    U = ULEcuyerRNG(n);
    X = a + (b - a) .* U;
    x = mean(X);
    y = var(X);
    fprintf("KOD - EGYENLETES:\n");
    fprintf("E(X)=%d\n",x);
    fprintf("D^2(X)=%d\n",y);
    fprintf("EREDETI:\n");
    fprintf("E(X)=%d\n",(a+b)/2);
    fprintf("D^2(X)=%d\n",((b-a)^2)/12);
    fprintf("------------------------\n");

    %Geometrikus
    p = 2/5;
    lambda = -log(1 - p);
    Y = ExactInversion('exponencialis', lambda, n);
    X = ceil(Y);
    x = mean(X);
    y = var(X);
    fprintf("KOD - GEOMETRIKUS\n");
    fprintf("E(X)=%d\n",x);
    fprintf("D^2(X)=%d\n",y);
    fprintf("EREDETI:\n");
    fprintf("E(X)=%d\n",1/p);
    fprintf("D^2(X)=%d\n",(1-p)/(p^2));
    fprintf("------------------------\n");

    %Haromszog
    a = 8;
    X = ExactInversion('haromszog', a, n);
    x = mean(X);
    y = var(X);
    fprintf("KOD - HAROMSZOG\n");
    fprintf("E(X)=%d\n",x);
    fprintf("D^2(X)=%d\n",y);
    fprintf("EREDETI:\n");
    fprintf("E(X)=%d\n",1/3*a);
    fprintf("D^2(X)=%d\n",a^2/18);
    fprintf("------------------------\n");

    %Binomialis
    N = 18;
    p = 1/3;
    q = 1 - p;
    X = zeros(1, n);
    f = @(k) nchoosek(N, k) * p ^ k * q ^ (N - k);
    for i = 1:n
        u = ULEcuyerRNG;
        j = 0;
        S = f(0);
        while(u > S)
            j = j + 1;
            S = S + f(j);
        end
        X(i) = j;
    end
    x = mean(X);
    y = var(X);
    fprintf("KOD - BINOMIALIS\n");
    fprintf("E(X)=%d\n",x);
    fprintf("D^2(X)=%d\n",y);
    fprintf("EREDETI:\n");
    fprintf("E(X)=%d\n",N*p);
    fprintf("D^2(X)=%d\n",N*p*q);
    fprintf("------------------------\n");

    %hipergeometrikus
    N = 20;
    M = 6;
    n_local = 8;

    x = max(0,n_local - N + M):min(n_local, M);
    X = zeros(2,length(x));
    y = DiscretePDF(x, 'hipergeometric', [N, M, n_local]);
    X(1,:) = x;
    X(2,:) = y;
    E = InversionByBinarySearch(X, 2, n);

    varhato = mean(E);
    szoras = var(E);
    mean1 = n_local*M/N;
    var1 = n_local*(M/N*(N-M)/N)*((N-n_local)/(N-1));
    fprintf("KOD - HIPERGEOMETRIKUS\n");
    fprintf("E(X)=%d\n",varhato);
    fprintf("D^2(X)=%d\n",szoras);
    fprintf("EREDETI:\n");
    fprintf("E(X)=%d\n",n_local*M/N);
    fprintf("D^2(X)=%d\n",n_local*(M/N*(N-M)/N)*((N-n_local)/(N-1)));
    fprintf("------------------------\n");

    %Gamma
    a1 = 6;
    b1 = 2;
    Y = BisectionMethod('gamma',[a1,b1],0,50,0.001,7000);
    varhato2 = mean(Y);
    szoras2 = var(Y);
    fprintf("KOD - Gamma\n");
    fprintf("E(X)=%d\n",varhato2);
    fprintf("D^2(X)=%d\n",szoras2);
    fprintf("EREDETI:\n");
    fprintf("E(X)=%d\n",a1*b1);
    fprintf("D^2(X)=%d\n",a1*b1^2);
    fprintf("------------------------\n");

end
