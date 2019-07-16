function out = false_position(f,a,b,MaxErr,N)

format LONGENG;
digits(N);
g = inline(f);
syms x;

c = b - ((b-a)/(g(b)-g(a)))*g(b);
if g(a)*g(b) > 0
    disp('Wrong Interval');
    out.suc='err';
    return;
elseif g(a) == 0
    out.value = double(vpa(a));
    out.suc = 'suc';
    return;
elseif g(b) == 0
    out.value = double(vpa(b));
    out.suc = 'suc';
    return;
else
    while abs(a-b) > MaxErr
        c = b - ((b-a)/(g(b)-g(a)))*g(b);
        if abs(g(c)) < MaxErr
            out.value = double(vpa(c));
            out.suc = 'suc';
            return;
        end
        if g(b)*g(c) < 0
            a = c;
        else
            b = c;
        end
    end
    out.value = double(vpa(c));
    out.suc = 'suc';
    return;
end