% create sparse matrix
n = 100;
e = ones(n, 1);
A = spdiags([e, 2 * e, e], -1 : 1, n, n);
b = zeros(n, 1); b(1) = 1; b(n) = -1;
x = ones(n, 1); x(2 : 2 : n) = -1;
% Jacobi Method
D = diag(diag(A));
R = A - D; % L + U
xc = zeros(n, 1);
steps = 0;
while max(abs(x - xc)) > 0.5 * 10 ^ (-3)
    xc = D \ (b - R * xc);
    steps = steps + 1;
end
steps
backward_error = max(abs(b - A * xc))
