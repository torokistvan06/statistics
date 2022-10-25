function X = Poisson (r,lambda)
  X=zeros(1,r);
  for k=1:r
    u=UMersenneTwisterRNG(1:1);
    i=0;
    p=e^(-lambda);
    S=p;
    while (u>S)
      i=i+1;
      p=(lambda/i)*p;
      S=S+p;     
    end
    X(k)=i;
  end
end
