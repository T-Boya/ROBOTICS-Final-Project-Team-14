function [row, col] = findChangedCellFinal(oldImage, newImage)
    oldImage = straightenGrid(oldImage);
    oldImage = removeShadows(oldImage);
    oldImage = removeWhitespace(oldImage); 

    newImage = straightenGrid(newImage);
    newImage = removeShadows(newImage);
    newImage = removeWhitespace(newImage);

    [row, col] = findChangedCell(oldImage, newImage);
end