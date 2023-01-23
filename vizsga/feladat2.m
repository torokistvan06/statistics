% Török István-Dániel, tiim2094, 534 csoport

function feladat2()
  
  X = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11 ,12];
  N = [491, 260, 170, 112, 70, 56, 34,  11, 9, 7, 4, 3];
    
  alpha = 1 - 0.98;
  k = length(N);
  n=sum(N);

  mean_X = sum(N.*X) / sum(N);

  p = 1 / mean_X
  p0 = DiscretePDF(X, 'geometric', p);
  chi2_value = sum(((N - n .* p0).^2) ./ (n .*p0))
  chi2_quantile = chi2inv(1 - alpha, k - 2)
  if(chi2_value < chi2_quantile)
      disp('Geometriai eloszlast kovetnek az X mintaveteli ertekek!');
  else
      disp('Nem geometriai elosztlast kovetnek az X mintaveteli ertekek!');
  end

end