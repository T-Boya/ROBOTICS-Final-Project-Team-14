%% test image slicing
clear all; close all; clc

imdata = imread('grid.png');
imshow(imdata)
cell1 = getCell(imdata, 1, 1);
imshow(cell1);

%% test grid detection
clear all; close all; clc
imdata = imread('grid.png');
imdata = rgb2gray(imdata);
imdata = imrotate(imdata, 10);
imshow(imdata)
img = straightenGrid(imdata);
imshow(img);