format long;
p = poly([1, 2, 3, 4, 5, 6]);
x0 = roots(p)
x1 = bairstow(p, -1, -1, 1e-10)