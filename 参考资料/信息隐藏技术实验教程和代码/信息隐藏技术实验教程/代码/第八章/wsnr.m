%�ļ���:wsnr.m
%����Ա:����
%��дʱ��:2004.3.21
%��������:����������ɶ�����ͼ���WSNR����.
%�����ʽ����:wsnrvalue=wsnr('c:\lenna.jpg','c:\test.jpg',0.5)
%����˵��:
%originalΪԭʼͼ��
%test����ˮӡ��ͼ��
%wnrvalueΪ���߼�Ȩ�����
function wsnrvalue=wsnr(original,test)
%��ȡͼ�񲢴������ȹ�ϵ
A=imread(original);
A=rgb2gray(A);
A=double(A);
B=imread(test);
B=rgb2gray(B);
B=double(B);
%�ж�����ͼ���Ƿ���Ч
[m,n]=size(A);
[m2,n2]=size(B);
if m2~=m || n2~=n
    error('ͼ��ѡ�����');
end
if A==B
    error('ͼ��ѡ�����');
end
%����ʧ���
e=A-B;
%CSF�˲�
filtercoefficients=csf;
result=filter2(filtercoefficients,e);
%���������
wsnrvalue=10*log10((255^2)/(mean(mean(result^2))));
disp(['����ͼ���WSNRΪ:',num2str(wsnrvalue),'dB']);