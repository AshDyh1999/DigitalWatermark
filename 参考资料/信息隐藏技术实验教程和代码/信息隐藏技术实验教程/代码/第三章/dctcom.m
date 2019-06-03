%文件名:dctcom.m
%程序员:李巍
%编写时间:2004.1.12
%函数功能:本函数将利用DCT变换完成对输入图像进行压缩.
%输入格式举例:comimage=dctcom('c:\blenna.jpg','jpg')
%参数说明:
%image为输入的灰度图像
%permission为图像类型
%comimage为压缩后的图像矩阵
function comimage=dctcom(image,permission)
f=imread (image,permission);
f=double(f)/255;
T=dctmtx(8);
B=blkproc(f,[8 8],'P1*x*P2',T,T');   %T和T的转置是DCT函数P1*x*P2的参数
mask=[1 1 1 1 0 0 0 0
      1 1 1 0 0 0 0 0
      1 1 0 0 0 0 0 0
      1 0 0 0 0 0 0 0
      0 0 0 0 0 0 0 0
      0 0 0 0 0 0 0 0
      0 0 0 0 0 0 0 0
      0 0 0 0 0 0 0 0];      %1表示保留，0表示舍弃
B2=blkproc(B,[8 8],'P1.*x',mask);   %“.*”表示矩阵对应元素向量乘法
I2=blkproc(B2,[8 8],'P1*x*P2',T',T); %“*”表示矩阵乘法
subplot(221),imshow(f);title('原始图像');
subplot(222),imshow(I2) ;title('压缩后的图像');
M=I2-f;                        %压缩前后图像数据矩阵相减
subplot(223),imshow(mat2gray(M)),title('图像细节');       %构成并显示相减图像
