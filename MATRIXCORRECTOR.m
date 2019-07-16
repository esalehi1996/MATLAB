function out=MATRIXCORRECTOR(M)
i=1;
DIM=size(M);
n=DIM(1);
while(i<=n)
    if(M(i,i)==0)
        j=1;
        while(j<=n&&M(j,i)==0)
        j=j+1;
        if(j<=n&&M(i,j)==0)
            j=j+1;
        end
        end
        if(j==n+1)
            j=n;
        end
        aux=M(j,:);
        M(j,:)=M(i,:);
        M(i,:)=aux;
        if(j==n)
            i=1;
        end
    end
    i=i+1;
end
out=M;
        