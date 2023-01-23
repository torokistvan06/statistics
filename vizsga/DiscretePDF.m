% -----------
% Description
% -----------
% The function calculates the values of different discrete probability density functions.
%
% -----
% Input
% -----
% \mathbf{x} = \left[x_i\right]_{i=1}^n} - an increasing sequence of positive integers
% distribution_type                      - a string that identifies the distribution (e.g., 'Bernoulli',
%                                          'binomial', 'Poisson', 'geometric', etc.)
% parameters                             - an array of parameters which characterize the distribution
%                                          specified by distribution_type
%
% ------
% Output
% ------
% \mathbf{f} = \left[f(x_i)\right]_{i=1}^n - values of the given probability density function
function f = DiscretePDF(x, distribution_type, parameters)

% for safety reasons
sort(x);
x = round(x);

% get the size of the input array
n = length(x);

% select the corresponding distribution
switch (distribution_type)
    case 'uniform'
    N = parameters(1);
    if N < 0
      error('Wrong parameter!');
    end

    f = zeros(1,n);
    for i = 1:n
        if x(i) <= N && x(i) >= 1
            f(i) = 1/N;
        end
    end
    case 'geometric'
        % the Geo(p}-distribution has a single parameter p in (0,1)
        p = parameters(1);
        % check the validity of the distribution parameter p
        if (p < 0 || p > 1)
            error('Wrong parameter!');
        end
        f = zeros(1, n);
        q = 1 - p;
        for i = 1:n
            % check the validity of the current value x_i
            if (x(i) < 1)
                error('Incorrect input data!');
            else
                f(i) = q^(x(i) - 1) * p; % i.e., f_{Geo(p)}(x_i) = (1-p)^{x_i} * p, i=1,2,...,n
            end
        end
  case 'binomial'

        m = parameters(1);
        p = parameters(2);
        if( m < 1 || p < 0 || p > 1 )
            error('Incorrect input data!');
        end
        f = zeros(1, n);
        q = 1 - p;
        for i = 1:n
            if( x(i) < 0 || x(i) > m)
                %error('Incorrect input data!');
                f(i) = 0;
            else
                k = x(i);
                f(i) =  nchoosek(m, k) * p ^ k * q ^ (m - k);
            end
        end
   case 'bernoulli'
        p = parameters(1);
        if (p <0 || p > 1)
          error('Incorrect input data');
        end
        f = zeros(1,n);
        for i = 1:n
          if (x(i) == 0)
            f(i) = 1 - p;
          end
          if (x(i) == 1)
            f(i) = p;
          end
        end
   case 'hipergeometric'
        %N,M
        N = parameters(1);
        M = parameters(2);
        n_h= parameters(3);
        if ((N < 1) || (M<0) || (M>N) || (0>n_h) || (n_h>N))
            error('Wrong parameter!');
        end
        f = zeros(1, n);
        for i = 1:n
            if(max(0,n_h-N+M)<=x(i) && x(i)<=min(n_h,M))
                  f(i) = (nchoosek(M,x(i)) * nchoosek(N-M,n_h-x(i))) / nchoosek(N,n_h);
            end
        end
    case 'pascal'
        N = parameters(1);
        p = parameters(2);
        if (p < 0 || p > 1)
            error('Wrong parameter!');
        end
        f = zeros(1, n);
        q = 1 - p;
        for i = 1:n
            if (x(i) < 0)
                error('Incorrect input data!');
            else
                f(i)=nchoosek(N+x(i)-1,x(i))*p^N * (q)^x(i);
            end
        end
    case 'poisson'
        l=parameters(1);
        if(l<=0)
            error('Wrong parameter!');
        end
        f = zeros(1, n);
        for i = 1:n
            if (x(i) < 0)
                error('Incorrect input data!');
            else
                f(i) = (l^x(i)/factorial(x(i)))*(exp(-l));
            end
        end
    case 'Bernoulli'
        p = parameters(1);

        if(p < 0 || p > 1)
            error('Wrong parameter!');
        end

        f = zeros(1,n);

        for i = 1:n
            if(x(i) == 0)
                f(i) = 1 - p;
            end
            if(x(i) == 1)
                f(i) = p;
            end
        end
     case 'Plusz'

        f = zeros(1,n);
        for i=1:n
          if(x(i) < 0)
                f(i) = 0;
          end
            
          if (x(i)<=1 && x(i) > 0)
            f(i) = 0.027;
          end

          if (x(i)>1 && x(i)<=2)
            f(i) = 0.239;
          end

          if (x(i)>2 && x(i) <= 3)
            f(i) = 0.212;
          end

          if (x(i)>3 && x(i) <=4)
            f(i) = 0.169;
          end

          if (x(i)>4 && x(i) <= 5)
            f(i) = 0.162;
          end

          if (x(i)>5 && x(i) <=6)
            f(i) = 0.180;
          end

          if (x(i)>6 && x(i) <= 7)
            f(i) = 0.081;
          end
          
          if(x(i) > 7)
             f(i) = 0;
          end
       end

    % handle another discrete distribution type
    ...
end
