% -----------
% Description
% -----------
% The function implements the sequential inversion method(@\footnote{\textbf{method} \emph{m�dszer}; \textbf{inversion $\sim$} \emph{inverzi�s m�dszer}; \textbf{rejection $\sim$} \emph{elutas�t�sos m�dszer}; \textbf{squeeze $\sim$} \emph{k�z\-re\-fo\-g�\-sos m�dszer}}@) for finite discrete random
% variable sampling.
%
% -----
% Input
% -----
% X           - a finite discrete random variable given as a matrix in the form
%
%              [ x_1, x_2, ..., x_n;
%                p_1, p_2, ..., p_n]
%
% uniform_rng - specifies the type of the used uniform integer radom number generator,
%               can be set as 'LEcuyer'/'MersenneTwister' or 1/2 (in case of other
%               values the function it will use the built-in uniform random number
%               generator of $\GMatlab$)
%
% count       - size of the output sample
%
% ------
% Output
% ------
% sample     - a random sample of the given finite discrete random variable
%
function sample = InversionByBinarySearch(X, uniform_rng, count)

% input checking
[row_count, column_count] = size(X);

if (row_count ~= 2)
    error('Wrong input discrete random variable!');
end

for j = 1:column_count
    if (X(2,j) < 0 || X(2,j) > 1)
        error('Wrong input discrete random variable!');
    end
end

total_probability = sum(X(2,:));
if (total_probability > 1.0001)
    error('Wrong input discrete random variable!');
end

% assume accumulated errors
if (total_probability < 1)
    X(2, column_count) = 1 - sum(X(2, 1:column_count-1));
end

% calculate cumulative probabilities
cumulative_probabilities = cumsum(X(2,:));

% allocate memory
sample = zeros(1, count);

% perform sequential searching(@\footnote{\textbf{to search} \emph{keresni}; \textbf{sequential $\sim$ing} \emph{szekvenci�lis keres�s}}@)
for k = 1:count

    switch (uniform_rng)
        case {'LEcuyer', 1}
            u = ULEcuyerRNG();

        case {'MersenneTwister', 2}
            u = UMersenneTwisterRNG();

        otherwise
            u = rand();
    end

    i = 1;
    ok = 0;
    j = column_count;
    while(ok == 0)
        mid = fix((i+j)/2);
        if(cumulative_probabilities(mid) < u && (mid == column_count || cumulative_probabilities(mid+1) > u)) %felette
                sample(k) = X(1, mid+1);
                break;
        end
        if((cumulative_probabilities(mid) > u) && (mid == 1 || cumulative_probabilities(mid-1) < u)) %alatta
                sample(k) = X(1, mid);
                break;
        end
        if(cumulative_probabilities(mid) == u)
                sample(k) = X(1, mid);
                break;
        end
        if(cumulative_probabilities(mid) < u) %felette
                i = mid + 1;
        else
                j = mid - 1;
        end
    end

end
