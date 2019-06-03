%文件名:wsnr.m
%程序员:郭迟
%编写时间:2004.3.21
%函数功能:本函数将完成对输入图像的WSNR计算.
%输入格式举例:wsnrvalue=wsnr('c:\lenna.jpg','c:\test.jpg',0.5)
%参数说明:
%original为原始图像
%test加有水印的图像
%wnrvalue为两者加权信噪比
function wsnrvalue=wsnr(original,test)
%读取图像并处理到亮度关系
A=imread(original);
A=rgb2gray(A);
A=double(A);
B=imread(test);
B=rgb2gray(B);
B=double(B);
%判断输入图像是否有效
[m,n]=size(A);
[m2,n2]=size(B);
if m2~=m || n2~=n
    error('图像选择错误');
end
if A==B
    error('图像选择错误');
end
%计算失真度
e=A-B;
%CSF滤波
filtercoefficients=csf;
result=filter2(filtercoefficients,e);
%计算信噪比
wsnrvalue=10*log10((255^2)/(mean(mean(result^2))));
disp(['待测图像的WSNR为:',num2str(wsnrvalue),'dB']);