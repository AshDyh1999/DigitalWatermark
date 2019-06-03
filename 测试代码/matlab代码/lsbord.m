function hideimg=lsbord(imgfile,info,outfile)
%读取载体图像
img=imread(imgfile);
%转灰度图像
if ndims(img)==3
    img=rgb2gray(img);
end
%读取待嵌入信息
fo=fopen(info,'r');
[msg,len]=fread(fo,'ubit1');
[m,n]=size(img);
%检查嵌入信息长度是否合法
if m*n<len
    error('wrong!');
end
%顺序循环嵌入隐藏信息
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