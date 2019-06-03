%文件名：median16.m
%作者：李鹏  武汉大学
%创作时间：2004.3.24
%目的：完成对图像的中值滤波
%引用举例： image_opd=median16('test.png',3);
%参数说明：
%image   待做中值滤波的图像
%x       二维中值滤波器的窗口尺寸参数，窗口大小为x*x，这里的二维中值滤波器为常规中值滤波器
function  image_opd=median16(image,a);
A=imread(image);
[row,col]=size(A);
A=double(A)/65535;
original=A;
B=reshape(A,row,col);
C= medfilt2(B,[a a]);
col=col/3;
 image_opd=reshape(C,row,col,3);
 imwrite(image_opd,'temp2.png','BitDepth',16);
 %以png格式存储


