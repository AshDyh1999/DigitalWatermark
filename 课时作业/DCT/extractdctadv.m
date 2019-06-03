function result=extractdctadv(image,msg,key,count)
data0=image;
data0=double(data0)/255;
data=data0(:,:,1);
T=dctmtx(8);
DCTcheck=blkproc(data,[8 8],'P1*x*P2',T,T');
[row,col]=size(DCTcheck); 
row=floor(row/8);
col=floor(col/8);
a=zeros([row col]);
[k1,k2]=randinterval(a,count,key); 
for i=1:count    
    k1(1,i)=(k1(1,i)-1)*8+1;          
    k2(1,i)=(k2(1,i)-1)*8+1;
end
frr=fopen(msg,'a');
for i=1:count
    if DCTcheck(k1(i)+4,k2(i)+1) < DCTcheck(k1(i)+3,k2(i)+2) 
      fwrite(frr,0, 'ubit1' );
      result(i,1)=0;
    else
        fwrite(frr,1,'ubit1');      
        result(i,1)=1;
    end
end
fclose(frr);