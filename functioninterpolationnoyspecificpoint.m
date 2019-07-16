function [out1,out2]=functioninterpolationnoyspecificpoint(func,X,flag,x0,mantissa)
syms x;
Y=subs(func,x,X);
[out1,out2]=pointinterpolationandspecificpoint(X,Y,length(X),flag,x0,mantissa);

