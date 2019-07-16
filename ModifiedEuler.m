function Y=ModifiedEuler(f,x0,y0,h,steps)
format long;
n = steps;
fin=sym(f);
syms y;
syms x;
x1=x0+h;
Y = zeros(n, 2);
for i=1:steps
y1=y0+h*subs(fin,{x y},{x0 y0});
y2=y0+0.5*h*(subs(fin,{x y},{x0 y0})+subs(fin,{x y},{x1 y1}));
Y(i, :) = [x1 eval(y2)];
x0 = x1;
y0 = y2;
x1 = x1 + h;
end