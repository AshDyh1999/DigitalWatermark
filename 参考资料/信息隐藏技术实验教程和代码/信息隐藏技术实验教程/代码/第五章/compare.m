%文件名:compare.m
%程序员:李巍
%编写时间:2004.3.3
%函数功能:本函数完成
%输入格式举例:F=compare('lena.bmp','lenahided.bmp')
%参数说明:
%original是原始载体图像
%hided是隐秘后的图像
%F是差值矩阵 
function F=compare(original,hided)
%读取原始载体图像矩阵 
w=imread(original);
A=double(w)/255;
%读取隐秘后图像矩阵 
e=imread(hided);
B=double(e)/255;
%将两图像矩阵相减 ，显示效果 
F=A-B;%注意，MATLAB中矩阵相减只支持double型
imshow(mat2gray(F))
