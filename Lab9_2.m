function Lab9_2()
    X = [500.8, 499.96, 497.03, 503.36, 498.34, 507.65, 498.44, 501.64, 497.43, 500.50, 499.33, 501.67, 505.21, 497.63];
    Y = [500.11, 498.49, 500.31, 501.59, 498.36, 496.89, 497.43, 499.19, 498.42, 497.40, 500.12, 501.80, 499.25, 499.39, 493.40, 497.68, 495.82, 498.84];
    
    sigma_1 = 3.1;
    sigma_2 = 2.1;
    
    alpha = 0.04;
    
    [ci_u, ci_delta, u_value, p_value, H] = UTest2D(X, Y, sigma_1, sigma_2, alpha, 'right');
    
    fprintf("ci_u = "); disp(ci_u);
    fprintf("ci_delta = "); disp(ci_delta);
    fprintf("u_value = "); disp(u_value);
    fprintf("p_value = "); disp(p_value);
    
    if (H == 1)
        fprintf("2.) A második adagológép átlagosan kevesebb csicseriborsót adagol, mint az elsõ. | H == %d\n", H);
    else
        fprintf("2.) A második adagológép átlagosan több csicseriborsót adagol, mint az elsõ. | H == %d\n", H);
    end
end