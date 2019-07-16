function [out,summ]=Jacobi(A,B,X0,n)
DIM=size(A);
m=DIM(1);
s=1;
summ=zeros(10^5,1);
AUX=zeros(m,m+1);
AUX(:,1:end-1)=A;
AUX(:,end)=B;
AUX=MATRIXCORRECTOR(AUX);
A=AUX(:,1:end-1);
B=AUX(:,end);
out=X0;
i=1;
while(i<=n)
    j=1;
    temp=zeros(m,1);
    while(j<=m)
        k=1;
        while(k<=m)
            if(k~=j)
            temp(j)=temp(j)-A(j,k)*out(k);
            end
            k=k+1;
        end
        temp(j)=temp(j)+B(j);
        temp(j)=temp(j)/A(j,j);
        j=j+1;
    end
    out=temp;
    summ(s:s+m-1,1)=out;
    s=s+n;
    i=i+1;
end
s=s-1;
summ=summ(1:s,:);

        