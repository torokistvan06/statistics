function OsszesMegadvaMintaillesztes

  X = [-1.773, 0.797, 7.907, -0.601, 0.654, 5.038, 4.099, -2.145, 6.910, 0.741, 2.730, 3.579, 6.069, 3.902, 3.186, -1.336, 2.639, -2.939, 3.380, 7.957, -0.334, 2.649, -0.953, 4.872, 3.196, 4.787, 6.194, -0.024, -0.318, 0.138, -1.286, 4.469, 3.268, 1.848, 5.611, -2.638, 3.410, 3.358, 0.190, 1.058, 6.030, 0.609, -2.367, -1.416, 7.729, -1.613, -0.225, -0.281, 0.475, 6.302, 7.938, 6.268, 4.577, 7.646, 5.546, -2.971, 2.609, 0.499, 0.404, 7.121, 5.973, 0.389, -1.292, -0.086, -1.357, -1.637, 6.275, -0.364, 4.980, -1.448, 2.234, 1.389, -0.277, 3.733, -1.834, 4.129, 2.116, 7.857, 3.909, 4.407, 4.499, 3.992, 1.505, 3.120, -2.908, 6.857, 7.596, -0.779, 6.201, 4.050, 0.366, 3.158, 3.495, -2.179, 6.883, -2.170];
  X = [0.65, 4.03, 3.04, 5.47, 0.90, 0.75, 1.81, 1.21, 0.25, 0.97, 3.68, 6.54, 1.55, 1.61, 1.37, 5.01, 0.01, 2.91, 2.26, 1.04, 1.08, 3.50, 5.27, 9.02, 0.38, 2.88, 0.22, 1.63, 0.81, 1.83, 5.43, 6.05, 0.36, 0.76, 3.70, 3.83, 0.41, 13.18, 3.36, 1.53, 0.14, 1.56, 1.70, 2.13, 3.40, 1.68, 5.62, 0.08, 7.08, 0.22, 1.08, 2.69, 3.38, 0.06, 2.27, 5.13, 0.19, 5.35, 0.25, 0.19, 0.38, 3.31, 0.03, 3.40, 3.72, 1.86, 2.70, 0.39, 7.26, 0.80, 8.37, 3.97, 0.10, 0.25, 1.30, 0.05, 0.09, 6.58, 9.96, 8.36, 1.09, 0.52, 3.10, 2.10, 6.43, 5.15, 0.92, 1.57, 0.78, 0.34, 1.64, 0.17, 2.15, 0.37, 2.93, 3.89, 6.89, 0.74, 2.86, 3.81, 0.52, 3.27, 3.53, 0.77, 0.18, 0.92, 5.01, 1.18, 2.96, 3.39, 1.07, 2.36, 0.35, 2.21, 0.82, 12.72, 0.24, 9.71, 0.69, 4.81, 1.03, 4.65, 3.95, 4.70, 1.72, 2.90, 4.91, 1.37, 1.65, 3.95, 0.48, 4.78, 2.43, 3.29, 1.27, 1.90, 1.36, 0.10, 2.59, 5.69];

  n = length(X);
  k = round(1 + log2(n));
  N = hist(X,k);
  x_min = min(X);
  x_max = max(X);
  x = linspace(x_min,x_max,k+1);
  mean_X = mean(X);

   %-binomialis eloszlas:
  param_n = k - 1   %nem szamit ismeretlen parameternek chi2_quantile-nel (tudtommal)
  param_p = 1 / param_n * mean_X

  %-geometriai eloszlas
  param_pgeo = 1 / mean_X

  %-poisson eloszlas
  param_lambda_poisson = mean_X;

  %-normalis eloszlas
  param_mu = mean_X;
  param_sigma = sqrt(var(X));

  %-egyenletes eloszlas
  param_a = x_min;
  param_b = x_max;

   %exponencialis
  param_lambda = 1 / mean_X;

  disp('egyenletes');
  i=1:k;
  p0 = ContinuousCDF(x(i+1),'egyenletes', [param_a,param_b]) - ContinuousCDF(x(i),'egyenletes', [param_a,param_b]);
  alpha  = 0.01;
  chi2_value = sum(((N - n .* p0) .^ 2) ./ (n .* p0))
  chi2_quantile = chi2inv(1-alpha,k-3)

  if (chi2_value < chi2_quantile)
    disp('Egyenletes');
  else
    disp('Nem egyenletes');
  end

  disp('Feltetelezzuk exp eloszlast');
  i=1:k;
  p0 = ContinuousCDF(x(i+1), 'exponencialis', [param_lambda]) - ContinuousCDF(x(i), 'exponencialis', [param_lambda]);
  chi2_value = sum(((N - n .* p0).^2) ./ (n .*p0))
  chi2_quantile = chi2inv(1 - alpha, k - 2)
  if(chi2_value < chi2_quantile)
      disp('Exp eloszlast kovetnek az X mintaveteli ertekek!');
  else
      disp('Nem exp elosztlast kovetnek az X mintaveteli ertekek!');
  end


  disp('Feltetelezzuk normalis eloszlast');
  i=i:k;
  p0 = ContinuousCDF(x(i), 'normal', [param_mu, param_sigma]) - ContinuousCDF(x(i), 'normal', [param_mu, param_sigma]);
  chi2_value = sum(((N - n .* p0).^2) ./ (n .*p0))
  chi2_quantile = chi2inv(1 - alpha, k - 3)
  if(chi2_value < chi2_quantile)
      disp('Normalis eloszlast kovetnek az X mintaveteli ertekek!');
  else
      disp('Nem normalis elosztlast kovetnek az X mintaveteli ertekek!');
  end


  disp('Feltetelezzuk poisson eloszlast');
  p0 = DiscretePDF(x, 'poisson', (param_lambda_poisson));
  chi2_value = sum(((N - n .* p0).^2) ./ (n .*p0))
  chi2_quantile = chi2inv(1 - alpha, k - 2)
  if(chi2_value < chi2_quantile)
      disp('Poisson eloszlast kovetnek az X mintaveteli ertekek!');
  else
      disp('Nem poisson elosztlast kovetnek az X mintaveteli ertekek!');
  end

  disp('Feltetelezzuk geometriai eloszlast');
  p0 = DiscretePDF(x, 'geometric', [param_pgeo]);
  chi2_value = sum(((N - n .* p0).^2) ./ (n .*p0))
  chi2_quantile = chi2inv(1 - alpha, k - 2)
  if(chi2_value < chi2_quantile)
      disp('Geometriai eloszlast kovetnek az X mintaveteli ertekek!');
  else
      disp('Nem geometriai elosztlast kovetnek az X mintaveteli ertekek!');
  end


  disp('Feltetelezzuk a binomialis eloszlast');
  p0 = DiscretePDF(x, 'binomial', [param_n, param_p]);
  chi2_value = sum(((N - n .* p0).^2) ./ (n .*p0))
  chi2_quantile = chi2inv(1 - alpha, k - 3)

  if(chi2_value < chi2_quantile)
      disp('Binomialis eloszlast kovetnek az X mintaveteli ertekek!');
  else
      disp('Nem binomialis elosztlast kovetnek az X mintaveteli ertekek!');
  end

endfunction
