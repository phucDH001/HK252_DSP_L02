// Hay sua duong dan file cho phu hop
filename = "C:\Users\Admin\Desktop\lab4_ex4.wav";

// Doc file WAV
[y, Fs, bits] = wavread(filename);

disp("Da doc file: " + filename);
disp("Tan so lay mau = " + string(Fs) + " Hz");
disp("So bit = " + string(bits));

sz = wavread(filename, "size");
disp("Kich thuoc [channels samples] = " + string(sz));

info = wavread(filename, "info");
disp("Thong tin chi tiet:");
disp(info);

// Phat am thanh
playsnd(y, Fs);

// Ve tin hieu theo thoi gian
subplot(2, 1, 1);
plot(y(1, :));
xtitle("Dang song am thanh", "Chi so mau", "Bien do");

// Ve pho tan so
subplot(2, 1, 2);
analyze(y(1, :), 10, 4000, Fs, 8192);
xtitle("Pho tan so cua file am thanh", "Tan so (Hz)", "Bien do");
