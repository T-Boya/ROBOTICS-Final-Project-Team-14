% Note: Inputs an image in grayscale
% Slices an image of grid into 9 images containing each cell

function [cell] = getCell(grid, x, y)
    [i, j] = size(grid);
    i = floor(i/3);
    j = floor(j/3);
    % Extracting the cell from the grid
    cell = grid(i*(x-1)+1: i*x, j*(y-1)+1: y*j);
    % Crop the outer 5% to remove potential borders
    [height, width] = size(cell);
    cell = cell(round(height*0.1):round(height*0.9),...
        round(width*0.1):round(width*0.9));
end