%given calibration image and board image
% run camera calibration script on given image


K = cameraParams.Intrinsics.IntrinsicMatrix';
reproj = cameraParams.ReprojectedPoints(:,:,1);
orig = cameraParams.WorldPoints;
uconv = (orig(1,2) - orig(1, 1)) / (reproj(1,2) - reproj(1, 1));
vconv = (orig(1,1) - orig(2, 1)) / (reproj(1,1) - reproj(2, 1));


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
offsetX = offsetXPx * uconv;
offsetY = offsetYPx * vconv;