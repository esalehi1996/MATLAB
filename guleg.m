function [out, t] = guleg(a,b,f,n)
t = a:h:b;
g = inline(f);
%computing c and x


x = ((b-a)*x + b + a)/2;
c = c*(b-a)/2;
c = c*g(x);

out = sum(c);