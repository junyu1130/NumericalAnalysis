format long;
x = [0.6 0.7 0.8 0.9 1.0];
y = [1.433329 1.632316 1.896481 2.247908 2.718282];
n = length(x); 
c = newtdd(x, y, n) % (a)
x0 = [0.82 0.98];
y0 = nest(n - 1, c, x0, x) % (b)
% (c)
% f(x) 5th derivative = (120x + 160x^3 + 32x^5)e^(x^2), for c <=1, max = 312e
err_bound = @(xx) abs(prod(x - xx)) / factorial(5) * 312 * exp(1); % error upper bound
err_bound1 = err_bound(0.82) 
err_bound2 = err_bound(0.98)
err_actual = abs(exp(x0 .^ 2) - y0)
% (d)
i1 = 0.5 : 0.01 : 1;
i2 = 0 : 0.01 : 2;
err_actual1 = nest(n - 1, c, i1, x) - exp(i1 .^ 2);
err_actual2 = nest(n - 1, c, i2, x) - exp(i2 .^ 2);
subplot(1, 2, 1); plot(i1, err_actual1);
title('[0.5, 1]'); xlabel('x'); ylabel('actual error');
subplot(1, 2, 2); plot(i2, err_actual2);
title('[0, 2]'); xlabel('x'); ylabel('actual error');
