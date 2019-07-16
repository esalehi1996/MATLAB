function out = Newton_Raphson(f,x0,MaxErr,N)

format LONGENG;
digits(N);

syms h;
syms x;
g = inline(f);
g1 = inline(limit((g(x+h)-g(x))/h,h,0));
g2 = inline(limit((g1(x+h)-g1(x))/h,h,0));
c = x0;
c0 = c + 2*MaxErr;
CC = abs((g(x0)*g2(x0))/(g1(x0))^2);
if CC>=1
    disp('Wrong Interval');
    out.suc = 'err';
    return;
else
    while abs(c - c0) > MaxErr
        c0 = c;
        c = c - (g(c))/(g1(c));
    end
    out.value = double(vpa(c));
    out.suc = 'suc';
    return;
end