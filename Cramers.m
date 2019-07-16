function [out,summ]=Cramers(A,B)
s=1;
DIM=size(A);
n=DIM(1);
summ=zeros(10^5,n);
out=zeros(n,1);
D=DET(A);
i=1;
while(i<=n)
    temp=A;
    temp(:,i)=B;
    summ(s:s+n-1,:)=temp;
    s=s+n;
    out(i)=DET(temp)/D;
    i=i+1;
end
s=s-1;
summ=summ(1:s,:);


