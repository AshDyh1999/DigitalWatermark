%文件名:watsonthreshold.m
%程序员:郭迟
%编写时间:2004.4.2
%函数功能:本函数将完成Watson模型下图像对比阈值的计算
%输入格式举例:threshold=watsonthreshold('c:\lenna.jpg')
%参数说明:
%image为输入图像
%threshold为输出矩阵
function threshold=watsonthreshold(image)
%读取图像转亮度
i=imread(image);
i=double(i);
i=rgb2gray(i);
%分块DCT变换
T=dctmtx(8);
DCTcoef=blkproc(i,[8 8],'P1*x*P2',T,T');
%调用函数计算亮度阈值
lumthreshold=lummask(image);
%计算W(ij)的修正值
[m,n]=size(DCTcoef);
for i=1:m
    for j=1:n
        another(i,j)=(abs(DCTcoef(i,j))^0.7)*(lumthreshold(i,j)^0.3);
    end
end
%计算对比阈值
threshold=zeros([m n]);
for i=1:m
    for j=1:n
        if lumthreshold(i,j)<=another(i,j)
            threshold(i,j)=another(i,j);
        else
            threshold(i,j)=lumthreshold(i,j);
        end
    end
end
