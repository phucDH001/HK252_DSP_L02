x = [1; 2; -3; 2; 1];
y = [4; -4; -3; 0; 3];
N = length(x); n_val = 0:(N-1);

Ex = x.^2;
Ey = y.^2;

// Log ket qua
disp("Tin hieu dau vao x(n):");
disp(x');
disp("Tin hieu tich chap vong y(n):");
disp(y');

disp("Nang luong Ex(n):");
disp(Ex');
disp("Nang luong Ey(n):");
disp(Ey');

f = scf(0); clf(); 
f.figure_size = [800, 850];

x_locs = (-1:N)'; 
x_lbls = string(x_locs);
amp_min = min([x; y]) - 1; amp_max = max([x; y]) + 1;
ene_max = max([Ex; Ey]) + 2;

// 1. Do thi x(n)
subplot(4, 1, 1);
for i = 1:N; plot([n_val(i), n_val(i)], [0, x(i)], 'r-'); end
plot(n_val, x, 'ro'); 
a1 = gca(); a1.data_bounds = [-1, amp_min; N, amp_max]; 
a1.x_ticks = tlist(["ticks", "locations", "labels"], x_locs, x_lbls);
xtitle('Signal x(n)', 'n', 'Amplitude'); xgrid(1);

// 2. Do thi y(n)
subplot(4, 1, 2);
for i = 1:N; plot([n_val(i), n_val(i)], [0, y(i)], 'b-'); end
plot(n_val, y, 'bo'); 
a2 = gca(); a2.data_bounds = [-1, amp_min; N, amp_max]; 
a2.x_ticks = tlist(["ticks", "locations", "labels"], x_locs, x_lbls);
xtitle('Circular Convolution y(n)', 'n', 'Amplitude'); xgrid(1);

// 3. Do thi nang luong Ex(n)
subplot(4, 1, 3);
for i = 1:N; plot([n_val(i), n_val(i)], [0, Ex(i)], 'r-'); end
plot(n_val, Ex, 'r*'); 
a3 = gca(); a3.data_bounds = [-1, 0; N, ene_max]; 
a3.x_ticks = tlist(["ticks", "locations", "labels"], x_locs, x_lbls);
xtitle('Energy of x(n)', 'n', 'Energy'); xgrid(1);

// 4. Do thi nang luong Ey(n)
subplot(4, 1, 4);
for i = 1:N; plot([n_val(i), n_val(i)], [0, Ey(i)], 'b-'); end
plot(n_val, Ey, 'b*'); 
a4 = gca(); a4.data_bounds = [-1, 0; N, ene_max]; 
a4.x_ticks = tlist(["ticks", "locations", "labels"], x_locs, x_lbls);
xtitle('Energy of y(n)', 'n', 'Energy'); xgrid(1);
