%�ļ���:jpgandalpha.m
%����Ա:����
%��дʱ��:2004.3.11
%��������:��������̽��DCT�����еĿ�����ֵalpha��JPEG����������³���Ե�Ӱ��.
%�����ʽ����:result=jpgandalpha('c:\lenna.jpg','c:\secret.txt')
%����˵��:
%testΪԭʼͼ��
%msgΪ�����ص���Ϣ
function result=jpgandalpha(test,msg)
%����ѹ�������ȴ�10%��100%
quality=10:10:100;
alpha=0.1:0.1:1;
result=zeros([max(size(alpha)) max(size(quality))]);
resultr=0;
resultc=0;
for a=alpha
    resultr=resultr+1;
    [count,message,hideresult]=hidedctadv(test,'temp.jpg',msg,2003,a);
    resultc=0;
    different=0;
    for q=quality
        resultc=resultc+1;
        imwrite(hideresult,'temp.jpg','jpg','quality',q);
        msgextract=extractdctadv('temp.jpg','temp.txt',2003,count);
        for i=1:count
            if message(i,1)~=msgextract(i,1);
                different=different+1;
            end
        end
        result(resultr,resultc)=different/count;
        different=0;
    end
disp(['����˵�',int2str(resultr),'��(��10��)����³���Բ���,��ȴ�...']);    
end
%return
for i=1:10
    plot(quality,result(i,:));
    hold on;
end
xlabel('jpegѹ����');
ylabel('��ȡ����Ϣ��ԭʼ��Ϣ��ͬ�İٷֱ���'); 
title('������ֵ����JPEG����������³���Ե�Ӱ��')