function X = Hurmodszer(distribution_type, parameters, x_min, x_max, epsilon, n)
  X=zeros(1,n);
  F=@(x)ContinuousCDF_matlab(x,distribution_type,parameters);
  u_min=F(x_min);
  u_max=F(x_max);
  for i=1:n
    u=UMersenneTwisterRNG(1:1)*(u_max-u_min)+u_min;
    a=x_min;
    b=x_max;
    x=a+((b-a)/(F(b)-F(a)))*(u-F(a));
    while true
      if (u<F(x))
        b=x;
      else
          a=x;
          endif
          x=a+((b-a)/(F(b)-F(a)))*(u-F(a));
          if (((b-a)<=epsilon) || (abs(u-F(x)) < epsilon))
            break;
          end
      end
    X(i)=x;
    end
  end
end