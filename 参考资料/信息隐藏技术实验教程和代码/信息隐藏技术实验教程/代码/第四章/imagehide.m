%文件名：imagehide.m
%程序员：王霞仙
%编写时间：2004.2.5
%函数功能：直接将秘密图像的高4bit隐藏在RGB载体图像的R、G、B层中所选的那一层的低4bit,并将秘密图像提取出来，最后显示。要求载体图像的大小大于等于秘密图像的大小。且秘密图像是二值或灰度图像。
%输入格式：
%data=imagehide('c:\Lenna.bmp','c:\woman.bmp','c:\mix.bmp','bmp',3)
%参数说明：
% cover是载体图像的地址
% massage是秘密图像的地址
% goleimage是隐藏后图像的地址
% pemission是图像的类型
%level是作为的载体的具体层。R为1，G为2，B为3。
%data是隐藏后图像的矩阵
function data=imagehide(cover,massage,goleimage,permission,level)
%提取图像信息并分层
cover = imread(cover,permission);
data=cover;
msg=imread(massage,permission);
[row,col]=size(cover);
cover1=cover(:,:,level);
%置载体图像R层的低4bit为0
for i=1:row
    for j=1:col/3
       cover1(i,j)=bitand(cover1(i,j),240);
    end
end
%置秘密图像的低4bit为0
takemsg4=bitand(msg,240);
%将秘密图像的高4bit右移4位
shiftmsg4=bitshift(takemsg4,-4);
%图像隐藏
for i=1:row
    for j=1:col/3
        cover1(i,j)=bitor(cover1(i,j),shiftmsg4(i,j));
    end
end
%写回并保存
data(:,:,level)=cover1;
imwrite(data,goleimage,permission);
%提取秘密图像信息,检测隐藏效果
data=imread(goleimage,permission);
[row,col]=size(data);
A=data(:,:,level);
for i=1:row
    for j=1:col/3
       A(i,j)=bitand(A(i,j),15);
    end
end
A=bitshift(A,4);
%显示结果
subplot(221),imshow(cover);title('载体图像');
subplot(222),imshow(massage);title('秘密图像');
subplot(223),imshow(data);title('隐藏后的图像');
subplot(224),imshow(A);title('提取的秘密图像');
