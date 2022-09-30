function x = newton(f, df, x0, tol)
    error = 1;
    while error > tol
        x = x0 - f(x0) / df(x0);
        error = abs(x - x0);
        x0 = x;
    end