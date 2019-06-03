%�ļ���:wavelet2D.m
%����Ա:����
%��дʱ��:2004.1.20
%��������:����������ɶ�����Ķ�ά�źŽ��ж�߶���ɢС���ֽ�.
%�����ʽ����:[lowf,highH,highV,highD,C,S]=wavelet2D(lennaR,'db1',3)
%����˵��:
%lowfΪ���߶ȷֽ��ĵ�Ƶϵ��
%highfHΪ���߶ȷֽ���ˮƽ�����Ƶϵ��
%highfVΪ���߶ȷֽ��Ĵ�ֱ�����Ƶϵ��
%highfDΪ���߶ȷֽ��ĶԽǷ����Ƶϵ��
%CΪȫ���ֽ��Ƶ��ϵ��
%SΪ���߶ȷֽ��µõ���Ƶ��ϵ���ĳ���
%signalΪ�����ԭʼ��ά�ź�
%waveletΪʹ�õ�С������
%levelΪ�ֽ�ĳ߶�
function  [lowf,highH,highV,highD,C,S]=wavelet2D(signal,wavelet,level);
%��άС���ֽ�
[C,S]=wavedec2(signal,level,wavelet);
%��ȡ���߶ȷֽ��ĵ�Ƶ����
lowf=appcoef2(C,S,wavelet,level);
%��ȡ���߶ȷֽ��ĸ�Ƶ����
highH=detcoef2('h',C,S,level);
highV=detcoef2('v',C,S,level);
highD=detcoef2('d',C,S,level);
%�ع����߶��·ֽ�ĵ�Ƶ�ź�
A=wrcoef2('a',C,S,wavelet,level);
%�ع����߶��·ֽ�õ��ĸ�Ƶ�ź�
Dh=wrcoef2('h',C,S,wavelet,level);
Dv=wrcoef2('v',C,S,wavelet,level);
Dd=wrcoef2('d',C,S,wavelet,level);
%��ʾ�ع����Ч��
subplot(2,2,1),;image(A);title('��Ƶƽ���ź�');  
subplot(2,2,2),imshow(Dh);title([int2str(level),' �߶��µ�ˮƽ��Ƶϸ���ź�']);
subplot(2,2,3),imshow(Dv);title([int2str(level),' �߶��µĴ�ֱ��Ƶϸ���ź�']);
subplot(2,2,4),imshow(Dd);title([int2str(level),' �߶��µĶԽǸ�Ƶϸ���ź�']);
