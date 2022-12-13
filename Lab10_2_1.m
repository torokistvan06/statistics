function Lab10_2_1()
    X = [18.0, 13.9, 21.3, 19.4, 19.6, 20.8, 17.2, 18.5, 20.3, 21.2, 17.4, 16.6, 18.9, 20.4, 21.3, 20.2];
    Y = [21.7, 20.8, 18.7, 19.9, 18.6, 19.9, 19.5, 21.8, 19.7, 18.8, 19.9, 22.7];

    alpha = 0.07;
    
    [ci_t, ci_mu, t_value, p_value, H] = TTest(X, 20, alpha, 'left');
    fprintf("ci_t = %d\n", ci_t);
    fprintf("ci_mu = %d\n", ci_mu);
    fprintf("t_value = %d\n", t_value);
    fprintf("p_value = %d\n", p_value);
    
    if (H == 1)
        fprintf("2.1.A.) Elsõ szélturbina hatásfoka kevesebb 20kW-nál | H == %d\n", H);
    else
        fprintf("2.1.A.) Elsõ szélturbina hatásfoka nagyobb 20kW-nál | H == %d\n", H);
    end

    alpha = 0.08;
    if ( abs(var(X) - var(Y)) < eps )
      equal_std = 1;
    else
      equal_std = 0;
    end

    [ci_t, ci_delta, t_value, p_value, H] = TTest2D(X, Y, equal_std,  alpha, 'left');
    fprintf("ci_t = %d\n", ci_t);
    fprintf("ci_delta = %d\n", ci_delta);
    fprintf("t_value = %d\n", t_value);
    fprintf("p_value = %d\n", p_value);

    if (H == 1)
        fprintf("2.1.B.) Második szélturbina hatásfoka nagyobb az elsõnénél | H == %d\n", H);
    else
        fprintf("2.1.B.) Második szélturbina hatásfoka kisebb az elsõnél | H == %d\n", H);
    end
end
