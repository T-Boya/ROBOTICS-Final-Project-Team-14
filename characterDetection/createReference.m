%% Creating a Reference Image

%% Initial
clear all; close all; clc
ref = zeros(500);
index = 1;

%% Repeat
clc;
ref_full = imcrop(getImage('o_ref_full.jpg'));
ref_full = removeWhitespace(ref_full); % The one we wrote
for i=1:3
    for j=1:3
        cell = getCell(ref_full,i,j);
        cell = imadjust(cell,[0.3 0.5]);
        cell = RemoveWhiteSpace(cell);
        cell = imresize(cell,[500 500]);
        ref = ref+cell;
        imshow(cell);
        pause(1);
        index = index+1;
    end
end

imshow(ref/(index-1));

%% Final
imsave;