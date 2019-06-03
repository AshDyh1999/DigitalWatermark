%文件名:lumhide.m
%程序员:郭迟
%编写时间:2004.2.25
%函数功能:本函数将完成亮度空间下的信息隐秘.
%输入格式举例:[result,count]=lumhide('c:\lenna.jpg','c:\secret.txt','c:\test.png',1983,2)
%             [result,count]=lumhide('c:\lenna.jpg','c:\secret.txt','c:\test.png',1983)
%参数说明:
%cover为载体图像
%msg为秘密消息
%goalfile为保存的结果
%key为隐藏密钥
%scale为实验中使用的调整亮度度数,默认为1
%result为隐藏结果
%count为隐藏的信息数
function [result,count]=lumhide(cover,msg,goalfile,key,scale)
%默认的对亮度的调整为1度
if nargin==4
    ascale=1;
else 
    ascale=scale;
end
%按位读取秘密信息
frr=fopen(msg,'r');%定义文件指针
[msg,count]=fread(frr,'ubit1');%msg为消息的位表示形式,count为消息的bit数
fclose(frr);
%读取载体图像信息,并提取亮度分量
image=imread(cover);
image=double(image)/256;
YUV=rgb2ycbcr(image);
bright=YUV(:,:,1);
%调用伪随机间隔函数,确定信息隐藏位
[row,col]=randinterval(bright,count,key);
%调整亮度进行隐藏
degree=ascale/128;
for i=1:count
    if msg(i,1)==0
        bright(row(i),col(i))=bright(row(i),col(i))-degree;
    else
        bright(row(i),col(i))=bright(row(i),col(i))+degree;
    end
end
%重构图像并写回保存,建议使用png格式
YUV(:,:,1)=bright;
result=ycbcr2rgb(YUV);
imwrite(result,goalfile,'BitDepth',16);
subplot(121),imshow(image),title('原始图像');
subplot(122),imshow(result),title(['取操作尺度为',int2str(ascale),'下的信息',int2str(count),'bits隐秘效果']);
