%�ļ�����fourthbitcmp.m
%����Ա����ϼ��
%��дʱ�䣺2004.2.5
%�������ܣ���������ͼ���ѡ�������ͼ��㣬���ڵ�4bit��ÿһ��8��8�飬��Щ������
%          ����ͼ��ȥ�滻����ͼ�񣬲�����һ���滻��count,Ҫ������ͼ�񶼿�������8��8�ֿ顣
%�����ʽ��count=fourthbitcmp('c:\Lenna.bmp','c:\woman.bmp','bmp',3,0.7)
%����˵����
%cover������ͼ��ĵ�ַ
%massage������ͼ��ĵ�ַ
%pemission��ͼ�������
%level����Ϊ������ľ���㡣RΪ1��GΪ2��BΪ3��
%count���滻��
%threshold����ֵ
function  count=fourthbitcmp(cover,massage, permission,level,threshold)
%��ȡͼ����Ϣ���ֲ�
cover = imread(cover,permission);
data=cover;
msg=imread(massage,permission);
cover1=cover(:,:,level);
%��cover��msg�ĵ�4bit���д���
tempc=cover1;
tempm=msg;
tempc=bitand(tempc,8);
tempm=bitand(tempm,8);
temp=bitxor(tempm,tempc);
[row,col]=size(temp);
%��¼ͼ��ÿ���ֿ��nֵ
k1=0;
k2=0;
a=row*col/64;
count=zeros([1 a]);
for i=1:a
    for m=1:8
        for n=1:8
            if temp(8*k1+m,8*k2+n)==0
                count(1,i)=count(1,i)+1;
            end
        end
    end
    k2=k2+1;
    if k2*8==col
       k2=0;
       k1=k1+1;
    end
end
%����ÿ��Ħ�ֵ������ֵ���бȽ�
count=count/64;
for i=1:a
    if count(i)>=threshold
        count(i)=1;%�����滻
    elseif count(i)<1-threshold
        count(i)=-1;%ȡ��
    else
        count(i)=0;%���ܴ���
    end
end
