image=imread('C:\Users\Administrator\Desktop\�½�λͼͼ��.bmp');
mysize=size(image);
if numel(mysize)>2
    imagegoal='C:\\Users\\Administrator\\Desktop\\DCT.bmp';
    msg='C:\\Users\\Administrator\\Desktop\\DCT.txt';
    disp '��ͼƬ�ǲ�ɫͼƬ,ˮӡǶ�������DCT�任�㷨';
    key=153; 
    alpha=1;
    [count,msg,result] = hidedctadv(image,imagegoal,msg,key,alpha); 
    count=16;
    subplot(111);
    imshow(result);
    title('��д��');
else
    LSBqianru(image);
end
