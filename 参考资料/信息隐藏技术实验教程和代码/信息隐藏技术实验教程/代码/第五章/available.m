%分析可用的图像块与秘密信息对应
%msg,count为秘密消息及其数量
%row,col存放的是随机选块后的块首地址的行,列地址值
%m*n为总块数量
%image为载体图像
%R1,R0,lumda为参数
%randr,randc是在8*8范围内随机置乱的行,列标
function [availabler,availablec,image]=available(msg,count,row,col,m,n,image,R1,R0,lumda,randr,randc);
msgquan=1;
unable=0;
difficult=0;
for blockquan=1:m*n
    %计算这一块的p1(Bi)
    p1bi=computep1bi(row(blockquan),col(blockquan),image);
    if p1bi>=R1+3*lumda ||  p1bi<=R0-3*lumda  %情况(1) 
       row(blockquan)=-1;%标记为无用
       col(blockquan)=-1;
       unable=unable+1;
       msgquan=msgquan-1;%该消息还未找到可以隐藏的块 
    %情况(2)
    elseif msg(msgquan,1)==1 && p1bi<=R0
        %调整p1(Bi)变得更小
        %disp([num2str(row(blockquan)),'a', num2str(col(blockquan)),'a', num2str(msgquan)]);
        image=editp1bi(row(blockquan),col(blockquan),image,1,3*lumda,randr,randc);
        row(blockquan)=-1;
        col(blockquan)=-1;
        difficult=difficult+1;
        msgquan=msgquan-1;%该消息还未找到可以隐藏的块    
    elseif msg(msgquan,1)==0 && p1bi>=R1 
       %调整p1(Bi)变得更大
       %disp([num2str(row(blockquan)),'b', num2str(col(blockquan)),'b', num2str(msgquan)]);
       image=editp1bi(row(blockquan),col(blockquan),image,0,3*lumda,randr,randc);
       row(blockquan)=-1;
       col(blockquan)=-1;
       difficult=difficult+1;
       msgquan=msgquan-1;%该消息还未找到可以隐藏的块 
    else    
       row(blockquan)=row(blockquan);
       row(blockquan)=row(blockquan);    
    end           
   msgquan=msgquan+1;
   if msgquan==count+1;%消息已经读取完成
       for i=(blockquan+1):m*n
          row(i)=-1;
          col(i)=-1;
      end
  disp(['消息长度:',num2str(msgquan-1),'bits;用到的块数:',num2str(blockquan),';其中不可用块有:',num2str(unable),';另有',num2str(difficult),'块难以调整块已修改为不可用块'])
  break;    
  end
end
%载体分析完但消息还没有读完
if msgquan<=count  
    disp(['消息长度:',num2str(msgquan-1),'bits;分析过的块数:',num2str(blockquan),';其中不可用块有:',num2str(unable),';另有',num2str(difficult),'块难以调整块已修改为不可用块'])
    disp('请根据以上数据更换载体!');
    error('载体太小!!');
end
%计算可用块的数量
%disp(row)
quan=0; 
for i=1:m*n
    if row(i)~=-1
        quan=quan+1;
    end
end
if quan<count
    error('可用块数量太小!请根据以上数据更换载体!');
end
disp(['可用图像块为:',num2str(quan)]);
%生成可用的块的行标列标并与消息对应
image=round(image);%防止边界扩散后的取整复原
availabler=zeros([1,quan]);
availablec=zeros([1,quan]);
j=1;
for i=1:m*n
   if row(i)~=-1;
      availabler(j)=row(i);
      availablec(j)=col(i);
      j=j+1;
  end  
end


       