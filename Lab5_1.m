function X = Lab5_1 (n)
  X=zeros(1,n);
  alfa=1/sqrt(exp(1));
  beta=1/2;
  gam=sqrt(2);
  hany=0;
  stan=0;
  for i=1:n
    L=false;
    while (L==false)
      U=UMersenneTwisterRNG(1:1);
      V=UMersenneTwisterRNG(1:1);
      Y=tan(pi*V);
      S=beta*Y^2;
      W=(alfa*U)/(beta+S);
      if (abs(Y) > gam)
        L=false;
      else 
        L=(W <= 1-S);
      end
      if ( L == false)
        L = (W <= exp(-S));
        stan=stan+1;
      end
      hany=hany+1;
    end
    X(i)=Y;
  end
  disp(stan/n);
  disp(hany/n);
end
