function Lab6_3_Test()

mu = [1; 4; 8; 3];
d = 4;
s1 = 1;
s2 = 1;
s3 = 1;
s4 = 1;
p12 = 1/2;
p13 = 1;
p14 = 1/2;
p23 = -1;
p24 = 1;
p34 = -1;

A =[s1*s1, s1*s2*p12, s1*s3*p13, s1*s4*p14; s1*s2*p12, s2*s2, s2*s3*p23, s2*s4*p24; s1*s3*p13, s2*s3*p23, s3*s3, s3*s4*p34; s1*s4*p14, s2*s4*p24, s3*s4*p34, s4*s4];

[~,Y] = Lab6_3(d, mu, A, 1000);

plot3(Y(:,1),Y(:,2),Y(:,3),'r.');
hold on;
plot3(Y(:,1),Y(:,2),Y(:,4),'g.');
hold on;
plot3(Y(:,1),Y(:,4),Y(:,3),'b.');
hold on;
plot3(Y(:,4),Y(:,2),Y(:,3),'y.');
figure;

A = [s1*s1, s1*s2*p12, s1*s3*p13; s1*s2*p12 s2*s2, s2*s3*p23; s1*s3*p13, s2*s3*p23, s3*s3];

[~,Y] = Lab6_3(3, [1;1;1], A, 1000);
plot3(Y(:,1),Y(:,2),Y(:,3),'r.');

end