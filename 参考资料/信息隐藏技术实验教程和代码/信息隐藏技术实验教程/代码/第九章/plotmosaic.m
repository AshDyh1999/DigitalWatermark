%文件名：plotmosaic.m
%程序员：李鹏
%编写时间：2004.3.28
%函数功能：本函数用于绘制加有水印的图像做马塞克处后，检测相关性值的曲线
%输入格式举例：plotmosaic('test.png',40,'lenna.jpg',10,'db6',2,0.1,0.99);
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
function plotmasaic(test,x,original,seed,wavelet,level,alpha,ratio)
quality=2:2:x;
corr_coef=zeros(max(size(quality)),1);
count=0;
for q=quality
      count=count+1;
      image_opd=mosaic16(test,q);
     [corr_coef(count),corr_DCTcoef(count)]=wavedetect('temp2.png',original,seed,wavelet,level,alpha,ratio);
end
plot(quality,abs(corr_DCTcoef));
xlabel('模板尺寸');
ylabel('相关性值');
