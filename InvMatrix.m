function out=InvMatrix(M)
DIM=size(M);
D=DET(M);
n=DIM(1);
i=1;
out=zeros(n,n);
while(i<=n)
    j=1;
    while(j<=n)
        temp=M;
        temp(i,:)=[];
        temp(:,j)=[];
        out(i,j)=(-1)^(i+j)*DET(temp)/D;
        j=j+1;
    end
    i=i+1;
end
out=out';
        
