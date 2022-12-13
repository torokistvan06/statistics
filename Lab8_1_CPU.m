function n = Lab8_1_CPU()
  mu=2800;
  sigma=708;
  epsilon=224;
  prob_to_reach = 0.9;
  exp_count=2000;
  n=0;
  p=0;
  hold on;
  while (p<prob_to_reach)
    n = n + 1;
    plot([0,n],[prob_to_reach, prob_to_reach],'r');
    good=0;
    for i=1:exp_count
      X=standard_5(n,sigma,mu);S
      if(abs(mean(X) - mu) < epsilon)
        good = good + 1;
      end
    end
    p=good/exp_count;
    stem(n,p);
    drawnow;
  end
  disp(n);
  

end
