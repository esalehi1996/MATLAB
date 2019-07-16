function out = Fixed_Point_Plus_AB_Minus_G(f,x0,a,b,step,N)

format LONGENG;
digits(N);

syms x;
syms h;
c = Fixed_Point_Plus_AB_Plus_G(f,x0,a,b,f+x,step,N);
if strcmp(c.suc,'suc')
    out.value = c.value;
    out.suc = c.suc;
    return;
end
d = Fixed_Point_Plus_AB_Plus_G(f,x0,a,b,(f+x-x+1)*x,step,N);
if strcmp(d.suc,'suc')
    out.value = d.value;
    out.suc = d.suc;
    return;
end
k = Fixed_Point_Plus_AB_Plus_G(f,x0,a,b,sqrt(f+x^2),step,N);
if strcmp(k.suc,'suc')
    out.value = k.value;
    out.suc = k.suc;
    return;
end
l = Fixed_Point_Plus_AB_Plus_G(f,x0,a,b,sqrt((f-x^2)*-1),step,N);
if strcmp(l.suc,'suc')
    out.value = l.value;
    out.suc = l.suc;
    return;
end
out.suc = 'err';
return;

