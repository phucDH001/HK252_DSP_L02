w = -%pi:0.01:%pi;

// a. x1(n) = 0.1^n * u(n)
n1 = 0:50;
x1 = 0.1.^n1; 

// X(e^jw) = sum( x(n) * e^(-j*w*n) )
X1 = x1 * exp(-%i * n1' * w);

mag_X1 = abs(X1);
phase_X1 = atan(imag(X1), real(X1));

// Ve do thi cau a
figure(1);
subplot(2,1,1);
plot(w, mag_X1, 'b', 'LineWidth', 2);
title("Amplitude Spectrum of x1(n)", 'fontsize', 3);
xlabel("Frequency");

subplot(2,1,2);
plot(w, phase_X1, 'r', 'LineWidth', 2);
title("Phase Spectrum of x1(n)", 'fontsize', 3);
xlabel("Frequency");

// b. x2(n) = \delta(n) + \delta(n-1) + \delta(n-2) + \delta(n-3)
n2 = 0:3;
x2 = [1, 1, 1, 1]; 

X2 = x2 * exp(-%i * n2' * w);

mag_X2 = abs(X2);
phase_X2 = atan(imag(X2), real(X2));

// Ve do thi cau b
figure(2);
subplot(2,1,1);
plot(w, mag_X2, 'b', 'LineWidth', 2);
title("Amplitude Spectrum of x2(n)", 'fontsize', 3);
xlabel("Frequency");

subplot(2,1,2);
plot(w, phase_X2, 'r', 'LineWidth', 2);
title("Phase Spectrum of x2(n)", 'fontsize', 3);
xlabel("Frequency");
