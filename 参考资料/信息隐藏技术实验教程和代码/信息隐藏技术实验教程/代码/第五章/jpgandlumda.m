%�ļ���:jpgandlumda.m
%����Ա:����
%��дʱ��:2004.3.10
%��������:��������̽�ֶ�ֵͼ����JPEG���������ظı��״��.
%�����ʽ����:jpgandlumda('c:\blenna.jpg')
%����˵��:
%testΪ��ֵͼ��
function jpgandlumda(test)
image=imread(test);
image=round(double(image)/255);
[M,N]=size(image);
quality=5:5:100;%����ѹ�������ȴ�5%��100%
result=zeros([1 max(size(quality))]);
count=0;
different=0;
for q=quality
    count=count+1;
    imwrite(image,'temp.jpg','jpg','quality',q);%����imwrite�������ѹ��
    comdone=imread('temp.jpg');
    comdone=round(double(comdone)/255);
    for i=1:M
        for j=1:N
            if comdone(i,j)~=image(i,j)
                different=different+1;
            end
        end
    end
result(1,count)=different/(M*N);
different=0;
end
plot(quality,result);
xlabel('jpegѹ����');
ylabel('���ظı�İٷֱ���');
title('��ֵͼ����JPEG���������ظı��״��')