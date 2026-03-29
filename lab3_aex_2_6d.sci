function x = x_sig(k)
    x = 1 .* ((k >= 0) & (k <= 3));
endfunction
n = -2:6;

// x(n)
x = x_sig(n);

// y(n) = n*x(n)
y = n .* x_sig(n);

// y2'(n) = y(n-2) = (n-2)x(n-2)
y2p = (n - 2) .* x_sig(n - 2);

// x2(n) = x(n-2)
x2 = x_sig(n - 2);

// y2(n) = T[x2(n)] = n*x2(n) = n*x(n-2)
y2 = n .* x_sig(n - 2);

// y(n)
subplot(4,1,1);
plot2d3(n, y, style=2);
title("y(n) = n x(n)");
a = gca();
a.data_bounds = [min(n), -0.2; max(n), 5.2];

// y2'(n)
subplot(4,1,2);
plot2d3(n, y2p, style=2);
title("y2p(n) = y(n-2)");
a = gca();
a.data_bounds = [min(n), -0.2; max(n), 5.2];

// x2(n)
subplot(4,1,3);
plot2d3(n, x2, style=5);
title("x2(n) = x(n-2)");
a = gca();
a.data_bounds = [min(n), -0.2; max(n), 5.2];

// y2(n)
subplot(4,1,4);
plot2d3(n, y2, style=5);
title("y2(n) = T[x2(n)]");
a = gca();
a.data_bounds = [min(n), -0.2; max(n), 5.2];
