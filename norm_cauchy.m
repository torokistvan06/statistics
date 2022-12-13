function X = norm_cauchy(mu, sigma, n)
  X = zeros(1,n);
  a = sqrt(exp(1)) / 2;
  for i = 1:n
      U = UMersenneTwisterRNG(1);
      V = UMersenneTwisterRNG(1);
      Y = tan(pi * V);
      S = Y^2;
      while(U > a * (1 + S)* exp(-S/2))
          U = UMersenneTwisterRNG(1);
          V = UMersenneTwisterRNG(1);
          Y = tan(pi * V);
          S = Y^2;
      end
      X(i) = Y * sigma + mu;
  end
end
