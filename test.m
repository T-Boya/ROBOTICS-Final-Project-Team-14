clear all; close all; clc

imdata = imread('grid.png');
imshow(imdata)
cell1 = getCell(imdata, 1, 1);
imshow(cell1);