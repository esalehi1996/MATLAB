function [out1,out2]=curvefitterpointsspecificpoint(X,Y,flag,x0,mantissa)
syms x;
out1=curvefitterpoints(X,Y,flag,mantissa);
out2=subs(out1,x,x0);
out2=vpa(out2,mantissa);
hold on;
scatter(x0,out2,'g');
legend('Fitted Curve','Actual points','Specific point');