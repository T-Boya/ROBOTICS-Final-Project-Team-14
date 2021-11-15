clear all; close all; clc
img = getImage('o.jpg');
ocrResults = ocr(img,'TextLayout','Character')

recognizedText = ocrResults.Text;    
figure;
imshow(img);
text(131, 131, recognizedText, 'BackgroundColor', [1 1 1]);

%%
clear all; close all;
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

clear all; close all;

o_ref = im2gray(imread('o_ref.jpg'));
o_ref = imresize(o_ref,[500 500]);
o = im2gray(imread('o.jpg'));
o = imresize(o,[500 500]);
x_ref = im2gray(imread('x_ref.jpg'));
x_ref = imresize(x_ref,[500 500]);
x = im2gray(imread('x.jpg'));
x = imresize(x,[500 500]);

o = imadjust(o,[0.3 0.7]);
x = imadjust(x,[0.3 0.7]);

% imshow(o)

ssimval = immse(o,o_ref)
ssimval = immse(x,x_ref)
ssimval = immse(o,x_ref)
ssimval = immse(x,o_ref)