%文件名:hashreplacement.m
%程序员:郭迟
%编写时间:2004.2.23
%函数功能:本函数将利用MD5函数产生随机的无碰撞的像素选择策略.
%输入格式举例:[row,col,j]=hashreplacement(test,60,1983,421,1121)
%参数说明:
%matrix为载体矩阵
%quantity为要嵌入的信息的数量(要选择的像素数量)
%key1,key2,key3为三个密钥
%row为伪随机输出的像素行标
%col为伪随机输出的像素列标
function [row,col,j]=hashreplacement(matrix,quantity,key1,key2,key3)
%记录载体矩阵大小
[X,Y]=size(matrix);
%初始化row和col
row=zeros([1,quantity]);
col=zeros([1,quantity]);
j=zeros([1,quantity]);
for i=1:quantity
    v=round(i/X);
    u=mod(i,X);
    v=mod(v+md52num(md5(u+key1)),Y);
    u=mod(u+md52num(md5(v+key2)),X);
    v=mod(v+md52num(md5(u+key3)),Y);
    j(i)=v*X+u+1;
    col(i)=mod(j(i),Y);
    row(i)=j(i)/Y;
    row(i)=floor(row(i))+1;
    if col(i)==0
       col(i)=Y;
       row(i)=row(i)-1;
    end
end


