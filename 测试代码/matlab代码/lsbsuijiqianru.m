%LSB随机替换嵌入算法-2016年6月26
%输入：载体图像C、密钥k、秘密消息M
%输出：载密图像C_M、C_C
%输入输出格式：   [C_M,C_C,L]=lsbRhide('Lena.bmp','message.txt',100)
%步骤
%1、读取图像、并且对载密图形赋空间C_M
%2、读取秘密消息文本并转化为二进制，并保存到向量M中，记录二进制长度L
%3、利用randinterval函数找到嵌入位置[row col]=randinterval(C,L,K)
%4、将二进制嵌入到相应指定的嵌入位置
%      具体方法为 i=1:L
%      C_M(row(i),col(i))=C1(row(i),col(i))-mod(C1(row(i),col(i)),2)+M1(i,1)
%5、查看LSB平面分布情况
%6、画图展示结果

function [C_M,C_C,L]=lsbsuijiqianru(C,M,k)
C1=imread(C);
C_M=C1;
C_C=C1;

%读取秘密消息文件
fileID=fopen(M,'r');
[M1,L]=fread(fileID,'ubit1');

%利用randinterval函数找到嵌入位置
[row,col]=suijishu(C,L,k);

%将二进制嵌入到相应指定的嵌入位置
for i=1:L
    C_M(row(i),col(i))=C1(row(i),col(i))-mod(C1(row(i),col(i)),2)+M1(i,1);
end

%查看LSB平面分布情况
[m,n]=size(C1);
for i=1:m
    for j=1:n
        C_C(i,j)=C_M(i,j)-C1(i,j);
   end
end

% %保存载密图像
imwrite(C_M,'lsbshuijiqianru.bmp','bmp');
imshow('lsbshuijiqianru.bmp');
% %画图展示结果
  % subplot(1,2,1);imshow(C_M);title('载密图像','FontSize',20);
  % subplot(1,2,2);imshow(mat2gray(C_C));title('LSB平面分布情况','FontSize',20);
%
