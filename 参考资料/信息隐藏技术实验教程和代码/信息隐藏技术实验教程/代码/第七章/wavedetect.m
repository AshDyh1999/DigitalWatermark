%文件名:wavedetect.m
%程序员:郭迟
%编写时间:2003.10.7
%函数功能:本函数将完成W-svd模型下数字水印的检测
%输入格式举例:[corr_coef,corr_DCTcoef]=wavedetect('c:\test.png','c:\lenna.jpg',1983,'db6',2,0.1,0.99)
%参数说明:
%input为输入原始图像
%seed为随机数种子
%wavelet为使用的小波函数
%level为小波分解的尺度
%alpha为水印强度
%ratio为算法中d/n的比例
%corr_coef,corr_DCTcoef分别为不同方法下检测出的相关系数
function [corr_coef,corr_DCTcoef]=wavedetect(test,original,seed,wavelet,level,alpha,ratio)
%function realCA=wavedetect(test,original,seed,wavelet,level,alpha,ratio)
dataoriginal=imread(original);
datatest=imread(test);
dataoriginal=double(dataoriginal)/255;
datatest=double(datatest)/65535;
dataoriginal=dataoriginal(:,:,1);
datatest=datatest(:,:,1);
%提取加有水印的图像的小波低频系数
[watermarkimagergb,watermarkimage,waterCA,watermark2,correlationU,correlationV]=wavemarksvd2(original,'temp.png',seed,wavelet,level,alpha,ratio);
%提取待测图像的小波低频系数
[C,S]=wavedec2(datatest,level,wavelet);
CA_test=appcoef2(C,S,wavelet,level);
%提取原始图像的小波低频系数
[C,S]=wavedec2(dataoriginal,level,wavelet);
realCA=appcoef2(C,S,wavelet,level);
%生成两种水印
realwatermark=waterCA-realCA;
testwatermark=CA_test-realCA;
%计算相关性
corr_coef=trace(realwatermark'*testwatermark)/(norm(realwatermark,'fro')*norm(testwatermark,'fro'));
%DCT 系数比较
DCTrealwatermark=dct2(waterCA-realCA);
DCTtestwatermark=dct2(CA_test-realCA);
DCTrealwatermark=DCTrealwatermark(1:min(32,max(size(DCTrealwatermark))),1:min(32,max(size(DCTrealwatermark))));
DCTtestwatermark=DCTtestwatermark(1:min(32,max(size(DCTtestwatermark))),1:min(32,max(size(DCTtestwatermark))));
DCTrealwatermark(1,1)=0;
DCTtestwatermark(1,1)=0;
corr_DCTcoef=trace(DCTrealwatermark'*DCTtestwatermark)/(norm(DCTrealwatermark,'fro')*norm(DCTtestwatermark,'fro'));


