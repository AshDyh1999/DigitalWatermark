image=imread('C:\Users\Administrator\Desktop\����ˮӡ����ҵ\�ڰ׻��ɫͼƬ\LSB.bmp');
mysize=size(image);
if numel(mysize)>2
    disp '��ͼƬ�ǲ�ɫͼƬ,ˮӡǶ�������DCT�任�㷨'
    msg = 'C:\\Users\\Administrator\\Desktop\\DCTmiwen.txt' ;
    key = 153;
    count =16;
    result=extractdctadv(image,msg,key,count);
else
    LSBjiemi(image);
end