n = -3:3; 
x = [0, 0, 1, 3, -2, 0, 0];      
x_rev = [0, 0, -2, 3, 1, 0, 0];

xe = 0.5 * (x + x_rev); // Even
xo = 0.5 * (x - x_rev); // Odd
clf();

// Vẽ x(n)
subplot(3,1,1);
plot2d3(n, x);
title("Original Signal x(n)");
xlabel("n"); ylabel("Amplitude");

// Vẽ xe(n)
subplot(3,1,2);
plot2d3(n, xe);
title("Even Component xe(n)");
xlabel("n"); ylabel("Amplitude");

// Vẽ xo(n)
subplot(3,1,3);
plot2d3(n, xo);
title("Odd Component xo(n)");
xlabel("n"); ylabel("Amplitude");
