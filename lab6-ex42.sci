A = 1;
a = 1;
F = -5:0.01:5; 

Mag_a = A ./ sqrt(a^2 + (2 * %pi * F).^2);
Phase_a = -atan(2 * %pi * F / a);

figure(1);
f1 = gcf();
f1.background = 8;

subplot(2, 1, 1);
plot(F, Mag_a, 'b', "thickness", 2); 
title("Magnitude of (a)", "fontsize", 3);
xlabel("Frequency");

subplot(2, 1, 2);
plot(F, Phase_a, 'r', "thickness", 2); 
title("Phase of (a)", "fontsize", 3);
xlabel("Frequency");
ax1 = gca();
ax1.data_bounds = [-5, -2; 5, 2];

Mag_b = (2 * a * A) ./ (a^2 + (2 * %pi * F).^2);
Phase_b = zeros(F);

figure(2);
f2 = gcf();
f2.background = 8;

subplot(2, 1, 1);
plot(F, Mag_b, 'b', "thickness", 2);
title("Magnitude of (b)", "fontsize", 3);
xlabel("Frequency)");

subplot(2, 1, 2);
plot(F, Phase_b, 'r', "thickness", 2);
title("Phase of (b)", "fontsize", 3);
xlabel("Frequency");
ax2 = gca();
ax2.data_bounds = [-5, -1; 5, 1];
