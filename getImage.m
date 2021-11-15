function [img] = getImage(filename)
    img = imread(filename);
    img = rgb2gray(img);
end