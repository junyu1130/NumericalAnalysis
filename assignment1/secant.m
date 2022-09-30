function x = secant(f, x0, x1, tol)
    error = 1;
    while error > tol
        x = x1 - f(x1) * (x1 - x0) / (f(x1) - f(x0));
        error = abs(x - x1);
        x0 = x1;
        x1 = x;
    end