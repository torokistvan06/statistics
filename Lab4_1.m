function X = Lab4_1(n)
    f=@(x)(1/16.*(2.*x + 1/2 * (3+x.^2) - x.^3)./3 + 1);
    X=zeros(1,n);
    M=f(2);
    for i=1:n
      u=UMersenneTwisterRNG(1:1);
      v=UMersenneTwisterRNG(1:1);
      a=-1;
      b=3;
      y=a+(b-a)*v;
      while u*M>f(y)
        u=UMersenneTwisterRNG(1:1);
        v=UMersenneTwisterRNG(1:1);
        y=a+(b-a)*v;
      end
    X(i)=y;
    end
end
