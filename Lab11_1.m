function Lab11_1
  X = [100.8, 102.5, 98.2, 97.5, 99.1, 99.4, 100.9, 95.6, 99.3, 99.1, 98.3, 99.6, 96.2, 99.0, 100.8, 97.5, 99.3, 97.2, 98.7, 98.2, 99.0, 98.6, 98.8, 97.3, 100.6, 99.3, 96.5];
  alpha = 0.04;
  sigma = 1.2;
  [ci_chi2, ci_std, chi2_value, p_value, H] = Chi2Test(X, sigma, alpha, 'right');
  fprintf("ci_chi2 = %f\n", ci_chi2);
  fprintf("ci_std = %f\n", ci_std);
  fprintf("chi2_value = %f\n", chi2_value);
  fprintf("p_value = %f\n", p_value);
  
  if H == 1
    fprintf("Az olaj mennyisegenek elmeleti hibaja meghaladja az eloirt minimalis 1.2 millimeteres erteket. | H == %d\n", H);
  else
    fprintf("Az olaj mennyisegenek elmeleti hibaja nem haladja meg az eloirt minimalis 1.2 millimeteres erteket. | H == %d\n", H);
  end
end
