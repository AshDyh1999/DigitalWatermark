%�ļ���:randU1.m
%����Ա:����
%��дʱ��:2003.11.20
%��������:������Ϊ����ͬ��α�����������
%�����ʽ����:randmtx=randU1(10,10,10000,0,1)
%����˵��:
%rowΪ��������������
%colΪ��������������
%seedΪ����
%k1,k2Ϊ���ɵ���������ڵķ�Χ,k1=0,k2=1��ʾ���ɵ������Ϊ0��1֮�����
function randmtx=randU1(row,col,seed,k1,k2)
%������������ӽ�����Ĭ�ϵ�����
if nargin < 3
   seed=1973272912;
end
m=2^31-1;
a=630360016;
randmtx(1,1)=mod(a*seed,m);
for i=2:row*col
    randmtx(1,i)=mod((a*randmtx(1,i-1)),m);
end
randmtx=reshape(randmtx,row,col);
if nargin<4
    randmtx=randmtx/m;
    return
end
randmtx=randmtx/m;
%�����ݷ�����Ҫ�������
randmtx=randmtx*(k2-k1)+k1;
