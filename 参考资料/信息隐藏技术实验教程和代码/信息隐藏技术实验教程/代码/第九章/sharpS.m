%文件名：sharpS.m
%作者：李鹏  武汉大学
%创作时间：2004.3.26
%函数功能：对图像做非线形锐化
%函数说明：本函数的非线形锐化滤波器采用‘sobel’算子
%引用举例： image_opd=sharpS('lenna.jpg','1.jpg');
%参数说明：
%image   待做锐化的的图像
%imagegoal   锐化后的图像
function image_opd=sharpS(image,imagegoal)
A=imread(image);
[row,col]=size(A);
A=double(A)/255;original=A;
B=reshape(A,row,col);
h=fspecial('sobel');
C=filter2(h,B);
col=col/3;
image_opd=reshape(C,row,col,3);
imwrite( image_opd,imagegoal);
