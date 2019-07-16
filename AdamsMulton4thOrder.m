function Y = AdamsMulton4thOrder(f,x0,y0,h,steps)
format long;
n = steps;
fin=inline(f);
syms y;
syms x;
x1=x0+h;
x2=x1+h;
x3=x2+h;
x4=x3+h;
U=Taylor(f,x0,y0,h,3,5);
tmp=U(1, :);
y1=tmp(2);
tmp=U(2, :);
y2=tmp(2);
tmp=U(3, :);
y3=tmp(2);
Y = zeros(n, 2);
Y(1, :) = [x1 y1];
Y(2, :) = [x2 y2];
Y(3, :) = [x3 y3];
for i=4:steps
    yp=y3+(h/24)*(55*subs(fin,{x y},{x3 y3})-59 ...
        *subs(fin,{x y},{x2 y2})+37*subs(fin,{x ...
        y},{x1 y1})-9*subs(fin,{x y},{x0 y0}));
    y4=y3+(h/24)*(9*subs(fin,{x y},{x4 yp})+19* ...
        subs(fin,{x y},{x3 y3})-5*subs(fin,{x y ...
        },{x2 y2})+subs(fin,{x y},{x1 y1}));
    Y(i, :) = [x4 eval(y4)];
    x0=x1;
    y0=y1;
    x1=x2;
    y1=y2;
    x2=x3;
    y2=y3;
    x3=x4;
    y3=y4;
    x4=x3+h;
end