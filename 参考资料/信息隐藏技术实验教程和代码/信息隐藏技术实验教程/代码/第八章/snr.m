%�ļ���:snr.m
%����Ա:����
%��дʱ��:2004.3.21
%��������:����������ɶ�����ͼ��������,��ֵ����ȼ���.
%�����ʽ����:[snrvalue,psnrvalue]=snr('c:\lenna.jpg','c:\test.jpg')
%����˵��:
%originalΪԭʼͼ��
%test����ˮӡ��ͼ��
%snrvalueΪ���������
%psnrvalueΪ���߷�ֵ�����
function [snrvalue,psnrvalue]=snr(original,test);
%���ú���,����MSE
msevalue=mse(original,test);
if msevalue==0
    error('ͼ��ѡ�����');
end
%����ԭʼͼ����źŹ���
A=imread(original);
A=rgb2gray(A);
A=double(A);
[m,n]=size(A);
signal=0;
for i=1:m
    for j=1:n
        signal=signal+A(i,j)^2;
    end
end
signal=signal/(m*n);
%���������,��ֵ�����
snrvalue=signal/msevalue;
snrvalue=10*log10(snrvalue);
psnrvalue=255^2/msevalue;%8λͼʹ��
%psnrvalue=65535^2/msevalue;%16λͼʹ��
psnrvalue=10*log10(psnrvalue);
disp(['����ͼ��������Ϊ:',num2str(snrvalue),'dB']);
disp(['����ͼ��ķ�ֵ�����Ϊ:',num2str(psnrvalue),'dB']);
    

