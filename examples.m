% requires signal processing toolbox
% tic-tac-toe board MUST be encompassed by border or board detecting code
% (whitespace removal code) fails

%% Slicing an image into cells
clear all; close all; clc
img = getImage('grid.png');
cell1 = getCell(img, 2, 2);
imshow(cell1);

%% Straightening an image
clear all; close all; clc
img = getImage('grid2.jpg');
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
img = getImage('grid2.jpg');
img = removeWhitespace(img);
imshow(img);

%% combined
clear all; close all; clc
img = getImage('grid2.jpg');
img = straightenGrid(img);
img = removeShadows(img);
img = removeWhitespace(img);
figure, imshow(img);
cell3 = getCell(img, 1, 3);
figure, imshow(cell3);

%% comparing cell differences
clear all; close all; clc
oldImage = getImage('grid2.jpg');
newImage = getImage('grid2_modified.jpg');
[row, col] = findChangedCell(oldImage, newImage);
changedCell = getCell(newImage, row, col);
imshow(changedCell)

%% combined
clear all; close all; clc

% clean old image
oldImage = getImage('grid2.jpg');
oldImage = imrotate(oldImage, -25); % rotate image to test straightening
oldImage = straightenGrid(oldImage);
oldImage = removeShadows(oldImage);
oldImage = removeWhitespace(oldImage);


% clean new image
newImage = getImage('grid2_modified.jpg');
newImage = imrotate(newImage, -25); % rotate image to test straightening
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