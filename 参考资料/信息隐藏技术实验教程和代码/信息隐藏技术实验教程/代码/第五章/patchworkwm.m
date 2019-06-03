%�ļ���:patchworkwm.m
%����Ա:����
%��дʱ��:2004.2.26
%��������:����������ɶ�ͼ�����patchworkˮӡ
%�����ʽ����:result=patchworkwm('c:\lenna.jpg','c:\test.png',1983,1121,421,2)
%             result=patchworkwm('c:\lenna.jpg','c:\test.png',1983,1121,421)
%����˵��:
%originalΪԭʼͼ��
%goalfileΪ����Ľ��
%key1,key2,key3Ϊ������Կ
%scaleΪʵ����ʹ�õĵ������ȶ���,Ĭ��Ϊ1
%resultΪ����ˮӡ��Ľ��
function result=patchworkwm(original,goalfile,key1,key2,key3,scale)
%Ĭ�ϵĶ����ȵĵ���Ϊ1��
if nargin==5
    ascale=1;
else 
    ascale=scale;
end
%��ȡͼ����Ϣ,����ȡ���ȷ���
image=imread(original);
image=double(image)/256;
YUV=rgb2ycbcr(image);
bright=YUV(:,:,1);
%�����������ص�ĸ���
[m,n]=size(bright);
quantity=floor(m*n/8);
%����α����������,ȷ����Ϣ����λ
[row,col,j]=hashreplacement(bright,2*quantity,key1,key2,key3);
%��������
degree=ascale/128;
for i=1:quantity
    bright(row(i),col(i))=bright(row(i),col(i))+degree;
    bright(row(2*i),col(2*i))=bright(row(2*i),col(2*i))-degree;
end
%�ع�ͼ��д�ر���,����ʹ��png��ʽ
YUV(:,:,1)=bright;
result=ycbcr2rgb(YUV);
imwrite(result,goalfile,'BitDepth',16);
subplot(121),imshow(image),title('ԭʼͼ��');
subplot(122),imshow(result),title(['ȡ�����߶�Ϊ',int2str(ascale),'��Ƕ��patchworkˮӡ��Ч��']);
