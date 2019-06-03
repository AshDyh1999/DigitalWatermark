%LSB随机替换提取--2016年6月27日
%输入：载密图像C_M、密钥k、嵌入消息长度L
%输出：秘密消息S
%输入输出格式： S=lsbRget('Lena_R.bmp',L,100)
%步骤：
%1、读取图像内容
%2、获取嵌入位置 row、col
%3、将嵌入位置消息存放到S中
%4、将二进制化为ASCII码
%5、打开文件，将消息S写入secret文件中
%---------------------------------
% C_M='Lena_R.bmp';
% L=12288;
% k=100;
%------------------------------------

function S=lsbsuijitiqu(C_M,L,k)
%读取图像矩阵
C_M1=imread(C_M);

%获取嵌入位置row、col
[row,col]=suijishu(C_M,L,k);

%将嵌入位置消息存放到S中
S=zeros(1,L);
for i=1:L
     S(1,i)=mod(C_M1(row(i),col(i)),2);
end

%将二进制化为ASCII码值
SC=zeros(1,L);
a=L/8;
for i=1:a
     for j=1:8
          SC(1,i)=SC(1,i)+S(1,(i-1)*8+j)*power(2,(j-1));
    end
end

 %打开文件，将消息写入secret.txt文件中
fileID=fopen('secret1.txt','w');
for i=1:a
     fwrite(fileID,SC(1,i),'char');
end
fclose(fileID);