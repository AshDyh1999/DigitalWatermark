function msg=lsbextract_rand(hideimg,len,key,outfile)
%��ȡ����ȡͼ��
img=imread(hideimg);
[m,n]=size(img);
%�ж�����ȡ����Ϣ�����Ƿ�Ϸ�
if len>m*n
    error('wrong!');
end
%��ԭ������жԣ�ȷ����ȡλ��
[x,y]=randxy(img,len,key);
%��ʼ���������
msg=zeros(1,len);
%�������ж���ȡ������Ϣ
for i=1:len
   msg(i)=bitand(img(x(i),y(i)),1);
%����ȡ����Ϣд���ļ�
fi=fopen(outfile,'w');
fwrite(fi,msg,'ubit1');
fclose(fi);
 end