function X = BisectionMethod (distribution_type, parameters, x_min, x_max, epsilon, n)
  X=zeros(1,n);
  F=@(x)ContinuousCDF_matlab(x,distribution_type,parameters);
  %F=@(x)gamcdf(x,parameters(1),parameters(2));
  u_min=F(x_min);
  u_max=F(x_max);
  for i=1:n
    u=UMersenneTwisterRNG(1:1)*(u_max-u_min)+u_min;
    a=x_min;
    b=x_max;
    x=(a+b)/2;
    while (((b-a)>2*epsilon) && (abs(F(x)-u) > epsilon))
      if (u<F(x))
        b=x;
      else
        a=x;
      endif
      x=(a+b)/2;
    endwhile
  X(i)=x
  endfor
endfunction
