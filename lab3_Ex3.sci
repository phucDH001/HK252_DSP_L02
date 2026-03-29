function [yn, yorigin] = fold(xn, xorigin)
    yn = xn($:-1:1); 
    yorigin = length(xn) - xorigin + 1;
    
    nx = (1:length(xn)) - xorigin;
    ny = (1:length(yn)) - yorigin;
    
    max_range = max(abs([nx, ny])) + 2;
    n_min = -max_range; 
    n_max =  max_range;
    
    f = scf(2); clf();
    f.figure_size = [1000, 600];
    
    // Vẽ x(n)
    subplot(2,1,1);
    plot2d3('gnn', nx', xn'); 
    xtitle("Original Signal x(n)", "n", "Amplitude");
    a = gca();
    a.x_location = "bottom"; a.y_location = "left";   
    a.data_bounds = [n_min, min(xn)-1; n_max, max(xn)+1];

    // Vẽ y(n)
    subplot(2,1,2);
    plot2d3('gnn', ny', yn'); 
    xtitle("Folded Signal y(n) = x(-n)", "n", "Amplitude");
    a = gca();
    a.x_location = "bottom"; a.y_location = "left";
    a.data_bounds = [n_min, min(xn)-1; n_max, max(xn)+1];
endfunction
