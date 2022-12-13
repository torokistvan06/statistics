function [X] = Lab6_1_Marsaglia(n)
  X=zeros(n,2);
  for i=1:n
    U1=ULEcuyerRNG(1);
    U2=ULEcuyerRNG(1);
    Z1=2*U1-1;
    Z2=2*U2-1;
    S=Z1^2+Z2^2;
    while(S<0 || S >1)
      U1=ULEcuyerRNG(1);
      U2=ULEcuyerRNG(1);
      Z1=2*U1-1;
      Z2=2*U2-1;
      S=Z1^2+Z2^2;
    end
    T=sqrt((2*log(S))/(-S));
    X(i,1)=T*Z1;
    X(i,2)=T*Z2;
  end
  figure(1);
  hist3(X);
  figure(2);
  plot(X(:,1),X(:,2),'.r');
  
end
