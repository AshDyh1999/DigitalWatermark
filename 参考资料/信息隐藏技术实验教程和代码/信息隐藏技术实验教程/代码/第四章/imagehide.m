%�ļ�����imagehide.m
%����Ա����ϼ��
%��дʱ�䣺2004.2.5
%�������ܣ�ֱ�ӽ�����ͼ��ĸ�4bit������RGB����ͼ���R��G��B������ѡ����һ��ĵ�4bit,��������ͼ����ȡ�����������ʾ��Ҫ������ͼ��Ĵ�С���ڵ�������ͼ��Ĵ�С��������ͼ���Ƕ�ֵ��Ҷ�ͼ��
%�����ʽ��
%data=imagehide('c:\Lenna.bmp','c:\woman.bmp','c:\mix.bmp','bmp',3)
%����˵����
% cover������ͼ��ĵ�ַ
% massage������ͼ��ĵ�ַ
% goleimage�����غ�ͼ��ĵ�ַ
% pemission��ͼ�������
%level����Ϊ������ľ���㡣RΪ1��GΪ2��BΪ3��
%data�����غ�ͼ��ľ���
function data=imagehide(cover,massage,goleimage,permission,level)
%��ȡͼ����Ϣ���ֲ�
cover = imread(cover,permission);
data=cover;
msg=imread(massage,permission);
[row,col]=size(cover);
cover1=cover(:,:,level);
%������ͼ��R��ĵ�4bitΪ0
for i=1:row
    for j=1:col/3
       cover1(i,j)=bitand(cover1(i,j),240);
    end
end
%������ͼ��ĵ�4bitΪ0
takemsg4=bitand(msg,240);
%������ͼ��ĸ�4bit����4λ
shiftmsg4=bitshift(takemsg4,-4);
%ͼ������
for i=1:row
    for j=1:col/3
        cover1(i,j)=bitor(cover1(i,j),shiftmsg4(i,j));
    end
end
%д�ز�����
data(:,:,level)=cover1;
imwrite(data,goleimage,permission);
%��ȡ����ͼ����Ϣ,�������Ч��
data=imread(goleimage,permission);
[row,col]=size(data);
A=data(:,:,level);
for i=1:row
    for j=1:col/3
       A(i,j)=bitand(A(i,j),15);
    end
end
A=bitshift(A,4);
%��ʾ���
subplot(221),imshow(cover);title('����ͼ��');
subplot(222),imshow(massage);title('����ͼ��');
subplot(223),imshow(data);title('���غ��ͼ��');
subplot(224),imshow(A);title('��ȡ������ͼ��');
