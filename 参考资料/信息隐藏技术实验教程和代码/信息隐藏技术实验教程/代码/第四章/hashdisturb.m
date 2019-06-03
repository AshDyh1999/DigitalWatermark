%文件名:hashdisturb.m
%程序员:王霞仙
%编写时间:2004.3.2
%函数功能:本函数将完成对输入的图像信号按菱型置换策略进行置乱.
%输入格式举例:result=hashdisturb(secretimage,1,1983,421,1121)
%参数说明:
%matrix为输入图像矩阵
%key为控制密钥
%eord为1表示置乱变换,为0表示复原变换 
%result为置乱后的结果
function result=hashdisturb(matrix,eord,key1,key2,key3)
%分析原图像尺寸并补遗
[m,n]=size(matrix);
%调用随机置换函数
[row,col]=hashreplacement(matrix,m*n,key1,key2,key3);
%置乱函数
count=1;
if eord==1
    for i=1:m
        for j=1:n
            result(i,j)=matrix(row(count),col(count));
            count=count+1;
        end
    end
end
%复原函数
if eord==0
    for i=1:m
        for j=1:n
            result(row(count),col(count))=matrix(i,j);
            count=count+1;
        end
    end
end
