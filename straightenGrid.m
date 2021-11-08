function [img] = straightenGrid(grid)
    angle = horizon(grid);
    img = imrotate(grid, -angle);
end