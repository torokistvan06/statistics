function Lab9_1()
    X = [18.0, 13.9, 21.3, 19.4, 19.6, 20.8, 17.2, 18.5, 20.3, 21.2, 17.4, 16.6, 18.9, 20.4, 21.3, 20.2];
    Y = [21.7, 20.8, 18.7, 19.9, 18.6, 19.9, 19.5, 21.8, 19.7, 18.8, 19.9, 22.7];

    sigma1 = 2.0;
    sigma2 = 1.3;
    alpha1 = 0.07;
    alpha2 = 0.08;
    
    [ci_u, ci_mu, u_value, p_value, H] = UTest(X, 20, sigma1, alpha1, 'left');
    
    fprintf("ci_u = "); disp(ci_u);
    fprintf("ci_mu = "); disp(ci_mu);
    fprintf("u_value = "); disp(u_value);
    fprintf("p_value = "); disp(p_value);
    
    if (H == 1)
        fprintf("1.A.) Elsõ szélturbina hatásfoka kevesebb 20kW-nál. | H == %d\n", H);
    else
        fprintf("1.A.) Elsõ szélturbina hatásfoka nagyobb 20kW-nál. | H == %d\n", H);
    end
    
    [ci_u, ci_mu, u_value, p_value, H] = UTest2D(X, Y, sigma1, sigma2, alpha2, 'left');
    
    fprintf("ci_u = "); disp(ci_u);
    fprintf("ci_mu = "); disp(ci_mu);
    fprintf("u_value = "); disp(u_value);
    fprintf("p_value = "); disp(p_value);
    
    if (H == 1)
        fprintf("1.B.) Második szélturbina hatásfoka nagyobb az elsõnénél. | H == %d\n", H);
    else
        fprintf("1.B.) Második szélturbina hatásfoka kisebb az elsõnénél. | H == %d\n", H);
    end
end