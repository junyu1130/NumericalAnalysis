% create sparse matrix
n = 100;
e = ones(n, 1);
A = spdiags([e, 2 * e, e], -1 : 1, n, n);
b = zeros(n, 1); b(1) = 1; b(n) = -1;
x = ones(n, 1); x(2 : 2 : n) = -1;
D = diag(diag(A));
L = tril(A, -1);
U = triu(A, 1);
% Gauss-Seidel Method
GS_xc = zeros(n, 1);
GS_steps = 0;
while max(abs(x - GS_xc)) > 0.5 * 10 ^ (-3)
    GS_xc = (L + D) \ (b - U * GS_xc);
    GS_steps = GS_steps + 1;
end
GS_steps
GS_backward_error = max(abs(b - A * GS_xc))
% SOR
w = 1.5;
SOR_xc = zeros(n, 1);
SOR_steps = 0;
while max(abs(x - SOR_xc)) > 0.5 * 10 ^ (-3)
    SOR_xc = (w * L + D) \ (w * b - w * U * SOR_xc + (1 - w) * D * SOR_xc);
    SOR_steps = SOR_steps + 1;
end
SOR_steps
SOR_backward_error = max(abs(b - A * SOR_xc))
