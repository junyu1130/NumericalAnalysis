format long;
p = poly([1 + i, 1 - i, 2 + 2i, 2 - 2i, 3 + 3i, 3 - 3i]);
% p = poly([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]); % case 1
% p = poly([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21]); % case 2
% p = poly([1, 2, 3, 4, 5, 6, -1, -2, -3, -4, -5, -6, 1.1 + i, 1.1 - i, -2.2, 3.3 + i, 3.3 - i, -4.4, 5.5, 6.6]); % case 3
x0 = roots(p)
x1 = bairstow(p, -1, -1, 1e-10)