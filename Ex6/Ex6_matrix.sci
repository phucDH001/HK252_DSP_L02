// CONVOLUTION USING MATRIX METHOD

x = [1; 2; -3; 2; 1];
h = [1; 0; -1];

Nx = length(x);
Nh = length(h);
Ny = Nx + Nh - 1;

H = zeros(Ny, Nx);

for i = 1:Nx
    H(i : i + Nh - 1, i) = h;
end

y_matrix = H * x;

disp("y(n) voi phuong phap Ma tran:");
disp(y_matrix');
