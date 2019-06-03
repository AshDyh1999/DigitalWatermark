%文件名：blurringL8.m
%程序员：李鹏
%编写时间：2004.3.20
%函数功能：本函数用于对图像做模糊处理(对RGB图像)
%输入格式举例：image_opd=blurringL8('lenna.jpg','1.jpg',5);
%参数说明：
%image为待处理图像
%imagegoal为处理后的图像
%x为模糊的次数
function [image_opd,C]=blurringL8(image,imagegoal,x);
A=imread(image);
[M,N]=size(A);
A=double(A)/255;
original=A;
B=reshape(A,M,N);
blur=1/44*[1 1 2 1 1;1 2 2 2 1;2 2 8 2 2;1 2 2 2 1;1 1 2 1 1];
for i=1:x
Xe=zeros(M+4,N+4);
    Xe(3:M+2,3:N+2)=B;
    Xe(1,3:N+2)=B(1,1:N);
    Xe(2,3:N+2)=B(1,1:N);
    Xe(M+3,3:N+2)=B(M,1:N);
    Xe(M+4,3:N+2)=B(M,1:N);
    Xe(3:M+2,1)=B(1:M,1);
    Xe(3:M+2,2)=B(1:M,1);
    Xe(3:M+2,N+3)=B(1:M,N);
    Xe(3:M+2,N+4)=B(1:M,N);
    Xe(1:2,1:2)=B(1,1);
    Xe(M+3:M+4,N+3:N+4)=B(M,N); 
    Xe(M+3:M+4,1:2)=B(M,1);
    Xe(1:2,N+3:N+4)=B(1,N);  
C=conv2(Xe,blur,'valid');
B=C;
end
N=N/3;
image_opd=reshape(C,M,N,3);
imwrite( image_opd,imagegoal);
imshow(imagegoal);
