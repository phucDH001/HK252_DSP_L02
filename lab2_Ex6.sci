n = -6:6; 
x1 = [0, 0, 0, 0, 0, 0, 0, 1, 3, -2, 0, 0, 0]; 
x2 = [0, 0, 0, 0, 0, 0, 1, 2, 3, 0, 0, 0, 0]; 

y = x1 + x2; 

clf();
function draw_sig(pos, n_vec, sig_vec, s_title)
    subplot(3,1,pos);
    plot2d3(n_vec, sig_vec);
    title(s_title);
    xlabel("n"); ylabel("Amplitude");
endfunction

draw_sig(1, n, x1, "Signal x1(n)");
draw_sig(2, n, x2, "Signal x2(n)");
draw_sig(3, n, y, "Result y(n) = x1(n) + x2(n)");
