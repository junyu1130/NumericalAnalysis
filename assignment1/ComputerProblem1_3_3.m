format long;
f = @(x) 2 * x * cos(x) - 2 * x + sin(x ^ 3);
xa = fzero(f, [-0.1 0.2])
forward_error = abs(xa - 0) %actual root is 0
backward_error = abs(f(xa))
xb = bisect(f, -0.1, 0.2, 0) %Bisection method