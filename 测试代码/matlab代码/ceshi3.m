
%f=fopen('2.txt','r'); 
%[msg,count]=fread(f,'ubit1'); 
data0=imread('2.bmp'); 
%frr=fopen(msg,'a'); 
%将图象矩阵转为 double 型
data0=double(data0)/255; 
%取图象的一层做隐藏
data=data0(:,:,1);

T=dctmtx(8); 
DCTrgb=blkproc(data,[8 8],'P1*x*P2',T,T');
%产生随机的块选择 ,确定图像块的首地址
[row,col]=size(DCTrgb); 
row=floor(row/8); 
col=floor(col/8); 
a=zeros([row col]); 
[k1,k2]=randinterval(a,count,2001); 
for i=1:count 
    k1(1,i)=(k1(1,i)-1)*8+1; 
    k2(1,i)=(k2(1,i)-1)*8+1;
end
    %信息嵌入
temp=0; 
for i=1:count
    if msg(i,1)==0
        if DCTrgb(k1(i)+4,k2(i)+1)>DCTrgb(k1(i)+3,k2(i)+2)
            temp=DCTrgb(k1(i)+4,k2(i)+1); 
            DCTrgb(k1(i)+4,k2(i)+1)=DCTrgb(k1(i)+3,k2(i)+2); 
            DCTrgb(k1(i)+3,k2(i)+2)=temp; 
        end
    else
        if DCTrgb(k1(i)+4,k2(i)+1)<DCTrgb(k1(i)+3,k2(i)+2)
            temp=DCTrgb(k1(i)+4,k2(i)+1); 
            DCTrgb(k1(i)+4,k2(i)+1)=DCTrgb(k1(i)+3,k2(i)+2); 
            DCTrgb(k1(i)+3,k2(i)+2)=temp; 
        end
    end
    if DCTrgb(k1(i)+4,k2(i)+1)>DCTrgb(k1(i)+3,k2(i)+2)
        DCTrgb(k1(i)+3,k2(i)+2)=DCTrgb(k1(i)+3,k2(i)+2)-10;% 将原本小的系数调整得更小
    else
        DCTrgb(k1(i)+4,k2(i)+1)=DCTrgb(k1(i)+4,k2(i)+1)-10;
    end
end
for i=1:count
    if DCTrgb(k1(i)+4,k2(i)+1)<= DCTrgb(k1(i)+3,k2(i)+2)
        %fwrite(frr,0,'bit1');
        result='0';
        a=result+' ';
    else
        %fwrite(frr,1,'bit1');
        result='1';
        a=result+' ';
    end
end
%fclose(frr);
