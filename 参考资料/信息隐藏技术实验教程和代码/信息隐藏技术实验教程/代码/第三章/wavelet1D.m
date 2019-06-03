%�ļ���:wavelet1D.m
%����Ա:����
%��дʱ��:2004.1.20
%��������:����������ɶ������һά�źŽ��ж�߶���ɢС���ֽ�.
%�����ʽ����:[lowf,highf]=wavelet1D(leleccum,'db1',3)
%����˵��:
%lowfΪ���߶ȷֽ��ĵ�Ƶ����
%highfΪ���߶ȷֽ��ĸ�Ƶ����
%signalΪ�����ԭʼһά�ź�
%waveletΪʹ�õ�С������
%levelΪ�ֽ�ĳ߶�
function  [lowf,highf]=wavelet1D(signal,wavelet,level);
is=length(signal);
im=max(signal);
%һάС���ֽ�
[C,S]=wavedec(signal,level,wavelet);
%��ȡ���߶ȷֽ��ĵ�Ƶ����
lowf=appcoef(C,S,wavelet,level);
%��ȡ���߶ȷֽ��ĸ�Ƶ����
highf=detcoef(C,S,level);

%�ع����߶��·ֽ�ĵ�Ƶ�ź�
A=wrcoef('a',C,S,wavelet,level);
%�ع����߶��·ֽ�õ��ĸ�Ƶ�ź�
for i=1:level
     D(i,:)=wrcoef('d',C,S,wavelet,i);
end
%��ʾ�ع����Ч��
subplot(2,2,1),;plot(A);axis([0 is 0 im]);title('��Ƶƽ���ź�');  
for i=1:level
    subplot(2,2,i+1),plot(D(i,:));title([int2str(i),' �߶��µĸ�Ƶϸ���ź�']);
end  




