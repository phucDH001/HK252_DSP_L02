function x = x_n(k)
    x = 1 .* ((k >= 0) & (k <= 3));
endfunction

n = -4:6;
x = x_n(n);
y = x_n(n.^2);
y2p = x_n((n - 2).^2);
x2 = x_n(n - 2);
y2 = x_n(n.^2 - 2);

subplot(4,1,1);
plot2d3(n, y, style=2);
title("y(n) = x(n^2)");
a = gca();
a.data_bounds = [min(n), -0.2; max(n), 1.2];

subplot(4,1,2);
plot2d3(n, y2p, style=2);
title("y2p(n) = y(n-2)");
a = gca();
a.data_bounds = [min(n), -0.2; max(n), 1.2];

subplot(4,1,3);
plot2d3(n, x2, style=5);
title("x2(n) = x(n-2)");
a = gca();
a.data_bounds = [min(n), -0.2; max(n), 1.2];

subplot(4,1,4);
plot2d3(n, y2, style=5);
title("y2(n) = T[x2(n)]");
a = gca();
a.data_bounds = [min(n), -0.2; max(n), 1.2];
