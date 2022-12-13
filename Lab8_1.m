function n = Lab8_1(p)
    A = [0,1;p,1-p];
    mu = p;
    epsz = 0.05;
    n = 0;
    prob_to_reach = 0.95;
    pk = 0;
    exp_count = 2000;
    A(1,:) = [0,1];
    A(2,:) = DiscretePDF(A(1, :),'Bernoulli', p);
    while(pk < prob_to_reach)
        n = n + 1;
        good = 0;
        for i = 1:exp_count
            X = InversionByBinarieSearch(A,'LEcuyer',n);
            if(abs(mean(X)-mu) < epsz)
                good = good + 1;
            end
        end
        pk = good/exp_count;
        plot([0,n],[prob_to_reach,prob_to_reach],'r');
        hold on;
        plot(n,pk);
        stem(n,pk);
        drawnow;
    end
end

