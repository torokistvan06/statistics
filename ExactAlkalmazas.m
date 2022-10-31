function ExactAlkalmazas (distribution_type)
    parameters = [2, 4];
    X = ExactInversion(distribution_type, parameters, 10000);
    histogram(X);
    % x = 0:0.01:1;
    % f = ContinuousPDF(x, distribution_type, parameters);
    % plot(x,f,'r');

    % F = ContinuousCDF(x, distribution_type, parameters);
    % plot(x,F,'b');
end
