// CONVOLUTION USING CIRCULAR MATRIX METHOD

x = [1; 2; -3; 2; 1];
h = [1; 0; -1; -1; 1];
N = length(x);

Hc = zeros(N, N);
for i = 1:N
    for j = 1:N
        
        idx = pmodulo(i - j, N) + 1; 
        Hc(i, j) = h(idx);
    end
end

y_matrix = Hc * x;
disp("y(n) voi phuong phap Ma tran vong:");
disp(y_matrix');
