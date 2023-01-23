function feladat2()
    X = [3996, 2659, 1683, 979, 634, 404, 253, 168, 84, 60, 32, 24 ,14, 10];
    
    n = length(X);
    alpha = 1 - 0.99;
    k = length(N);
    n=sum(N);
    xmin = min(X);
    xmax = max(X);
    x = linspace(xmin,xmax,k+1);

    %hist(X);
    mean_X = sum(N.*X) / sum(N);

    %-poisson
    %   disp("Poisson");
    %   lambda_ = sum(N.*X)/n
    %   p0 = DiscretePDF(X(1:(k-1)),'poisson',lambda_);
    %   p0(k)=1-sum(p0(1:(k-2)));
    %   chi2_value=sum((N-n.*p0).^2./(n.*p0))
    %   chi2_quantile=chi2inv(1-alpha,k-2)
    %   if (chi2_value<chi2_quantile)
    %       disp('Poisson.');
    %   else
    %       disp('NEM Poisson.');
    %   end

    %binomialis eloszlas:
    param_n = k - 1   %nem szamit ismeretlen parameternek chi2_quantile-nel (tudtommal)
    param_p = 1 / param_n * mean_X
    disp('Feltetelezzuk a binomialis eloszlast');
    p0 = DiscretePDF(X, 'binomial', [param_n, param_p]);
    chi2_value = sum(((N - n .* p0).^2) ./ (n .*p0))
    chi2_quantile = chi2inv(1 - alpha, k - 3)

    if(chi2_value < chi2_quantile)
        disp('Binomialis eloszlast kovetnek az X mintaveteli ertekek!');
    else
        disp('Nem binomialis elosztlast kovetnek az X mintaveteli ertekek!');
    end


    %-normalis eloszlas
    param_mu = mean_X;
    param_sigma = sqrt(var(X));
    disp('Feltetelezzuk normalis eloszlast');
    i=1:k;
    %p0 = ContinuousCDF(x(i+1), 'normal', [param_mu, param_sigma]) - ContinuousCDF(x(i), 'normal', [param_mu, param_sigma]);
    p0 = ContinuousCDF_matlab(x(i+1), 'normal', [param_mu, param_sigma]) - ContinuousCDF_matlab(x(i), 'normal', [param_mu, param_sigma]);

    chi2_value = sum(((N - n .* p0).^2) ./ (n .*p0))
    chi2_quantile = chi2inv(1 - alpha, k - 3)
    if(chi2_value < chi2_quantile)
        disp('Normalis eloszlast kovetnek az X mintaveteli ertekek!');
    else
        disp('Nem normalis elosztlast kovetnek az X mintaveteli ertekek!');
    end

    %-egyenletes eloszlas
    param_a = xmin;
    param_b = xmax;
    disp('Feltetelezzuk egyenletes eloszlast');
    i = 1:k;
    p0 = ContinuousCDF_matlab(x(i+1), 'egyenletes', [param_a, param_b]) - ContinuousCDF_matlab(x(i), 'egyenletes', [param_a, param_b]);
    chi2_value = sum(((N - n .* p0).^2) ./ (n .*p0))
    chi2_quantile = chi2inv(1 - alpha, k - 3)
    if(chi2_value < chi2_quantile)
        disp('Egyenletes eloszlast kovetnek az X mintaveteli ertekek!');
    else
        disp('Nem egyenletes elosztlast kovetnek az X mintaveteli ertekek!');
    end

    %geo
    param_pgeo = 1 / mean_X
    disp('Feltetelezzuk geometriai eloszlast');
    p0 = DiscretePDF(X, 'geometric', [param_pgeo]);
    chi2_value = sum(((N - n .* p0).^2) ./ (n .*p0))
    chi2_quantile = chi2inv(1 - alpha, k - 2)
    if(chi2_value < chi2_quantile)
        disp('Geometriai eloszlast kovetnek az X mintaveteli ertekek!');
    else
        disp('Nem geometriai elosztlast kovetnek az X mintaveteli ertekek!');
    end
end
