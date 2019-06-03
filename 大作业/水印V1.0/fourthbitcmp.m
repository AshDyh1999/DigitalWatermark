%文件名：fourthbitcmp.m
%程序员：王霞仙
%编写时间：2004.2.5
%函数功能：计算秘密图像和选择的载体图像层，对于第4bit的每一个8×8块，哪些可以用
%          秘密图像去替换载体图像，并返回一个替换表count,要求两个图像都可以整数8×8分块。
%输入格式：count=fourthbitcmp('c:\Lenna.bmp','c:\woman.bmp','bmp',3,0.7)
%参数说明：
%cover是载体图像的地址
%massage是秘密图像的地址
%pemission是图像的类型
%level是作为的载体的具体层。R为1，G为2，B为3。
%count是替换表
%threshold是阈值
function  count=fourthbitcmp(cover,massage, permission,permission1,level,threshold)
%提取图像信息并分层
cover = imread(cover,permission1);
data=cover;
msg=imread(massage,permission);
cover1=cover(:,:,level);
%对cover和msg的第4bit进行处理
tempc=cover1;
tempm=msg;
tempc=bitand(tempc,8);
tempm=bitand(tempm,8);
temp=bitxor(tempm,tempc);
[row,col]=size(temp);
%记录图像每个分块的n值
k1=0;
k2=0;
a=row*col/64;
count=zeros([1 a]);
for i=1:a
    for m=1:8
        for n=1:8
            if temp(8*k1+m,8*k2+n)==0
                count(1,i)=count(1,i)+1;
            end
        end
    end
    k2=k2+1;
    if k2*8==col
       k2=0;
       k1=k1+1;
    end
end
%计算每块的μ值并与阈值进行比较
count=count/64;
for i=1:a
    if count(i)>=threshold
        count(i)=1;%可以替换

    elseif count(i)<1-threshold
        count(i)=-1;%取反

    else
        count(i)=0;%不能处理

    end
end
