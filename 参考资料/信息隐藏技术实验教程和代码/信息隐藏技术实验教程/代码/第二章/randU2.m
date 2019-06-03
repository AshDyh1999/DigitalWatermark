%文件名:randU2.m
%程序员:郭迟
%编写时间:2003.11.20
%函数功能:本函数小数开方伪随机数发生器
%输入格式举例:randmtx=randU2(10,10,10000,0,1)
%参数说明:
%row为随机数矩阵的行数
%col为随机数矩阵的列数
%seed为种子
%k1,k2为生成的随机数落在的范围,k1=0,k2=1表示生成的随机数为0到1之间的数
function randmtx=randU2(row,col,seed,k1,k2)
 if nargin < 3
   seed=11;
 end
m=4;
seed2=sqrt(seed);
while seed2<1
    seed2=seed2*10;
end
n=round(seed2/m);
x=(10^n)*seed2;
randmtx(1,1)=x-round(x);
for i=2:row*col
    temp=sqrt(abs(randmtx(1,i-1)));
    while temp<1
       temp=temp*10;
    end
    n=round(temp/m);
    x=(10^n)*temp;
    randmtx(1,i)=(x-round(x))+0.5;
end
randmtx=reshape(randmtx,row,col);
if nargin<4
    return
end
randmtx=randmtx*(k2-k1)+k1;

    