function [x,y]=randxy(matrix,len,key)
%计算步长，两个步长随机交替，确保插入的随机性
[m,n]=size(matrix);
step1=floor(m*n/len)+1;
step2=step1-3;
if step2<=0
    error('wrong!');
end
%设置随机种子，生成一串随机数
rand('seed',key);
temp=rand(1,len);
%根据随机数计算随机序列对（x,y）
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