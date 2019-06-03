function hideimg=lsbrand(imgfile,info,key,outfile)
%读取载体图像
img=imread(imgfile);
%转灰度图像
if ndims(img)==3
    img=rgb2gray(img);
end
%读取嵌入信息
fi=fopen(info,'r');
[msg,len]=fread(fi,'ubit1');
[m,n]=size(img);
%检查嵌入信息是否合法
if len>m*n
    error('wrong!');
end
%生成随机序列对
[x,y]=randxy(img,len,key);
%嵌入隐藏信息
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