%�ļ�����plotmosaic.m
%����Ա������
%��дʱ�䣺2004.3.28
%�������ܣ����������ڻ��Ƽ���ˮӡ��ͼ���������˴��󣬼�������ֵ������
%�����ʽ������plotmosaic('test.png',40,'lenna.jpg',10,'db6',2,0.1,0.99);
%����˵����
%�������ʾģ��Ĵ�С��������Ϊ�����ֵ
%����˵����
%testΪ�Ѿ�����ˮӡ�Ĵ����ͼ��
%xΪ����ͼ��ģ������ֵ
%originalΪ����ԭʼͼ��
%seedΪ���������
%waveletΪʹ�õ�С������
%levelΪС���ֽ�ĳ߶�
%alphaΪˮӡǿ��
%ratioΪ�㷨��d/n�ı���
function plotmasaic(test,x,original,seed,wavelet,level,alpha,ratio)
quality=2:2:x;
corr_coef=zeros(max(size(quality)),1);
count=0;
for q=quality
      count=count+1;
      image_opd=mosaic16(test,q);
     [corr_coef(count),corr_DCTcoef(count)]=wavedetect('temp2.png',original,seed,wavelet,level,alpha,ratio);
end
plot(quality,abs(corr_DCTcoef));
xlabel('ģ��ߴ�');
ylabel('�����ֵ');
