n = -6:6; 
x = [0, 0, 0, 0, 1, -2, 3, 6, 0, 0, 0, 0, 0]; 

// y1(n) = x(-n)
y1 = [0, 0, 0, 0, 0, 6, 3, -2, 1, 0, 0, 0, 0];

// y2(n) = x(n+3)
y2 = [0, 1, -2, 3, 6, 0, 0, 0, 0, 0, 0, 0, 0];

// y3(n) = 2x(-n-2)
y3 = [0, 0, 0, 0, 0, 0, 0, 12, 6, -4, 2, 0, 0];

clf();
function draw_pair(sig_orig, sig_mod, t_mod)
    subplot(2,1,1);
    plot2d3(n, sig_orig); title("Original Signal x(n)");
    xlabel("n"); ylabel("Amplitude");
    
    subplot(2,1,2);
    plot2d3(n, sig_mod); title(t_mod);
    xlabel("n"); ylabel("Amplitude");
endfunction

// draw_pair(x, y1, "Manipulated Signal y1(n) = x(-n)");
// draw_pair(x, y2, "Manipulated Signal y2(n) = x(n+3)");
draw_pair(x, y3, "Manipulated Signal y3(n) = 2x(-n-2)");
