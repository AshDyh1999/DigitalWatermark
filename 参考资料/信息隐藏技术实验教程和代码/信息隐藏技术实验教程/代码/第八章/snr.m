%文件名:snr.m
%程序员:郭迟
%编写时间:2004.3.21
%函数功能:本函数将完成对输入图像的信噪比,峰值信噪比计算.
%输入格式举例:[snrvalue,psnrvalue]=snr('c:\lenna.jpg','c:\test.jpg')
%参数说明:
%original为原始图像
%test加有水印的图像
%snrvalue为两者信噪比
%psnrvalue为两者峰值信噪比
function [snrvalue,psnrvalue]=snr(original,test);
%调用函数,计算MSE
msevalue=mse(original,test);
if msevalue==0
    error('图像选择错误');
end
%计算原始图像的信号功率
A=imread(original);
A=rgb2gray(A);
A=double(A);
[m,n]=size(A);
signal=0;
for i=1:m
    for j=1:n
        signal=signal+A(i,j)^2;
    end
end
signal=signal/(m*n);
%计算信噪比,峰值信噪比
snrvalue=signal/msevalue;
snrvalue=10*log10(snrvalue);
psnrvalue=255^2/msevalue;%8位图使用
%psnrvalue=65535^2/msevalue;%16位图使用
psnrvalue=10*log10(psnrvalue);
disp(['待测图像的信噪比为:',num2str(snrvalue),'dB']);
disp(['待测图像的峰值信噪比为:',num2str(psnrvalue),'dB']);
    

