function Y = Euler2ndOrderODE(f,g,x0,y0,z0,h,steps)
format long;
n = steps;
fin=sym(f);
gin=sym(g);
syms x;
syms y;
syms z;
x1=x0+h;
Y = zeros(n, 2);
for i=1:steps
    y1=y0+h*subs(fin,{x y z},{x0 y0 z0});
    z1=z0+h*subs(gin,{x y z},{x0 y0 z0});
    Y(i, :) = [x1 eval(y1)];
    x0=x1;
    y0=y1;
    z0=z1;
    x1=x0+h;
end