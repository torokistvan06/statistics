function X = Lab6_2_s(n)
  f=@(x, y) 4/9.*(x.^3 + 2.*y.^2 .* (x + 1/2) - y.^2 + 1);
  X=zeros(2,n);
  ax=0;
  bx=1;
  ay=-1/2;
  by=1;
  M=f(1,1);
  for i=1:n
    x = ULEcuyerRNG(1)*(bx-ax)+ax;
    y = ULEcuyerRNG(1)*(by-ay)+ay;
    u = ULEcuyerRNG(1);
    while(u*M > f(x, y))
      x = ULEcuyerRNG(1)*(bx-ax)+ax;
      y = ULEcuyerRNG(1)*(by-ay)+ay;
      u = ULEcuyerRNG(1);
    end
    X(1,i)=x;
    X(2,i)=y;
  end
  figure(1);
  hist3(X');

  Y = X';
  figure(2);
  plot3(Y(:,1),Y(:,2),f(Y(:,1),Y(:,2)),'.r');

  figure(3);
  [X, Y] = meshgrid(linspace(0, 1, 100), linspace(-1/2, 1, 100));
  surf(X,Y,f(X,Y));
  hold on;
end