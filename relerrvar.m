function out = relerrvar(err, val)

err = abserrvar(err, val);
err = err / val;
out = err;
