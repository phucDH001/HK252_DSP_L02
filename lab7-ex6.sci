function y = circular_conv_fft(x1, x2)
    // Tinh DFT cua tung chuoi
    X1 = fft(x1);
    X2 = fft(x2);
    // Bien doi nguoc DFT
    y = ifft(X1 .* X2);
endfunction

function y = circular_conv_non_fft(x1, x2)
    N = length(x1);
    y = zeros(1, N);
    // y[n] = sum(x1[m] * x2[(n-m) mod N])
    for n = 0:(N-1)
        for m = 0:(N-1)
            idx = pmodulo(n - m, N) + 1;
            y(n + 1) = y(n + 1) + x1(m + 1) * x2(idx);
        end
    end
endfunction

// Kiem chung ket qua
x1 = [1, 2, 3, 4];
x2 = [5, 6, 7, 8];

disp("x1 = ");
disp(x1);
disp("x2 = ");
disp(x2);

y_fft = circular_conv_fft(x1, x2);
disp("Ket qua tich chap vong dung FFT:");
disp(y_fft);

y_non_fft = circular_conv_non_fft(x1, x2);
disp("Ket qua tich chap vong dung cong thuc:");
disp(y_non_fft);

sai_so = norm(y_fft - y_non_fft);
disp("Sai so giua hai phuong phap:");
disp(sai_so);
