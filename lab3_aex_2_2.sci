function [yn, yorigin] = fold_shift(xn, xorigin, k)
    yn = xn($:-1:1);
    yorigin = length(xn) - xorigin - k + 1;
endfunction

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

n = -1:4
xn = [1 1 1 1 1/2 1/2];
xorigin = 2;

an = xn;
aorigin = xorigin - 2;

[bn, borigin] = fold_shift(xn, xorigin, 4);

cn = xn;
corigin = xorigin + 2;

dn = xn .* (n <= 2);
dorigin = xorigin;

en = xn .* (n == 3);
eorigin = xorigin;

fn = xn([-2:2].^2 + 1);
forigin = floor(length(fn) / 2) + 1;

[gn, gorigin, hn, horigin] = get_even_odd(xn, xorigin);

nx = (1:length(xn)) - xorigin;
na = (1:length(an)) - aorigin;
nb = (1:length(bn)) - borigin;
nc = (1:length(cn)) - corigin;
nd = (1:length(dn)) - dorigin;
ne = (1:length(en)) - eorigin;
nf = (1:length(fn)) - forigin;
ng = (1:length(gn)) - gorigin;
nh = (1:length(hn)) - horigin;

nmin = min([nx na nb nc nd ne nf ng nh]);
nmax = max([nx na nb nc nd ne nf ng nh]);

[n, xn] = align_origin(xn, xorigin, nmin, nmax);
[n, an] = align_origin(an, aorigin, nmin, nmax);
[n, bn] = align_origin(bn, borigin, nmin, nmax);
[n, cn] = align_origin(cn, corigin, nmin, nmax);
[n, dn] = align_origin(dn, dorigin, nmin, nmax);
[n, en] = align_origin(en, eorigin, nmin, nmax);
[n, fn] = align_origin(fn, forigin, nmin, nmax);
[n, gn] = align_origin(gn, gorigin, nmin, nmax);
[n, hn] = align_origin(hn, horigin, nmin, nmax);

subplot(3, 3, 1);
plot2d3(n, xn);
title("x(n)");

subplot(3, 3, 2);
plot2d3(n, an, style=2);
title("x(n-2)");
 
subplot(3, 3, 3);
plot2d3(n, bn, style=2);
title("x(-n+4)");

subplot(3, 3, 4);
plot2d3(n, cn, style=2);
title("x(n+2)");

subplot(3, 3, 5);
plot2d3(n, dn, style=2);
title("x(n)u(2-n)");

subplot(3, 3, 6);
plot2d3(n, en, style=2);
title("x(n-1)&(n-3)");

subplot(3, 3, 7);
plot2d3(n, fn, style=2);
title("x(n^2)");

subplot(3, 3, 8);
plot2d3(n, gn, style=2);
title("even part of x(n)");

subplot(3, 3, 9);
plot2d3(n, hn, style=2);
title("odd part of x(n)");
