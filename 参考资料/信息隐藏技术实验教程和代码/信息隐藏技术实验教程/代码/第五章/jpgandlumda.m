%文件名:jpgandlumda.m
%程序员:郭迟
%编写时间:2004.3.10
%函数功能:本函数将探讨二值图像在JPEG条件下像素改变的状况.
%输入格式举例:jpgandlumda('c:\blenna.jpg')
%参数说明:
%test为二值图像
function jpgandlumda(test)
image=imread(test);
image=round(double(image)/255);
[M,N]=size(image);
quality=5:5:100;%定义压缩质量比从5%到100%
result=zeros([1 max(size(quality))]);
count=0;
different=0;
for q=quality
    count=count+1;
    imwrite(image,'temp.jpg','jpg','quality',q);%利用imwrite函数完成压缩
    comdone=imread('temp.jpg');
    comdone=round(double(comdone)/255);
    for i=1:M
        for j=1:N
            if comdone(i,j)~=image(i,j)
                different=different+1;
            end
        end
    end
result(1,count)=different/(M*N);
different=0;
end
plot(quality,result);
xlabel('jpeg压缩率');
ylabel('像素改变的百分比例');
title('二值图像在JPEG条件下像素改变的状况')