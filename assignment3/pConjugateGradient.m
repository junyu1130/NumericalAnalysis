function [x, relres] = pConjugateGradient(A, b, tol, maxit, M)
    n = length(b);
    x = zeros(n, 1);
    r = b - A * x;
    d = M \ r; z = d;
    for k = 1 : maxit
        if r <= tol
            break; 
        end
        alpha = r' * z / (d' * A * d);
        x = x + alpha * d;
        r0 = r; z0 = z;
        r = r - alpha * A * d;
        z = M \ r;
        beta = r' * z / (r0' * z0);
        d = z + beta * d;
        relres = max(abs(b - A * x)) / max(abs(b));
    end
end