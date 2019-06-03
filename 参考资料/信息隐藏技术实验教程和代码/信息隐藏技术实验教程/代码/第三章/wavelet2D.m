%文件名:wavelet2D.m
%程序员:郭迟
%编写时间:2004.1.20
%函数功能:本函数将完成对输入的二维信号进行多尺度离散小波分解.
%输入格式举例:[lowf,highH,highV,highD,C,S]=wavelet2D(lennaR,'db1',3)
%参数说明:
%lowf为最大尺度分解后的低频系数
%highfH为最大尺度分解后的水平方向高频系数
%highfV为最大尺度分解后的垂直方向高频系数
%highfD为最大尺度分解后的对角方向高频系数
%C为全部分解的频率系数
%S为各尺度分解下得到的频率系数的长度
%signal为输入的原始二维信号
%wavelet为使用的小波类型
%level为分解的尺度
function  [lowf,highH,highV,highD,C,S]=wavelet2D(signal,wavelet,level);
%二维小波分解
[C,S]=wavedec2(signal,level,wavelet);
%提取最大尺度分解后的低频部分
lowf=appcoef2(C,S,wavelet,level);
%提取最大尺度分解后的高频部分
highH=detcoef2('h',C,S,level);
highV=detcoef2('v',C,S,level);
highD=detcoef2('d',C,S,level);
%重构最大尺度下分解的低频信号
A=wrcoef2('a',C,S,wavelet,level);
%重构最大尺度下分解得到的高频信号
Dh=wrcoef2('h',C,S,wavelet,level);
Dv=wrcoef2('v',C,S,wavelet,level);
Dd=wrcoef2('d',C,S,wavelet,level);
%显示重构后的效果
subplot(2,2,1),;image(A);title('低频平滑信号');  
subplot(2,2,2),imshow(Dh);title([int2str(level),' 尺度下的水平高频细节信号']);
subplot(2,2,3),imshow(Dv);title([int2str(level),' 尺度下的垂直高频细节信号']);
subplot(2,2,4),imshow(Dd);title([int2str(level),' 尺度下的对角高频细节信号']);
