 function out = bisection(f,a,b,MaxErr,N)

 format LONGENG;
 digits(N);
 
 g = inline(f);
 syms x;
 c = (a + b)/2;
 if g(a)*g(b)>0  
     disp('Wrong Interval');
     out.suc = 'err';
     return;
 elseif g(a) == 0
     out.value = double(vpa(a));
     out.suc = 'suc';
     return;
 elseif g(b) == 0
     out.value = double(vpa(b));
     out.suc = 'suc';
     return;
 else
     while abs(a-b) > MaxErr
         c = (a + b)/2;
         if abs(g(c)) < MaxErr
             out.value = double(vpa(c));
             out.suc = 'suc';
             break;
         end
         if g(a)*g(c)<0 
             b = c; 
         else
             a = c;          
         end
     end
     out.value = double(vpa(c));
     out.suc = 'suc';
     return;
 end
 