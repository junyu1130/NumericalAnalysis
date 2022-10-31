function [Q, R] = qr_classical(A)
    n = size(A, 2);
    for j = 1 : n
        y = A(:, j);
        for i = 1 : j - 1
            R(i, j) = Q(:, i)' * A(:, j);
            y = y - R(i, j) * Q(:, i);
        end
        R(j, j) = sqrt(y' * y);
        Q(:, j) = y / R(j, j);
    end
end