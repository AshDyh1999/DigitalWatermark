function data=imagehide(cover,massage,goleimage,permission,permission1,level)
%提取图像信息并分层
cover = imread(cover,permission1);
data=cover;
msg=imread(massage,permission);
[row,col]=size(cover);
cover1=cover(:,:,level);
%置载体图像R层的低4bit为0
for i=1:row
    for j=1:col/3
       cover1(i,j)=bitand(cover1(i,j),240);
    end
end
%置秘密图像的低4bit为0
takemsg4=bitand(msg,240);
%将秘密图像的高4bit右移4位
shiftmsg4=bitshift(takemsg4,-4);
%图像隐藏
for i=1:row
    for j=1:col/3
        cover1(i,j)=bitor(cover1(i,j),shiftmsg4(i,j));
    end
end
%写回并保存
data(:,:,level)=cover1;
imwrite(data,goleimage,permission);
%提取秘密图像信息,检测隐藏效果

data=imread(goleimage,permission);
[row,col]=size(data);
A=data(:,:,level);
for i=1:row
    for j=1:col/3
       A(i,j)=bitand(A(i,j),15);
    end
end
A=bitshift(A,4);
%显示结果
subplot(221),imshow(cover);title('载体图像');
subplot(222),imshow(massage);title('秘密图像');
subplot(223),imshow(data);title('隐藏后的图像');
subplot(224),imshow(A);title('提取的秘密图像');