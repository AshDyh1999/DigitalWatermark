%文件名：mosaic16.m
%程序员：李鹏
%编写时间：2004.3.20
%函数功能：本函数用于对图像做马塞克处理
%输入格式举例：image_opd=mosaic16('test.png',3);
%参数说明：
%image为待处理图像
%x为处理图像模板的大小
function image_opd=mosaic16(image,x);
A=imread(image);
[row,col]=size(A);
A=double(A)/65535;
original=A;
B=reshape(A,row,col);
r=x;
for i=1:r:row
   for j=1:r:col
       C(i:min(i+r-1,row),j:min(j+r-1,col))=mean2(B(i:min(i+r-1,row),j:min(j+r-1,col)));
   end
end
col=col/3;
image_opd=reshape(C,row,col,3);
imwrite(image_opd,'temp2.png','BitDepth',16);%以png格式存储
