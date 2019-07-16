function out = errval(f, err, val)

%-1 stands for chopping, -2 stands for symmetric

g = inline(f, 'a', 'b', 'c', 'd', 'e', 'f');
err = abserrvar(err, val);

%disp(err);

for i= 1:1000
    for j= 1:6
        r(j) =  val(j) - err(j) + 2*err(j)*rand(1);
    end
    sample(i) = g(r(1), r(2), r(3), r(4), r(5), r(6));
end

out = (max(sample) - min(sample));
