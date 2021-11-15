% Note: The horizon function is from the addon "Straighten image" by Jan Motl

function [img] = straightenGrid(grid)
    angle = horizon(grid);
    img = imrotate(grid, -angle);
end