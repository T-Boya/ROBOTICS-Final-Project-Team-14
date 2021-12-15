%% Create Reference Images

clc;
x_ref_full = imcrop(getImage('x_ref_full_2.jpg'));
x_ref_full = removeWhitespace(x_ref_full); % The one we wrote
% x_ref = zeros(500);
index = 1;
for i=1:3
    for j=1:3
        cell = getCell(x_ref_full,i,j);
        cell = imadjust(cell,[0.3 0.5]);
        cell = RemoveWhiteSpace(cell);
        cell = imresize(cell,[500 500]);
        x_ref = x_ref+cell;
        imshow(cell);
        pause(1);
        index = index+1;
    end
end

imshow(x_ref/(index-1));