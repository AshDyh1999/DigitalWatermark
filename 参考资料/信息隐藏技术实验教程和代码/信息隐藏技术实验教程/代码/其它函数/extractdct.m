%这是一个提取利用DCT变换隐藏的信息的函数
function tt=extractdct(image,permission,msg,count)
frr=fopen(msg,'a');
data=imread(image,permission);
data=double(data)/255;
T=dctmtx(8);
DCTcheck=blkproc(data,[8 8],'P1*x*P2',T,T');
[row,col]=size(DCTcheck);
k1=0;
k2=0;
for i=1:count
   if DCTcheck(8*k1+5,8*k2+2)<=DCTcheck(8*k1+4,8*k2+3) 
      fwrite(frr,0,'bit1');
      tt(i,1)=0;
      k2=k2+1;
      if 8*k2>=col
        k1=k1+1;  
        k2=0; 
      end
   else
     fwrite(frr,1,'bit1'); 
     tt(i,1)=1;
     k2=k2+1;
      if 8*k2>=col
        k1=k1+1;  
        k2=0; 
      end
   end
end
fclose(frr);