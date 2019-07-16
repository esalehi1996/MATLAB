function [out,summ]=Gauss_Seidel(A,B,X0,m)
DIM=size(A);
n=DIM(1);
s=1;
summ=zeros(10^5,1);
AUX=zeros(n,n+1);
AUX(:,1:end-1)=A;
AUX(:,end)=B;
AUX=MATRIXCORRECTOR(AUX);
A=AUX(:,1:end-1);
B=AUX(:,end);
out=X0;
i=1;
while(i<=m)
    j=1;
    temp=zeros(n,1);
    while(j<=n)
        k=1;
        while(k<=n)
            if(k~=j)
                if(k<j)
            temp(j)=temp(j)-A(j,k)*temp(k);
                end
                if(k>j)
            temp(j)=temp(j)-A(j,k)*out(k);  
                end
            end
            k=k+1;
        end
        temp(j)=temp(j)+B(j);
        temp(j)=temp(j)/A(j,j);
        j=j+1;
    end
    out=temp;
    summ(s:s+n-1,1)=out;
    s=s+n;
    i=i+1;
end
s=s-1;
summ=summ(1:s,:);