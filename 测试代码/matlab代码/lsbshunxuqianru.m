% LSB顺序替换嵌入算法--2016年6月24日
% 输入：载体C、秘密消息M。
% 输出：载密图像C_M、位平面C_C
% 1、将秘密消息M转化为二进制M1；
% 2、将转化为二进制的秘密消息M1嵌入到载体图像的LSB平面
%3、将载密图像C_M减去载体图像C，查看嵌入信息情况
% ---------------------------------------------------
% 函数功能介绍：实现LSB顺序替换嵌入
% 使用示例:function      [C_M,C_C,L]=lsbshide('Lena.bmp','message.txt');
%输入输入参数介绍：
%C：载体图像
%M：秘密消息
%C_M：载密图像
%C_C:lsb平面

function [C_M,C_C,L]=lsbshunxuqianru(C,M)
C=imread(C);%读取图像并存放到C中
C_M=C;
fileID=fopen(M,'r');%打开文件
[M,L]=fread(fileID,'ubit1');%读取文件的内容，并以二进制方式存放到向量M中

%将二进制的秘密消息M嵌入到载密图像的LSB面
[m,n]=size(C);
p=1;%嵌入计数器
for i=1:m
    for j=1:n
        C_M(i,j)=C(i,j)-mod(C(i,j),2)+M(p,1);%嵌入方法是先将LSB置零，然后加上秘密消息中的对应的0或1
        if L==p   %嵌入终止条件：当嵌入的个数为秘密消息的长度时，跳出循环，不再嵌入
         break;
        end
       p=p+1;
 end
 if L==p    %嵌入终止条件：当嵌入的个数为秘密消息的长度时，跳出循环，不再嵌入
    break;
 end
end

imwrite(C_M,'lsbshunxuqianru.bmp','bmp');
imshow('lsbshunxuqianru.bmp');
 %查看嵌入信息情况：将载密图像减去载体图像
for i=1:m
    for j=1:n
        C_C(i,j)=C_M(i,j)-C(i,j);
   end
 end

