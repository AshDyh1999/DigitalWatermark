%�ļ���:imagecbe.m
%����Ա:����
%��дʱ��:2004.1.24
%��������:����������ɶ����������RGBͼ����С�������ķ�������ͼ���ں�.Ҫ���һ��ͼ��Ĵ�С���ڵ��ڵڶ���ͼ��.
%�����ʽ����:cbeimage=imagecbe('c:\lenna.jpg','c:\cindy.jpg','jpg','db6')
%����˵��:
%image1Ϊ��һ��ͼ���ַ
%image2Ϊ�ڶ���ͼ���ַ
%permissionΪͼ����ļ�����
%waveletΪʹ�õ�С������
%cbeimage Ϊ�ںϵ�ͼ��

function cbeimage=imagecbe(image1,image2,permission,wavelet);
%��ȡ�������ںϵ�ͼ��
im1=imread(image1,permission);
im2=imread(image2,permission);
im1=double(im1)/255;
im2=double(im2)/255;
[row1,col1]=size(im1);
[row2,col2]=size(im2);
a=reshape(im1,row1,col1);
b=reshape(im2,row2,col2);
%��ͼ�����һ�߶��µ�С���ֽ�,��ȡƵ��ϵ��
[C1,S1]=wavedec2(a,1,wavelet);
[C2,S2]=wavedec2(b,1,wavelet);
size1=size(C1);
size2=size(C2);
%��ͼ�����ϵ������
for i=1:size1(2)
    C1(i)=1.2*C1(i);
end
for i=1:size2(2)
    C2(i)=0.8*C2(i);
end
%��ͼ������ں�
C=0.5*(C1+C2);
%��ͼ������ع�
cbeimage=waverec2(C,S1,wavelet);
cbeimage=reshape(cbeimage,row1,col1/3,3);
cbeimage=uint8(cbeimage*255);
%��ʾ���
subplot(221),imshow(im1);title('��һ��ͼ��');
subplot(222),imshow(im2);title('�ڶ���ͼ��');
subplot(223),imshow(cbeimage);title('�ں�ͼ��');
