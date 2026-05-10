N = 6;
n = 0:N-1;
x = [3, 2, 1, 0, 1, 2];
k = 0:N-1;
ck = [1.5, 2/3, 0, 1/6, 0, 2/3];

clf;
subplot(3,1,1);
plot2d3(n, x);
plot(n, x, 'ro');
title('x(n)');

subplot(3,1,2);
plot2d3(k, ck);
plot(k, ck, 'ro');
title('Magnitude');

subplot(3,1,3);
plot2d3(k, zeros(k));
plot(k, zeros(k), 'ro');
title('Phase');
