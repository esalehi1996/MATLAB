function [out, t] = simpson3(a,b,f,h)
t = a:h:b;
g = inline(f);
x = a;
y = b;
sum = 0;

sum = sum + g(x);
x = x+h;


while x < b
    x = x + h;
    sum = sum + cof*g(x);
    
    if cof == 2
        cof = 4;
    else cof = 2;
    end
end
sum  = sum + g(b);

sum = (sum*h)/3;
out = sum;
return
