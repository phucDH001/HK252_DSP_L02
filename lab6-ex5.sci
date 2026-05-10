w = -%pi:0.01:%pi;

Y = (1 + exp(-%i*w)) ./ (1 - 0.5*exp(-%i*w));

mag_Y = abs(Y);
phase_Y = atan(imag(Y), real(Y));

// Vẽ pho bien do
subplot(2,1,1);
plot(w, mag_Y, 'b');
xtitle("Amplitude Spectrum", "Frequency");

// Vẽ pho pha
subplot(2,1,2);
plot(w, phase_Y, 'r');
xtitle("Phase Spectrum", "Frequency");
