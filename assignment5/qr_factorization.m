function [Q, R] = qr_factorization(A)
    [m, n] = size(A);
    Q = eye(m);
    for i = 1 : min(n, m - 1)
        x = A(i : m, i);
        norm_x = sqrt(x' * x);
        if sign(norm_x) == sign(x(1))
            norm_x = -norm_x;
        end
        w = [norm_x; zeros(m - i, 1)];
        v = w - x;
        H = eye(m);
        H(i : m, i : m) = eye(m - i + 1) - 2 * (v * v')/ (v' * v);
        Q = Q * H;
        A = H * A;
    end
    R = A;
end
