%文件名:binaryextract.m
%程序员:郭迟
%编写时间:2004.3.9
%函数功能:本函数将完成亮度空间下的隐秘信息的提取.
%输入格式举例:result=binaryextract('c:\test.jpg','c:\extract.txt',1983,45,55,3,233)
%参数说明:
%stegocover为隐藏有信息的秘密消息
%goalfile为信息提取后保存的地址
%key为提取密钥
%R0,R1和lumda为分析参数
%count为要提取的信息数
%result为提取的信息
function result=binaryextract(stegocover,goalfile,key,R0,R1,lumda,count)
%读取隐秘载体图像信息,并提取亮度分量.该载体应为16位存储方式的图像,建议使用png格式
stegoimage= imread(stegocover);
stegoimage=round(double(stegoimage)/255);
%确定图像块的首地址
[m,n]=size(stegoimage);
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
%准备提取并回写信息
frr=fopen(goalfile,'a');%定义文件指针
%按隐藏顺序分析图像块
quan=1;
result=zeros([count 1]);
for i=1:m*n
    %计算这一块的p1(Bi)
   p1bi=computep1bi(row(i),col(i),stegoimage);
   if p1bi<R1+3*lumda &&  p1bi>50
       fwrite(frr,1,'bit1');%回写1
       result(quan,1)=1;     
       quan=quan+1;
   elseif  p1bi>R0-3*lumda &&  p1bi<50   
      fwrite(frr,0,'bit1');%回写0
       result(quan,1)=0;
       quan=quan+1;
   else
       quan=quan;
   end
   if quan==count+1
      break;
   end
end
disp(['已经正确处理',num2str(quan-1),'bits的消息']);
fclose(frr);   