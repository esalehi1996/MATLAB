function out = abserrvar(err, val)
for i= 1:6
    if err(i) < 0
        w = 0;
        while floor(val(i)*10^w) ~= ceil(val(i)*10^w)
            w = w+1;
        end
        err(i) = 10^(-w) / (-err(i));
    end
end
 out = err;