// Thiet lap thong so co ban
A = 1;
tau = 1;
k = -3:3;
F = k / tau;

// Tinh gia tri PSD tai cac tan so
Sxx = (4 * A^2) ./ (%pi^2 * (1 - 4 * k.^2).^2);

// Ve xung
plot2d3(F, Sxx, style=2);
plot(F, Sxx, 'ro');
xtitle("PSD of x_a(t)", "Frequence (Hz)");

// Label cho tung xung
for i = 1:length(k)
    val_str = msprintf("%.3f", Sxx(i));
    xstring(F(i) - 0.35, Sxx(i) + 0.02, val_str);
    t = gce();
    t.font_size = 2;
    t.font_foreground = 13;
end
