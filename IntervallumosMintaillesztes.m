function IntervallumosMintaillesztes()
  intervallum = [0 0.8571; 0.8571 1.7143; 1.7143 2.5714; 2.5714 3.4286; 3.4286 4.2857; 4.2857 5.1429; 5.1429 6.0000; 6.0000 6.8571; 6.8571 7.7143; 7.7143 8.5714; 8.5714 9.4286; 9.4286 10.2857; 10.2857 11.1429; 11.1429 12.0000];
  N = [3996 2659 1683 979 634 404 253 168 84 60 32 24 14 10];

  alpha = 1 - 0.99;
  n = sum(N);
  k = length(N);
  i=1:k;
  x = zeros(1, k);
  x(i) = (intervallum(i,1) + intervallum(i,2)) / 2;
  X = [];
  for i=1:k
     Y = ones(1, N(i)) * x(i);
     X = cat(2, X, Y);
  end
  %mean_X = sum(N.*x) / sum(N);
  min_X = min(X);
  max_X = max(X);

  %-binomialis eloszlas:
  param_n = k - 1   %nem szamit ismeretlen parameternek chi2_quantile-nel (tudtommal)
  param_p = 1 / param_n * mean(X)

  %-geometriai eloszlas
  param_pgeo = 1 / mean(X)

  %-poisson eloszlas
  param_lambda_poisson = mean(X)

  %-normalis eloszlas
  param_mu = mean(X)
  param_sigma = sqrt(var(X))

  %-egyenletes eloszlas
  param_a = min_X
  param_b = max_X

  %diszkret:
	%p0 = DiscretePDF(x, 'eloszlas', [param])

  %folytonos - sajat linspace eseten
  %i=1:k;
	%p0 = ContinuousCDF(x(i+1), 'eloszlas', [param_1, param_2, ...]) - ContinuousCDF(x(i), 'eloszlas', [param_1, param_2, ...]);

  %exponencialis
  param_lambda = 1 / mean(X)

  i=1:k

  disp('Feltetelezzuk exp eloszlast');
  p0 = ContinuousCDF(intervallum(i, 2), 'exponencialis', param_lambda) - ContinuousCDF(intervallum(i, 1), 'exponencialis', param_lambda);
  %p0
  chi2_value = sum(((N - n .* p0).^2) ./ (n .*p0))
  chi2_quantile = chi2inv(1 - alpha, k - 2)
  if(chi2_value < chi2_quantile)
      disp('Exp eloszlast kovetnek az X mintaveteli ertekek!');
  else
      disp('Nem exp elosztlast kovetnek az X mintaveteli ertekek!');
  end

  i=1:k;
  disp('Feltetelezzuk normalis eloszlast');
  p0 = ContinuousCDF(intervallum(i, 2), 'normal', [param_mu, param_sigma]) - ContinuousCDF(intervallum(i, 1), 'normal', [param_mu, param_sigma]);
  chi2_value = sum(((N - n .* p0).^2) ./ (n .*p0))
  chi2_quantile = chi2inv(1 - alpha, k - 3)
  if(chi2_value < chi2_quantile)
      disp('Normalis eloszlast kovetnek az X mintaveteli ertekek!');
  else
      disp('Nem normalis elosztlast kovetnek az X mintaveteli ertekek!');
  end

  disp('Feltetelezzuk egyenletes eloszlast');
  i = 1:k;
  p0 = ContinuousCDF(intervallum(i, 2), 'egyenletes', [param_a, param_b]) - ContinuousCDF(intervallum(i, 1), 'egyenletes', [param_a, param_b]);
  chi2_value = sum(((N - n .* p0).^2) ./ (n .*p0))
  chi2_quantile = chi2inv(1 - alpha, k - 3)
  if(chi2_value < chi2_quantile)
      disp('Egyenletes eloszlast kovetnek az X mintaveteli ertekek!');
  else
      disp('Nem egyenletes elosztlast kovetnek az X mintaveteli ertekek!');
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

  disp('Feltetelezzuk poisson eloszlast');
  p0 = DiscretePDF(x, 'poisson', [param_lambda_poisson]);
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

end
