// Truoc khi chay hay cai Image Processing & Computer Vision Toolbox
// atomsInstall("IPCV");
atomsLoad("IPCV");

// Hay sua duong dan file cho phu hop
filename = "C:\Users\Admin\Desktop\lab4_ex5.jpg";
img = imread(filename);

// Neu anh mau thi doi sang xam de de xu ly histogram
dims = size(size(img), "*");
if dims == 3 then
    g = rgb2gray(img);
else
    g = img;
end

g = uint8(g);

// Hien thi anh goc
scf(1);
subplot(2, 2, 1);
imshow(g);
title("Anh xam goc");

// Histogram cua anh goc
[counts, cells] = imhist(g, 16); // gop 16 muc de de dang xem

subplot(2, 2, 2);
bar(cells, counts);
xtitle("Histogram anh goc gop 16 level", "Muc xam", "So pixel");

// Histogram equalization thu cong
[counts, cells] = imhist(g, 256);
[m, n] = size(g);
cdf = cumsum(counts) / (m*n);
lut = uint8(round(255 * cdf));

eq = g;
for i = 1:m
    for j = 1:n
        eq(i,j) = lut(double(g(i,j)) + 1);
    end
end

subplot(2, 2, 3);
imshow(eq);
title("Anh sau equalization");

// Histogram sau equalization
[counts, cells] = imhist(eq, 16);

subplot(2, 2, 4);
bar(cells, counts);
xtitle("Histogram sau equalization gop 16 level", "Muc xam", "So pixel");

// Anh goc co mau
scf(2);
subplot(2, 1, 1);
imshow(img);
title("Anh goc");

// Blur bang bo loc trung binh
H = fspecial("average", 10);
blurred = imfilter(img, H);

subplot(2,1,2);
imshow(blurred);
title("Anh sau blur");
