function Lab10_1 ()
  X = [30, 31, 30, 32, 30, 30, 31, 29, 31, 30, 31, 30, 30, 30, 29, 31, 31, 30, 31, 30];
  alpha = 0.07;
  
  [ci_t, ci_mu, t_value, p_value, H] = TTest(X, 30, alpha, 'right');
  fprintf("ci_t = %d\n", ci_t);
  fprintf("ci_mu = %d\n", ci_mu);
  fprintf("t_value = %d\n", t_value);
  fprintf("p_value = %d\n", p_value);
  
  if (H==1)
    fprintf('1.) A gep atlagosan tobb mint fel perc alatt tolti meg a dobozokat | H == %d\n', H);
  else
    fprintf('1.) A gep atlagosan kevesebb mint fel perc alatt tolti meg a dobozokat | H == %d\n', H);
  end

end
