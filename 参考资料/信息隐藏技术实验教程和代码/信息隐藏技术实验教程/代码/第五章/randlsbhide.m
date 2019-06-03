%�ļ���:randlsbhide.m
%����Ա:��Ρ
%��дʱ��:2004.3.2
%��������:��������������ѡ��LSB����Ϣ����
%�����ʽ����:[ste_cover,len_total]=randlsbhide('lena.bmp','message.txt','hided.bmp',213)
%����˵��:
%input����Ϣ��������ͼ��
%file��������Ϣ�ļ�
%output����Ϣ���غ�����ͼ��
%key����������������Կ 
%ste_cover����Ϣ���غ�ͼ����� 
%len_total��������Ϣ�ĳ��ȣ�������
function  [ste_cover,len_total]=randlsbhide(input,file,output,key)
%����ͼ�����
cover=imread(input);
ste_cover=cover;
ste_cover=double(ste_cover);
%���ı��ļ�ת��Ϊ����������
f_id=fopen(file,'r');
[msg,len_total]=fread(f_id,'ubit1'); 
%�ж�Ƕ����Ϣ���Ƿ����
[m,n]=size(ste_cover);
if len_total>m*n
    error('Ƕ����Ϣ�����������ͼ��');
end
%p��Ϊ��ϢǶ��λ��������
p=1;
%��������������ѡȡ���ص� 
[row,col]=randinterval(ste_cover,len_total,key);
%��LSB������Ϣ 
for i=1:len_total
   ste_cover(row(i),col(i))=ste_cover(row(i),col(i))-mod(ste_cover(row(i),col(i)),2)+msg(p,1);
 if p==len_total
   break;
 end
 p=p+1;
end
ste_cover=uint8(ste_cover);
imwrite(ste_cover,output);
%��ʾʵ���� 
subplot(1,2,1);imshow(cover); title('  ԭʼͼ��  ');
subplot(1,2,2);imshow(output);title('������Ϣ��ͼ��');
