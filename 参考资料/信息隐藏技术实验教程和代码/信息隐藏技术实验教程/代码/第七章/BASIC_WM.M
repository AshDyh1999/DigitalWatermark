%文件名:basic_wm.m
%程序员:李巍
%编写时间:2004.3.20
%函数功能:本函数是一个实现基本通信水印模型的函数
%输入格式举例:
%[watermarkimage,watermark]=basic_wm('lenna.jpg',1,2000,0.9)
%参数说明:
%input为原始载体图像文件名
%m是1比特水印信息 
%seed为随机序列种子
%alpha是尺度参数
%watermarkimage嵌入水印后的图片
%wm是生成水印
function [watermarkimage,wm]=basic_wm(input,m,seed,alpha)
Po=imread(input);
[row,col]=size(Po);
Po=double(Po)/255;
%调用函数randU1.m生成一个服从均匀分布的随机矩阵
rand('seed',seed);
wr=rand(row,col)/10;
%将1比特水印信息嵌入随机矩阵
if m==0
    wm=-wr;
else wm=wr;
end
wa=zeros(row,col);
wa=alpha*wm;
Pw=Po+wa;
%显示结果 
watermarkimage=Pw;
subplot(131);imshow(Po);title('原始图像');
subplot(132);imshow(wm);title('水印图像');
subplot(133);imshow(watermarkimage);title('嵌入水印后的图像');
