%�ļ���:dctcom.m
%����Ա:��Ρ
%��дʱ��:2004.1.12
%��������:������������DCT�任��ɶ�����ͼ�����ѹ��.
%�����ʽ����:comimage=dctcom('c:\blenna.jpg','jpg')
%����˵��:
%imageΪ����ĻҶ�ͼ��
%permissionΪͼ������
%comimageΪѹ�����ͼ�����
function comimage=dctcom(image,permission)
f=imread (image,permission);
f=double(f)/255;
T=dctmtx(8);
B=blkproc(f,[8 8],'P1*x*P2',T,T');   %T��T��ת����DCT����P1*x*P2�Ĳ���
mask=[1 1 1 1 0 0 0 0
      1 1 1 0 0 0 0 0
      1 1 0 0 0 0 0 0
      1 0 0 0 0 0 0 0
      0 0 0 0 0 0 0 0
      0 0 0 0 0 0 0 0
      0 0 0 0 0 0 0 0
      0 0 0 0 0 0 0 0];      %1��ʾ������0��ʾ����
B2=blkproc(B,[8 8],'P1.*x',mask);   %��.*����ʾ�����ӦԪ�������˷�
I2=blkproc(B2,[8 8],'P1*x*P2',T',T); %��*����ʾ����˷�
subplot(221),imshow(f);title('ԭʼͼ��');
subplot(222),imshow(I2) ;title('ѹ�����ͼ��');
M=I2-f;                        %ѹ��ǰ��ͼ�����ݾ������
subplot(223),imshow(mat2gray(M)),title('ͼ��ϸ��');       %���ɲ���ʾ���ͼ��
