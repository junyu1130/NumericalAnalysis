format long;
x = logspace(-1, -14, 14);
a1 = (1 - sec(x)) ./ tan(x) .^ 2    %(a)original form
a2 = -1 ./ (1 + sec(x))             %(a)alternative form
b1 = (1 - (1 - x) .^ 3) ./ x        %(b)original form
b2 = 3 - 3 .* x + x .^ 2            %(b)alternative form