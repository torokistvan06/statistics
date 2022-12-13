function Lab7_2 (n)
  f = @(x,y) (15/38) .* (x .* (y .^2) + (1 + (y .^ 4) ./ 2) + (x ./ 2) .* (1/4 + x));
  X=zeros(1,n);
  Y=zeros(1,n);
  ax=-1;
  bx=1;
  ay=0;
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
    X(i)=x;
    Y(i)=y;
  end
  fprintf('Varhato ertek - X : %f\n', mean(X));
  fprintf('Varhato ertek - Y : %f\n', mean(Y));
  fprintf('Szoras negyzet - X : %f\n', var(X));
  fprintf('Szoras negyzet - Y : %f\n', var(Y));
  Z=X .^ 2 + Y./2 + 1;
  fprintf('Varhato ertek - Z : %f\n', mean(Z));
  fprintf('Szoras negyzet - Z : %f\n', var(Z));
end
