function Q2
 
clear all
clc
 
syms A B C
 
n = input('How many data points do you have?: ');
k = 1;
for i = 1:n
    fprintf('\n');
    fprintf('    Give data for point %i \n',i);
    fprintf('\n');
    x(k) = input(' Give x value!: ');
    y(k) = input(' Give y value!: ');
    fprintf('\n');
   
    
    xy(k) = x(k)*y(k);
    x2(k) = x(k)^2;
    x2y(k) = x2(k)*y(k);
    x3(k) = x(k)^3;
    x4(k) = x(k)^4;
    
    k = k+1;
    
end
 
sx = sum(x);
sy = sum(y);
sxy = sum(xy);
sx2 = sum(x2);
sx2y = sum(x2y);
sx3 = sum(x3);
sx4 = sum(x4);
 
eqn1 = A*sx4+B*sx3+C*sx2 == sx2y;
eqn2 = A*sx3+B*sx2+C*sx == sxy;
eqn3 = A*sx2+B*sx+C == sy;
 
[inp,outp] = equationsToMatrix([eqn1,eqn2,eqn3],[A,B,C]);
 
unks = linsolve(inp,outp);
 
A = unks(1);
B = unks(2);
C = unks(3);
 
F = @(x) A*(x^2) + B*(x) + C;
 
syms x 
disp(F(x))
 
