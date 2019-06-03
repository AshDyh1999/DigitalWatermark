function [count,msg,result]=hidedctadv(image,imagegoal,msg,key,alpha) 
frr=fopen(msg,'r');
[msg,count]=fread(frr,'ubit1');
fclose(frr);
data0=image;
data0=double(data0)/255;
data=data0(:,:,1);
T=dctmtx(8);
DCTrgb=blkproc(data,[8 8],'P1*x*P2',T,T');
DCTrgb0=DCTrgb;
[row,col]=size(DCTrgb);
row=floor(row/8);
col=floor(col/8);
a=zeros([row col]);
[k1,k2]=randinterval(a,count,key);
for i=1:count
    k1(1,i)=(k1(1,i)-1)*8+1;           
    k2(1,i)=(k2(1,i)-1)*8+1;
end
temp=0;
p=0;
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
        DCTrgb(k1(i)+3,k2(i)+2)=DCTrgb(k1(i)+3,k2(i)+2)-alpha;
    else
        DCTrgb(k1(i)+4,k2(i)+1)=DCTrgb(k1(i)+4,k2(i)+1)-alpha;
    end
end
DCTrgb1=DCTrgb;
data=blkproc(DCTrgb,[8 8],'P1*x*P2',T',T); 
result=data0; 
result(:,:,1)=data;
imwrite(result,imagegoal);