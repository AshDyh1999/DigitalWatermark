%文件名:rgbanalysis.m
%程序员:郭迟
%编写时间:2004.2.8
%函数功能:将输入的RGB图像分层，并将图像的指定层加强
%输入格式举例:[imageRGB,imageR,imageG,imageB,result]=rgbanalysis('c:\lenna.jpg','jpg',1)
%参数说明:
%image输入的原始RGB图像的地址
%permission为图像文件类型
%level为要加强的层:1为R,2为G,3为B
%imageRGB为输入的RGB图像的RGB矩阵
%imageR为R层分量的矩阵
%imageG为G层分量的矩阵
%imageB为B层分量的矩阵
%result为色彩加强的RGB矩阵
function  [imageRGB,imageR,imageG,imageB,result]=rgbanalysis(image,permission,level);
%读取图像信息并转换为double型
imageRGB=imread(image,permission);
imageRGB=double(imageRGB)/255;
result=imageRGB;
%对图像进行分层提取
imageR=imageRGB(:,:,1);
imageG=imageRGB(:,:,2);
imageB=imageRGB(:,:,3);
%显示结果
subplot(321),imshow(imageRGB),title('原始图像');
subplot(322),imshow(imageR),title('R层灰度图像');
subplot(323),imshow(imageG),title('G层灰度图像');
subplot(324),imshow(imageB),title('B层灰度图像');
%对相应的层进行颜色加强
if level==1
    imageR=imageR+0.2;
end
if level==2
    imageG=imageG+0.2;
end
if level==3
    imageB=imageB+0.2;
end
result(:,:,1)=imageR;
result(:,:,2)=imageG;
result(:,:,3)=imageB;
%通过图像写回保存将超出范围的像素值自动调整为最大
imwrite(result,'temp.jpg','jpg');
result=imread('temp.jpg','jpg');
%显示结果
subplot(325),imshow(result),title('色彩增强的结果') ;
