function Y = AdamsMulton3rdOrder(f,x0,y0,h,steps)
format long;
n = steps;
fin=sym(f);
syms y;
syms x;
x1=x0+h;
x2=x1+h;
x3=x2+h;
U=RK4thOrder(f,x0,y0,h,2);
tmp=U(1, :);
y1=tmp(2);
tmp=U(2, :);
y2=tmp(2);
Y = zeros(n, 2);
Y(1, :) = [x1 y1];
Y(2, :) = [x2 y2];
for i=3:steps
    yp=y2+(h/12)*(23*subs(fin,{x y},{x2 y2})...
    -16*subs(fin,{x y},{x1 y1})+5*subs(fin,{...
    x y},{x0 y0}));
    y3=y2+(h/12)*(5*subs(fin,{x y},{x3 yp})+...
    8*subs(fin,{x y},{x2 y2})-subs(fin,{x y},{x1 y1}));
    Y(i, :) = [x3 eval(y3)];
    x0=x1;
    y0=y1;
    x1=x2;
    y1=y2;
    x2=x3;
    y2=y3;
    x3=x2+h;
end