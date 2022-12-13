function Lab10_2_2

    X = [500.8, 499.96, 497.03, 503.36, 498.34, 507.65, 498.44, 501.64, 497.43, 500.50, 499.33, 501.67, 505.21, 497.63];
    Y = [500.11, 498.49, 500.31, 501.59, 498.36, 496.89, 497.43, 499.19, 498.42, 497.40, 500.12, 501.80, 499.25, 499.39, 493.40, 497.68, 495.82, 498.84];
    
    alpha = 0.04;
    
    if ( abs(var(X) - var(Y)) < eps )
      equal_std = 1;
    else 
      equal_std = 0;
    end
    
    [ci_t, ci_delta, t_value, p_value, H] = TTest2D(X, Y, equal_std, alpha, 'right');
    fprintf("ci_t = %d\n", ci_t);
    fprintf("ci_delta = %d\n", ci_delta);
    fprintf("t_value = %d\n", t_value);
    fprintf("p_value = %d\n", p_value);
    
    if(H == 1)
       fprintf('Az elso gep kevesebbet tolt a zacskokba! | H == %d\n', H);
    else
       fprintf('Az elso gep atlagban nem tolt kevesebbet a zacskokba, mint a masodik! | H == %d\n', H);
    end
end

