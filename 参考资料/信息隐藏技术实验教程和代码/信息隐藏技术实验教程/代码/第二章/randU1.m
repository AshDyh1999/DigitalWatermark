%文件名:randU1.m
%程序员:郭迟
%编写时间:2003.11.20
%函数功能:本函数为线性同余伪随机数发生器
%输入格式举例:randmtx=randU1(10,10,10000,0,1)
%参数说明:
%row为随机数矩阵的行数
%col为随机数矩阵的列数
%seed为种子
%k1,k2为生成的随机数落在的范围,k1=0,k2=1表示生成的随机数为0到1之间的数
function randmtx=randU1(row,col,seed,k1,k2)
%如果不输入种子将采用默认的种子
if nargin < 3
   seed=1973272912;
end
m=2^31-1;
a=630360016;
randmtx(1,1)=mod(a*seed,m);
for i=2:row*col
    randmtx(1,i)=mod((a*randmtx(1,i-1)),m);
end
randmtx=reshape(randmtx,row,col);
if nargin<4
    randmtx=randmtx/m;
    return
end
randmtx=randmtx/m;
%将数据放缩到要求的区间
randmtx=randmtx*(k2-k1)+k1;
