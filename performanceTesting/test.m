img = getImage('X.jpg');
angle = horizon(img);
imgNew = imrotate(img, -angle);
% crop image to only include the X or O
% attempt to straighten using horizon

% idea 1
% if it  with horizon, its an X

% idea 2
% rotate straightened image 45 degrees, compare rotated profile rows/cols
% darkness to original to determine if circle (unchanged) or X.