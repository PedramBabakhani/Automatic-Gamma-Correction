I = imread('westconcordorthophoto.png');
I=rgb2gray(I);
I=mat2gray(I);
size=size(I);
sizex=size(1);
sizey=size(2);
sum1=0.0;
mean=sum(sum(I))/(sizex*sizey);
for i=1:sizex
for j=1:sizey
sum1=sum1+(abs(I(i,j)-0.5));
end
end
var=sum1/(sizex*sizey);
gamma=mean/var;
imshow(I);
title({['average of brightness: ' num2str(mean)];['average of distance from center: ' num2str(var)];['gamma: ' num2str(gamma)]});
figure;
imhist(I);
figure;
enhancI=imadjust(I,[],[],gamma);
meanenhancI=sum(sum(enhancI))/(sizex*sizey);
sum2=0.0;
for i=1:sizex
for j=1:sizey
sum2=sum2+(abs(enhancI(i,j)-0.5));
end
end
varenhancI=sum2/(sizex*sizey);
imshow(enhancI); 
title({['average of brightness: ' num2str(meanenhancI)];['average of distance from center: ' num2str(varenhancI)]});
figure;
imhist(enhancI);

function [enhancI]= gammacorrection (I);
I=rgb2gray(I);
I=mat2gray(I);
size=size(I);
sizex=size(1);
sizey=size(2);
sum1=0.0;
mean=sum(sum(I))/(sizex*sizey);
for i=1:sizex
for j=1:sizey
sum1=sum1+(abs(I(i,j)-0.5));
end
end
var=sum1/(sizex*sizey);
gamma=mean/var;
imshow(I);
title({['average of brightness: ' num2str(mean)];['average of distance from center: ' num2str(var)];['gamma: ' num2str(gamma)]});
figure;
imhist(I);
figure;
enhancI=imadjust(I,[],[],gamma);
meanenhancI=sum(sum(enhancI))/(sizex*sizey);
sum2=0.0;
for i=1:sizex
for j=1:sizey
sum2=sum2+(abs(enhancI(i,j)-0.5));
end
end
varenhancI=sum2/(sizex*sizey);
imshow(enhancI);
title({['average of brightness: ' num2str(meanenhancI)];['average of distance from center: ' num2str(varenhancI)]});
figure;
imhist(enhancI);
