%文件名：median.m
%作者：李鹏  武汉大学
%创作时间：2004.3.24
%目的：完成对图像的中值滤波
%引用举例： image_opd=median('lenna.jpg','1.jpg',3);
%参数说明：
%image   待做中值滤波的图像
%x       二维中值滤波器的窗口尺寸参数，窗口大小为x*x，这里的二维中值滤波器为常规中值滤波器
function  image_opd=median(image,imagegoal,x);
A=imread(image);
[row,col]=size(A);
A=double(A)/255;
original=A;
B=reshape(A,row,col);
C= medfilt2(B,[x x]);
col=col/3;
 image_opd=reshape(C,row,col,3);
imwrite( image_opd,imagegoal);

