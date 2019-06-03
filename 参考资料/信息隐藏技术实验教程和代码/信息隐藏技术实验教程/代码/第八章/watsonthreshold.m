%�ļ���:watsonthreshold.m
%����Ա:����
%��дʱ��:2004.4.2
%��������:�����������Watsonģ����ͼ��Ա���ֵ�ļ���
%�����ʽ����:threshold=watsonthreshold('c:\lenna.jpg')
%����˵��:
%imageΪ����ͼ��
%thresholdΪ�������
function threshold=watsonthreshold(image)
%��ȡͼ��ת����
i=imread(image);
i=double(i);
i=rgb2gray(i);
%�ֿ�DCT�任
T=dctmtx(8);
DCTcoef=blkproc(i,[8 8],'P1*x*P2',T,T');
%���ú�������������ֵ
lumthreshold=lummask(image);
%����W(ij)������ֵ
[m,n]=size(DCTcoef);
for i=1:m
    for j=1:n
        another(i,j)=(abs(DCTcoef(i,j))^0.7)*(lumthreshold(i,j)^0.3);
    end
end
%����Ա���ֵ
threshold=zeros([m n]);
for i=1:m
    for j=1:n
        if lumthreshold(i,j)<=another(i,j)
            threshold(i,j)=another(i,j);
        else
            threshold(i,j)=lumthreshold(i,j);
        end
    end
end
