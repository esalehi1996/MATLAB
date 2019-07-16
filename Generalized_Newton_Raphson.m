function out = Generalized_Newton_Raphson(n,F,X,step,N)
format LONGENG;
digits(N);
for i = 1 : n
    eval (['syms a', num2str(i)]);
end
for i = 1 : n
    Z(i) = eval (['a', num2str(i)]);
end
D = jacobian(F,Z);
Y = X;
for i = 1 : step
    for j = 1 : n
        D(1:end,j) = F';
        D(1:end,j) = D(1:end,j)*-1;
        Y(j) = subs(eval(['a', num2str(j)]),Z,X)...
            + subs(det(D)/det(jacobian(F,Z)),Z,X);
        D = jacobian(F,Z);
    end
    X = Y;
end
out.value = double(vpa(Y));
out.suc = 'suc';
return;