% create sparse matrix
n = 20000000;
e = ones(n, 1);
A = spdiags([e, 2 * e, e], -1 : 1, n, n);
x = ones(n, 1);
b = A * x;

tic
xc1 = A \ b;
err1 = max(abs(x - xc1))
toc

tic
[L, U] = lu(A);
% xc2 = back_substition(L, U, b, n);
% err2 = max(abs(x - xc2))
toc

tic
[L, U] = lu_factorization(A, n);
% xc3 = back_substition(L, U, b, n);
% err3 = max(abs(x - xc3))
toc

% function [l, u] = lu_factorization(a, n)
%     l = speye(n);
%     mult = zeros(n - 1, 1);
%     % b = zeros(n, 3);
%     % b(1, 2) = a(1, 1);
%     % b(1, 3) = a(1, 2);
%     for j = 1 : n - 1
%         i = j + 1;
%         mult(j) = a(i, j) / a(j, j);
%         t = j + 2;
%         if t > n
%             t = n;
%         end
%         % if j <= n - 2
%         %     b(i, :) = a(i, j : j + 2) - mult(j) * a(j, j : j + 2);
%         % else
%         %     b(i, 1 : 2) = a(i, j : n) - mult(j) * a(j, j : n);
%         % end
%         % a(i, i) = b(i, 2);
%         for k = j : t
%             a(i, k) = a(i, k) - mult(j) * a(j, k);
%             % b(i, k) = a(i, k) - mult(j) * a(j, k);
%         end
%     end
%     % a(:, i) = b(:, 2);
%     l = spdiags(mult, -1, l);
%     % u = spdiags(b, -1 : 1, a);
%     u = a;
% end

function [l, u] = lu_factorization(a, n)
    l = speye(n);
    mult = zeros(n - 1, 1);
    for j = 1 : n - 1
        i = j + 1;
        mult(j) = a(i, j) / a(j, j);
        t = j + 2;
        if t > n
            t = n;
        end
        for k = i : t
            a(i, k) = a(i, k) - mult(j) * a(j, k);
        end
    end
    l = spdiags(mult, -1, l);
    u = spdiags(zeros(n, 1), -1, a);
end

function x = back_substition(l, u, b, n)
    c = zeros(n, 1);
    x = zeros(n, 1);
    for i = 1 : n
        for j = i - 1 : -1 : 1
            b(i) = b(i) - l(i, j) * c(j);
        end
        c(i) = b(i) / l(i, i);
    end
    for i = n : -1 : 1
        for j = i + 1 : n
            c(i) = c(i) - u(i, j) * x(j);
        end
        x(i) = c(i) / u(i, i);
    end
end
