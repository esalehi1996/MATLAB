function Y=RKMidPoint(f,x0,y0,h,steps)
format long;
fin=sym(f);
n = steps;
syms y;
syms x;
x1=x0+h;
Y = zeros(n, 2);
for i=1:steps
k1=h*subs(fin,{x y},{x0 y0});
k2=h*subs(fin,{x y},{x1 y0+k1});
y1=y0+0.5*(k1+k2);
Y(i, :) = [x1 eval(y1)];
x0 = x1;
y0 = y1;
x1 = x1 + h;
end