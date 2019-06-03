function msg=lsbextract_rand(hideimg,len,key,outfile)
%读取待提取图像
img=imread(hideimg);
[m,n]=size(img);
%判断想提取的信息长度是否合法
if len>m*n
    error('wrong!');
end
%还原随机序列对，确定提取位置
[x,y]=randxy(img,len,key);
%初始化缓冲变量
msg=zeros(1,len);
%根据序列对提取隐藏信息
for i=1:len
   msg(i)=bitand(img(x(i),y(i)),1);
%将提取的信息写入文件
fi=fopen(outfile,'w');
fwrite(fi,msg,'ubit1');
fclose(fi);
 end