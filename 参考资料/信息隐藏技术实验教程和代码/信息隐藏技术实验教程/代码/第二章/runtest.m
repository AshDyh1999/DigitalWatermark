%文件名:runstest.m
%程序员:郭迟
%编写时间:2004.1.12
%函数功能:本函数将完成对输入的[0,1]随机序列的游程检验.
%输入格式举例:[r,zr]=runstest(a);
%a是一个1x nobs的序列
%参数说明:
%randomnum为输入序列
%r为游程数
%zr 为检验结果
function [r,zr]=runtest(randomnum)
if size(randomnum(1,:))<=20
    error('输入序列太短'); 
end;
logic=(randomnum>=0.5); 
%序列二值化,大于等于0.5的取1,表示+
run=abs(diff(logic));
%计算等差绝对值
%计算+,-的数量及游程数
n=length(logic);
n1=sum(logic)+1; 
n2=n-n1;
r=sum(run);
%计算统计量值
u_r=(2*n1*n2)/(n1+n2)+1;
std_r=sqrt((2*n1*n2*(2*n1*n2-n1-n2))/(((n1+n2)^2)*(n1+n2-1)));
zr=(r-u_r)/std_r;
%计算显著性水平0.05下的正态上2/α分位点值
sz=abs(norminv(0.025,0,1));
if abs(zr)<sz
    disp('接受独立假设');
else
    disp('拒绝独立假设');
end



