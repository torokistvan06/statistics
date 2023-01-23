function feladat1()

X = [150.4, 150.3, 151.2, 154.7, 147.8, 151.1, 146.3, 150.1, 152.4, 150.8, 153.1, 151.5, 149.6];
Y = [149.2, 152.8, 151.3, 152.9, 153.7, 149.8, 151.6, 150.7, 156.2, 155.1, 153.5, 154.2];

disp("TTest2D");
disp("right");
[ci_t, ci_delta, t_value, p_value, H] = TTest2D(X, Y, 1, 0.05, 'right');

t_value
ci_t
ci_delta
p_value
H

disp("Chi2Test");
disp("right");

[ci_chi2, ci_std, chi2_value, p_value, H] = Chi2Test(Y, 2.2, 0.02, 'right');

chi2_value
ci_std
p_value
H

end
