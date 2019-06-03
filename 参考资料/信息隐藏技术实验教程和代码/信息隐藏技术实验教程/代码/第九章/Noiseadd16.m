%文件名：noiseadd16.m
%程序员：李鹏
%编写时间：2004.3.25
%函数功能：本函数用于对16位图像加gaussian噪声
%输入格式举例： image_opd=noiseadd16('test.png',0,0.01);
%函数说明：本函数用到matlab中自带的imnoise函数，这里所加的噪声仅仅是gaussian噪声,
%          其他噪声的参数不同，这里不再例举，同学们可以自己查看imnoise函数
%参数说明：
%image为待处理图像
%M为均值
%V为方差
function image_opd=noiseadd16(image,M,V)
A=imread(image);
original=A;
[row,col]=size(A);
A=double(A)/65535;
B=imnoise(A,'gaussian',M,V);
col=col/3;
image_opd=reshape(B,row,col,3);
imwrite(image_opd,'temp2.png','BitDepth',16);


