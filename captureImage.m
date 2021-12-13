function [img] = takePicture()
    cam = webcam('Logitech HD Webcam C270');
    cam.Resolution = '1280x960';
    img = snapshot(cam);
    img = rgb2gray(img);
end