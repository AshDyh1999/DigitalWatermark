%�ļ���:mse.m
%����Ա:����
%��дʱ��:2004.3.20
%��������:����������ɶ�����ͼ���MSE����.
%�����ʽ����:msevalue=mse('c:\lenna.jpg','c:\test.jpg')
%����˵��:
%originalΪԭʼͼ��
%test����ˮӡ��ͼ��
%msevalueΪ���߾�����
function msevalue=mse(original,test);
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
%����MSE
msevalue=0;
for i=1:m
    for j=1:n
        msevalue=msevalue+(A(i,j)-B(i,j))^2;
    end
end
msevalue=msevalue/(m*n);
disp(['�������ݵ�MSEΪ:',num2str(msevalue)]);