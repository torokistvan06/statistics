function TruncatedGeo() 
    figure(1);
    X = Poisson(10000, 9);
    histogram(X);
    figure(2);
    p = 1/3;
    lambda = -log(1 - p);
    Y = ExactInversion('exponencialis', lambda, 10000);
    Y = ceil(Y);
    histogram(Y);
    title('Truncated Geo');
end
