% Török István-Dániel, tiim2094, 534 csoport

function feladat3()
    n = 20000;
    f = @(x)((x^3)/4 - x);
    X = zeros(1,n);
    M = f(((-2) * sqrt(3)) / 3)
    a = -2;
    b = 0;
    for i=1:n
      u = UMersenneTwisterRNG(1:1);
      v = UMersenneTwisterRNG(1:1);
      y = a+(b-a)*v;
      while u*M>f(y)
        u = UMersenneTwisterRNG(1:1);
        v = UMersenneTwisterRNG(1:1);
        y = a+(b-a)*v;
      end
    X(i) = y;
    end
    disp(mean(X));
    
    Y = 12 - ((X .^ 4) ./ 5);
    disp(var(Y));
end