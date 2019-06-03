f=open('1.txt','r');
[msg,count]=fread(f,'ubit1');
mat=imread('1.bmp');
mat=double(mat);
T=dctmtx(8);
DCTrgb=blkproc(mat,[8 8],'P1*x*P2',T,T');
%信息加密
rand('seed',key);
a=rand(1,count);
[m,n]=size(DCTrgb);
m=floor(m/8);
n=floor(n/8);
r=c=1;
k=floor(m*n/count)+1;
p=k-2;
for i=1:count
    if(a(i)>=0.5)
        c=c+k;
    else
        c=c+p;
    end
    if c>n 
        r=r+1;
        c=mod(c,n);
        if c==0
            c=1;
        end
    end
    row(1,i)=r;
    col(1,i)=c;
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
  %
 S=blkproc(DCTrgb,[8 8],'P1*x*P2',T',T);
        