% (a)
x1 = [0 1 2 3];
y1 = [3 5 4 1];
c1 = splinecoeff(x1, y1)
figure;
splineplot(x1, y1, 30);
% (b)
x2 = [-1 0 3 4 5];
y2 = [3 5 1 1 1];
c2 = splinecoeff(x2, y2)
figure;
splineplot(x2, y2, 30);