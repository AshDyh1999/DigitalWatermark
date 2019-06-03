%�ļ���:watsondistorsion.m
%����Ա:����
%��дʱ��:2004.4.2
%��������:�����������Watsonģ����ͼ���֪��������.
%�����ʽ����:result=watsondistorsion('c:\lenna.jpg','c:\test.jpg')
%����˵��:
%originalΪԭʼͼ��
%test����ˮӡ��ͼ��
%resultΪ����������
function result=watsondistorsion(original,test)
%��ȡͼ��ת����
io=imread(original);
io=rgb2gray(io);
io=double(io);
iw=imread(test);
iw=rgb2gray(iw);
iw=double(iw);
%�ֿ�DCT�任�����ͼ��
T=dctmtx(8);
DCTcoefo=blkproc(io,[8 8],'P1*x*P2',T,T');
DCTcoefw=blkproc(iw,[8 8],'P1*x*P2',T,T');
e=DCTcoefw-DCTcoefo;
%���϶
threshold=watsonthreshold(original);
%����JND����
[m,n]=size(e);
d=zeros([m n]);
for i=1:m
    for j=1:n
        d(i,j)=e(i,j)/threshold(i,j);
    end
end
%���ϲ�
distortion=0;
for i=1:m
    for j=1:n
        d(i,j)=d(i,j)^4;
        distortion=distortion+d(i,j);
    end
end
result=sqrt(sqrt(distortion));
disp(['ͼ��ĸ�֪���Ϊ:',num2str(result)]);