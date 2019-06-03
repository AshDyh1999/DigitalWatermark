%�ļ���:globaladaptive.m
%����Ա:����
%��дʱ��:2004.4.7
%��������:�����������Watsonģ����ȫ������Ӧˮӡ
%�����ʽ����:[result,alf]=globaladaptive('c:\lenna.jpg',0.1,1983,'c:\wm.jpg')
%����˵��:
%imageΪ����ԭʼͼ��
%equalΪ�����ĸ�֪����
%seedΪ���������
%goalΪ�����ŵĵ�ַ
%resultΪ����ˮӡ�Ľ��
%alfΪ��õ�ȫ��ǿ��
function [imagergb,alf]=globaladaptive(image,equal,seed,goal)
%��ȡͼ����DCT�任
imagergb=imread(image);
imagergb=double(imagergb);
imagergb1=imagergb;%��������ʱʹ��
imagergb2=imagergb/255;%��ʾʱʹ��
r=imagergb(:,:,1);%��R���ˮӡ
T=dctmtx(8);
DCTcoef=blkproc(r,[8 8],'P1*x*P2',T,T');
%���ɳ���Ϊ64�ĸ�˹�������Ϊˮӡģ��
rand('seed',seed);
wm=randn(1,64);
%�����Ӻ���,��ͼ��Ӧ�Ϊ1ʱ��ˮӡ
fun=@wmadd;
result=blkproc(DCTcoef,[8 8],fun,wm,1);
%DCT���任
T=dctmtx(8);
r=blkproc(result,[8 8],'P1*x*P2',T',T);
imagergb1(:,:,1)=r;
imagergb1=imagergb1/255;%�����һ�����ܴ洢
imwrite(imagergb1,'temp.jpg');
%�����Ϊ1ʱ�ĸ�֪���
basic=watsondistorsion(image,'temp.jpg');
disp('(��Ϊ1ʱ�Ļ������)');
%����ȫ��ǿ�����Ӧ�
alf=equal/basic;
%��ʽ��ˮӡ
fun=@wmadd;
result=blkproc(DCTcoef,[8 8],fun,wm,alf);
T=dctmtx(8);
r=blkproc(result,[8 8],'P1*x*P2',T',T);
imagergb(:,:,1)=r;
imagergb=imagergb/255;%�����һ�����ܴ洢
imwrite(imagergb,goal);
imagergb=double(imread(goal))/255;
watsondistorsion(image,goal);
disp('(��������Ӧ��ĸ�֪���)');
%������
disp(['ȫ��ǿ�����Ӧ�=',num2str(alf)]);
subplot(121),imshow(imagergb2),title('ԭʼͼ��');
subplot(122),imshow(imagergb),title(['����ˮӡǿ�Ȧ�=',num2str(alf),'��ͼ��']);
%---------------------------------
function block=wmadd(test,wm,alf)
zigdone=zigzag(test,1);%zigzag����
for i=3:8
    for j=1:8
        zigdone(i,j)=zigdone(i,j)+alf*(wm((i-1)*8+j));%��Ƶϵ���ǲ���ˮӡ��
    end
end
block=zigzag(zigdone,2);
