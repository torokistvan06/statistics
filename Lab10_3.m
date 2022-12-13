function Lab10_3
  X = [253.3, 247.7, 251.9, 249.4, 252.4, 247.2, 250.8, 251.9, 250.1, 249.0, 245.6, 248.2, 249.6, 251.5, 248.1];
  Y = [249.9, 249.6, 248.1, 253.9, 250.5, 251.1, 250.6, 250.7, 248.1, 248.7, 248.0, 254.5, 249.6, 246.8, 249.0, 253.7, 251.2];
  alpha = 0.03;

  if ( abs(var(X) - var(Y)) < eps )
    equal_std = 1;
  else
    equal_std = 0;
  end

  [ci_t, ci_delta, t_value, p_value, H] = TTest2D(X, Y, equal_std, alpha, 'left');
  fprintf("ci_t = %d\n", ci_t);
  fprintf("ci_delta = %d\n", ci_delta);
  fprintf("t_value = %d\n", t_value);
  fprintf("p_value = %d\n", p_value);
  
  if(H == 1)
     fprintf('Masodik nap tobb | H == %d\n', H);
  else
     fprintf('Ugyanannyi, mint az elson vagy kevesebb | H == %d\n', H);
  end

end
