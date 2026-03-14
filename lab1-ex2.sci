function y = x_a(t)
    y = 3 * sin(100 * %pi * t)
endfunction

function y = x_s(n)
    y = 3 * sin(%pi * n/3)
endfunction

t = linspace(0, 0.1, 100)
subplot(3, 1, 1)
plot(t, x_a(t))
xtitle("x_a(t)")

n = 0:30
x = clean(x_s(n))
subplot(3, 1, 2)
plot2d3(n, x)
plot(n, x, "r.")
xtitle("x(n)")

delta = 0.1
x_q = floor(x / delta) * delta
subplot(3, 1, 3)
plot2d3(n, x_q)
plot(n, x_q, "b.")
xtitle("x_q(n)")
