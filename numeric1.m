function NewtonsMethod
 
clear all
clc
 
syms x y
 
x0 = input('Give the value of x0!: '); 
y0 = input('Give the value of y0!: ');
 
TC = 10^(-20);
 
A = 1;
B = 1;
 
f1 = @(x,y)((1/5)*(exp(-2*A*x)-B*sin(x*y))-0.4325);
f2 = @(x,y)((1/5)*((x^2*y)+B*cos(x))-0.0643);
 
dxf1 = diff(f1, x); %df1/dx
dyf1 = diff(f1, y); %df1/dy
dxf2 = diff(f2, x); %df2/dx
dyf2 = diff(f2, y); %df2/dy
 
J = [dxf1,dyf1;dxf2,dyf2]; %J
 
 
invJ = matlabFunction(inv(J));%inverse function of J
 
x(1) = x0;
 
y(1) = y0;
 
i = 1;
 
E(1) = 100; 
 
while (E>TC);
    
    S = eval([x(i); y(i)] + (feval(invJ,x(i),y(i)) * [feval(f1,x(i),y(i)) ;  feval(f2,x(i),y(i))]));
 
    x(i+1) = S(1,1);
    y(i+1) = S(2,1);
    E(i+1) = eval(max(abs(((x(i+1)-x(i))/x(i+1))*100), abs((((y(i+1)-y(i))/y(i+1)))*100)));
 
    i = i+1;
 
end
disp('  ')
disp('After calculations;')
Error = E(i-1)
x = eval(x(i-1))
y = eval(y(i-1))
 
 
end






