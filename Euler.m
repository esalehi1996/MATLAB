function Y = Euler(f,x0,y0,h,steps)%step is the number of (xi,yi) you want to show
format long;
n = steps;
Y = zeros(n, 2);
fin=sym(f);
syms y;
syms x;
x1=x0+h;
for i=1:steps
y1=y0+h*subs(fin,{x y},{x0 y0});
Y(i, :) = [x1 eval(y1)];
x0 = x1;
y0 = y1;
x1 = x1 + h;
end