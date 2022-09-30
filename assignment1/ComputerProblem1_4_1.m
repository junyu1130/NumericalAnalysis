format long;
fa = @(x) x ^ 3 - 2 * x - 2;
fb = @(x) exp(x) + x - 7;
fc = @(x) exp(x) + sin(x) - 4;
dfa = @(x) 3 * x ^ 2 - 2;
dfb = @(x) exp(x) + 1;
dfc = @(x) exp(x) + cos(x);
x0 = 1; %initial guess
tol = 0.5 * 10 ^ -8;
xa = round(newton(fa, dfa, x0, tol), 8) %a
xb = round(newton(fb, dfb, x0, tol), 8) %b
xc = round(newton(fc, dfc, x0, tol), 8) %c