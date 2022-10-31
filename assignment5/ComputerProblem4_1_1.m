% (a)
A1 = [3 -1 2; 4 1 0; -3 2 1; 1 1 5; -2 0 3];
b1 = [10 10 -5 15 0]';
x1 = A1' * A1 \ (A1' * b1)
r1 = b1 - A1 * x1;
error1_norm2 = sqrt(r1' * r1)
% (b)
A2 = [4 2 3 0; -2 3 -1 1; 1 3 -4 2; 1 0 1 -1; 3 1 3 -2];
b2 = [10 0 2 0 5]';
x2 = A2' * A2 \ (A2' * b2)
r2 = b2 - A2 * x2;
error2_norm2 = sqrt(r2' * r2)