%LSB˳���滻��ȡ--2016��6��27
%���룺����ͼ��C_M��Ƕ�볤��L
%�����������Ϣ����S
%���������ʽ��S=lsbsget('Lena_S.bmp',L)
%���裺
%1����ȡ����ͼ��C_M
%2������LSBƽ����0��1����S��
%3��������������Sת��ΪASCII�벢��ŵ��ı��ļ�secret.txt��

function S=lsbshunxutiqu(C_M,L)
%��ȡ����ͼ�����
C_M1=imread(C_M);
[m,n]=size(C_M1);
S=zeros(1,L);
%����LSBƽ����0��1����S��
for i=1:m
    for j=1:n
        if (i-1)*m+j>L%�ж�Ƕ�볤���Ƿ����L��������L������ֹѭ��
            break;
        end
        S(1,(i-1)*m+j)=mod(C_M1(i,j),2);
    end
    if (i-1)*m+j>L%�ж�Ƕ�볤���Ƿ����L��������L������ֹѭ��
         break;
    end
end

%������������Sת��ΪASCII�벢��ŵ��ı��ļ�secret��
fileID=fopen('secret.txt','w');
a=L/8;%�����ַ�����
SC=zeros(1,a);
for i=1:a
    b=0;
    for j=1:8
        b=b+S(1,(i-1)*8+j)*power(2,j-1);
    end
    SC(1,i)=b;
    fwrite(fileID,SC(1,i),'char');
end
fclose(fileID);

