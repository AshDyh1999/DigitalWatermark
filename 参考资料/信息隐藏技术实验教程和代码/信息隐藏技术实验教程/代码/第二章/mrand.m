%�ļ���:mrand.m
%����Ա:����
%��дʱ��:2003.12.15
%��������:������������m����.
%�����ʽ����:seq=mrand([1 0 0 1 0])
%����˵��:
%connectionΪ���Ӷ���ʽ,1��ʾ����,0��ʾ�Ͽ�
%seqΪ�����m����
function [seq]=mrand(connection)
m=length(connection);
L=2^m-1;
registers=[zeros(1,m-1) 1];
seq(1)=registers(m);
for i=2:L
    new_reg_cont(1)=connection(1)*seq(i-1);
    for j=2:m
        new_reg_cont(j)=bitxor(registers(j-1),connection(j)*seq(i-1));
    end
    registers=new_reg_cont;
    seq(i)=registers(m);
end
