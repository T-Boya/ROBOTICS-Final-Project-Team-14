% Note: Takes images in grayscale
% slices image of grid into 9 images of cells
% inputs x and y specify cell coordinates

function [cell] = getCell(grid, x, y)
    [i, j] = size(grid);
    cols = [1 sort(findDarkestRows(grid, j, 2, true)) j];
    rows = [1 sort(findDarkestRows(grid, i, 2, false)) i];
    % extract cell
    cell = grid(rows(x): rows(x+1), cols(x):cols(x+1));
    % crop outer 5% to remove potential borders
    [height, width] = size(cell);
    cell = cell(round(width*0.05):round(width*0.95),...
        round(height*0.05):round(height*0.95));
end