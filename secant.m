function out = secant(f,a,b,MaxErr,N)

format LONGENG;
digits(N);

syms x;
syms h;
g = inline(f);
g1 = inline(limit((g(x+h)-g(x))/h,h,0));
g2 = inline(limit((g1(x+h)-g1(x))/h,h,0));
w1 = g1(a:MaxErr/100:b);
w2 = g2(a:MaxErr/100:b);
if isempty(find(isnan(w1), 1)) == 0
    disp('Your function maynot converge in this interval');
    out.suc = 'err';
    return;
elseif isempty(find(isnan(w2), 1)) == 0
    disp('Your function maynot converge in this interval');
    out.suc = 'err';
    return;
elseif isempty(find(abs(w1)>1000000)) == 0
    disp('Your function maynot converge in this interval');
    out.suc = 'err';
    return;
elseif isempty(find(abs(w2)>1000000)) == 0
    disp('Your function maynot converge in this interval');
    out.suc = 'err';
    return;
else
    while abs(b-a) > MaxErr
        c = (a*g(b) - b*g(a))/(g(b) - g(a));
        a = b;
        b = c;
        if abs(g(c)) < MaxErr
            out.value = double(vpa(c));
            out.suc = 'suc';
            break;
        end
        out.suc = 'suc';
        out.value = double(vpa(c)); 
    end
end