% Code to estimate the beam characteristics using Lowell model
clear all
close all
clc

angle_list = [0 :0.01:70]*pi/180;
flex_mod = 2; %EI
length   = 1; %l
n        = 0.3;
eta      = sqrt(1+n*n);
th_0     = max(angle_list);
lambda   = sin(th_0)-n*cos(th_0);

int_fun = @(th)(1./sqrt(lambda-sin(th)+n*cos(th)));

counter = 1;
for th = angle_list
   P(counter) = (flex_mod/(2*length*length))*(integral(int_fun,0,th)^2);
   counter =counter+1;
end
