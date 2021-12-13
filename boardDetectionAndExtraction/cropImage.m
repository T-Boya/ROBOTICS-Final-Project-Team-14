function [img] = cropImage(img, percent)
    [height, width] = size(img);
    img = img(round(height*percent/100):round(height*(1-(percent/100))),...
    round(width*percent/100):round(width*(1-(percent/100))));
end