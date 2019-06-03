function msg=lsbextract_ord(hideimg,len,outfile)
%读取待提取图像
img=imread(hideimg);
[m,n]=size(img);
%判断想提取的信息长度是否合法
if len>m*n
    error('wrong!');
end
%初始化缓冲变量
msg=zeros(1,len);
%顺序循环读取隐藏信息到缓冲变量
for i=1:m
    for j=1:n
       if (i-1)*n+j>len
          break
       end
       msg(1,(i-1)*n+j)=bitand(img(i,j),1);
    end
end
%将信息从缓冲变量写入文件
fi=fopen(outfile,'w');
fwrite(fi,msg,'ubit1');
fclose(fi);
end