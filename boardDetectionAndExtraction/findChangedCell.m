function [row, col] = findChangedCell(oldImage, newImage)
    differences = zeros(3);
    maxDiff = 0; row = 0; col = 0;
    
    mismatchedDimensions = [ size(oldImage); size(newImage) ];
    dimensions = [ min(mismatchedDimensions(:,1)) min(mismatchedDimensions(:,2)) ];
    oldImage = imresize(oldImage, dimensions);
    newImage = imresize(newImage, dimensions);
    
    for i = 1:3
        for j = 1:3
            oldCell = getCell(oldImage, i, j);
            newCell = getCell(newImage, i , j);
            differences(i, j) = max(mean(mean(imabsdiff(oldCell, newCell))) - 5, 0);
            if differences(i, j) > maxDiff
                maxDiff = differences(i, j);
                row = i; col = j;
            end
        end
    end
end