function [out, plot_data] =functioninterpolation(func,flag,mantissa)
xs=zeros(1,10);
ys=zeros(1,10);
xs(1)=-5;
i=2;
syms x;
out=x-x;
while(i<=10)
    xs(i)=xs(i-1)+1;
    i=i+1;
end
i=1;
while(i<=10)
    ys(i)=subs(func,x,xs(i));
    i=i+1;
end
switch flag 
    case 0
        i=1;
        while(i<=10)
            g=x/x;
            j=1;
            while(j<=10)
      if(j==i)
          j=j+1;
      else
          g=g*(x-xs(j));
          j=j+1;
      end
            end
            j=1;
            while(j<=10)
          if(j==i)
          j=j+1;
          else
          g=g/(xs(i)-xs(j));
          j=j+1;
          end
            end
            out=out+ys(i)*g;
            i=i+1;
        end
    case 1
        i=1;
        coeffs=ys;
        while(i<=10)
         g=x/x;
         j=1;
         while(j<i)
             g=g*(x-xs(j));
             j=j+1;
         end
         out=out+coeffs(i)*g;
         j=i+1;
         while(j<=10)
             coeffs(j)=(ys(j)-ys(j-1))/(xs(j)-xs(j-i));
             j=j+1;
         end
         j=i+1;
         while(j<=10)
             ys(j)=coeffs(j);
             j=j+1;
         end
         i=i+1;
        end
    case 2
        i=1;
        r=(x-xs(1));
        coeffs=ys;aux=ys;
        while(i<=10)
        coeffs(i)=aux(1);
        j=0;
        g=1;
        while(j<i-1)
        g=g*(r-j);
        j=j+1;
        end
        out=out+coeffs(i)*g/factorial(i-1);
        j=1;
        while(j<11-i)
        aux(j)=aux(j+1)-aux(j);
        j=j+1;
        end
        i=i+1;
        end
    case 3
        i=1;
        r=(x-xs(10));
        coeffs=fliplr(ys);
        aux=fliplr(ys);
       while(i<=10)
        coeffs(i)=aux(1);
        j=0;
        g=1;
        while(j<i-1)
        g=g*(r+j);
        j=j+1;
        end
        out=out+coeffs(i)*g/factorial(i-1);
        j=1;
        while(j<11-i)
        aux(j)=aux(j)-aux(j+1);
        j=j+1;
        end
        i=i+1;
       end
    case 4
        i=1;
       r=x-xs(6);
       coeffs=ys;aux=ys;
     while(i<11)
          if(mod(i,2)==1)
      coeffs(i)=aux((10-i+1)/2+1);
          end
          if(mod(i,2)==0)
       coeffs(i) =aux(ceil((10-i+1)/2));
          end
        j=0;  
        g=1;
        k=1;
          while(j<i-1)
          if(j==0)
              g=g*r;
          end
          if(j>0&&mod(j,2)==1)
           g=g*(r+k);  
          end
          if(j>0&&mod(j,2)==0)
          g=g*(r-k);
          k=k+1;
          end
          j=j+1;
          end
          out=out+coeffs(i)*g/factorial(i-1);
          j=1;
        while(j<10)
        aux(j)=aux(j+1)-aux(j);
        j=j+1;
        end
        i=i+1;
     end 
    case 5
        i=1;
       r=x-xs(5);
       coeffs=ys;aux=ys;
     while(i<11)
          if(mod(i,2)==1)
      coeffs(i)=aux((10-i+1)/2);
          end
          if(mod(i,2)==0)
       coeffs(i) =aux(ceil((10-i+1)/2));
          end
        j=0;  
        g=1;
        k=1;
          while(j<i-1)
          if(j==0)
              g=g*r;
          end
          if(j>0&&mod(j,2)==1)
           g=g*(r-k);  
          end
          if(j>0&&mod(j,2)==0)
          g=g*(r+k);
          k=k+1;
          end
          j=j+1;
          end
          out=out+coeffs(i)*g/factorial(i-1);
          j=1;
        while(j<10)
        aux(j)=aux(j+1)-aux(j);
        j=j+1;
        end
        i=i+1;
     end 
end
xs=linspace(-5,5,1000);
out=simplify(out);
out=vpa(out,mantissa);
ys=subs(out,x,xs);
plot_data.plt{1} = [xs ys];
xs=linspace(-5,5,1000);
plot_data.plt{2} = [xs subs(func,x,xs)];
plot_data.legend{1} = 'Interpolated polynomial';
plot_data.type{1} = 'p';
plot_data.type{2} = 'p';
plot_data.legend{2} = 'Actual Function';
        
        
  