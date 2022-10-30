format long;
x = - 2 * pi : 0.1 : 2 * pi;
n = length(x);
y2 = zeros(1, n);
for i = 1 : n
    y2(i) = cos2(x(i));
end
plot(x, y2);
subplot(1, 2, 1); plot(x, y2);
title('y = cos(x)'); xlabel('x'); ylabel('y');
x = - 1e4 : 0.1 : 1e4;
n = length(x);
y1 = cos(x);
y2 = zeros(1, n);
for i = 1 : n
    y2(i) = cos2(x(i));
end
subplot(1, 2, 2); plot(x, abs(y1 - y2));
title('error'); xlabel('x'); ylabel('actual error');