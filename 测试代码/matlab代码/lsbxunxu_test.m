C='1.bmp';
M='1.txt';
C1=imread(C);
[row,col]=size(C1);
%����Ƕ�뺯��lsbshide
if row>=400 && col>=400
    disp 'ͼƬ�ߴ�С�ڵ���400*400,ʹ��LSB˳��Ƕ��';
    [C_M,C_C,L]=lsbshunxuqianru(C,M);
%������ȡ����lsbsget
    lsbshunxutiqu('lsbshunxuqianru.bmp',L);
else
    disp 'ͼƬ�ߴ����500*500,ʹ��LSB���Ƕ��';
    k=100;
    %Ƕ����Ϣ��ʹ�ú���lsbsuijiqianru
    [C_M,C_C,L]=lsbsuijiqianru(C,M,k);
    %������ͼ�񱣴浽lsbshuijiqianru.bmp��
    imwrite(C_M,'lsbshuijiqianru.bmp','bmp');
    %��ȡ��Ϣ��ʹ�ú���lsbsuijitiqu
    lsbsuijitiqu('lsbshuijiqianru.bmp',L,k);
end


