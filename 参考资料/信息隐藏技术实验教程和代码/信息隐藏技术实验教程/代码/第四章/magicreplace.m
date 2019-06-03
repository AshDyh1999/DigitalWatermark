%�ļ���:magicreplace.m
%����Ա:��ϼ��
%��дʱ��:2004.3.1
%��������:����������ɶ������ͼ���źŰ������û����Խ�������.
%�����ʽ����:result=magicreplace(secretimage,1,1983)
%����˵��:
%matrixΪ����ͼ�����
%keyΪ������Կ
%eordΪ1��ʾ���ұ任,Ϊ0��ʾ��ԭ�任 
%resultΪ���Һ�Ľ��
function result=magicreplace(matrix,eord,key)
%����ԭͼ��ߴ粢����
[m,n]=size(matrix);
rowadd=11-mod(m,11);
coladd=11-mod(n,11);
if rowadd==11 
    rowadd=0;
end
if coladd==11
    coladd=0;
end
input=uint8(zeros([m+rowadd n+coladd]));
input(1:m,1:n)=matrix;
%��Կ���������
rand('seed',key);
control=randint(1,1,[1 121]);
%11�ױ�׼�÷�
magic=[38	52	66	69	83	97	100	114	7	21	24
 61	75	78	92	106	120	2	16	30	44	47
 84	98	101	115	8	22	25	39	53	56	70
 107 121 3	17	31	34	48	62	76	79	93
 9	12	26	40	54	57	71	85	99	102	116
 32	35	49	63	77	80	94	108	111	4	18
 55	58	72	86	89	103	117	10	13	27	41
 67	81	95	109	112	5	19	33	36	50	64
 90	104	118	11	14	28	42	45	59	73	87
 113 6	20	23	37	51	65	68	82	96	110
 15	29	43	46	60	74	88	91	105	119	1];

if eord==0
    control=121-control;
elseif eord==1
    control=control;
else
    error('�����������');
end

%�÷��任������
for define=1:key%control
    for r=1:11
        for c=1:11
            magic(r,c)=magic(r,c)-1;
            if magic(r,c)==0
               magic(r,c)=121;
           end
        end
    end
end
%�������
fun=@replacemagicfun;%�����Ӻ���
result=blkproc(input,[11 11],fun,magic);
