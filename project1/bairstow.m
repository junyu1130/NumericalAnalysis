% Fuction : Finding roots using Bairstow's method.
%           f(x) = a(n) * x ^ n + a(n - 1) * x ^ (n - 1) + ... + a(1) * x + a(0) = 0.
% Input   : a  : [a(n), a(n-1), ... , a(1), a(0)].
%           r0 : Initial value of r.
%           s0 : Initial value of s.
%           EE : Error Estimation(%).
% Output  : x  : Roots.
function x = bairstow(a, r0, s0, EE)
    n = length(a);
    a = a(n : -1 : 1); % reverse a
    % Check if the degree of the polynomial is even or odd.
    if mod(n - 1, 2)
        m = (n - 2) / 2; % odd
    else
        m = (n - 3) / 2; % even
    end
    % Each iteration gets a pair of roots.
    for jj = 1 : m
        r = r0; 
        s = s0;
        Ear = 100;
        Eas = 100;
        while Ear > EE || Eas > EE
            % Calculate b and c.
            b(n) = a(n);
            b(n - 1) = a(n - 1) + r * b(n);
            c(n) = b(n);
            c(n - 1) = b(n - 1) + r * c(n);
            for j = n - 2 : -1 : 1
                b(j) = a(j) + r * b(j + 1) + s * b(j + 2);
                c(j) = b(j) + r * c(j + 1) + s * c(j + 2);
            end
            % Correct the initial approximation with the values of dr and ds.
            dr = -(-c(3) * b(2) + b(1) * c(4)) / (c(2) * c(4) - c(3) ^ 2);
            ds = (-c(2) * b(2) + c(3) * b(1)) / (c(2) * c(4) - c(3) ^ 2);
            r = r + dr; 
            s = s + ds;
            % Calculate the approximation error.
            Ear = abs(dr / r) * 100; 
            Eas = abs(ds / s) * 100;
        end
        % Get two roots.
        x(2 * jj - 1) = (r + sqrt(r ^ 2 + 4 * s)) / 2;
        x(2 * jj) = (r - sqrt(r ^ 2 + 4 * s)) / 2;
        % Recompute the value for the next iteration.
        a = b(3 : n);
        n = length(a);
        r0 = r;
        s0 = s;
    end
    r = -a(2);
    s = -a(1);
    if n == 2 % If only one order is left.
        x(2 * jj + 1) = -s / r;
    else
        x(2 * jj + 1) = (r + sqrt(r ^ 2 + 4 * s)) / 2;
        x(2 * jj + 2) = (r - sqrt(r ^ 2 + 4 * s)) / 2;
    end
    x = x';
end
