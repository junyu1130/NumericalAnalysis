% Building a cos calculator key
% Approximates cos curve with degree 9 polynomial
% Input:  x
% Output: approximation for cos(x), correct to 10 decimal places
function y = cos2(x)
    % First calculate the interpolating polynomial and store coefficients
    n = 10; % error upper bound = 0.4807 * 10 ^ -10
    b = pi / 4 + (pi / 4) * cos((1 : 2 : 2 * n - 1) * pi / (2 * n)); % b holds Chebyshev base points
    yb = cos(b); 
    c = newtdd(b, yb, n); 
    % For each input x, move x to the fundamental domain and evaluate the interpolating polynomial
    s = 1; % Correct the sign of cos
    x1 = mod(x, 2 * pi);
    if x1 > pi * 3 / 2
        x1 = 2 * pi - x1;
    elseif x1 > pi / 2
        x1 = 2 * pi - x1;
        s = -1;
    end
    if x1 > pi / 2
        x1 = pi - x1;
    end
    y = s * nest(n - 1, c, x1, b);
end