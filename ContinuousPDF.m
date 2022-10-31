% -----------
% Description
% -----------
% The function evaluates different continuous probability density functions.
%
% -----
% Input
% -----
% \mathbf{x} = \left[x_i\right]_{i=1}^n - an increasing sequence of real numbers
% distribution_type                     - a string that identifies the distribution (e.g., 'exponential',
%                                         'normal', 'chi2', 'gamma', 'beta', 'Student', etc.)
% parameters                            - an array of parameters which characterize the distribution
%                                         specified by distribution_type
%
% ------
% Output
% ------
% \mathbf{f} = \left[f_i\right]_{i=1}^n  = \left[f(x_i)\right]_{i=1}^n} - values of the given probability density function
%
function f = ContinuousPDF(x, distribution_type, parameters)
% for safety reasons
x = sort(x);
% get the size of the input array
n = length(x);
% select the corresponding distribution
switch (distribution_type)

    case 'normal'
        % the N(mu,sigma)-distribution has two parameters, where mu in \mathbb{R} and sigma > 0
        mu    = parameters(1);
        sigma = parameters(2);

        % check the validity of the distribution parameters
        if (sigma <= 0)
            error('The standard deviation must be a strictly positive number!');
        end
        f = (1.0 / sqrt(2.0 * pi) / sigma) * exp(-(x - mu).^ 2 / 2.0 / sigma^2);

    % handle another continuous distribution type
  case 'beta'
        a = parameters(1);
        b = parameters(2);
        if (a <= 0 || b <=0 )
            error('Wrong parameter');
        end
        for i=1:n
          if(x(i)>0 && x(i)<1)
            B = (gamma(a)*gamma(b))/gamma(a+b);
            f(i) = (1/B)* x(i)^(a-1)*(1-x(i))^(b-1);
          else
            f(i)=0;
          end
        end
  case 'egyenletes'
        a = parameters(1);
        b = parameters(2);
        if (a >= b )
            error('Wrong parameter');
        end
        f = zeros(1,n);
        for i=1:n
          if(x(i)<a || x(i)>b)
            f(i)=0;
          else
            f(i)=1/(b-a);
          end
        end
   case 'student'
        N=parameters(1);
        if (N < 1)
            error('Wrong parameter');
        end
        f = zeros(1,n);
        for i=1:n
          G1=gamma((N+1)/2);
          G2=gamma(N/2);
          gyok=sqrt(N*pi);
          resz = (1 + (x(i)^2)/N)^(-((N+1)/2));
          f(i) = (G1/(gyok*G2))*resz;
        end
   case 'exponencialis'
        l = parameters(1);
        if (l <= 0)
            error('Wrong parameter');
        end
        f = zeros(1,n);
        
        for i=1:n
          if( x(i) >= 0 )
              f(i)=l*(exp(-l*x(i)));
          else
              f(i)=0;
          end
        end
   case 'gamma'
        a=parameters(1);
        b=parameters(2);

        if(a<=0 || b<=0)
            error('Wrong parameter');
        end

        f=zeros(1,n);

       for i=1:n
         if(x(i) >0)
            f(i) = (1/(((b^a)*gamma(a))))*x(i)^(a-1)*exp(-x(i)/b);
         else
            f(i)=0;
         end
       end
   case 'fisher'
       N = parameters(2);
       m = parameters(1);
       if(N<=0 || m <=0)
        error('Wrong parameters');
       end
       f = zeros(1,n);
       for i=1:n
         if(x(i)>=0)
          B = (gamma(m/2)*gamma(N/2))/gamma((m+N)/2);
          f(i)=1/B .* (m/N).^(m/2) .* (x(i).^(m/2 - 1))/((1+(m/N).*x(i)).^((m+N)/2));
         else
          f(i) = 0;
         end
       end
   case 'pearson'
       N = parameters(1);
       sigma = parameters(2);
       f = zeros(1,n);
       for i=1:n
         G = gamma(N/2);
         szamlalo = x(i)^(N/2 - 1) * exp((-x(i))/(2*(sigma^2)));
         nevezo = 2^(N/2) * sigma^(N) * G;
         if (x(i) > 0)
           f(i) = szamlalo/nevezo;
         end
         if (x(i) <= 0)
           f(i) = 0;
         end
       end
       
   case 'Plusz'
        a = 1/34;
        f = zeros(1,n);
        for i=1:n
          if(x(i)<=-3)
            f(i) = 0;
          end

          if(x(i)>-3 && x(i)<=-1)
            f(i) = a*(x(i)+(1/2))^2;
          end

          if(x(i)>-1 && x(i)<=0)
            f(i) = ((5*a)/2)*(x(i)^4);
          end

          if(x(i)>0 && x(i)<=3)
            f(i) = (1/12)*(x(i)^2 + 1/3);
          end

          if(x(i) > 3)
            f(i) = 0;
          end

        end
  case 'lab3'
      f = zeros(1,n);
      for i=1:n
        if (x(i) < -2 || x(i) > 3)
          f(i) = 0;
        else
          f(i) = 8/45 * (x(i)/4 + 1);
        end
      end
end
end
