%文件名:lsbhide.m
%程序员:李巍
%编写时间:2004.2.29
%函数功能:本函数将完成在LSB上的顺序信息隐秘
%输入格式举例:[ste_cover,len_total]=lsbhide('lenna.bmp','msg.txt','d.bmp');
%参数说明:
%input是信息隐秘载体图像
%file是秘密消息文件
%output是信息隐秘后生成图像
%ste_cover是信息隐秘后图像矩阵 
%len_total是秘密消息的长度，即容量
function  [ste_cover,len_total]=lsbhide(input,file,output)
%读入图像矩阵
cover=imread(input);
ste_cover=cover;
ste_cover=double(ste_cover);
%将文本文件转换为二进制序列
f_id=fopen(file,'r');
[msg,len_total]=fread(f_id,'ubit1'); 

%判断嵌入消息量是否过大
[m,n]=size(ste_cover);
if len_total>m*n
    error('嵌入消息量过大，请更换图像');
end
%p作为消息嵌入位数计数器   
p=1; 
for f2=1:n
    for f1=1:m
        ste_cover(f1,f2)=ste_cover(f1,f2)-mod(ste_cover(f1,f2),2)+msg(p,1);
        if p==len_total
            break;
         end
         p=p+1;
     end
     if p==len_total
         break;
     end
 end
ste_cover=uint8(ste_cover);
imwrite(ste_cover,output);
%显示实验结果 
subplot(1,2,1);imshow(cover); title('  原始图像  ');
subplot(1,2,2);imshow(output);title('隐藏信息的图像');

