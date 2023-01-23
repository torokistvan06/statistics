% Török István-Dániel, tiim2094, 534 csoport

function feladat1()
    X = [331.9, 331.5, 329.7, 332.2, 329.5, 329.8, 330.3, 329.7, 330.5];
    Y = [330.9, 327.2, 328.9, 328.4, 329.9, 329.3, 330.6, 323.3];
     
    alpha = 1 - 0.92;
    sigma = 2.4;
    mu_0 = 330;
    tail = 'left';
    
    [ci_u, ci_mu, u_value, p_value, H] = UTest(Y, mu_0, sigma, alpha, tail)

    equal_std = 0;
    alpha = 1 - 0.94;
    tail = 'right';
    
    [ci_t, ci_delta, t_value, p_value, H] = TTest2D(X, Y, equal_std, alpha, tail)
    
end