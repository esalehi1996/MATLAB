function out=curvefitterpointsnotspecified(X,Y,n,mantissa)
syms x;
flag=0;
i=0;
e=10^12;
while(i<=4)
    y=Y;
    z=X;
    m=2;
    switch i
    case 0
     y=log(Y);
     matrix=zeros(2,3);
    case 1
      z=log(X);
      matrix=zeros(2,3);
    case 2
        z=1./z;
        matrix=zeros(2,3);
    case 3
        y=1./Y;
        matrix=zeros(2,3);
    case 4
        m=4;
        matrix=zeros(4,5);
    end 
  k=1;
while(k<=m)
    j=1;
    while(j<=m)
        matrix(k,j)=sum(z.^(k+j-2));
        j=j+1;
    end
    matrix(k,j+1)=sum((z.^(k-1)).*y);
    k=k+1;
end
coeffs=linsolve(matrix(1:end,1:end-1),matrix(:,end));
switch i
    case 0
        f=exp(coeffs(1))*exp(coeffs(2)*x);
    case 1
        f=coeffs(1)*log (x)+coeffs(2);
    case 2
        f=coeffs(1)/x+coeffs(2);
    case 3
        f=1/(coeffs(1)*x+coeffs(2));
    case 4
        k=1;
        f=0;
        while(k<=4)
            f=f+coeffs(k)*x^(k-1);
            k=k+1;
        end
end
es=0;
k=1;
while(k<=n)
    es=es+(y(k)-subs(f,x,z(k)))^2;
    k=k+1;
end
if(es<e)
    e=es;
    flag=i;
end
i=i+1;
end
out=curvefitterpoints(X,Y,flag,mantissa);

