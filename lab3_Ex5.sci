function [yn, yorigin] = multi(x1n, x1origin, x2n, x2origin)
    n1 = (1:length(x1n)) - x1origin;
    n2 = (1:length(x2n)) - x2origin;
    
    n_start = min(min(n1), min(n2));
    n_end = max(max(n1), max(n2));
    ny = n_start:n_end;
    
    y1 = zeros(1, length(ny));
    y2 = zeros(1, length(ny));
    
    y1(ny >= min(n1) & ny <= max(n1)) = x1n;
    y2(ny >= min(n2) & ny <= max(n2)) = x2n;
    
    yn = y1 .* y2; 
    yorigin = find(ny == 0);
    
    max_range = max(abs(ny)) + 2;
    n_view = [-max_range, max_range];
    
    f = scf(4); clf(); f.figure_size = [1000, 700];
    subplot(3,1,1); plot2d3('gnn', n1', x1n'); xtitle("x1(n)");
    gca().data_bounds = [n_view(1), min([x1n, x2n, yn])-1; n_view(2), max([x1n, x2n, yn])+1];
    
    subplot(3,1,2); plot2d3('gnn', n2', x2n'); xtitle("x2(n)");
    gca().data_bounds = [n_view(1), min([x1n, x2n, yn])-1; n_view(2), max([x1n, x2n, yn])+1];
    
    subplot(3,1,3); plot2d3('gnn', ny', yn', style=3); xtitle("y(n) = x1(n) * x2(n)");
    gca().data_bounds = [n_view(1), min([x1n, x2n, yn])-1; n_view(2), max([x1n, x2n, yn])+1];
endfunction
