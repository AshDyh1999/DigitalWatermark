%这是一个利用DCT变换往图像中隐藏信息的函数
function [count,msg,data]=hidedct(image,imagegoal,permission,msg,alpha)
frr=fopen(msg,'r');
[msg,count]=fread(frr,'bit1');
fclose(frr);
data=imread(image,permission);
%original=data;
data=double(data)/255;
T=dctmtx(8);
DCTrgb=blkproc(data,[8 8],'P1*x*P2',T,T');
[row,col]=size(DCTrgb);
k1=0;
k2=0;
temp=0;
for i=1:count
   if msg(i,1)==0 
     if DCTrgb(8*k1+5,8*k2+2)>DCTrgb(8*k1+4,8*k2+3)
        temp=DCTrgb(8*k1+5,8*k2+2);
        DCTrgb(8*k1+5,8*k2+2)=DCTrgb(8*k1+4,8*k2+3); 
        DCTrgb(8*k1+4,8*k2+3)=temp; 
     end
   else
     if DCTrgb(8*k1+5,8*k2+2)<DCTrgb(8*k1+4,8*k2+3)
        temp=DCTrgb(8*k1+5,8*k2+2);
        DCTrgb(8*k1+5,8*k2+2)=DCTrgb(8*k1+4,8*k2+3); 
        DCTrgb(8*k1+4,8*k2+3)=temp; 
     end 
   end  
   k2=k2+1;
   if 8* k2>=col;
      k1=k1+1;  
      k2=0;
   end  
   if DCTrgb(8*k1+5,8*k2+2)>DCTrgb(8*k1+4,8*k2+3)
      DCTrgb(8*k1+4,8*k2+3)=DCTrgb(8*k1+4,8*k2+3)-alpha;
  else
      DCTrgb(8*k1+5,8*k2+2)=DCTrgb(8*k1+5,8*k2+2)-alpha;
  end    
end
 data=blkproc(DCTrgb,[8 8],'P1*x*P2',T',T);
 col=col/3;
 data=reshape(data,row,col,3);
 imwrite(data,imagegoal,permission);
 %subplot(211);imshow(original);
 %subplot(212);imshow(data);
