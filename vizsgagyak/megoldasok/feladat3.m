function feladat3()
    X = ExactInversion('vizsga2022', [], 10000);
    disp(mean(X))
    disp(mean(X.^5))
end