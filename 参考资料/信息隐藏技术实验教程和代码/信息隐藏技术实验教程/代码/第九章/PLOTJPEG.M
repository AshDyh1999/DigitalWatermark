%文件名：plotjpeg.m
%程序员：李鹏
%编写时间：2004.3.29
%函数功能：本函数用于绘制加有水印的图像做JPEG压缩后，检测相关性值的曲线
%输入格式举例：plotjpeg('test.png','lenna.jpg',10,'db6',2,0.1,0.99);
%函数说明：
%横坐标表示模板的大小，纵坐标为相关性值
%参数说明：
%test为已经加入水印的待检测图像
function plotmedian(test,original,seed,wavelet,level,alpha,ratio)
data=imread(test);
data=double(data)/65535;
[M,N]=size(data);
quality=5:5:100;
corr_coef=zeros(max(size(quality)),1);
count=0;
for q=quality
    count=count+1;
    imwrite(data,'temp.jpg','jpg','quality',q);
    temp=imread('temp.jpg');
    temp=double(temp)/255;
    imwrite(temp,'temp2.png','BitDepth',16);
    [corr_coef(count),corr_DCTcoef(count)]=wavedetect('temp2.png',original,seed,wavelet,level,alpha,ratio);
end
plot(quality,abs(corr_DCTcoef));
xlabel('jpeg压缩率');
ylabel('相关性值');