function char = detectCharacter(cell)
    o_ref = imread('o_ref.jpg');
    x_ref = imread('x_ref.jpg');
    cell = RemoveWhiteSpace(cell);
    cell = imresize(cell,[500 500]);
    imshow(cell);
    imshow(cell);
    cell = uint8(cell);
    ifx = immse(cell,x_ref);
    ifo = immse(cell,o_ref);
    if ifx>ifo
        char = 'X';
    else
        char = 'O';
    end
end

%%
clear all; close all; clc
img = getImage('o.jpg');
ocrResults = ocr(img,'TextLayout','Character')

recognizedText = ocrResults.Text;    
figure;
imshow(img);
text(131, 131, recognizedText, 'BackgroundColor', [1 1 1]);

%%
clear all; close all; clc
a = im2gray(imread('o.jpg'));
a = imresize(a,[500 500]);
bw = a < 100;
hold on
imshow(bw)

stats = regionprops(a,'all');

extr = stats.FilledImage

Z = 10 + extr;
surf(Z)
hold on 
image(Z,'CDataMapping','scaled')
%%

% Using
% https://www.mathworks.com/matlabcentral/fileexchange/34898-remove-white-space-around-images
% for removing the whitespace around the images

clear all; close all; clc

o_ref = im2gray(imread('o_ref.jpg'));
o_ref = imadjust(o_ref,[0.5 0.9]);
o_ref = RemoveWhiteSpace(o_ref);
o_ref = imresize(o_ref,[500 500]);
figure
imshow(o_ref)

o = im2gray(imread('o.jpg'));
o = imadjust(o,[0.25 0.4]);
o = RemoveWhiteSpace(o);
o = imresize(o,[500 500]);
figure
imshow(o)

x_ref = im2gray(imread('x_ref.jpg'));
x_ref = imadjust(x_ref,[0.5 0.9]);
x_ref = RemoveWhiteSpace(x_ref);
x_ref = imresize(x_ref,[500 500]);
figure
imshow(x_ref)

x = im2gray(imread('x.jpg'));
x = imadjust(x,[0.5 0.9]);
x = RemoveWhiteSpace(x)
x = imresize(x,[500 500]);
figure
imshow(x)

ssimval = immse(o,o_ref)
ssimval = immse(x,x_ref)
ssimval = immse(o,x_ref)
ssimval = immse(x,o_ref)

%%

imshow(RemoveWhiteSpace(x))