%文件名:imagenr.m
%程序员:郭迟
%编写时间:2004.1.24
%函数功能:本函数将完成对输入的RGB图象用小波分析的方法进行自动降噪,得到高频系数阈值,降噪效果百分比和结果
%输入格式举例:[comimage,perf0,perf1,thr]=imagenr('c:\lenna.jpg','c:\lenna2.jpg','jpg','db6',2)
%参数说明:
%image为输入的含噪声的RGB图像地址
%permission为图像的文件类型
%addr为处理后的图像存放的地址
%wavelet为使用的小波类型
%level为分解的尺度
%comimage 为降噪后的结果
%perf0为高频系数置0的百分比
%perf1为降噪后的能量百分比
%thr为降噪量化选择的阈值
function [comimage,perf0,perf1,thr]=imagecom(image,addr,permission,wavelet,level);
signal=imread(image,permission);
[row,col]=size(signal);
signal2=double(signal)/255;
signal2=reshape(signal2,row,col);
%对图像进行小波分解
[C,S]=wavedec2(signal2,level,wavelet);
%计算量化阈值
[thr,sorh,keepapp]=ddencmp('den','wv',signal2);
%压缩
[comimage,cxc,lxc,perf0,perf1]=wdencmp('gbl',C,S,wavelet,level,thr,sorh,keepapp);
comimage=reshape(comimage,row,col/3,3);
imwrite(comimage,addr,permission);
%显示结果
subplot(221),imshow(image);title('含噪声的原始图像');
comimage=imread(addr,permission);
subplot(222),imshow(comimage);title('降噪后的图像');
disp('高频系数置0的百分比:');perf0
disp('压缩后的能量百分比:');perf1



