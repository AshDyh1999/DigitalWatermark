%文件名:lsbget.m
%程序员:李巍
%编写时间:2004.2.29
%函数功能:本函数将完成提取隐秘于LSB上的秘密消息
%输入格式举例:result=lsbget('d.bmp',1736,'secret.txt');
%参数说明:
%output是信息隐秘后的图像
%len_total是秘密消息的长度
%goalfile是提取出的秘密消息文件
%result是提取的消息 
function result=lsbget(output,len_total,goalfile)
ste_cover=imread(output);
ste_cover=double(ste_cover);
%判断嵌入消息量是否过大
[m,n]=size(ste_cover);
frr=fopen(goalfile,'a');
%p作为消息嵌入位数计数器,将消息序列写回文本文件
p=1;
for f2=1:n
    for f1=1:m
         if bitand(ste_cover(f1,f2),1)==1
             fwrite(frr,1,'bit1');
             result(p,1)=1;
         else  
             fwrite(frr,0,'bit1');
             result(p,1)=0;
         end
         if p==len_total
             break;
         end    
         p=p+1;
    end
    if p==len_total
        break;
    end
end
fclose(frr);



