function Lab8geo()
  n=5000;
  alpha=0.01;
  x=norminv(1-alpha/2,0,1);
  p = 0.62;
  lambda = -log(1 - p);
  Y = ExactInversion('exponencialis', lambda, n);
  X = ceil(Y);

  histogram(X);
  X_=mean(X);

  a=X_^2 * n;
  b=x^2 - 2 * X_ * n;
  c=n - x ^ 2;
  delta=b^2-4*a*c;

  p_max=(-b+sqrt(delta))/(2*a)
  p_min=(-b-sqrt(delta))/(2*a)

end
