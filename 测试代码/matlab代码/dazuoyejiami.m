image=imread('C:\Users\Administrator\Desktop\新建位图图像.bmp');
mysize=size(image);
if numel(mysize)>2
    imagegoal='C:\\Users\\Administrator\\Desktop\\DCT.bmp';
    msg='C:\\Users\\Administrator\\Desktop\\DCT.txt';
    disp '该图片是彩色图片,水印嵌入采用了DCT变换算法';
    key=153; 
    alpha=1;
    [count,msg,result] = hidedctadv(image,imagegoal,msg,key,alpha); 
    count=16;
    subplot(111);
    imshow(result);
    title('隐写后');
else
    LSBqianru(image);
end
