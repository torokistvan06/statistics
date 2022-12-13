function X = ExactInversion (distribution_type, parameters,n)
  U=ULEcuyerRNG(1,n);
  X = zeros(1, n);
  switch(distribution_type)
    case 'lab8'
      theta = parameters(1);
      
      for i=1:n
        X(i) = (-1 + sqrt(1-U(i)))/(-2*theta);
      end
    case 'exponencialis'
      lambda = parameters(1);
      if(lambda<=0)
          error('Nem jo parameter');
      end
      for i=1:n
        X(i)=(-1/lambda)*log(U(i));
      end
    case 'Cauchy'
      s=parameters(1);
      if(s<=0)
          error('Nem jo parameter');
      end
      for i=1:n
        X(i)=s*tan(pi*U(i));
      end
    case 'Rayleigh'
      s=parameters(1);
      if(s<=0)
          error('Nem jo parameter');
      end
      for i=1:n
        X(i)=s*sqrt(-2*log(U(i)));
      end
    case 'haromszog'
      a=parameters(1);
      if(a<=0)
          error('Nem jo parameter');
      end
      for i=1:n
        X(i)=a*(1.-sqrt(U(i)));
      end
    case 'Rayleigh-veg'
      a=parameters(1);
      if(a<=0)
          error('Nem jo parameter');
      end
      for i=1:n
       X(i)=sqrt(a*a-log(U(i)));
      end
    case 'Pareto'
      a=parameters(1);
      b=parameters(2);
      if (a<=0 || b<=0)
          error('Nem jo parameterek');
      end
      for i=1:n
        X(i)=b/(U(i)^(1/a));
      end

    case 'lab3'
      for i=1:n
        if (U(i) >= -2 && U(i) <=3)
          X(i) = -4 + sqrt(4+45*U(i));
        end
      end
  end
end

