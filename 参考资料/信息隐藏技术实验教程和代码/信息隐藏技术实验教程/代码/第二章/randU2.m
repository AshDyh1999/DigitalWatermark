%�ļ���:randU2.m
%����Ա:����
%��дʱ��:2003.11.20
%��������:������С������α�����������
%�����ʽ����:randmtx=randU2(10,10,10000,0,1)
%����˵��:
%rowΪ��������������
%colΪ��������������
%seedΪ����
%k1,k2Ϊ���ɵ���������ڵķ�Χ,k1=0,k2=1��ʾ���ɵ������Ϊ0��1֮�����
function randmtx=randU2(row,col,seed,k1,k2)
 if nargin < 3
   seed=11;
 end
m=4;
seed2=sqrt(seed);
while seed2<1
    seed2=seed2*10;
end
n=round(seed2/m);
x=(10^n)*seed2;
randmtx(1,1)=x-round(x);
for i=2:row*col
    temp=sqrt(abs(randmtx(1,i-1)));
    while temp<1
       temp=temp*10;
    end
    n=round(temp/m);
    x=(10^n)*temp;
    randmtx(1,i)=(x-round(x))+0.5;
end
randmtx=reshape(randmtx,row,col);
if nargin<4
    return
end
randmtx=randmtx*(k2-k1)+k1;

    