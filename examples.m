% requires signal processing toolbox

%% image slicing into cells
clear all; close all; clc
img = imread('grid.png');
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