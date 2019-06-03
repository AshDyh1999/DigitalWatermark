%文件名:mse.m
%程序员:郭迟
%编写时间:2004.3.20
%函数功能:本函数将完成对输入图像的MSE计算.
%输入格式举例:msevalue=mse('c:\lenna.jpg','c:\test.jpg')
%参数说明:
%original为原始图像
%test加有水印的图像
%msevalue为两者均方差
function msevalue=mse(original,test);
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
%计算MSE
msevalue=0;
for i=1:m
    for j=1:n
        msevalue=msevalue+(A(i,j)-B(i,j))^2;
    end
end
msevalue=msevalue/(m*n);
disp(['输入数据的MSE为:',num2str(msevalue)]);