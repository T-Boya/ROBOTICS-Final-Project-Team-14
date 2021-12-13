function [img] = takePicture()
    cam = webcam('USB Video Device');
    cam.Resolution = '1280x960';
    img = snapshot(cam);
    img = rgb2gray(img);
    [height, width] = size(img);
    img = img(round(height*0.1):round(height*0.9),...
    round(width*0.1):round(width*0.9));
end