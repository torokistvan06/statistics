function p0 = TestCont(alpha, X, N, dist)
    k = length(N);

    n = sum(N);
    
    i = 1:(length(X) - 1);
    x = (X(i) + X(i + 1)) ./ 2;
    
    Y = zeros(1, n);
    l = 1;
    for i = 1:length(N)
        for j = 1:N(i)
            Y(l) = X(i);
            l = l + 1;
        end
    end
    
    x = x .* N;
    figure(); hist(N, k);
    
    mean_x = sum(x) / n;
    var_x = (n-1) ./ n .* var(Y);
    min_X = min(x);
    max_X = max(x);
    
    l = 0;
    
    switch (dist)
        case 'exponential'
            l = 1;
            params = 1 / mean_x;
        case 'normal'
            l = 2;
            param_mu = mean_x;
            param_sigma = sqrt(var_x);
            %param_sigma = sqrt(var(X));
            params = [param_mu, param_sigma];
        case 'uniform'
            l = 2; %0 ??????
            param_a = min_X;
            param_b = max_X;
            params = [param_a, param_b];
        case 'gamma'
            % l = 2;
            % param_a = mean(X) * mean(X) / var(X);
            % param_b = mean(X) / var(X);
            l = 1; %0 ??????
            param_a = k;
            param_b = 1/param_a * mean_x;
            params = [param_a, param_b];
        case 'beta'
            fprintf('==================%s IS NOT SUPPORTED==================\n', dist); return;
            l = 2; %0 ??????
            param_a = min_X;
            param_b = max_X;
            params = [param_a, param_b];
        case 'student'
            fprintf('==================%s IS NOT SUPPORTED==================\n', dist); return;
            l = 1;
            param_n = 1 / mean_x;
            params = param_n;
        case 'snedecor-fisher'
            fprintf('==================%s IS NOT SUPPORTED==================\n', dist); return;
            l = 2; %0 ??????
            param_m = min_X;
            param_n = max_X;
            params = [param_m, param_n];
        case 'pearson'
            fprintf('==================%s IS NOT SUPPORTED==================\n', dist); return;
            l = 2;
            np = 6;
            sigma = 1;
            params = [np / 2, 2 * sigma * sigma];
            dist = 'gamma';
    end
    i = 1:k;
    p0 = ContinuousCDF(X(i + 1), dist, params) - ContinuousCDF(X(i), dist, params);

    chi2_value = sum(((N - n .* p0) .^ 2) ./ (n .* p0));
    chi2_quantile = chi2inv(1 - alpha, k - 1 - l);
    
    if (chi2_value < chi2_quantile)
        if (l == 0)
            fprintf("Nem paraméteres Chi2 teszt, folytonos %s eloszlást követ.\n", dist);
        else
            fprintf("Paraméteres Chi2 teszt, folytonos %s eloszlást követ.\n", dist);
        end
    else
        fprintf("Nem követ folytonos %s eloszlást.\n", dist);
    end
    %fprintf("p0 == "); disp(p0);
    fprintf("   Próba értéke: %.4f\n", chi2_value);
    fprintf("   Kvantilis értéke: %.4f\n", chi2_quantile);
    fprintf("Params == "); disp(params);
    fprintf("\n");
end