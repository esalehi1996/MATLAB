function out = montcarlo(a,b,f,h)
g = inline(f);
x = a;
y = b;
sum = 0;

while x < b
    x = x + h;
    r = a + (b-a)*rand(1);
    sum = sum + g(r);
end

sum = sum*h;
out = sum;
return