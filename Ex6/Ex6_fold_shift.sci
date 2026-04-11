// CONVOLUTION USING FOLDING AND SHIFTING METHOD
x = [1; 2; -3; 2; 1];
h = [1; 0; -1];

Nx = length(x);
Nh = length(h);
Ny = Nx + Nh - 1;

y = zeros(Ny, 1);

for n = 1:Ny
    sum_val = 0;
    for k = 1:Nx
        idx_h = n - k + 1; 
        if (idx_h >= 1) & (idx_h <= Nh) then
            sum_val = sum_val + x(k) * h(idx_h);
        end
    end
    y(n) = sum_val;
end

disp("y(n) voi thuat toan Folding va Shifting:");
disp(y');
