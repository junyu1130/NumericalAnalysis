n = 1000;
A = diag(1 : n) + diag(1 / 2 * ones(n - 1, 1), 1) + diag(1 / 2 * ones(n - 1, 1), -1) + diag(1 / 2 * ones(n - 2, 1), 2) + diag(1 / 2 * ones(n - 2, 1), -2);
figure;
spy(A);
xe = ones(n, 1);
b = A * xe;
L = tril(A, -1); D = diag(diag(A)); U = triu(A, 1);
for i = 1 : 40
    % M = I, no preconditioner
    M = eye(n);
    [x1, relres1(i)] = pConjugateGradient(A, b, 1e-15, i, M);
    % M = diag(A), Jacobi Preconditioner
    M = diag(diag(A));
    [x2, relres2(i)] = pConjugateGradient(A, b, 1e-15, i, M);
    % M = (D+wL)D^(-1)(D+wU), w = 1, Gauss-Seidel Preconditioner
    M = (D + L) * (D \ (D + U));
    [x3, relres3(i)] = pConjugateGradient(A, b, 1e-15, i, M);
end
figure;
semilogy(relres1, 'o', 'LineWidth', 2);
hold on;
semilogy(relres2, 's', 'LineWidth', 2);
semilogy(relres3, 'd', 'LineWidth', 2);
hold off;
axis([0 40 1e-16 2]);
legend('No preconditioner', 'Jacobi', 'Gauss-Seidel');
xlabel('Iteration Number');
ylabel('Relative Residual Error');
