%文件名:imagecom.m
%程序员:郭迟
%编写时间:2004.1.24
%函数功能:本函数将完成对输入的RGB图象用小波分析的方法进行自动压缩.得到压缩的高频系数阈值,压缩的效果百分比和压缩的结果
%输入格式举例:[comimage,perf0,perf1,thr]=imagecom('c:\lenna.jpg','c:\lenna2.jpg','jpg','db6',2)
%参数说明:
%image为输入的RGB图像地址
%permission为图像的文件类型
%addr为压缩后的图像存放的地址
%wavelet为使用的小波类型
%level为分解的尺度
%comimage 为压缩后的结果
%perf0为高频系数置0的百分比
%perf1为压缩后的能量百分比
%thr为压缩量化选择的阈值
function [comimage,perf0,perf1,thr]=imagecom(image,addr,permission,wavelet,level);
signal=imread(image,permission);
[row,col]=size(signal);
signal2=double(signal)/255;
signal2=reshape(signal2,row,col);
%对图像进行小波分解
[C,S]=wavedec2(signal2,level,wavelet);
%计算量化阈值
[thr,sorh,keepapp]=ddencmp('cmp','wv',signal2);
%压缩
[comimage,cxc,lxc,perf0,perf1]=wdencmp('gbl',C,S,wavelet,level,thr,sorh,keepapp);
comimage=reshape(comimage,row,col/3,3);
imwrite(comimage,addr,permission);
%显示结果

subplot(221),imshow(image);title('原始图像');
comimage=imread(addr,permission);
subplot(222),imshow(comimage);title('压缩后的图像');
disp('原始图像的大小');whos('signal')
disp('压缩后的图像的大小');whos('comimage')
disp('高频系数置0的百分比:');perf0
disp('压缩后的能量百分比:');perf1



