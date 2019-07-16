function [out2,out1]=pointinterpolationandspecificpoint(X,Y,n,flag,x0,mantissa)
syms x;
out1=pointinterpolation(X,Y,n,flag,mantissa);
out2=subs(out1,x,x0);
out2=vpa(out2,mantissa);
hold on;
scatter(x0,out2,'m');
legend('Interpolated polynomial','Actual points','Specific point');