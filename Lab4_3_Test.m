function Lab4_3_Test
  alfa = 27/2;
  lambda = 3/4;
  y = 3/(3 - lambda);
  x = 0 : 0.01 : 10;
  n = length(x);

  f = @(x) alfa .* (x.^3) .*exp(-3 .* x);
  g = @(x) lambda .* exp(-lambda .* x);
  c = f(y)/g(y);

  subplot(1,2,1);
  hold on;
  plot(x, f(x));
  plot(x, c*g(x));

  subplot(1,2,2);
  hold on;
  X = Lab4_3(n);
  histogram(X);

end
