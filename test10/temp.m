clear;clc
x=1:1:60;
y=(x+1)./x-(0.9).^x;
plot(x,y)
A = [1/4 1/3 1/2;
    1/5 1/4 1/3;
    1/3 1/2 1];
B = [1/2;
    0.4;
    1];
X = A\B;
disp(X)