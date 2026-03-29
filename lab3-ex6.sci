function [yn, yorigin] = convolution(xn, xorigin, hn, horigin)
    N = length(xn) + length(hn) - 1;
    yn = zeros(1, N);
    
    for n = 1:N
        for k = 1:length(xn)
            if (n - k + 1 >= 1) && (n - k + 1 <= length(hn))
                yn(n) = yn(n) + xn(k) * hn(n - k + 1);
            end
        end
    end
    
    yorigin = xorigin + horigin - 1;
endfunction

xn = [1 2 3];
xorigin = 1;
hn = [1 1 1];
horigin = 1;
[yn, yorigin] = convolution(xn, xorigin, hn, horigin);

left  = max([xorigin-1, horigin-1, yorigin-1]);
right = max([length(xn)-xorigin, length(hn)-horigin, length(yn)-yorigin]);
xmin = -left;
xmax = right;

subplot(3,1,1);
plot2d3((1:length(xn)) - xorigin, xn);
title("x(n)");
a = gca(); a.data_bounds = [xmin, min(xn)-1; xmax, max(xn)+1];

subplot(3,1,2);
plot2d3((1:length(hn)) - horigin, hn);
title("h(n)");
a = gca(); a.data_bounds = [xmin, min(hn)-1; xmax, max(hn)+1];

subplot(3,1,3);
plot2d3((1:length(yn)) - yorigin, yn, style=2);
title("y(n) = conv(x(n), h(n))");
a = gca(); a.data_bounds = [xmin, min(yn)-1; xmax, max(yn)+1];
