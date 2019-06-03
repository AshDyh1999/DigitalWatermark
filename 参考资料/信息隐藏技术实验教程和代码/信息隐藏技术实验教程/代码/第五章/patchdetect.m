%�ļ���:patchdetect.m
%����Ա:����
%��дʱ��:2004.2.26
%��������:����������ɶ�ͼ�����patchworkˮӡ
%�����ʽ����:result=patchdetect('c:\test.png',1983,1121,421,0.001);
%����˵��:
%testΪ�����ͼ��
%key1,key2,key3Ϊ������Կ
%thresholdΪ�ж���ֵ
%resultΪ���Ľ��
function [result,cmpvalue]=patchdetect(test,key1,key2,key3,threshold);
%��ȡ��������ͼ����Ϣ,����ȡ���ȷ���.������ӦΪ16λ�洢��ʽ��ͼ��,����ʹ��png��ʽ
image= imread(test);
image=double(image)/65535;
YUV=rgb2ycbcr(image);
bright=YUV(:,:,1);
%���������ص�ĸ���
[m,n]=size(bright);
quantity=floor(m*n/8);
%����α����������,ȷ����Ϣ����λ
[row,col]=hashreplacement(bright,2*quantity,key1,key2,key3);
%��sumֵ
sum=0;
for i=1:quantity
    sum=sum+bright(row(i),col(i))-bright(row(2*i),col(2*i));
end
%����ֵ���бȽ�
cmpvalue=abs(sum/quantity)-1/128;
if cmpvalue>threshold 
    result=1;
    disp('ͼ����ˮӡ�ź�');
else
    result=0;
    disp('ͼ�񲻺���ˮӡ�ź�');
end
