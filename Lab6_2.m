function Lab6_2()
    n = 100;
    x = linspace(0,1,n);
    y = linspace(-1/2,1,n);

    fx = zeros(1,n);
    fy = zeros(1,n);
    Fx = zeros(1,n);
    Fy = zeros(1,n);
    FF = zeros(n,2);

    for i = 1:n
         fx(i) = (2*x(i)^3 + x(i) + 2) / 3;
         fy(i) = (4 * y(i)^2 + 5) / 9;
         Fx(i) = (x(i)^4 + x(i)^2 + 4*x(i)) / 6;
         Fy(i) = (4 * y(i)^3 + 15 * y(i) + 8) / 27;
         FF(i,1)= (2*x(i)^3 + x(i) + 2) / 3;
         FF(i,2)= (4 * y(i)^2 + 5) / 9;
    end

    hold on
    plot(x,fx,"r");
    plot(y,fy,"b");
    plot(x,Fx,"g");
    plot(y,Fy,"y");

    figure;

    f = ContinuousPDF2(x,y);
    [x1,y1] = meshgrid(x,y);
    plot3(x1,y1,f,'.g');
    
    figure;

    [X,Y] = meshgrid(x,y);
    Z= 4/9 .* (X .^ 3 + 2 .* Y .^ 2 .* (X + 1/2) - Y .^ 2 + 1);   
    surf(X,Y,Z);
    figure;

    F = ContinuousCDF2(1/2,1,0,3/4);
    disp('P(1/2 < X < 2, 0 < Y < 3/4):');
    disp(F(n,n));
    F2 = ContinuousCDF2(0,1,-1/2,1);
    surf(X, Y, F2(1:n, 1:n));
end