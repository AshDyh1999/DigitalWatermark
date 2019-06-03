%文件名：plotmedian.m
%程序员：李鹏
%编写时间：2004.3.29
%函数功能：本函数用于绘制加有水印的图像做中值滤波处理后，检测相关性值的曲线
%输入格式举例：plotmedian('test.png',21,'lenna.jpg',10,'db6',2,0.1,0.99);
%函数说明：
%横坐标表示模板的大小，纵坐标为相关性值
%参数说明：
%test为已经加入水印的待检测图像
%x为处理图像模板的最大值
%original为输入原始图像
%seed为随机数种子
%wavelet为使用的小波函数
%level为小波分解的尺度
%alpha为水印强度
%ratio为算法中d/n的比例
function plotmedian(test,x,original,seed,wavelet,level,alpha,ratio)
quality=1:2:x;
corr_coef=zeros(max(size(quality)),1);
count=0;
for q=quality
      count=count+1;
      image_opd=median16(test,q);
[corr_coef(count),corr_DCTcoef(count)]=wavedetect('temp2.png',original,seed,wavelet,level,alpha,ratio);
end
plot(quality,abs(corr_DCTcoef));
xlabel('模板尺寸');
ylabel('相关性值');

