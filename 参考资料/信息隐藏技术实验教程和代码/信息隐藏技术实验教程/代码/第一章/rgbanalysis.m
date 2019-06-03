%�ļ���:rgbanalysis.m
%����Ա:����
%��дʱ��:2004.2.8
%��������:�������RGBͼ��ֲ㣬����ͼ���ָ�����ǿ
%�����ʽ����:[imageRGB,imageR,imageG,imageB,result]=rgbanalysis('c:\lenna.jpg','jpg',1)
%����˵��:
%image�����ԭʼRGBͼ��ĵ�ַ
%permissionΪͼ���ļ�����
%levelΪҪ��ǿ�Ĳ�:1ΪR,2ΪG,3ΪB
%imageRGBΪ�����RGBͼ���RGB����
%imageRΪR������ľ���
%imageGΪG������ľ���
%imageBΪB������ľ���
%resultΪɫ�ʼ�ǿ��RGB����
function  [imageRGB,imageR,imageG,imageB,result]=rgbanalysis(image,permission,level);
%��ȡͼ����Ϣ��ת��Ϊdouble��
imageRGB=imread(image,permission);
imageRGB=double(imageRGB)/255;
result=imageRGB;
%��ͼ����зֲ���ȡ
imageR=imageRGB(:,:,1);
imageG=imageRGB(:,:,2);
imageB=imageRGB(:,:,3);
%��ʾ���
subplot(321),imshow(imageRGB),title('ԭʼͼ��');
subplot(322),imshow(imageR),title('R��Ҷ�ͼ��');
subplot(323),imshow(imageG),title('G��Ҷ�ͼ��');
subplot(324),imshow(imageB),title('B��Ҷ�ͼ��');
%����Ӧ�Ĳ������ɫ��ǿ
if level==1
    imageR=imageR+0.2;
end
if level==2
    imageG=imageG+0.2;
end
if level==3
    imageB=imageB+0.2;
end
result(:,:,1)=imageR;
result(:,:,2)=imageG;
result(:,:,3)=imageB;
%ͨ��ͼ��д�ر��潫������Χ������ֵ�Զ�����Ϊ���
imwrite(result,'temp.jpg','jpg');
result=imread('temp.jpg','jpg');
%��ʾ���
subplot(325),imshow(result),title('ɫ����ǿ�Ľ��') ;
