tau = 1;
F = -5:0.01:5;
// Ham sinc(x) trong Scilab tinh sin(x)/x
Mag_X = tau * (sinc(%pi * F * tau)).^2;

// Pha = 0 voi moi F
Phase_X = zeros(F); 

f = gcf();
f.background = 8;

subplot(2, 1, 1);
plot(F, Mag_X, 'b', "thickness", 2);
ax1 = gca();
title("Magnitude", "fontsize", 3);
xlabel("Frequency");

subplot(2, 1, 2);
plot(F, Phase_X, 'r', "thickness", 2);
ax2 = gca();
title("Phase", "fontsize", 3);
xlabel("Frequency");
ax2.data_bounds = [-5, -1; 5, 1];
