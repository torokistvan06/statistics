function Lab8_2()
  n=10000;
  alpha=0.01;
  x=norminv(1-alpha/2,0,1);
  theta=4;
  
  X = ExactInversion('lab8', [theta], n);
  disp(X)
  hist(X);
  X_=mean(X);

  theta_min = (-x + sqrt(2)*sqrt(n))/(X_ * 6 * sqrt(2) * sqrt(n))
  theta_max = (x + sqrt(2)*sqrt(n))/(X_ * 6 * sqrt(2) * sqrt(n))

end
