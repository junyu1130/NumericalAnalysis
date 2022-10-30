function y0 = polyinterp(x, y, x0)
    n = length(x);
    c = newtdd(x, y, n);
    y0 = nest(n - 1, c, x0, x);
end
