%�ļ���:imagecom.m
%����Ա:����
%��дʱ��:2004.1.24
%��������:����������ɶ������RGBͼ����С�������ķ��������Զ�ѹ��.�õ�ѹ���ĸ�Ƶϵ����ֵ,ѹ����Ч���ٷֱȺ�ѹ���Ľ��
%�����ʽ����:[comimage,perf0,perf1,thr]=imagecom('c:\lenna.jpg','c:\lenna2.jpg','jpg','db6',2)
%����˵��:
%imageΪ�����RGBͼ���ַ
%permissionΪͼ����ļ�����
%addrΪѹ�����ͼ���ŵĵ�ַ
%waveletΪʹ�õ�С������
%levelΪ�ֽ�ĳ߶�
%comimage Ϊѹ����Ľ��
%perf0Ϊ��Ƶϵ����0�İٷֱ�
%perf1Ϊѹ����������ٷֱ�
%thrΪѹ������ѡ�����ֵ
function [comimage,perf0,perf1,thr]=imagecom(image,addr,permission,wavelet,level);
signal=imread(image,permission);
[row,col]=size(signal);
signal2=double(signal)/255;
signal2=reshape(signal2,row,col);
%��ͼ�����С���ֽ�
[C,S]=wavedec2(signal2,level,wavelet);
%����������ֵ
[thr,sorh,keepapp]=ddencmp('cmp','wv',signal2);
%ѹ��
[comimage,cxc,lxc,perf0,perf1]=wdencmp('gbl',C,S,wavelet,level,thr,sorh,keepapp);
comimage=reshape(comimage,row,col/3,3);
imwrite(comimage,addr,permission);
%��ʾ���

subplot(221),imshow(image);title('ԭʼͼ��');
comimage=imread(addr,permission);
subplot(222),imshow(comimage);title('ѹ�����ͼ��');
disp('ԭʼͼ��Ĵ�С');whos('signal')
disp('ѹ�����ͼ��Ĵ�С');whos('comimage')
disp('��Ƶϵ����0�İٷֱ�:');perf0
disp('ѹ����������ٷֱ�:');perf1



