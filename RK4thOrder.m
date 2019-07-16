function Y = RK4thOrder(f,x0,y0,h,steps)
format long;
n=steps;
fin=sym(f);
syms y;
syms x;
x1=x0+h;
Y = zeros(n, 2);
for i=1:steps
k1=h*subs(fin,{x y},{x0 y0});
k2=h*subs(fin,{x y},{x0+h/2 y0+k1/2});
k3=h*subs(fin,{x y},{x0+h/2 y0+k2/2});
k4=h*subs(fin,{x y},{x1 y0+k3});
y1=y0+(1/6)*(k1+2*k2+2*k3+k4);
Y(i, :) = [x1 eval(y1)];
x0 = x1;
y0 = y1;
x1 = x1 + h;
end