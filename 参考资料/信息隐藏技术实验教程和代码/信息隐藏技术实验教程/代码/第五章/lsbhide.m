%�ļ���:lsbhide.m
%����Ա:��Ρ
%��дʱ��:2004.2.29
%��������:�������������LSB�ϵ�˳����Ϣ����
%�����ʽ����:[ste_cover,len_total]=lsbhide('lenna.bmp','msg.txt','d.bmp');
%����˵��:
%input����Ϣ��������ͼ��
%file��������Ϣ�ļ�
%output����Ϣ���غ�����ͼ��
%ste_cover����Ϣ���غ�ͼ����� 
%len_total��������Ϣ�ĳ��ȣ�������
function  [ste_cover,len_total]=lsbhide(input,file,output)
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
for f2=1:n
    for f1=1:m
        ste_cover(f1,f2)=ste_cover(f1,f2)-mod(ste_cover(f1,f2),2)+msg(p,1);
        if p==len_total
            break;
         end
         p=p+1;
     end
     if p==len_total
         break;
     end
 end
ste_cover=uint8(ste_cover);
imwrite(ste_cover,output);
%��ʾʵ���� 
subplot(1,2,1);imshow(cover); title('  ԭʼͼ��  ');
subplot(1,2,2);imshow(output);title('������Ϣ��ͼ��');

