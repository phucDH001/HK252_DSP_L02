w = -%pi:0.01:%pi;

// Tinh dap ung tan so
H = 1 ./ (1 + 0.1*exp(-%i*w) + 0.2*exp(-%i*2*w));

// Ve pho bien do
subplot(2,1,1);
plot(w, abs(H), 'b');
xtitle("Amplitude Spectrum", "Frequency");

// Ve pho pha
subplot(2,1,2);
plot(w, atan(imag(H), real(H)), 'r');
xtitle("Phase Spectrum", "Frequency");
