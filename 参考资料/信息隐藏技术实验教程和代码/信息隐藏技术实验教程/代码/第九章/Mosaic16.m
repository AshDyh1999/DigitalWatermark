%�ļ�����mosaic16.m
%����Ա������
%��дʱ�䣺2004.3.20
%�������ܣ����������ڶ�ͼ���������˴���
%�����ʽ������image_opd=mosaic16('test.png',3);
%����˵����
%imageΪ������ͼ��
%xΪ����ͼ��ģ��Ĵ�С
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
imwrite(image_opd,'temp2.png','BitDepth',16);%��png��ʽ�洢
