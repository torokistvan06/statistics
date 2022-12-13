function Lab5_2(n)
    figure(1);
    x = 0:0.001:pi/2;
    X1 = (4/pi)*(1-(cos(2.*x)).^2);
    h2 = -1.*(x - pi/4).^2 + 1.2732;
    h1 = -1.*(2.*x - pi/2).^2 + 1.0;
    cg = zeros(1,length(x));
    cg(1:length(x)) = 2*(2/pi);
    plot(x, X1, x, h1, x, h2, x, cg);
    
    X = zeros(1,n);
    h2 = @(x) -(x -((pi)/(4))).^(2)+1.2732;
    h1 = @(x) -(2 .* x-((pi)/(2))).^(2)+1.0;
    f = @(x) (4/pi)*(1-(cos(2.*x)).^2);
    cg = 2*(2/pi);
    disp(integral(h1,0.28,1.28));
    disp(integral(h2,0, pi/2));
    
    ossz = 0;
    fszam=0;
    h2szam=0;
    h1szam=0;
    

    for i = 1:n
        L = false;
        while(L == false)
            U = ULEcuyerRNG;
            Y = URealRNG(1,3,0,pi/2,1);
            W = U * cg;
            L = (W <= h1(Y) || h1(Y) > 1.6 || h1(Y) < -1.6);
            if(L==true)
            h1szam = h1szam + 1;
            end
            if (L==false)
              h2szam = h2szam + 1;
              if (W<=h2(Y))
                L = (W<=f(Y));
                fszam=fszam+1;
              end
            end
        end
        X(i) = Y;
        ossz = ossz + 1;
    end
    disp(fszam/n);
    figure(2);
    histogram(X);
end
