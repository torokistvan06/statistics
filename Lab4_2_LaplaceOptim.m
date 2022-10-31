function X = Lab4_2_LaplaceOptim(n,s,nu)
    X=zeros(1,n);
    a=sqrt(e)/2;
    for i=1:n
      while true
        U=ULEcuyerRNG(1:1);
        V=ULEcuyerRNG(1:1);
        Y=tan(pi*V);
        S=Y*Y;
        if (U<=a*(1+S)*e^(-S/2))
          break;
        end
      end
    X(i)=Y* s + nu;
    end
end
