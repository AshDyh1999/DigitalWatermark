%�ļ����� hidedctadv.m 
%�������ܣ����������� DCT �����Ϣ����
%�����ʽ������ [count,msg,data]=hidedctadv('lenna.jpg','1.jpg','1.txt',1982,1); %����˵����
%imageΪ����ͼ��
%imagegoalΪ����������Ϣ�����壬����������
%msgΪ�����ص���Ϣ
%key Ϊ��Կ�������������ѡ��
%alphaΪ��������������֤�������ȷ��
%count Ϊ��������Ϣ�ĳ���
%result Ϊ���ؽ��
function [count,msg,result]=hidedctadv(image,imagegoal,msg,key,alpha) 
%��λ��ȡ������Ϣ
frr=fopen('1.txt','r'); 
[msg,count]=fread(frr,'ubit1'); 
fclose(frr); 
data0=imread('1.bmp'); 
%��ͼ�����תΪ double ��
data0=double(data0)/255; 
%ȡͼ���һ��������
data=data0(:,:,1); 
%��ͼ��ֿ�
T=dctmtx(8); 
%�Էֿ�ͼ���� DCT �任
DCTrgb=blkproc(data,[8 8],'P1*x*P2',T,T'); 
DCTrgb0=DCTrgb; 
%��������Ŀ�ѡ�� ,ȷ��ͼ�����׵�ַ
[row,col]=size(DCTrgb); 
row=floor(row/8); 
col=floor(col/8); 
a=zeros([row col]); 
[k1,k2]=randinterval(a,count,2001); 
for i=1:count 
    k1(1,i)=(k1(1,i)-1)*8+1; 
    k2(1,i)=(k2(1,i)-1)*8+1;
end
    %��ϢǶ��
temp=0; 
for i=1:count
    if msg(i,1)==0
        if DCTrgb(k1(i)+4,k2(i)+1)>DCTrgb(k1(i)+3,k2(i)+2)
            temp=DCTrgb(k1(i)+4,k2(i)+1); 
            DCTrgb(k1(i)+4,k2(i)+1)=DCTrgb(k1(i)+3,k2(i)+2); 
            DCTrgb(k1(i)+3,k2(i)+2)=temp; 
        end
    else
        if DCTrgb(k1(i)+4,k2(i)+1)<DCTrgb(k1(i)+3,k2(i)+2)
            temp=DCTrgb(k1(i)+4,k2(i)+1); 
            DCTrgb(k1(i)+4,k2(i)+1)=DCTrgb(k1(i)+3,k2(i)+2); 
            DCTrgb(k1(i)+3,k2(i)+2)=temp; 
        end
    end
    if DCTrgb(k1(i)+4,k2(i)+1)>DCTrgb(k1(i)+3,k2(i)+2)
        DCTrgb(k1(i)+3,k2(i)+2)=DCTrgb(k1(i)+3,k2(i)+2)-10;% ��ԭ��С��ϵ�������ø�С
    else
        DCTrgb(k1(i)+4,k2(i)+1)=DCTrgb(k1(i)+4,k2(i)+1)-10;
    end
end
%��Ϣ��д����
DCTrgb1=DCTrgb; 
data=blkproc(DCTrgb,[8 8],'P1*x*P2',T',T); 
result=data0; 
result(:,:,1)=data; 
imwrite(result,'2.bmp');
imshow('2.bmp');