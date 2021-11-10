% Note: Takes images in grayscale
% slices image of grid into 9 images of cells

function [cell] = getCell(grid, x, y)
    [i, j] = size(grid);
    i = floor(i/3);
    j = floor(j/3);
    % extract cell
    cell = grid(i*(x-1)+1: i*x, j*(y-1)+1: y*j);
    % crop outer 5% to remove potential borders
    [height, width] = size(cell);
    cell = cell(round(width*0.05):round(width*0.95),...
        round(height*0.05):round(height*0.95));
end