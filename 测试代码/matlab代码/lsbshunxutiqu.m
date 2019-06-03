%LSB顺序替换提取--2016年6月27
%输入：载密图像C_M，嵌入长度L
%输出：秘密消息向量S
%输入输出格式：S=lsbsget('Lena_S.bmp',L)
%步骤：
%1、读取载密图像C_M
%2、读出LSB平面中0、1存入S中
%3、将二进制向量S转化为ASCII码并存放到文本文件secret.txt中

function S=lsbshunxutiqu(C_M,L)
%读取载密图像矩阵
C_M1=imread(C_M);
[m,n]=size(C_M1);
S=zeros(1,L);
%读出LSB平面中0、1存入S中
for i=1:m
    for j=1:n
        if (i-1)*m+j>L%判断嵌入长度是否大于L，若大于L，则终止循环
            break;
        end
        S(1,(i-1)*m+j)=mod(C_M1(i,j),2);
    end
    if (i-1)*m+j>L%判断嵌入长度是否大于L，若大于L，则终止循环
         break;
    end
end

%将二进制向量S转化为ASCII码并存放到文本文件secret中
fileID=fopen('secret.txt','w');
a=L/8;%计算字符个数
SC=zeros(1,a);
for i=1:a
    b=0;
    for j=1:8
        b=b+S(1,(i-1)*8+j)*power(2,j-1);
    end
    SC(1,i)=b;
    fwrite(fileID,SC(1,i),'char');
end
fclose(fileID);

