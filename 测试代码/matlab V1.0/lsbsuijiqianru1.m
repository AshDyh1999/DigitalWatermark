%LSB����滻Ƕ���㷨-2016��6��26
%���룺����ͼ��C����Կk��������ϢM
%���������ͼ��C_M��C_C
%���������ʽ��   [C_M,C_C,L]=lsbRhide('Lena.bmp','message.txt',100)
%����
%1����ȡͼ�񡢲��Ҷ�����ͼ�θ��ռ�C_M
%2����ȡ������Ϣ�ı���ת��Ϊ�����ƣ������浽����M�У���¼�����Ƴ���L
%3������randinterval�����ҵ�Ƕ��λ��[row col]=randinterval(C,L,K)
%4����������Ƕ�뵽��Ӧָ����Ƕ��λ��
%      ���巽��Ϊ i=1:L
%      C_M(row(i),col(i))=C1(row(i),col(i))-mod(C1(row(i),col(i)),2)+M1(i,1)
%5���鿴LSBƽ��ֲ����
%6����ͼչʾ���

function [C_M,C_C,L]=lsbsuijiqianru(C,M,k)
C1=imread(C);
C_M=C1;
C_C=C1;

%��ȡ������Ϣ�ļ�
fileID=fopen(M,'r');
[M1,L]=fread(fileID,'ubit1');

%����randinterval�����ҵ�Ƕ��λ��
[row,col]=suijishu(C,L,k);

%��������Ƕ�뵽��Ӧָ����Ƕ��λ��
for i=1:L
    C_M(row(i),col(i))=C1(row(i),col(i))-mod(C1(row(i),col(i)),2)+M1(i,1);
end

%�鿴LSBƽ��ֲ����
[m,n]=size(C1);
for i=1:m
    for j=1:n
        C_C(i,j)=C_M(i,j)-C1(i,j);
   end
end

% %��������ͼ��
imwrite(C_M,'lsbshuijiqianru.bmp','bmp');
imshow('lsbshuijiqianru.bmp');
% %��ͼչʾ���
  % subplot(1,2,1);imshow(C_M);title('����ͼ��','FontSize',20);
  % subplot(1,2,2);imshow(mat2gray(C_C));title('LSBƽ��ֲ����','FontSize',20);
%
