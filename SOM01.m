clc
close all
clear

x = 6*rand(1,1000)-3;
my_noise = 0.2*randn(size(x));
y = sin(x)+my_noise;

figure(1);
plot(x,y,'.');

X = [x;y];
nctool