x = [0; 1; 2; -3; 2; 1;0;0];
y = [0; 1; 2; -4; 0; 4; -2; -1];

Nx = length(x); n_x = 0:(Nx-1);
Ny = length(y); n_y = 0:(Ny-1);

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


n_min = min([n_x, n_y]) - 1;
n_max = max([n_x, n_y]) + 1;

ene_max = max([Ex; Ey]) + 2;

x_locs = n_min:n_max;
x_lbls = string(x_locs);

// Ve do thi
f = scf(0); clf(); 
f.figure_size = [800, 850];

// 1. Do thi x(n)
subplot(4, 1, 1);
plot2d3('onn', n_x, x); plot(n_x, x, 'ro');
a1 = gca(); 
a1.data_bounds = [n_min, amp_min; n_max, amp_max];
a1.x_ticks = tlist(["ticks", "locations", "labels"], x_locs, x_lbls);
xtitle('Signal x(n)', 'n', 'Amplitude'); xgrid(1);

// 2. Do thi y(n)
subplot(4, 1, 2);
plot2d3('onn', n_y, y); plot(n_y, y, 'bo');
a2 = gca(); 
a2.data_bounds = [n_min, amp_min; n_max, amp_max]; 
a2.x_ticks = tlist(["ticks", "locations", "labels"], x_locs, x_lbls);
xtitle('Linear Convolution y(n)', 'n', 'Amplitude'); xgrid(1);

// 3. Do thi nang luong cua x(n)
subplot(4, 1, 3);
plot2d3('onn', n_x, Ex, style=5); plot(n_x, Ex, 'r*');
a3 = gca(); 
a3.data_bounds = [n_min, 0; n_max, ene_max]; 
a3.x_ticks = tlist(["ticks", "locations", "labels"], x_locs, x_lbls);
xtitle('Energy of x(n): Ex(n)', 'n', 'Energy'); xgrid(1);

// 4. Do thi nang luong cua y(n)
subplot(4, 1, 4);
plot2d3('onn', n_y, Ey, style=2); plot(n_y, Ey, 'b*');
a4 = gca(); 
a4.data_bounds = [n_min, 0; n_max, ene_max]; 
a4.x_ticks = tlist(["ticks", "locations", "labels"], x_locs, x_lbls);
xtitle('Energy of y(n): Ey(n)', 'n', 'Energy'); xgrid(1);
