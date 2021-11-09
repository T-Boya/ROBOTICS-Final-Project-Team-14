% Note: Takes in grayscale images
% only partially removes shadows at present
function [img] = removeShadows(img)
    img = imadjust(img, [0 1], []);
    img = imadd(img, 75);
end