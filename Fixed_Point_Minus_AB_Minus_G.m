function out = Fixed_Point_Minus_AB_Minus_G(f,x0,step,N)

format LONGENG;
digits(N);

syms x;
c = Fixed_Point_Minus_AB_Plus_G(f,x0,f+x,step,N);
if strcmp(c.suc,'suc')
    out.value = c.value;
    out.suc = c.suc;
    return;
end
d = Fixed_Point_Minus_AB_Plus_G(f,x0,(f+x-x+1)*x,step,N);
if strcmp(d.suc,'suc')
    out.value = d.value;
    out.suc = d.suc;
    return;
end
out.suc = 'err';
return;