%�ļ�����blurringL16.m
%����Ա������
%��дʱ�䣺2004.3.20
%�������ܣ����������ڶ�ͼ����ģ������(��RGBͼ��)
%�����ʽ������image_opd=blurringL16('test.png',5);
%����˵����
%imageΪ������ͼ��
%imagegoalΪ������ͼ��
%xΪģ���Ĵ���
function [image_opd,C]=blurringL16(image,x);
A=imread(image);
[M,N]=size(A);
A=double(A)/65535;
original=A;
B=reshape(A,M,N);
blur=1/44*[1 1 2 1 1;1 2 2 2 1;2 2 8 2 2;1 2 2 2 1;1 1 2 1 1];
for i=1:x
Xe=zeros(M+4,N+4);
    Xe(3:M+2,3:N+2)=B;
    Xe(1,3:N+2)=B(1,1:N);
    Xe(2,3:N+2)=B(1,1:N);
    Xe(M+3,3:N+2)=B(M,1:N);
    Xe(M+4,3:N+2)=B(M,1:N);
    Xe(3:M+2,1)=B(1:M,1);
    Xe(3:M+2,2)=B(1:M,1);
    Xe(3:M+2,N+3)=B(1:M,N);
    Xe(3:M+2,N+4)=B(1:M,N);
    Xe(1:2,1:2)=B(1,1);
    Xe(M+3:M+4,N+3:N+4)=B(M,N); 
    Xe(M+3:M+4,1:2)=B(M,1);
    Xe(1:2,N+3:N+4)=B(1,N);  
C=conv2(Xe,blur,'valid');
B=C;
end
N=N/3;
image_opd=reshape(C,M,N,3);


