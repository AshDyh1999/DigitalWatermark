%文件名:lummask.m
%程序员:郭迟
%编写时间:2004.4.2
%函数功能:本函数将完成Watson模型下图像亮度阈值的计算
%输入格式举例:lumthreshold=lummask('c:\lenna.jpg')
%参数说明:
%image为输入图像
%lumthreshold为输出矩阵
function lumthreshold=lummask(image);
%读取图像转亮度
i=imread(image);
i=double(i);
i=rgb2gray(i);
%分块DCT变换
T=dctmtx(8);
DCTcoef=blkproc(i,[8 8],'P1*x*P2',T,T');
%计算平均DC系数
[m,n]=size(DCTcoef);
meandc=0;
count=0;
for i=0:ceil(m/8-1)
    for j=0:ceil(n/8-1)
        meandc=meandc+DCTcoef(8*i+1,8*j+1);
        count=count+1;
    end
end
meandc=meandc/count;
%计算亮度掩蔽
fun=@blocklum;%调用子函数
lumthreshold=blkproc(DCTcoef,[8 8],fun,meandc);
%------------------------------------------------------
function result=blocklum(matrix,meandc);
%敏感表
t=[1.40	1.01	1.16	1.66	2.40	3.43	4.79	6.56
1.01	1.45	1.32	1.52	2.00	2.71	3.67	4.93
1.16	1.32	2.24	2.59	2.98	3.64	4.60	5.88
1.16	1.52	2.59	3.77	4.55	5.30	6.28	7.60
2.40	2.00	2.98	4.55	6.15	7.46	8.71	10.17
3.43	2.71	3.64	5.30	7.46	9.62	11.58	13.51
4.79	3.67	4.60	6.28	8.71	11.58	14.50	17.29
6.56	4.93	5.88	7.60	10.17	13.51	17.29	21.15];
%计算
for i=1:8;
    for j=1:8
        result(i,j)=t(i,j)*(matrix(1,1)/meandc)^0.649;
    end
end


        
