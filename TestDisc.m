function p0 = TestDisc(alpha, X, x, N, k, dist, lastcase)
    n = sum(N);
    
    mean_X = sum(X .* N) / n;
    min_X = min(X.* N);
    max_X = max(X.* N);
    
    figure(); plot(N);
    
    switch (dist)
        case 'binomial'
            l = 1;
            param_n = k - 1;   %nem szamit ismeretlen parameternek chi2_quantile-nel (tudtommal)
            param_p = 1 / param_n * mean_X;
            params = [param_n, param_p];
    
        case 'poisson'
            l = 1;
            params = mean_X;
    
        case 'geometric'
            l = 1;
            params = 1 / mean_X;
    
        case 'pascal'
            l = 1;
            param_n = n; % ??????
            param_p = n / sum(X .* N);
            params = [param_n, param_p];
        
        case 'uniform'
            l = 0; %0 ??????
            params = n;
        
        case 'hypergeo'
            fprintf('==================%s IS NOT SUPPORTED==================\n', dist); return;
    end

    if (lastcase == 0)
        p0 = DiscretePDF(x, dist, params);
    else
        y = x;
        y(end) = [];
        p0 = DiscretePDF(y, dist, params);
        p0(k) = 1 - sum(p0);
    end

    chi2_value = sum(((N - n .* p0).^2) ./ (n .* p0));
    chi2_quantile = chi2inv(1 - alpha, k - 1 - l);

    if (chi2_value < chi2_quantile)
        if (l == 0)
            fprintf("Nem paraméteres Chi2 teszt, diszkrét %s eloszlást követ.\n", dist);
        else
            fprintf("Paraméteres Chi2 teszt, diszkrét %s eloszlást követ.\n", dist);
        end
    else
        fprintf("Nem követ diszkrét %s eloszlást.\n", dist);
    end
    %fprintf("p0 == "); disp(p0);
    fprintf("   Próba értéke: %.4f\n", chi2_value);
    fprintf("   Kvantilis értéke: %.4f\n", chi2_quantile);
    fprintf("Params == "); disp(params);
    fprintf("\n");
end