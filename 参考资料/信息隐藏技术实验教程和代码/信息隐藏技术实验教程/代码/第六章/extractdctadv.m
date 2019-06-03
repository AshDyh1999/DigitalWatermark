%�ļ�����extractdctadv.m
%����Ա������
%��дʱ�䣺2004.3.8
%�������ܣ�����������DCT������Ϣ����ȡ
%�����ʽ������tt=extractdctadv('lennahide.jpg','2.txt',1982,40)
%����˵����
%imageΪ�Ѿ�������Ϣ��ͼ��
%permissionΪͼ���ʽ
%msgΪ��ȡ��Ϣ��ŵ�λ��
%keyΪ��Կ�������������ѡ��
%countΪ��Ϣ�ı��������ɲ��뷽����
function result=extractdctadv(image,msg,key,count)
data0=imread(image);
data0=double(data0)/255;
%��ͼ���һ������ȡ
data=data0(:,:,1);
%�ֿ���DCT�任
T=dctmtx(8);
DCTcheck=blkproc(data,[8 8],'P1*x*P2',T,T');
%��������Ŀ�ѡ��,ȷ��ͼ�����׵�ַ
[row,col]=size(DCTcheck);
row=floor(row/8);
col=floor(col/8);
a=zeros([row col]);
[k1,k2]=randinterval(a,count,key);
for i=1:count
    k1(1,i)=(k1(1,i)-1)*8+1;
    k2(1,i)=(k2(1,i)-1)*8+1;
end
%׼����ȡ����д��Ϣ
frr=fopen(msg,'a');
for i=1:count
   if DCTcheck(k1(i)+4,k2(i)+1)<=DCTcheck(k1(i)+3,k2(i)+2) 
      fwrite(frr,0,'bit1');
      result(i,1)=0;
  else
     fwrite(frr,1,'bit1'); 
     result(i,1)=1;
   end
end
fclose(frr);