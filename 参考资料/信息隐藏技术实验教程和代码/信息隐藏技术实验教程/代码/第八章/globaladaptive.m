%文件名:globaladaptive.m
%程序员:郭迟
%编写时间:2004.4.7
%函数功能:本函数将完成Watson模型下全局自适应水印
%输入格式举例:[result,alf]=globaladaptive('c:\lenna.jpg',0.1,1983,'c:\wm.jpg')
%参数说明:
%image为输入原始图像
%equal为期望的感知质量
%seed为随机数种子
%goal为结果存放的地址
%result为加有水印的结果
%alf为求得的全局强度
function [imagergb,alf]=globaladaptive(image,equal,seed,goal)
%读取图像做DCT变换
imagergb=imread(image);
imagergb=double(imagergb);
imagergb1=imagergb;%求基本误差时使用
imagergb2=imagergb/255;%显示时使用
r=imagergb(:,:,1);%往R层加水印
T=dctmtx(8);
DCTcoef=blkproc(r,[8 8],'P1*x*P2',T,T');
%生成长度为64的高斯随机数作为水印模板
rand('seed',seed);
wm=randn(1,64);
%调用子函数,给图像加α为1时的水印
fun=@wmadd;
result=blkproc(DCTcoef,[8 8],fun,wm,1);
%DCT反变换
T=dctmtx(8);
r=blkproc(result,[8 8],'P1*x*P2',T',T);
imagergb1(:,:,1)=r;
imagergb1=imagergb1/255;%结果归一化才能存储
imwrite(imagergb1,'temp.jpg');
%计算α为1时的感知误差
basic=watsondistorsion(image,'temp.jpg');
disp('(α为1时的基本误差)');
%计算全局强度因子α
alf=equal/basic;
%正式加水印
fun=@wmadd;
result=blkproc(DCTcoef,[8 8],fun,wm,alf);
T=dctmtx(8);
r=blkproc(result,[8 8],'P1*x*P2',T',T);
imagergb(:,:,1)=r;
imagergb=imagergb/255;%结果归一化才能存储
imwrite(imagergb,goal);
imagergb=double(imread(goal))/255;
watsondistorsion(image,goal);
disp('(α经过适应后的感知误差)');
%输出结果
disp(['全局强度因子α=',num2str(alf)]);
subplot(121),imshow(imagergb2),title('原始图像');
subplot(122),imshow(imagergb),title(['加有水印强度α=',num2str(alf),'的图像']);
%---------------------------------
function block=wmadd(test,wm,alf)
zigdone=zigzag(test,1);%zigzag排列
for i=3:8
    for j=1:8
        zigdone(i,j)=zigdone(i,j)+alf*(wm((i-1)*8+j));%低频系数是不加水印的
    end
end
block=zigzag(zigdone,2);
