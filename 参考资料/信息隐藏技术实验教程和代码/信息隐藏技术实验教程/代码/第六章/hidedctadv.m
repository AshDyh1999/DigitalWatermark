%�ļ�����hidedctadv.m
%����Ա������
%�޸ģ�����
%��дʱ�䣺2003.11.25
%�޸�ʱ�䣺2004.3.8
%�������ܣ�����������DCT�����Ϣ����
%�����ʽ������[count,msg,data]=hidedctadv('lenna.jpg','1.jpg','1.txt',1982,1);
%����˵����
%imageΪ����ͼ��
%imagegoalΪ����������Ϣ�����壬����������
%msgΪ�����ص���Ϣ
%keyΪ��Կ�������������ѡ��
%alphaΪ��������������֤�������ȷ��
%countΪ��������Ϣ�ĳ���
%resultΪ���ؽ��
function [count,msg,result]=hidedctadv(image,imagegoal,msg,key,alpha)
%��λ��ȡ������Ϣ
frr=fopen(msg,'r');
[msg,count]=fread(frr,'ubit1');
fclose(frr);
data0=imread(image);
%��ͼ�����תΪdouble��
data0=double(data0)/255;
%ȡͼ���һ��������
data=data0(:,:,1);
%��ͼ��ֿ�
T=dctmtx(8);
%�Էֿ�ͼ����DCT�任
DCTrgb=blkproc(data,[8 8],'P1*x*P2',T,T');
DCTrgb0=DCTrgb;
%��������Ŀ�ѡ��,ȷ��ͼ�����׵�ַ
[row,col]=size(DCTrgb);
row=floor(row/8);
col=floor(col/8);
a=zeros([row col]);
[k1,k2]=randinterval(a,count,key);
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
      DCTrgb(k1(i)+3,k2(i)+2)=DCTrgb(k1(i)+3,k2(i)+2)-alpha;%��ԭ��С��ϵ�������ø�С
  else
      DCTrgb(k1(i)+4,k2(i)+1)=DCTrgb(k1(i)+4,k2(i)+1)-alpha;
  end    
end
%��Ϣд�ر��� 
 DCTrgb1=DCTrgb;
 data=blkproc(DCTrgb,[8 8],'P1*x*P2',T',T);
 result=data0;
 result(:,:,1)=data;
 imwrite(result,imagegoal);
 