%�ļ���:diamondreplace.m
%����Ա:��ϼ��
%��дʱ��:2004.3.1
%��������:����������ɶ������ͼ���źŰ������û����Խ�������.
%�����ʽ����:result=diamondreplace(secretimage,1983)
%����˵��:
%matrixΪ����ͼ�����
%keyΪ������Կ
%resultΪ���Һ�Ľ��
function result=diamondreplace(matrix,key)
%����ԭͼ��ߴ粢����
[m,n]=size(matrix);
rowadd=32-mod(m,32);
coladd=32-mod(n,32);
if rowadd==32 
    rowadd=0;
end
if coladd==32
    coladd=0;
end
input=uint8(zeros([m+rowadd n+coladd]));
input(1:m,1:n)=matrix;
rand('seed',key);
control=randint(1,1,[200 255]);
%�������
fun=@replace32fun;%�����Ӻ���
result=blkproc(input,[32 32],fun);
result=bitxor(result,control(1,1));
