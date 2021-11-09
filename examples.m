% requires signal processing toolbox

%% image slicing into cells
clear all; close all; clc
img = imread('grid.png');
img = rgb2gray(img);
cell1 = getCell(img, 1, 1);
imshow(cell1);

%% straightening
clear all; close all; clc
img = imread('grid2.jpg');
img = rgb2gray(img);
img = imrotate(img, -25);
img = straightenGrid(img);
imshow(img);

%% shadow removal (may not be necessary)
clear all; close all; clc
img = imread('grid2.jpg');
img = removeShadows(img);
imshow(img)

%% whitespace removal
clear all; close all; clc
img = imread('grid2.jpg');
img = removeWhitespace(img);
imshow(img);

%% combined
clear all; close all; clc
img = imread('grid2.jpg');
img = rgb2gray(img);
img = straightenGrid(img);
img = removeShadows(img);
img = removeWhitespace(img);
figure, imshow(img);
cell3 = getCell(img, 1, 3);
figure, imshow(cell3);

%% comparing cell differences
clear all; close all; clc
oldImage = imread('grid2.jpg');
newImage = imread('grid2_modified.jpg');
[row, col] = findChangedCell(oldImage, newImage);
changedCell = getCell(newImage, row, col);
imshow(changedCell)

%% combined
clear all; close all; clc

% clean old image
oldImage = imread('grid2.jpg');
oldImage = rgb2gray(oldImage);
oldImage = straightenGrid(oldImage);
oldImage = removeShadows(oldImage);
oldImage = removeWhitespace(oldImage);


% clean new image
newImage = imread('grid2_modified.jpg');
newImage = rgb2gray(newImage);
newImage = straightenGrid(newImage);
newImage = removeShadows(newImage);
newImage = removeWhitespace(newImage);

% get modified cell
[row, col] = findChangedCell(oldImage, newImage);
if sum([row col]) == 0
    disp('no cells changed')
else
    changedCell = getCell(newImage, row, col);
    imshow(changedCell)
end