%文件名:patchworkwm.m
%程序员:郭迟
%编写时间:2004.2.26
%函数功能:本函数将完成对图像加入patchwork水印
%输入格式举例:result=patchworkwm('c:\lenna.jpg','c:\test.png',1983,1121,421,2)
%             result=patchworkwm('c:\lenna.jpg','c:\test.png',1983,1121,421)
%参数说明:
%original为原始图像
%goalfile为保存的结果
%key1,key2,key3为序列密钥
%scale为实验中使用的调整亮度度数,默认为1
%result为加入水印后的结果
function result=patchworkwm(original,goalfile,key1,key2,key3,scale)
%默认的对亮度的调整为1度
if nargin==5
    ascale=1;
else 
    ascale=scale;
end
%读取图像信息,并提取亮度分量
image=imread(original);
image=double(image)/256;
YUV=rgb2ycbcr(image);
bright=YUV(:,:,1);
%定义两组像素点的个数
[m,n]=size(bright);
quantity=floor(m*n/8);
%调用伪随机间隔函数,确定信息隐藏位
[row,col,j]=hashreplacement(bright,2*quantity,key1,key2,key3);
%调整亮度
degree=ascale/128;
for i=1:quantity
    bright(row(i),col(i))=bright(row(i),col(i))+degree;
    bright(row(2*i),col(2*i))=bright(row(2*i),col(2*i))-degree;
end
%重构图像并写回保存,建议使用png格式
YUV(:,:,1)=bright;
result=ycbcr2rgb(YUV);
imwrite(result,goalfile,'BitDepth',16);
subplot(121),imshow(image),title('原始图像');
subplot(122),imshow(result),title(['取操作尺度为',int2str(ascale),'下嵌入patchwork水印的效果']);
