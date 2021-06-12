%import image
clc;
clear;

obj=imread('ball1.png');
%%imshow(obj);

%segment image
%divide image into respective RGB intensities

red=obj(:,:,1);
green=obj(:,:,2);
blue=obj(:,:,3);

figure(1)
subplot(3,2,1); imshow(obj); title('ORIGINAL IMAGE');
subplot(3,2,2); imshow(red); title('RED PLANE');
subplot(3,2,3); imshow(green); title('GREEN PLANE');
subplot(3,2,4); imshow(blue); title('BLUE PLANE');

%thresold blue plane
figure(2)
level =0.37;
bw2=im2bw(blue,level);  % we can also use imbinarize
subplot(3,2,1) ; imshow(bw2); title('BLUE PLANE THRESOLD');

%%remove noise

%fill any holes
fill=imfill(bw2,'HOLES');
subplot(3,2,2); imshow(fill); title('HOLES FILLED');

%remove any blobs on the border of the shape
clear=imclearborder(fill);
subplot(3,2,3); imshow(clear); title('REMOVE BLOBS ON BORDER');

%remove blobs that are smaller than 7 pexels 
se=strel('disk',7);
open=imopen(fill,se);
subplot(3,2,4); imshow(open); title('REMOVE SMALL BLOBS');

%%measure object diameter

diameter = regionprops(open,'MajorAxisLength')


%show result
figure(3)
imshow(obj)
d=imdistline;




