%�ļ���:binaryextract.m
%����Ա:����
%��дʱ��:2004.3.9
%��������:��������������ȿռ��µ�������Ϣ����ȡ.
%�����ʽ����:result=binaryextract('c:\test.jpg','c:\extract.txt',1983,45,55,3,233)
%����˵��:
%stegocoverΪ��������Ϣ��������Ϣ
%goalfileΪ��Ϣ��ȡ�󱣴�ĵ�ַ
%keyΪ��ȡ��Կ
%R0,R1��lumdaΪ��������
%countΪҪ��ȡ����Ϣ��
%resultΪ��ȡ����Ϣ
function result=binaryextract(stegocover,goalfile,key,R0,R1,lumda,count)
%��ȡ��������ͼ����Ϣ,����ȡ���ȷ���.������ӦΪ16λ�洢��ʽ��ͼ��,����ʹ��png��ʽ
stegoimage= imread(stegocover);
stegoimage=round(double(stegoimage)/255);
%ȷ��ͼ�����׵�ַ
[m,n]=size(stegoimage);
m=floor(m/10);
n=floor(n/10);
temp=zeros([m,n]);
[row,col]=hashreplacement(temp,m*n,m,key,n);%��m,nҲ��Ϊ��Կ������
for i=1:m*n
    if row(i)~=1
        row(i)=(row(i)-1)*10+1;
    end
    if col(i)~=1
        col(i)=(col(i)-1)*10+1;
    end
end
%׼����ȡ����д��Ϣ
frr=fopen(goalfile,'a');%�����ļ�ָ��
%������˳�����ͼ���
quan=1;
result=zeros([count 1]);
for i=1:m*n
    %������һ���p1(Bi)
   p1bi=computep1bi(row(i),col(i),stegoimage);
   if p1bi<R1+3*lumda &&  p1bi>50
       fwrite(frr,1,'bit1');%��д1
       result(quan,1)=1;     
       quan=quan+1;
   elseif  p1bi>R0-3*lumda &&  p1bi<50   
      fwrite(frr,0,'bit1');%��д0
       result(quan,1)=0;
       quan=quan+1;
   else
       quan=quan;
   end
   if quan==count+1
      break;
   end
end
disp(['�Ѿ���ȷ����',num2str(quan-1),'bits����Ϣ']);
fclose(frr);   