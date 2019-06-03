%文件名:binaryhide.m
%程序员:郭迟
%编写时间:2004.3.5
%函数功能:本函数将完成二值图像下的信息隐秘.
%输入格式举例:[result,count]=binaryhide('c:\blenna.jpg','c:\secret.txt','c:\test.jpg',1983,45,55,3)
%参数说明:
%cover为二值载体图像
%msg为秘密消息
%goalfile为保存的结果
%key为隐藏密钥
%R0,R1和lumda为分析参数
%result为隐藏结果
%count为隐藏的信息数
%availabler,availablec存放隐藏块首地址的行,列标
function [result,count,availabler,availablec]=binaryhide(cover,msg,goalfile,key,R0,R1,lumda)
%按位读取秘密信息
frr=fopen(msg,'r');%定义文件指针
[msg,count]=fread(frr,'ubit1');%msg为消息的位表示形式,count为消息的bit数
fclose(frr);
%读取载体图像信息
images=imread(cover);
image=round(double(images)/255);
%确定图像块的首地址
[m,n]=size(image);
m=floor(m/10);
n=floor(n/10);
temp=zeros([m,n]);
[row,col]=hashreplacement(temp,m*n,m,key,n);%将m,n也作为密钥简化输入
for i=1:m*n
    if row(i)~=1
        row(i)=(row(i)-1)*10+1;
    end
    if col(i)~=1
        col(i)=(col(i)-1)*10+1;
    end
end
%随机置乱8*8个点
temp=zeros(8);
[randr,randc]=hashreplacement(temp,64,key,m,n);%将m,n也作为密钥简化输入
%分析可用的图像块
[availabler,availablec,image]=available(msg,count,row,col,m,n,image,R1,R0,lumda,randr,randc);
%信息嵌入
for i=1:count
    p1bi=computep1bi(availabler(i),availablec(i),image);
    if msg(i,1)==1
       if p1bi<R1
           image=editp1bi(availabler(i),availablec(i),image,0,R1-p1bi+1,randr,randc);%使p1(Bi)>R1
       elseif p1bi>R1+lumda
           image=editp1bi(availabler(i),availablec(i),image,1,p1bi-R1-lumda+1,randr,randc);%使p1(Bi)<R1+λ
       else
       end
   end
   if msg(i,1)==0
       if p1bi>R0
           image=editp1bi(availabler(i),availablec(i),image,1,p1bi-R0+1,randr,randc);%使p1(Bi)<R0
       elseif p1bi<R0-lumda
           image=editp1bi(availabler(i),availablec(i),image,0,R0-lumda-p1bi+1,randr,randc);%使p1(Bi)<R1+λ
       else
       end
   end
end
%信息写回保存
image=round(image);%防止边界扩散后的取整复原
result=image;
imwrite(result,goalfile);
subplot(121),imshow(images),title('原始图像');
subplot(122),imshow(result),title(['取阈值R0,R1为',int2str(R0),',',int2str(R1),'以及健壮参数λ为',int2str(lumda),'下的信息',int2str(count),'bits隐秘效果']);