function [yn, yorigin] = advance (xn, xorigin, k)
    if k <= 0 then
        error("Loi: Gia tri k phai lon hon 0 de thuc hien phep delay.");
        return;
    end
    
    yorigin = xorigin + k;
    yn = xn;
    
    if yorigin > length(xn) then
        padding = yorigin - length(xn);
        yn = [xn, zeros(1, padding)];
    end
    
    nx = (1:length(xn)) - xorigin;
    ny = (1:length(yn)) - yorigin;
    
    max_range = max(abs([nx, ny])) + 2;
    n_min = -max_range; 
    n_max =  max_range;

    f = scf(0); clf();
    f.figure_size = [1000, 600];
    
    // Vẽ x(n)
    subplot(2,1,1);
    plot2d3('gnn', nx', xn'); 
    xtitle("Original Signal x(n)", "n", "Amplitude");
    a = gca();
    a.x_location = "bottom"; 
    a.y_location = "left";   
    a.data_bounds = [n_min, min(xn)-1; n_max, max(xn)+1];

    // Vẽ y(n)
    subplot(2,1,2);
    plot2d3('gnn', ny', yn'); 
    xtitle("Advanced Signal y(n) = x(n + " + string(k) + ")", "n", "Amplitude");
    a = gca();
    a.x_location = "bottom"; a.y_location = "left";
    a.data_bounds = [n_min, min(xn)-1; n_max, max(xn)+1];
endfunction

