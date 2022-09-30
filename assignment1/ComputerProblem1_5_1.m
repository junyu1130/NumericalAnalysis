format long;
fa = @(x) x ^ 3 - 2 * x - 2;
fb = @(x) exp(x) + x - 7;
fc = @(x) exp(x) + sin(x) - 4;
x0 = 1; x1 = 2; %initial guess
tol = 0.5 * 10 ^ -8;
xa = round(secant(fa, x0, x1, tol), 8) %a
xb = round(secant(fb, x0, x1, tol), 8) %b
xc = round(secant(fc, x0, x1, tol), 8) %c