function [out1,out2,summ]=PowerIteration(A,X0,m)
i=1;
out1=X0;
DIM=size(A);
n=DIM(1);
s=1;
summ=zeros(10^5,1);
while(i<=m)
    out1=A*out1;
    out2=out1(1);
    j=2;
    while(j<=n)
        if(abs(out2)<abs(out1(j)))
            out2=out1(j);
        end
    j=j+1;    
    end
    out1=out1/out2;
    summ(s:s+m-1,1)=out1;
    s=s+n;
    i=i+1;
end
s=s-1;
summ=summ(1:s,:);

