%�ļ���:hashreplacement.m
%����Ա:����
%��дʱ��:2004.2.23
%��������:������������MD5�����������������ײ������ѡ�����.
%�����ʽ����:[row,col,j]=hashreplacement(test,60,1983,421,1121)
%����˵��:
%matrixΪ�������
%quantityΪҪǶ�����Ϣ������(Ҫѡ�����������)
%key1,key2,key3Ϊ������Կ
%rowΪα�������������б�
%colΪα�������������б�
function [row,col,j]=hashreplacement(matrix,quantity,key1,key2,key3)
%��¼��������С
[X,Y]=size(matrix);
%��ʼ��row��col
row=zeros([1,quantity]);
col=zeros([1,quantity]);
j=zeros([1,quantity]);
for i=1:quantity
    v=round(i/X);
    u=mod(i,X);
    v=mod(v+md52num(md5(u+key1)),Y);
    u=mod(u+md52num(md5(v+key2)),X);
    v=mod(v+md52num(md5(u+key3)),Y);
    j(i)=v*X+u+1;
    col(i)=mod(j(i),Y);
    row(i)=j(i)/Y;
    row(i)=floor(row(i))+1;
    if col(i)==0
       col(i)=Y;
       row(i)=row(i)-1;
    end
end


