function Lab11_2
  X = [750, 753, 747, 748, 751, 748, 751, 753, 752, 749, 750, 753, 748, 752, 748, 752, 749, 751, 750, 749];
  Y = [746, 753, 747, 751, 751, 747, 748, 745, 754, 747, 744, 748, 750, 747, 748, 746, 754, 752, 745];
  alpha = 0.05;
  [ci_f, ci_lambda, f_value, p_value, H] = FTest2D(X,Y,alpha,'both');
  fprintf("ci_f = %f\n", ci_f);
  fprintf("ci_lambda = %f\n", ci_lambda);
  fprintf("f_vakye = %f\n", f_value);
  fprintf("p_value = %f\n", p_value);
  if(H==0)
    fprintf("Azonos hiba. | H == %d\n", H);
  else
    fprintf("Nem azonos hiba. | H == %d\n", H);
  end
  if ( abs(var(X) - var(Y)) < eps )
    equal_std = 1;
  else
    equal_std = 0;
  end
  alpha = 1 - 0.91;
  [ci_t, ci_delta, t_value, p_value, H] = TTest2D(X, Y, equal_std, alpha, 'right');
  fprintf("ci_t = %f\n", ci_t);
  fprintf("ci_delta = %f\n", ci_delta);
  fprintf("t_value = %f\n", t_value);
  fprintf("p_value = %f\n", p_value);
  if(H==1)
    fprintf("Az elso cukraszda eseten a sutemenyes dobozok atlagos sulya nagyobb, mint a masodik cukraszda eseten. | H == %d\n", H);
  else
    fprintf("Az elso cukraszda eseten a sutemenyes dobozok atlagos sulya kisebb vagy egyenlo, mint a masodik cukraszda eseten. | H == %d\n", H);
  end
end
