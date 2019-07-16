function out = Fixed_Point_Minus_AB_Plus_G(f,x0,g,step,N)

format LONGENG;
digits(N);

syms x;
for a = x0-2:0.1:x0-0.01
    for b = x0+0.01:0.1:x0+2
        c = Fixed_Point_Plus_AB_Plus_G(f,x0,a,b,g,step,N);
        if strcmp(c.suc,'err')
            continue;
        end
        out.value = c.value;
        out.suc = c.suc;
        return;
    end
end
disp('x0 is too far from the answer');
out.suc = 'err';
return;
