function [row, col] = findChangedCell(oldImage, newImage)
    differences = zeros(3);
    maxDiff = 0; row = 0; col = 0;
    oldImage = imresize(oldImage, [2409, 2411]);
    newImage = imresize(newImage, [2409, 2411]);
    
    for i = 1:3
        for j = 1:3
            oldCell = getCell(oldImage, i, j);
            newCell = getCell(newImage, i , j);
            differences(i, j) = mean(mean(imabsdiff(oldCell, newCell)));
            if differences(i, j) > maxDiff
                maxDiff = differences(i, j);
                row = i; col = j;
            end
        end
    end
end