%�ļ�����sharpS.m
%���ߣ�����  �人��ѧ
%����ʱ�䣺2004.3.26
%�������ܣ���ͼ������������
%����˵�����������ķ��������˲������á�sobel������
%���þ����� image_opd=sharpS('lenna.jpg','1.jpg');
%����˵����
%image   �����񻯵ĵ�ͼ��
%imagegoal   �񻯺��ͼ��
function image_opd=sharpS(image,imagegoal)
A=imread(image);
[row,col]=size(A);
A=double(A)/255;original=A;
B=reshape(A,row,col);
h=fspecial('sobel');
C=filter2(h,B);
col=col/3;
image_opd=reshape(C,row,col,3);
imwrite( image_opd,imagegoal);
