function Lab12_3
    alpha = 0.02;
    X = [1:6];
    k = 6;
    N = [284, 259, 241, 210, 238, 268];
    n = sum(N);
    p0 = 1/6 * ones(1,6);
    chi2_value = sum(( (N - n .* p0) .^2) ./ (n .* p0));
    chi2_quantile = chi2inv(1 - alpha, k - 1);
    if (chi2_value < chi2_quantile)
        disp('Szabalyos a kocka');
    else
        disp('Nem szabalyos a kocka');
    end
end
