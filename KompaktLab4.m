function X = KompaktLab4 (n)
    f=@(x)(15/31 * (x.^3 .* (2 - x) .^2 + 1/2));
    X=zeros(1,n);
    M=f(1.2);
    for i=1:n
      u=UMersenneTwisterRNG(1:1);
      v=UMersenneTwisterRNG(1:1);
      a=0;
      b=2;
      y=a+(b-a)*v;
      while u*M>f(y)
        u=UMersenneTwisterRNG(1:1);
        v=UMersenneTwisterRNG(1:1);
        y=a+(b-a)*v;
      end
    X(i)=y;
    end
    mean(X)
    sqrt(var(X))
end
