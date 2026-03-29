function x = x_n(n)
    x = zeros(1, length(n));
    for k = 1:length(n)
        if (n(k) >= -3) && (n(k) <= -1)
            x(k) = 1 + n(k)/3;
        elseif (n(k) >= 0) && (n(k) <= 3)
            x(k) = 1;
        else
            x(k) = 0;
        end
    end
endfunction

function [yn, yorigin] = fold_shift(xn, xorigin, k)
    yn = xn($:-1:1);
    yorigin = length(xn) - xorigin - k + 1;
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

nx = -3:3;
xn = x_n(nx);
xorigin = 4;

[yn, yorigin] = fold_shift(xn, xorigin, 4);
[zn, zorigin] = fold_shift(xn, xorigin, -4);

nx = (1:length(xn)) - xorigin;
ny = (1:length(yn)) - yorigin;
nz = (1:length(zn)) - zorigin;

nmin = min([nx ny nz]);
nmax = max([nx ny nz]);

[n, xa] = align_origin(xn, xorigin, nmin, nmax);
[n, ya] = align_origin(yn, yorigin, nmin, nmax);
[n, za] = align_origin(zn, zorigin, nmin, nmax);

subplot(3,1,1);
plot2d3(n, xa);
title("x(n)");

subplot(3,1,2);
plot2d3(n, ya, style=2);
title("x(-n+4)");

subplot(3,1,3);
plot2d3(n, za, style=2);
title("x(-n-4)");
