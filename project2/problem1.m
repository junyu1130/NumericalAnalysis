% create sparse matrix
n = 20000000;
e = ones(n, 1);
A = spdiags([e, 2 * e, e], -1 : 1, n, n);
x = ones(n, 1);
b = A * x;
% matlab operation: \
tic
xc1 = A \ b;
toc
err1 = max(abs(x - xc1))
% matlab lu
tic
[L, U] = lu(A);
toc
xc2 = substition(L, U, b, n);
err2 = max(abs(x - xc2))
% my lu
tic
[L, U] = lu_factorization(A, n);
toc
tic
xc3 = substition(L, U, b, n);
err3 = max(abs(x - xc3))
toc

function [l, u] = lu_factorization(a, n)
    l = speye(n);
    mult = zeros(n, 1);
    down = spdiags(a, -1);
    mid = spdiags(a, 0);
    up = spdiags(a, 1);
    for j = 1 : n - 1
        mult(j) = down(j) / mid(j);
        mid(j + 1) = mid(j + 1) - mult(j) * up(j + 1);
    end
    l = spdiags(mult, -1, l);
    u = spdiags([zeros(n, 1), mid], [-1 0], a);
end

function x = substition(l, u, b, n)
    c = zeros(n, 1);
    x = zeros(n, 1);
    % forward substition
    down = spdiags(l, -1);
    for i = 1 : n
        if i == 1
            c(i) = b(i);
        else
            c(i) = b(i) - down(i - 1) * c(i - 1);
        end
    end
    % back substition
    up = spdiags(u, 1);
    mid = spdiags(u, 0);
    for i = n : -1 : 1
        if i == n
            x(i) = c(i) / mid(i);
        else 
            c(i) = c(i) - up(i + 1) * x(i + 1);
            x(i) = c(i) / mid(i);
        end
    end
end
