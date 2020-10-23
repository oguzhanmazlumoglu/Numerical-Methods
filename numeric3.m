function Q3
 
clear all
clc
syms x;
N = input('How many subinterval do you want?: ');
 
a = 0;
b = pi;
f = @(x) (x.^2).*exp(x.^2);
 
h = (b-a)/(N);
 
T = a:h:b;
 
I = (3*h/8) * (f(T(1)) - 3*sum(f(T(3:3:end-1))) + 3*sum(f(T(2:1:end-1))) + 2*sum(f(T(3:3:end-1)))+ f(T(end)));
 
Exact = integral(f,0,pi);
 
Error = abs((Exact-I)/Exact)*100;
 
fprintf('The approximate result is %d\nThe exact result is %d\nError based on exact result is %d\n', I, Exact, Error)

 
