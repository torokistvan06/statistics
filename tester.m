function tester()
    alpha = 0.01;
    X = [4.0900 5.1780 6.2660 7.3540 8.4420 9.5300 10.6180 11.7060 12.7940 13.8820 14.9700 16.0580 17.1460 18.2340 19.3220 20.4100];
    N = [25 88 256 523 982 1540 2084 2254 2039 1653 1043 561 295 122 35];
    dist = 'normal';
    %TestCont(alpha, X, N, dist);
    
    alpha = 0.01;
    X = [0 0.4767 0.9533 1.43 1.9067 2.3833 2.86 3.3367 3.8133 4.29 4.7667 5.2433 5.72 6.1967 6.6733 7.15];
    N = [8422 5265 3212 1972 1194 729 482 300 163 102 70 41 27 13 8];
    dist = 'exponential';
    %TestCont(alpha, X, N, dist);
    
    alpha = 0.01;
    k = 14;
    X = 0:13;
    x = 0:13;
    N = [1 37 183 755 2163 4061 5751 6199 4877 2872 1190 345 61 5];
    dist = 'binomial';
    %TestDisc(alpha, X, x, N, k, dist, 0);
    
    alpha = 0.01;
    k = 8;
    X = 0:7;
    x = 0:7;
    N = [3 12 22 25 19 11 5 2];
    dist = 'binomial';
    %TestDisc(alpha, X, x, N, k, dist, 0);
    
    alpha = 0.01;
    k = 14;
    X = 1:14;
    x = 1:14;
    N = [8312 3490 1550 688 317 142 53 22 11 8 3 1 2 1];
    dist = 'geometric';
    %TestDisc(alpha, X, x, N, k, dist, 1);
    
    alpha = 0.01;
    k = 12;
    X = 0:11;
    x = 0:11;
    N = [24 86 170 227 203 134 83 43 19 6 4 1];
    dist = 'poisson';
    TestDisc(alpha, X, x, N, k, dist, 1);
end