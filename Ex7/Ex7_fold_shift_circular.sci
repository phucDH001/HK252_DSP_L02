// CONVOLUTION USING FOLDING AND CIRCULAR SHIFTING METHOD

x = [1; 2; -3; 2; 1];
h = [1; 0; -1; -1; 1];
N = length(x);
y_circ = zeros(N, 1);

for n = 0:(N-1)
    sum_val = 0;
    for k = 0:(N-1)
        idx_x = pmodulo(n - k, N) + 1; 
        idx_h = k + 1;
        sum_val = sum_val + h(idx_h) * x(idx_x);
    end
    y_circ(n+1) = sum_val;
end

disp("y(n) voi phuong phap Folding và shifting vong:");
disp(y_circ');
