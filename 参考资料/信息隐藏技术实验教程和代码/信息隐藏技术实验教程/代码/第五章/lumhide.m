%�ļ���:lumhide.m
%����Ա:����
%��дʱ��:2004.2.25
%��������:��������������ȿռ��µ���Ϣ����.
%�����ʽ����:[result,count]=lumhide('c:\lenna.jpg','c:\secret.txt','c:\test.png',1983,2)
%             [result,count]=lumhide('c:\lenna.jpg','c:\secret.txt','c:\test.png',1983)
%����˵��:
%coverΪ����ͼ��
%msgΪ������Ϣ
%goalfileΪ����Ľ��
%keyΪ������Կ
%scaleΪʵ����ʹ�õĵ������ȶ���,Ĭ��Ϊ1
%resultΪ���ؽ��
%countΪ���ص���Ϣ��
function [result,count]=lumhide(cover,msg,goalfile,key,scale)
%Ĭ�ϵĶ����ȵĵ���Ϊ1��
if nargin==4
    ascale=1;
else 
    ascale=scale;
end
%��λ��ȡ������Ϣ
frr=fopen(msg,'r');%�����ļ�ָ��
[msg,count]=fread(frr,'ubit1');%msgΪ��Ϣ��λ��ʾ��ʽ,countΪ��Ϣ��bit��
fclose(frr);
%��ȡ����ͼ����Ϣ,����ȡ���ȷ���
image=imread(cover);
image=double(image)/256;
YUV=rgb2ycbcr(image);
bright=YUV(:,:,1);
%����α����������,ȷ����Ϣ����λ
[row,col]=randinterval(bright,count,key);
%�������Ƚ�������
degree=ascale/128;
for i=1:count
    if msg(i,1)==0
        bright(row(i),col(i))=bright(row(i),col(i))-degree;
    else
        bright(row(i),col(i))=bright(row(i),col(i))+degree;
    end
end
%�ع�ͼ��д�ر���,����ʹ��png��ʽ
YUV(:,:,1)=bright;
result=ycbcr2rgb(YUV);
imwrite(result,goalfile,'BitDepth',16);
subplot(121),imshow(image),title('ԭʼͼ��');
subplot(122),imshow(result),title(['ȡ�����߶�Ϊ',int2str(ascale),'�µ���Ϣ',int2str(count),'bits����Ч��']);
