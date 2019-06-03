%文件名:lumextract.m
%程序员:郭迟
%编写时间:2004.2.25
%函数功能:本函数将完成亮度空间下的隐秘信息的提取.
%输入格式举例:result=lumextract('c:\lenna.jpg','c:\test.png','c:\extract.txt',128,1983)
%参数说明:
%cover为原始载体图像
%stegocover为隐藏有信息的秘密消息
%goalfile为信息提取后保存的地址
%key1为秘密信息的bit数,作为一个密钥参与计算
%key2为提取密钥
%result为提取的信息
function result=lumextract(cover,stegocover,goalfile,key1,key2)
%读取原始载体图像信息,并提取亮度分量
originalimage=imread(cover);
originalimage=double(originalimage)/255;
originalYUV=rgb2ycbcr(originalimage);
originalbright=originalYUV(:,:,1);
%读取隐秘载体图像信息,并提取亮度分量.该载体应为16位存储方式的图像,建议使用png格式
stegoimage= imread(stegocover);
stegoimage=double(stegoimage)/65535;
stegoYUV=rgb2ycbcr(stegoimage);
stegobright=stegoYUV(:,:,1);
%调用伪随机间隔函数,确定信息隐藏位
[row,col]=randinterval(stegobright,key1,key2);
%准备提取并回写信息
frr=fopen(goalfile,'a');%定义文件指针
for i=1:key1
    if  originalbright(row(i),col(i))>stegobright(row(i),col(i))
        fwrite(frr,0,'bit1');%回写0
        result(i,1)=0;    
    else
        fwrite(frr,1,'bit1');%回写1
        result(i,1)=1;
    end
end
fclose(frr);

    