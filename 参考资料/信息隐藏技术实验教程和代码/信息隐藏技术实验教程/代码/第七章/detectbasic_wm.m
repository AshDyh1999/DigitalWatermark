%文件名:detectbasic_wm.m
%程序员:李巍
%编写时间:2004.3.20
%函数功能:本函数是一个检测基本通信水印的函数
%输入格式举例:
%Mn=detectbasic_wm(watermarkimage,2000,0.7)
%参数说明:
%watermarkimage嵌入水印后的图像数据矩阵
%seed为随机序列种子
%tlp是检测阈值
%Mn是检测结果 
function Mn=detectbasic_wm(watermarkimage,seed,tlp)
P=watermarkimage;
[row,col]=size(P);
%调用函数rand.m生成一个服从均匀分布的随机矩阵
rand('seed',seed);
wr=rand(row,col)*3;
%计算线性相关Zlp 
Zlp=0;
for j=1:col
    for i=1:row
        Zlp=Zlp+P(i,j)*wr(i,j);
    end
end
Zlp=Zlp/(row*col);
%根据检测阈值判断检测结果
if Zlp>tlp
    Mn=1;
elseif -tlp>Zlp
    Mn=0;
else Mn=-1;%无水印
end
