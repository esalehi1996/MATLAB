function [out, t] = romberg(a,b,f,n)
t = a:(b - a):b;
h = (b - a) ./ (2.^(0:n-1));

g = inline(f);
r(1,1) = (b - a) * (g(a) + g(b)) / 2;

for j = 2:n
    sum = 0;
    for i = 1:2^(j-2)
        sum = sum + g(a+(2*i-1) * h(j));
    end
    r(j,1) = r(j-1,1) / 2+h(j) * sum;
    for k = 2:j
        r(j,k) = (4^(k-1)*r(j,k-1)-r(j-1,k-1)) / (4^(k-1)-1);
    end
end

out = r(n,n);
