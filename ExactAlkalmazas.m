function ExactAlkalmazas ()
    figure(1);
    subplot(1, 2, 1);
    X = ExactInversion('lab3', [], 10000);
    histogram(X);
    subplot(1, 2, 2);
    x = 0:0.01:1;
    f = ContinuousPDF(x, 'lab3', []);
    plot(x,f,'r');

    figure(2);
    F = ContinuousCDF(x, 'lab3', []);
    plot(x,F,'b');
end
