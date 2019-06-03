%文件名:patchdetect.m
%程序员:郭迟
%编写时间:2004.2.26
%函数功能:本函数将完成对图像加入patchwork水印
%输入格式举例:result=patchdetect('c:\test.png',1983,1121,421,0.001);
%参数说明:
%test为待测的图像
%key1,key2,key3为序列密钥
%threshold为判断阈值
%result为检测的结果
function [result,cmpvalue]=patchdetect(test,key1,key2,key3,threshold);
%读取隐秘载体图像信息,并提取亮度分量.该载体应为16位存储方式的图像,建议使用png格式
image= imread(test);
image=double(image)/65535;
YUV=rgb2ycbcr(image);
bright=YUV(:,:,1);
%求两组像素点的个数
[m,n]=size(bright);
quantity=floor(m*n/8);
%调用伪随机间隔函数,确定信息隐藏位
[row,col]=hashreplacement(bright,2*quantity,key1,key2,key3);
%求sum值
sum=0;
for i=1:quantity
    sum=sum+bright(row(i),col(i))-bright(row(2*i),col(2*i));
end
%与阈值进行比较
cmpvalue=abs(sum/quantity)-1/128;
if cmpvalue>threshold 
    result=1;
    disp('图像含有水印信号');
else
    result=0;
    disp('图像不含有水印信号');
end
