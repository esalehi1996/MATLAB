function [out, plot_data] = functioninterpolationnoy(func,X,flag,mantissa)
syms x;
Y=subs(func,x,X);
[out, plot_data] =pointinterpolation(X,Y,length(X),flag,mantissa);

    