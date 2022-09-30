function [l, u] = lu_factorization(a, n)
    l = eye(n);
    for j = 1 : n - 1
        if abs(a(j, j)) < eps
            error('zero pivot encountered'); 
        end
        for i = j + 1 : n
            mult = a(i, j) / a(j, j);
            l(i, j) = mult;
            for k = j : n
                a(i, k) = a(i, k) - mult * a(j, k);
            end
        end
    end
    u = a;
end