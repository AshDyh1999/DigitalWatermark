function [x,y]=randxy(matrix,len,key)
%���㲽������������������棬ȷ������������
[m,n]=size(matrix);
step1=floor(m*n/len)+1;
step2=step1-3;
if step2<=0
    error('wrong!');
end
%����������ӣ�����һ�������
rand('seed',key);
temp=rand(1,len);
%�������������������жԣ�x,y��
locate=1;
x=zeros(1,len);
y=zeros(1,len);
x(1,1)=locate;
y(1,1)=locate;
for i=2:len
    if temp(i)>0.5
       locate=locate+step1;
    else
       locate=locate+step2;
    end
   x(1,i)=floor(locate/n)+1;
    if mod(locate,n)==0
       y(1,i)=n;
    else
       y(1,i)=mod(locate,n);
    end
end
end