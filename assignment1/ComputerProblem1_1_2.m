format long;
a = @(x) x ^ 5 + x - 1;
b = @(x) sin(x) - 6 * x - 5;
c = @(x) log(x) + x ^ 2 - 3;
tol = 0.5 * 10 ^ -8;
xa = round(bisect(a, 0, 1, tol), 8)
xb = round(bisect(b, -1, 0, tol), 8)
xc = round(bisect(c, 1, 2, tol), 8)