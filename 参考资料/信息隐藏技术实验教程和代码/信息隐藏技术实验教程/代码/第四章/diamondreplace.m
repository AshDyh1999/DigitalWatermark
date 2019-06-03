%文件名:diamondreplace.m
%程序员:王霞仙
%编写时间:2004.3.1
%函数功能:本函数将完成对输入的图像信号按菱型置换策略进行置乱.
%输入格式举例:result=diamondreplace(secretimage,1983)
%参数说明:
%matrix为输入图像矩阵
%key为控制密钥
%result为置乱后的结果
function result=diamondreplace(matrix,key)
%分析原图像尺寸并补遗
[m,n]=size(matrix);
rowadd=32-mod(m,32);
coladd=32-mod(n,32);
if rowadd==32 
    rowadd=0;
end
if coladd==32
    coladd=0;
end
input=uint8(zeros([m+rowadd n+coladd]));
input(1:m,1:n)=matrix;
rand('seed',key);
control=randint(1,1,[200 255]);
%查表置乱
fun=@replace32fun;%调用子函数
result=blkproc(input,[32 32],fun);
result=bitxor(result,control(1,1));
