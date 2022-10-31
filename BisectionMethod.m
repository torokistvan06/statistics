function X = BisectionMethod (distribution_type, parameters, x_min, x_max, epsilon, n)
  X=zeros(1,n);
  F=@(x)ContinuousCDF(x,distribution_type,parameters);
  u_min=F(x_min);
  u_max=F(x_max);
  for i=1:n
    u=UMersenneTwisterRNG(1:1)*(u_max-u_min)+u_min;
    a=x_min;
    b=x_max;
    x=(a+b)/2;
    while (((b-a) > epsilon) && (abs(F(x)-u) > epsilon))
      if (u<F(x))
        b = x;
      else
        a = x;
      end
      x = (a+b)/2;
    end
    X(i) = x;
  end
end
