function [out, t] = trap(a,b,f,h)
t = a:h:b;
g = inline(f);
x = a+h;
y = b;
sum = g(a);

while x < b
    x = x + h;
   % disp(x)
    sum = sum + g(x);
end
sum = sum + g(b);

sum = sum*h/2;
out = sum;
return
