%�ļ���:lsbget.m
%����Ա:��Ρ
%��дʱ��:2004.2.29
%��������:�������������ȡ������LSB�ϵ�������Ϣ
%�����ʽ����:result=lsbget('d.bmp',1736,'secret.txt');
%����˵��:
%output����Ϣ���غ��ͼ��
%len_total��������Ϣ�ĳ���
%goalfile����ȡ����������Ϣ�ļ�
%result����ȡ����Ϣ 
function result=lsbget(output,len_total,goalfile)
ste_cover=imread(output);
ste_cover=double(ste_cover);
%�ж�Ƕ����Ϣ���Ƿ����
[m,n]=size(ste_cover);
frr=fopen(goalfile,'a');
%p��Ϊ��ϢǶ��λ��������,����Ϣ����д���ı��ļ�
p=1;
for f2=1:n
    for f1=1:m
         if bitand(ste_cover(f1,f2),1)==1
             fwrite(frr,1,'bit1');
             result(p,1)=1;
         else  
             fwrite(frr,0,'bit1');
             result(p,1)=0;
         end
         if p==len_total
             break;
         end    
         p=p+1;
    end
    if p==len_total
        break;
    end
end
fclose(frr);



