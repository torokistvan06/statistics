function Lab8poisson ()
  n=5000;
  alpha=0.01;
  x=norminv(1-alpha/2,0,1);
  l = 14;
  X = zeros(0,n);
  for k = 1:n
       u = ULEcuyerRNG;
       i = 0;
       p = exp(-l);
       S = p;
       while(u > S)
           i = i + 1;
           p = (l / i) * p;
           S = S + p;
       end
       X(k) = i;
  end
  histogram(X);
  X_ = mean(X);

  a = n;
  b = - 2 * X_ * n - x ^ 2;
  c = X_ ^ 2 * n;
  delta=b^2-4*a*c;

  p_max=(-b+sqrt(delta))/(2*a)
  p_min=(-b-sqrt(delta))/(2*a)
  %p_max=(24*X_+X.^2+sqrt((-24*X_-X.^2).^2 - 4*(144+X.^2)*X_.^2))/(2*(144+X.^2))
  %p_min=(24*X_+X.^2-sqrt((-24*X_-X.^2).^2 - 4*(144+X.^2)*X_.^2))/(2*(144+X.^2))


end
