function X = Lab6_1_BoxMuller(n)
    X = zeros(n,2);
    U_1 = ULEcuyerRNG(n,1);
    U_2 = ULEcuyerRNG(n,1);
    R = sqrt(-2.*log(U_1));
    Theta = 2 .* pi .* U_2;
    X(:,1) = R .* cos(Theta);
    X(:,2) = R .* sin(Theta);
    hist3(X);
    figure;
    plot(X(:,1),X(:,2),'.r');
end