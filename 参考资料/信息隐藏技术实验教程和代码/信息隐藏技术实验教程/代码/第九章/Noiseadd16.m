%�ļ�����noiseadd16.m
%����Ա������
%��дʱ�䣺2004.3.25
%�������ܣ����������ڶ�16λͼ���gaussian����
%�����ʽ������ image_opd=noiseadd16('test.png',0,0.01);
%����˵�����������õ�matlab���Դ���imnoise�������������ӵ�����������gaussian����,
%          ���������Ĳ�����ͬ�����ﲻ�����٣�ͬѧ�ǿ����Լ��鿴imnoise����
%����˵����
%imageΪ������ͼ��
%MΪ��ֵ
%VΪ����
function image_opd=noiseadd16(image,M,V)
A=imread(image);
original=A;
[row,col]=size(A);
A=double(A)/65535;
B=imnoise(A,'gaussian',M,V);
col=col/3;
image_opd=reshape(B,row,col,3);
imwrite(image_opd,'temp2.png','BitDepth',16);


