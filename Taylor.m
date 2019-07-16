function Y = Taylor(f,x0,y0,h,steps,n)%n is the number of statments of taylor series
format long;
y=sym('y(x)');
syms x;
fin = sym(f);
%disp(fin);
x1=x0+h;
Y = zeros(n, 2);
for i=1:steps
    dfin=fin;
    g=y;
    D{1}=vpa(subs(fin,{'x' 'y'},{x0 y0}));

    %disp(D{1});
    %disp(subs(dfin,'y','y(x)'));
    dfin=diff(subs(dfin,'y','y(x)'));
    for j=2:n
        %disp(dfin);
        str=char(diff(g));
        %disp(str);
        D{j}=vpa(subs(dfin,...
            {'x' 'y' str},{x0 y0 D{j-1}}));
        g=diff(g);
        dfin=diff(subs(dfin));
        %disp(D{j});
    end
    y1=y0;
    for j=1:n
        y1=y1+(h^j)*D{j}/factorial(j);
    end
    Y(i, :) = [x1 eval(y1)];
    y0=vpa(y1);
    x0=vpa(x1);
    x1=x0+h;
end
