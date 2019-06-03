%�ļ���:brightanalysis.m
%����Ա:����
%��дʱ��:2004.2.25
%��������:��������һ����������,���Է���ͼ���������ȵı仯.
%�����ʽ����:result=brightanalysis('c:\lenna.jpg',-3,0.5);
%             result=brightanalysis('c:\lenna.jpg',-3);
%����˵��:
%imageΪ��������ԭʼͼ��
%degreeΪҪ�����������ȶ���
%percentΪҪ���������ռȫ�����صİٷֱ�
%resulΪ������
function result=brightanalysis(image,degree,percent)
%��ͼ��ת��ΪYUV��ɫ�ռ�,��ȡ���ȷ���ֵ
a=imread(image);
a=double(a)/255;
YUV=rgb2ycbcr(a);
bright=YUV(:,:,1);
%���Ҫ���б������������û�ѡ�������а��������ѡ�����ص�,����Ϊȫ�����ص�
if nargin==3
    [row,col]=size(bright);
    selectquan=row*col*percent;
    %���ѡȡ����
    %hashreplacemen�������������ӹ̶�Ϊrow,col,selectquan,������Ϊ�˼�����������ĸ���
    [row,col]=hashreplacement(bright,selectquan,row,col,selectquan);
    for i=1:selectquan
        bright(row(i),col(i))=bright(row(i),col(i))+degree/128;%ȡ1/128Ϊ���ȵ�1��
    end    
%δ����percent���ͼ��ȫ��������ȴ���    
else
    percent=1;
    bright=bright+degree/128;
end
%ת��ΪRGBģ����ʾ����Ч��
YUV(:,:,1)=bright;
result=ycbcr2rgb(YUV);
subplot(121),imshow(a),title('ԭʼͼ��');
subplot(122),imshow(result),title(['�������',int2str(percent*100),'%���ص�����(',int2str(degree),')���ͼ��']);

 