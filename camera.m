% given image img and 
[rows, cols] = size(img);
% find image center coordinates in pixels
imgCntrX = rows/2;
imgCntrY = cols/2;

% find grid center coordinates in pixels
locationsX = findDarkestRows(img, cols, 4, true);
locationsY = findDarkestRows(img, rows, 4, false);
gridCntrX = mean([min(locationsX) max(locationsX)]);
gridCntrY = mean([min(locationsY) max(locationsY)]);

% find offset in pixels
offsetXPx = gridCntrX - imgCntrX;
offsetYPx = gridCntrY - imgCntrY;

% find offset in mm
offsetX = ;
offsetY = ;