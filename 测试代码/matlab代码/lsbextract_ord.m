function msg=lsbextract_ord(hideimg,len,outfile)
%��ȡ����ȡͼ��
img=imread(hideimg);
[m,n]=size(img);
%�ж�����ȡ����Ϣ�����Ƿ�Ϸ�
if len>m*n
    error('wrong!');
end
%��ʼ���������
msg=zeros(1,len);
%˳��ѭ����ȡ������Ϣ���������
for i=1:m
    for j=1:n
       if (i-1)*n+j>len
          break
       end
       msg(1,(i-1)*n+j)=bitand(img(i,j),1);
    end
end
%����Ϣ�ӻ������д���ļ�
fi=fopen(outfile,'w');
fwrite(fi,msg,'ubit1');
fclose(fi);
end