function out=curvefitterpoints(X,Y,flag,mantissa)
syms x;
switch flag
    case 0
     Y=log(Y);
     m=2;
     matrix=zeros(2,3);
    case 1
      X=log(X);
      m=2;
      matrix=zeros(2,3);
    case 2
        X=1./X;
        m=2;
        matrix=zeros(2,3);
    case 3
        Y=1./Y;
        m=2;
        matrix=zeros(2,3);
    case 4
        m=4;
        matrix=zeros(4,5);
end
i=1;
while(i<=m)
    j=1;
    while(j<=m)
        matrix(i,j)=sum(X.^(i+j-2));
        j=j+1;
    end
    matrix(i,j+1)=sum((X.^(i-1)).*Y);
    i=i+1;
end
coeffs=linsolve(matrix(1:end,1:end-1),matrix(:,end));
switch flag
    case 0
        y=exp(coeffs(1))*exp(coeffs(2)*x);
    case 1
        y=coeffs(1)*log (x)+coeffs(2);
    case 2
        y=coeffs(1)/x+coeffs(2);
    case 3
        y=1/(coeffs(1)*x+coeffs(2));
    case 4
        i=1;
        y=0;
        while(i<=4)
            y=y+coeffs(i)*x^(i-1);
            i=i+1;
        end
end
scatter(X,Y);
hold on;
y=simplify(y);
X=linspace(-10,10,2000);
plot(X,subs(y,x,X),'r');
legend('Fitted Curve','Actual points');
out=vpa(y,mantissa);