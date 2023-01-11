function Lab12_4
  alpha = 0.01;
  k = 12;
  X = 0:11;
  N = [24 86 170 227 203 134 83 43 19 6 4 1];

  n = sum(N);
  lambda = sum(X .* N)/n;

  p0 = DiscretePDF(0:(k-2), 'poisson', lambda);
  p0(k) = 1 - sum(p0);

  chi2_value = sum(((N - n .* p0).^2)  ./ (n .* p0));
  chi2_quantile = chi2inv(1-alpha,k-2);

  if(chi2_value < chi2_quantile)
      disp('Az alabbi szamok Poisson eloszlast kovetnek! ');
  else
      disp('Az alabbi szamok nem Poisson eloszlast kovetnek!');
  end
end
