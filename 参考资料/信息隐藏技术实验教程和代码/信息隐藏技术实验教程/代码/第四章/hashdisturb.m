%�ļ���:hashdisturb.m
%����Ա:��ϼ��
%��дʱ��:2004.3.2
%��������:����������ɶ������ͼ���źŰ������û����Խ�������.
%�����ʽ����:result=hashdisturb(secretimage,1,1983,421,1121)
%����˵��:
%matrixΪ����ͼ�����
%keyΪ������Կ
%eordΪ1��ʾ���ұ任,Ϊ0��ʾ��ԭ�任 
%resultΪ���Һ�Ľ��
function result=hashdisturb(matrix,eord,key1,key2,key3)
%����ԭͼ��ߴ粢����
[m,n]=size(matrix);
%��������û�����
[row,col]=hashreplacement(matrix,m*n,key1,key2,key3);
%���Һ���
count=1;
if eord==1
    for i=1:m
        for j=1:n
            result(i,j)=matrix(row(count),col(count));
            count=count+1;
        end
    end
end
%��ԭ����
if eord==0
    for i=1:m
        for j=1:n
            result(row(count),col(count))=matrix(i,j);
            count=count+1;
        end
    end
end
