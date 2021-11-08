% slices image of grid into 9 images of cells
function [cell] = getCell(grid, x, y)
    [i, j, k] = size(grid);
    i = i/3;
    j = j/3;
    cell = grid(i*(x-1)+1: i*x, j*(y-1)+1: y*j);
end