function X = Newton_Raphson(distribution_type, parameters, epsilon, n, a, b, x_min)
  X=zeros(1,n);
  f=@(x)gampdf(x,parameters(1),parameters(2));
  F=@(x)gamcdf(x,parameters(1),parameters(2));
  f=@(x)ContinuousPDF(x,distribution_type,parameters);
  F=@(x)ContinuousCDF(x,distribution_type,parameters);
  kezdet=F(a);
  veg=F(b);
  for i=1:n
    disp(i)
    u=UMersenneTwisterRNG(1:1)*(veg-kezdet)+kezdet;
    x=x_min;
    y=0;
    x=x+(u-F(x))/f(x);
    while (abs(F(x)-u) > epsilon)
      y=y+1;
      if(y>500)
        break;
      end
      x=x+(u-F(x))/f(x);
    end 
    X(i)=x;
  end
end