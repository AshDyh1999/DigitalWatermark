function hideimg=lsbord(imgfile,info,outfile)
%��ȡ����ͼ��
img=imread(imgfile);
%ת�Ҷ�ͼ��
if ndims(img)==3
    img=rgb2gray(img);
end
%��ȡ��Ƕ����Ϣ
fo=fopen(info,'r');
[msg,len]=fread(fo,'ubit1');
[m,n]=size(img);
%���Ƕ����Ϣ�����Ƿ�Ϸ�
if m*n<len
    error('wrong!');
end
%˳��ѭ��Ƕ��������Ϣ
hideimg=img;
for i=1:m
    for j=1:n
       if (i-1)*n+j>len
          break
       end
       if bitand(hideimg(i,j),1)==msg((i-1)*n+j)
          continue
       else
           if msg((i-1)*n+j)==1
             hideimg(i,j)=hideimg(i,j)+1;
           else
             hideimg(i,j)=hideimg(i,j)-1;
       end
    end
end
imwrite(hideimg,outfile);
end