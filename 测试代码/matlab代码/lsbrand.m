function hideimg=lsbrand(imgfile,info,key,outfile)
%��ȡ����ͼ��
img=imread(imgfile);
%ת�Ҷ�ͼ��
if ndims(img)==3
    img=rgb2gray(img);
end
%��ȡǶ����Ϣ
fi=fopen(info,'r');
[msg,len]=fread(fi,'ubit1');
[m,n]=size(img);
%���Ƕ����Ϣ�Ƿ�Ϸ�
if len>m*n
    error('wrong!');
end
%����������ж�
[x,y]=randxy(img,len,key);
%Ƕ��������Ϣ
hideimg=img;
for i=1:len
    if bitand(hideimg(x(i),y(1,i)),1)==msg(i)
       continue
    else
       if msg(i)==1
          hideimg(x(i),y(i))=hideimg(x(i),y(i))+1;
       else
          hideimg(x(i),y(i))=hideimg(x(i),y(i))-1;
       end
    end
end
imwrite(hideimg,outfile);
end