function [xe, xe_origin, xo, xo_origin] = get_even_odd(xn, xorigin)
    n = (1:length(xn)) - xorigin;
    x_rev = xn($:-1:1);
    n_rev = -n($:-1:1);
    
    n_min = min(min(n), min(n_rev));
    n_max = max(max(n), max(n_rev));
    n_new = n_min:n_max;
    
    len_new = length(n_new);
    x1 = zeros(1, len_new);
    x2 = zeros(1, len_new);
    
    x1(n - n_min + 1) = xn;
    x2(n_rev - n_min + 1) = x_rev;
    
    xe = 0.5 * (x1 + x2);
    xo  = 0.5 * (x1 - x2);
    
    xe_origin = 1 - n_min;
    xo_origin = xe_origin;
endfunction

function [n_all, x_aligned] = align_origin(x, xorigin, nmin, nmax)
    n_all = nmin:nmax;
    x_aligned = zeros(1, length(n_all));

    nx = (1:length(x)) - xorigin;
    for k = 1:length(x)
        pos = nx(k) - nmin + 1;
        x_aligned(pos) = x(k);
    end
endfunction

xn = [2 3 4 5 6];
xorigin = 3;

[xe, xe_origin, xo, xo_origin] = get_even_odd(xn, xorigin);

nx = (1:length(xn)) - xorigin;
ne = (1:length(xe)) - xe_origin;
no = (1:length(xo)) - xo_origin;

nmin = min([nx ne no]);
nmax = max([nx ne no]);

[n, xn] = align_origin(xn, xorigin, nmin, nmax);
[n, xe] = align_origin(xe, xe_origin, nmin, nmax);
[n, xo] = align_origin(xo, xo_origin, nmin, nmax);

subplot(3,1,1);
plot2d3(n, xn);
title("x(n)");

subplot(3,1,2);
plot2d3(n, xe, style=2);
title("x_e(n)");

subplot(3,1,3);
plot2d3(n, xo, style=2);
title("x_o(n)");
