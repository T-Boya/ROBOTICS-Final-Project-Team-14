clear all; close all; clc;
board = ['_' '_' '_'; '_' '_' '_'; '_' '_' '_'];
duration = zeros(100, 1);
for k = 1:100
    for i = 1:3
        for j = 1:3
            val = rand(1, 1);
            if val < 1/3
                board(i, j) = 'X';
                continue;
            end
            if val < 2/3
                board(i, j) = 'O';
                continue;
            end
            board(i, j) = '_';
        end
    end

    startTime = posixtime(datetime('now'));
    img1 = getImage('grid2.jpg');
    img1fixed = cropImage(img1, 10);
    img1fixed = straightenGrid(img1fixed);
    img1fixed = removeWhitespace(img1fixed); 
    img1fixed = imadjust(img1fixed, [0.5 1], []);

    img2 = getImage('grid2_m.jpg');
    img2fixed = cropImage(img2, 10);
    img2fixed = straightenGrid(img2fixed);
    img2fixed = removeWhitespace(img2fixed); 
    img2fixed = imadjust(img2fixed, [0.5 1], []);
    [row, col] = findChangedCell(img1fixed, img2fixed);


    changedCell = getCell(img2fixed, row, col);

    [row, col] = choosemove(board, 'X'); 

    duration(k) = posixtime(datetime('now')) - startTime;
end
mean(duration)
std(duration)