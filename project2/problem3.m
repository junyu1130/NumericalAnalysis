n = 200000;
i = zeros(n, 5);
j = zeros(n, 5);
tic
for k = 1 : n
    j(k, :) = randperm(n, 5);
    i(k, :) = k * ones(1, 5); 
end
v = randi([1 5], n, 5);
A = sparse(i, j, v) + speye(n);
x = ones(n, 1);
b = A * x;
toc
% matlab operation: \
tic
xc1 = A \ b;
toc
err1 = max(abs(x - xc1))
% matlab lu
% tic
% [L, U, P] = lu(A);
% toc
% xc2 = substition(L, U, P * b, n);
% err2 = max(abs(x - xc2))
% %my lu
% tic
% [P, L, U] = plu(A, n);
% toc
% tic
% xc3 = substition(L, U, P * b, n);
% err3 = max(abs(x - xc3))
% toc

function [p, l, u] = plu(a, n)
    u = a;
    p = zeros(n);
    row = 1 : n;
    for k = 1 : n
        [~, idx] = max(abs(a(row(k : n), k)));
        idx = idx + k - 1;
        t = row(k); 
        row(k) = row(idx);
        row(idx) = t;
        for i = k + 1 : n
            a(row(i), k) = a(row(i), k) / a(row(k), k);
            for j = k + 1 : n
                a(row(i), j) = a(row(i), j) - a(row(i), k) * a(row(k), j);
            end
        end
    end
    for i = 1 : n
        u(i, :) = a(row(i), :);
        p(i, row(i)) = 1;
    end
    l = tril(u);
    u = triu(u);
    l = l - diag(diag(l)) + speye(n);
end

function x = substition(l, u, b, n)
    c = zeros(n, 1);
    x = zeros(n, 1);
    % forward substition
    for i = 1 : n
        for j = i - 1 : -1 : 1
            b(i) = b(i) - l(i, j) * c(j);
        end
        c(i) = b(i);
    end
    % back substition
    for i = n : -1 : 1
        for j = i + 1 : n
            c(i) = c(i) - u(i, j) * x(j);
        end
        x(i) = c(i) / u(i, i);
    end
end
