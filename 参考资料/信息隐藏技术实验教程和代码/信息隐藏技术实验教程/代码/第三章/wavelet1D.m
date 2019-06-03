%文件名:wavelet1D.m
%程序员:郭迟
%编写时间:2004.1.20
%函数功能:本函数将完成对输入的一维信号进行多尺度离散小波分解.
%输入格式举例:[lowf,highf]=wavelet1D(leleccum,'db1',3)
%参数说明:
%lowf为最大尺度分解后的低频部分
%highf为最大尺度分解后的高频部分
%signal为输入的原始一维信号
%wavelet为使用的小波类型
%level为分解的尺度
function  [lowf,highf]=wavelet1D(signal,wavelet,level);
is=length(signal);
im=max(signal);
%一维小波分解
[C,S]=wavedec(signal,level,wavelet);
%提取最大尺度分解后的低频部分
lowf=appcoef(C,S,wavelet,level);
%提取最大尺度分解后的高频部分
highf=detcoef(C,S,level);

%重构最大尺度下分解的低频信号
A=wrcoef('a',C,S,wavelet,level);
%重构各尺度下分解得到的高频信号
for i=1:level
     D(i,:)=wrcoef('d',C,S,wavelet,i);
end
%显示重构后的效果
subplot(2,2,1),;plot(A);axis([0 is 0 im]);title('低频平滑信号');  
for i=1:level
    subplot(2,2,i+1),plot(D(i,:));title([int2str(i),' 尺度下的高频细节信号']);
end  




