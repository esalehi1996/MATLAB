function out = Fixed_Point_Plus_AB_Plus_G(f,x0,a,b,g,step,N)

format LONGENG;
digits(N);

syms x;
syms h;
c = x0;
F = inline(f);
G = inline(g);
G1 = inline(limit((G(x+h)-G(x))/h,h,0));
G2 = inline(limit((G1(x+h)-G1(x))/h,h,0));
w2 = G2(a:0.0001:b);
if x0>a && x0<b
    if isempty(find(isnan(w2), 1)) == 0
        disp('Your Function maynot converge with this g(x)');
        out.suc = 'err';
        return;
    else
        for i = a:0.001:b
            if G(i)>a && G(i)<b
            else
                disp('Your Function maynot converge with this g(x)');
                out.suc = 'err';
                return;
            end
        end
        for i = a:0.001:b
            if abs(G1(i)) < 1
            else
                disp('Your Function maynot converge with this g(x)');
                out.suc = 'err';
                return;
            end
        end
        for i = 1:step
            c = G(c);
        end
        out.value = double(vpa(c));
        out.suc = 'suc';
        return;
    end
else
    disp('Wrong Interval according to initial point');
    out.suc = 'err';
    return;
end