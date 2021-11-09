clear all
close all

BW = im2gray(imread('Image1.png'));
BI = BW>150;
imshow(BI)
s = regionprops(BW,'Centroid');

centroids = cat(1,s.Centroid);

imshow(BW)
hold on
plot(centroids(:,1),centroids(:,2),'b*')
hold off