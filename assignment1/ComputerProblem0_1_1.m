format long;
x = 1.00001;
p = nest(50, ones(1, 51), x)
q = (x ^ 51 - 1) / (x - 1)
error = p - q