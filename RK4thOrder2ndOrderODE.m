function Y = RK4thOrder2ndOrderODE(f,g,x0,y0,z0,h,steps)
format long;
n=steps;
fin=sym(f);
gin=sym(g);
syms x;
syms y;
syms z;
x1=x0+h;
Y = zeros(n, 2);
for i=1:steps
    kf1=subs(fin,{x y z},{x0 y0 z0});
    kg1=subs(gin,{x y z},{x0 y0 z0});
    kf2=subs(fin,{x y z},{x0+h/2 y0+(h/2)*kf1 z0+(h/2)*kg1});
    kg2=subs(gin,{x y z},{x0+h/2 y0+(h/2)*kf1 z0+(h/2)*kg1});
    kf3=subs(fin,{x y z},{x0+h/2 y0+(h/2)*kf2 z0+(h/2)*kg2});
    kg3=subs(gin,{x y z},{x0+h/2 y0+(h/2)*kf2 z0+(h/2)*kg2});
    kf4=subs(fin,{x y z},{x0+h y0+h*kf3 z0+h*kg3});
    kg4=subs(gin,{x y z},{x0+h y0+h*kf3 z0+h*kg3});
    y1=y0+(h/6)*(kf1+2*kf2+2*kf3+kf4);
    z1=z0+(h/6)*(kg1+2*kg2+2*kg3+kg4);;
    Y(i, :) = [x1 eval(y1)];
    x0=x1;
    y0=y1;
    z0=z1;
    x1=x0+h;
end