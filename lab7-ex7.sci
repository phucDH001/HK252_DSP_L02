function y = linear_conv_fft(x1, x2)
    x1 = matrix(x1, 1, -1);
    x2 = matrix(x2, 1, -1);
    
    N1 = length(x1);
    N2 = length(x2);
    N = N1 + N2 - 1;
    
    // Zero-padding
    x1_pad = [x1, zeros(1, N - N1)];
    x2_pad = [x2, zeros(1, N - N2)];
    
    X1 = fft(x1_pad);
    X2 = fft(x2_pad);
    
    y = ifft(X1 .* X2);
endfunction

// Kiem chung ket qua
x1 = [1, 2, 3, 4, 5];
x2 = [6, 7, 8];

disp("x1 = ");
disp(x1);
disp("x2 = ");
disp(x2);

y_fft = linear_conv_fft(x1, x2);
disp("Ket qua tich chap bang FFT dung zero-padding:");
disp(y_fft);

y_conv = conv(x1, x2);
disp("Ket qua tich chap bang lenh conv():");
disp(y_conv);

sai_so = norm(y_fft - y_conv);
disp("Sai so lon nhat giua phuong phap:");
disp(sai_so);
