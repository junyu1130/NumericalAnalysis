function calculate_error(n)
    for i = 1 : n
        for j = 1 : n
            A(i, j) = 5 / (i + 2 * j - 1);
        end
    end
    x = ones(n, 1);
    b = A * x;
    xc = A \ b
    forward_error = max(abs(x - xc))
    backward_error = max(abs(b - A * xc));
    relative_forward_error = forward_error / max(abs(x));
    relative_backward_error = backward_error / max(abs(b));
    error_magnification_factor = relative_forward_error / relative_backward_error
    condition_number = cond(A, inf)
end