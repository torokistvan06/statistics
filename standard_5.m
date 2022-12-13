function X = standard_5 (n,s,nu)
    X=zeros(1,n);
    a=sqrt(exp(1))/2;
    for i=1:n
      while true 
        U=ULEcuyerRNG(1:1);
        V=ULEcuyerRNG(1:1);
        Y=tan(pi*V);
        S=Y*Y;
        if (U<=a*(1+S)*exp(-S/2))
          break;
        end
      end
    X(i)=Y* s + nu;
    end
end