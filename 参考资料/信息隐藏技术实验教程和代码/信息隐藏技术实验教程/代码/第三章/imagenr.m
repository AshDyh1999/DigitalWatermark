%�ļ���:imagenr.m
%����Ա:����
%��дʱ��:2004.1.24
%��������:����������ɶ������RGBͼ����С�������ķ��������Զ�����,�õ���Ƶϵ����ֵ,����Ч���ٷֱȺͽ��
%�����ʽ����:[comimage,perf0,perf1,thr]=imagenr('c:\lenna.jpg','c:\lenna2.jpg','jpg','db6',2)
%����˵��:
%imageΪ����ĺ�������RGBͼ���ַ
%permissionΪͼ����ļ�����
%addrΪ������ͼ���ŵĵ�ַ
%waveletΪʹ�õ�С������
%levelΪ�ֽ�ĳ߶�
%comimage Ϊ�����Ľ��
%perf0Ϊ��Ƶϵ����0�İٷֱ�
%perf1Ϊ�����������ٷֱ�
%thrΪ��������ѡ�����ֵ
function [comimage,perf0,perf1,thr]=imagecom(image,addr,permission,wavelet,level);
signal=imread(image,permission);
[row,col]=size(signal);
signal2=double(signal)/255;
signal2=reshape(signal2,row,col);
%��ͼ�����С���ֽ�
[C,S]=wavedec2(signal2,level,wavelet);
%����������ֵ
[thr,sorh,keepapp]=ddencmp('den','wv',signal2);
%ѹ��
[comimage,cxc,lxc,perf0,perf1]=wdencmp('gbl',C,S,wavelet,level,thr,sorh,keepapp);
comimage=reshape(comimage,row,col/3,3);
imwrite(comimage,addr,permission);
%��ʾ���
subplot(221),imshow(image);title('��������ԭʼͼ��');
comimage=imread(addr,permission);
subplot(222),imshow(comimage);title('������ͼ��');
disp('��Ƶϵ����0�İٷֱ�:');perf0
disp('ѹ����������ٷֱ�:');perf1



