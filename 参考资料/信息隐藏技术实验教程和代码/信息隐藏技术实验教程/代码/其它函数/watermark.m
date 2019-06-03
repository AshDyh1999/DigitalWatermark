%高斯噪声作为水印原形
size=256;block=8;blockno=size/block;LENGTH=size*size/64;
Alpha1=0.02;  Alpha2=0.1; T1=3; I=zeros(size,size); D=zeros(size,size); BW=zeros(size,size); block_dct1=zeros(block,block);
%产生高斯水印，并显示水印信息；
randn('seed',10);mark=randn(1,LENGTH);
subplot(2,2,1);plot(mark);title('watermarc:Gaussian noise');

%显示原图
subplot(2,2,2);I=imread('lena264_264','bmp');    
imshow(I);title('origine image:I');
%显示prewitt为算子的边缘图
BW=edge(I,'prewitt');subplot(2,2,3);imshow(BW);
title('edge of origine image');
%嵌入水印
k=1;
for m=1:blockno
   for n=1:blockno
      x=(m-1)*block+1;      y=(n-1)*block+1;
        block_dct1=I(x:x+block-1,y:y+block-1);
        block_dct1=dct2(block_dct1);
    BW_8_8=BW(x:x+block-1,y:y+block-1);
      if m<=1|n<=1
         T=0;
      else
         T=sum(BW_8_8);    T=sum(T);
      end
      if T>T1
         Alpha=Alpha2;
      else
         Alpha=Alpha1;
end
block_dct1(1,1)=block_dct1(1,1)*(1+Alpha*mark(k));     block_dct1=idct2(block_dct1);
D(x:x+block-1,y:y+block-1)=block_dct1;  
      k=k+1;
   end
end
%显示嵌入水印后的图像
subplot(2,2,4);imshow(D,[]);title('embeded image:D');