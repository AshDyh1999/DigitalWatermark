image=imread('C:\Users\Administrator\Desktop\数字水印大作业\黑白或彩色图片\LSB.bmp');
mysize=size(image);
if numel(mysize)>2
    disp '该图片是彩色图片,水印嵌入采用了DCT变换算法'
    msg = 'C:\\Users\\Administrator\\Desktop\\DCTmiwen.txt' ;
    key = 153;
    count =16;
    result=extractdctadv(image,msg,key,count);
else
    LSBjiemi(image);
end