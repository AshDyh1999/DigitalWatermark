%LSB����滻��ȡ--2016��6��27��
%���룺����ͼ��C_M����Կk��Ƕ����Ϣ����L
%�����������ϢS
%���������ʽ�� S=lsbRget('Lena_R.bmp',L,100)
%���裺
%1����ȡͼ������
%2����ȡǶ��λ�� row��col
%3����Ƕ��λ����Ϣ��ŵ�S��
%4���������ƻ�ΪASCII��
%5�����ļ�������ϢSд��secret�ļ���
%---------------------------------
% C_M='Lena_R.bmp';
% L=12288;
% k=100;
%------------------------------------

function S=lsbsuijitiqu(C_M,L,k)
%��ȡͼ�����
C_M1=imread(C_M);

%��ȡǶ��λ��row��col
[row,col]=suijishu(C_M,L,k);

%��Ƕ��λ����Ϣ��ŵ�S��
S=zeros(1,L);
for i=1:L
     S(1,i)=mod(C_M1(row(i),col(i)),2);
end

%�������ƻ�ΪASCII��ֵ
SC=zeros(1,L);
a=L/8;
for i=1:a
     for j=1:8
          SC(1,i)=SC(1,i)+S(1,(i-1)*8+j)*power(2,(j-1));
    end
end

 %���ļ�������Ϣд��secret.txt�ļ���
fileID=fopen('secret1.txt','w');
for i=1:a
     fwrite(fileID,SC(1,i),'char');
end
fclose(fileID);