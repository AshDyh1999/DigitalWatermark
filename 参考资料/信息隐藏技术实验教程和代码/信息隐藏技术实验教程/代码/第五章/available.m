%�������õ�ͼ�����������Ϣ��Ӧ
%msg,countΪ������Ϣ��������
%row,col��ŵ������ѡ���Ŀ��׵�ַ����,�е�ֵַ
%m*nΪ�ܿ�����
%imageΪ����ͼ��
%R1,R0,lumdaΪ����
%randr,randc����8*8��Χ��������ҵ���,�б�
function [availabler,availablec,image]=available(msg,count,row,col,m,n,image,R1,R0,lumda,randr,randc);
msgquan=1;
unable=0;
difficult=0;
for blockquan=1:m*n
    %������һ���p1(Bi)
    p1bi=computep1bi(row(blockquan),col(blockquan),image);
    if p1bi>=R1+3*lumda ||  p1bi<=R0-3*lumda  %���(1) 
       row(blockquan)=-1;%���Ϊ����
       col(blockquan)=-1;
       unable=unable+1;
       msgquan=msgquan-1;%����Ϣ��δ�ҵ��������صĿ� 
    %���(2)
    elseif msg(msgquan,1)==1 && p1bi<=R0
        %����p1(Bi)��ø�С
        %disp([num2str(row(blockquan)),'a', num2str(col(blockquan)),'a', num2str(msgquan)]);
        image=editp1bi(row(blockquan),col(blockquan),image,1,3*lumda,randr,randc);
        row(blockquan)=-1;
        col(blockquan)=-1;
        difficult=difficult+1;
        msgquan=msgquan-1;%����Ϣ��δ�ҵ��������صĿ�    
    elseif msg(msgquan,1)==0 && p1bi>=R1 
       %����p1(Bi)��ø���
       %disp([num2str(row(blockquan)),'b', num2str(col(blockquan)),'b', num2str(msgquan)]);
       image=editp1bi(row(blockquan),col(blockquan),image,0,3*lumda,randr,randc);
       row(blockquan)=-1;
       col(blockquan)=-1;
       difficult=difficult+1;
       msgquan=msgquan-1;%����Ϣ��δ�ҵ��������صĿ� 
    else    
       row(blockquan)=row(blockquan);
       row(blockquan)=row(blockquan);    
    end           
   msgquan=msgquan+1;
   if msgquan==count+1;%��Ϣ�Ѿ���ȡ���
       for i=(blockquan+1):m*n
          row(i)=-1;
          col(i)=-1;
      end
  disp(['��Ϣ����:',num2str(msgquan-1),'bits;�õ��Ŀ���:',num2str(blockquan),';���в����ÿ���:',num2str(unable),';����',num2str(difficult),'�����Ե��������޸�Ϊ�����ÿ�'])
  break;    
  end
end
%��������굫��Ϣ��û�ж���
if msgquan<=count  
    disp(['��Ϣ����:',num2str(msgquan-1),'bits;�������Ŀ���:',num2str(blockquan),';���в����ÿ���:',num2str(unable),';����',num2str(difficult),'�����Ե��������޸�Ϊ�����ÿ�'])
    disp('������������ݸ�������!');
    error('����̫С!!');
end
%������ÿ������
%disp(row)
quan=0; 
for i=1:m*n
    if row(i)~=-1
        quan=quan+1;
    end
end
if quan<count
    error('���ÿ�����̫С!������������ݸ�������!');
end
disp(['����ͼ���Ϊ:',num2str(quan)]);
%���ɿ��õĿ���б��б겢����Ϣ��Ӧ
image=round(image);%��ֹ�߽���ɢ���ȡ����ԭ
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


       