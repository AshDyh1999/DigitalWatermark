%文件名:imagecbe.m
%程序员:郭迟
%编写时间:2004.1.24
%函数功能:本函数将完成对输入的两幅RGB图象用小波分析的方法进行图像融合.要求第一幅图像的大小大于等于第二幅图像.
%输入格式举例:cbeimage=imagecbe('c:\lenna.jpg','c:\cindy.jpg','jpg','db6')
%参数说明:
%image1为第一幅图像地址
%image2为第二幅图像地址
%permission为图像的文件类型
%wavelet为使用的小波类型
%cbeimage 为融合的图像

function cbeimage=imagecbe(image1,image2,permission,wavelet);
%读取两幅待融合的图像
im1=imread(image1,permission);
im2=imread(image2,permission);
im1=double(im1)/255;
im2=double(im2)/255;
[row1,col1]=size(im1);
[row2,col2]=size(im2);
a=reshape(im1,row1,col1);
b=reshape(im2,row2,col2);
%对图像进行一尺度下的小波分解,提取频率系数
[C1,S1]=wavedec2(a,1,wavelet);
[C2,S2]=wavedec2(b,1,wavelet);
size1=size(C1);
size2=size(C2);
%对图像进行系数调整
for i=1:size1(2)
    C1(i)=1.2*C1(i);
end
for i=1:size2(2)
    C2(i)=0.8*C2(i);
end
%对图像进行融合
C=0.5*(C1+C2);
%对图像进行重构
cbeimage=waverec2(C,S1,wavelet);
cbeimage=reshape(cbeimage,row1,col1/3,3);
cbeimage=uint8(cbeimage*255);
%显示结果
subplot(221),imshow(im1);title('第一幅图像');
subplot(222),imshow(im2);title('第二幅图像');
subplot(223),imshow(cbeimage);title('融合图像');
