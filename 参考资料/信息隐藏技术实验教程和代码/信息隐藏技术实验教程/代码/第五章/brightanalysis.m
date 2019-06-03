%文件名:brightanalysis.m
%程序员:郭迟
%编写时间:2004.2.25
%函数功能:本函数是一个分析函数,用以分析图像像素亮度的变化.
%输入格式举例:result=brightanalysis('c:\lenna.jpg',-3,0.5);
%             result=brightanalysis('c:\lenna.jpg',-3);
%参数说明:
%image为待分析的原始图像
%degree为要求增减的亮度度数
%percent为要求处理的像素占全部像素的百分比
%resul为处理结果
function result=brightanalysis(image,degree,percent)
%将图像转换为YUV颜色空间,提取亮度分量值
a=imread(image);
a=double(a)/255;
YUV=rgb2ycbcr(a);
bright=YUV(:,:,1);
%如果要求有比例则调用随机置换选择函数进行按比例随机选择像素点,否则为全部像素点
if nargin==3
    [row,col]=size(bright);
    selectquan=row*col*percent;
    %随机选取像素
    %hashreplacemen函数的三个种子固定为row,col,selectquan,仅仅是为了减少输入参数的个数
    [row,col]=hashreplacement(bright,selectquan,row,col,selectquan);
    for i=1:selectquan
        bright(row(i),col(i))=bright(row(i),col(i))+degree/128;%取1/128为亮度的1度
    end    
%未输入percent则对图像全体进行亮度处理    
else
    percent=1;
    bright=bright+degree/128;
end
%转换为RGB模型显示处理效果
YUV(:,:,1)=bright;
result=ycbcr2rgb(YUV);
subplot(121),imshow(a),title('原始图像');
subplot(122),imshow(result),title(['随机调整',int2str(percent*100),'%像素点亮度(',int2str(degree),')后的图像']);

 