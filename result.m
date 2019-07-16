function out = result(f,val)

g = inline(f, 'a', 'b', 'c', 'd', 'e', 'f');
out = g(val(1), val(2), val(3), val(4), val(5), val(6));
