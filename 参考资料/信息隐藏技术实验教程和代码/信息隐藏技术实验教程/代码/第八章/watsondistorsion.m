%文件名:watsondistorsion.m
%程序员:郭迟
%编写时间:2004.4.2
%函数功能:本函数将完成Watson模型下图像感知质量度量.
%输入格式举例:result=watsondistorsion('c:\lenna.jpg','c:\test.jpg')
%参数说明:
%original为原始图像
%test加有水印的图像
%result为两者误差估计
function result=watsondistorsion(original,test)
%读取图像转亮度
io=imread(original);
io=rgb2gray(io);
io=double(io);
iw=imread(test);
iw=rgb2gray(iw);
iw=double(iw);
%分块DCT变换求错误图像
T=dctmtx(8);
DCTcoefo=blkproc(io,[8 8],'P1*x*P2',T,T');
DCTcoefw=blkproc(iw,[8 8],'P1*x*P2',T,T');
e=DCTcoefw-DCTcoefo;
%求间隙
threshold=watsonthreshold(original);
%计算JND倍数
[m,n]=size(e);
d=zeros([m n]);
for i=1:m
    for j=1:n
        d(i,j)=e(i,j)/threshold(i,j);
    end
end
%误差合并
distortion=0;
for i=1:m
    for j=1:n
        d(i,j)=d(i,j)^4;
        distortion=distortion+d(i,j);
    end
end
result=sqrt(sqrt(distortion));
disp(['图像的感知误差为:',num2str(result)]);