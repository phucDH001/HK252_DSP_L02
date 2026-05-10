w = -%pi:0.01:%pi;

n_a = 0:5;
x_a = ones(1, 6);
X_a = x_a * exp(-%i * n_a' * w);

n_f = -4:4;
x_f = 2 - 0.5 * abs(n_f);
X_f = x_f * exp(-%i * n_f' * w);

n_g = -2:2;
x_g = [-2, -1, 0, 1, 2];
X_g = x_g * exp(-%i * n_g' * w);

// Ve tin hieu (a)
subplot(3, 2, 1); plot(w, abs(X_a)); title("Mag (a)");
subplot(3, 2, 2); plot(w, atan(imag(X_a), real(X_a)), 'r'); title("Phase (a)");

// Ve tin hieu (f)
subplot(3, 2, 3); plot(w, abs(X_f)); title("Mag (f)");
subplot(3, 2, 4); plot(w, atan(imag(X_f), real(X_f)), 'r'); title("Phase (f)");

// Ve tin hieu (g)
subplot(3, 2, 5); plot(w, abs(X_g)); title("Mag (g)");
subplot(3, 2, 6); plot(w, atan(imag(X_g), real(X_g)), 'r'); title("Phase (g)");
