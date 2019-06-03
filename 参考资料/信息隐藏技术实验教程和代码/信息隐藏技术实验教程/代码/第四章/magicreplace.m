%文件名:magicreplace.m
%程序员:王霞仙
%编写时间:2004.3.1
%函数功能:本函数将完成对输入的图像信号按菱型置换策略进行置乱.
%输入格式举例:result=magicreplace(secretimage,1,1983)
%参数说明:
%matrix为输入图像矩阵
%key为控制密钥
%eord为1表示置乱变换,为0表示复原变换 
%result为置乱后的结果
function result=magicreplace(matrix,eord,key)
%分析原图像尺寸并补遗
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
%密钥生成随机数
rand('seed',key);
control=randint(1,1,[1 121]);
%11阶标准幻方
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
    error('输入参数错误');
end

%幻方变换主过程
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
%查表置乱
fun=@replacemagicfun;%调用子函数
result=blkproc(input,[11 11],fun,magic);
