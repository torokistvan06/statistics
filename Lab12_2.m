function  Lab12_2()
X = [0.65, 4.03, 3.04, 5.47, 0.90, 0.75, 1.81, 1.21, 0.25, 0.97, 3.68, 6.54, 1.55, 1.61, 1.37, 5.01, 0.01, 2.91, 2.26, 1.04, 1.08, 3.50, 5.27, 9.02, 0.38, 2.88, 0.22, 1.63, 0.81, 1.83, 5.43, 6.05, 0.36, 0.76, 3.70, 3.83, 0.41, 13.18, 3.36, 1.53, 0.14, 1.56, 1.70, 2.13, 3.40, 1.68, 5.62, 0.08, 7.08, 0.22, 1.08, 2.69, 3.38, 0.06, 2.27, 5.13, 0.19, 5.35, 0.25, 0.19, 0.38, 3.31, 0.03, 3.40, 3.72, 1.86, 2.70, 0.39, 7.26, 0.80, 8.37, 3.97, 0.10, 0.25, 1.30, 0.05, 0.09, 6.58, 9.96, 8.36, 1.09, 0.52, 3.10, 2.10, 6.43, 5.15, 0.92, 1.57, 0.78, 0.34, 1.64, 0.17, 2.15, 0.37, 2.93, 3.89, 6.89, 0.74, 2.86, 3.81, 0.52, 3.27, 3.53, 0.77, 0.18, 0.92, 5.01, 1.18, 2.96, 3.39, 1.07, 2.36, 0.35, 2.21, 0.82, 12.72, 0.24, 9.71, 0.69, 4.81, 1.03, 4.65, 3.95, 4.70, 1.72, 2.90, 4.91, 1.37, 1.65, 3.95, 0.48, 4.78, 2.43, 3.29, 1.27, 1.90, 1.36, 0.10, 2.59, 5.69];
input_type = 'flat';
alpha = 0.01;
switch (input_type)
    case 'flat'
            n=length(X);
            k=round(1+log2(n)); %optimalis kategoriaszam rogzitett
            N=hist(X,k); % hogy tudjuk Ni-t valtozo

            lambda_ = 1/mean(X);

            x_min = min(X);
            x_max = max(X);
            x = linspace(x_min,x_max,k+1);

            index=1:k;
            p0=ContinuousCDF(x(index+1), 'exponencialis', lambda_)-ContinuousCDF(x(index), 'exponencialis', lambda_); %valtozo
            
            chi2_value = sum(((N-n.*p0).^2)./(n.*p0));
            chi2_quantile = chi2inv(1-alpha,(k-1)-1);
            H = ~(chi2_value < chi2_quantile);

            if(H == 0)
                disp('exponencialis eloszlas');
                disp(lambda_);
            else
                disp('nem exponencialis eloszlas');
            end

    case 'table'
            n = sum(N);
            k=length(X);
            lambda_ = 1/mean(lab12_flatten(X,N));
            
            index=1:k;
            p0=ContinuousCDF(INT(2*index), 'exponential', lambda_)-ContinuousCDF(INT(2*index-1), 'exponential', lambda_); %valtozo

            chi2_value = sum(((N-n.*p0).^2)./(n.*p0));
            chi2_quantile = chi2inv(1-alpha,(k-1)-1); % -1 valtozo(attol fugg hany parametert becsultunk)
            H = ~(chi2_value < chi2_quantile);

            if(H == 0)
                disp('exponencialis eloszlas');
                disp('lambda=');
                disp(lambda_);
            else
                disp('nem exponencialis eloszlas');
            end

end


end

