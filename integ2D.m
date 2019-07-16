function out =  integ2D(a,b,c,d,f,h)

g = inline(f, 'x', 'y');

sum = 0;

while a < b
    x = c;
    while x < d
        x = x + h;
        sum = sum + g(a,x);
    end
    a = a+h;
end

sum = sum*h*h;
out = sum;