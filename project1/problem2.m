format long;
p = poly([1, 2, 3 + 3i, 3 - 3i, 4, 5]);
f = @(x) p * [x ^ 6, x ^ 5, x ^ 4, x ^ 3, x ^ 2, x, 1]';
df = @(x) p * [6 * x ^ 5, 5 * x ^ 4, 4 * x ^ 3, 3 * x ^ 2, 2 * x, 1, 0]';
x0 = 3 + 1i; %initial guess
tol = 0.5 * 10 ^ -10;
error = 1;
iter = 0;
% Newton's Method
while error > tol
    x = x0 + f(x0) / df(x0);
    error = abs(x - x0);
    x0 = x;
    iter = iter + 1;
end
% A polynomial with real coefficients has a pair of conjugate complex roots
real(x0) + imag(x0) * 1i
real(x0) - imag(x0) * 1i
iter % number of iterations
