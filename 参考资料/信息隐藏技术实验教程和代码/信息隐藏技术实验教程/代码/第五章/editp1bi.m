%�޸����صĺ���
%headrΪ�����е�ַ
%headcΪ�����е�ַ
%imageΪͼ��
%pixelΪҪ�޸ĵ�����
%countΪ�޸ĵ�����
%randr,randc��������Һ�Ľ��
function image=editp1bi(headr,headc,image,pixel,count,randr,randc)
c=0;
for i=1:64
    if image(headr+randr(i),headc+randc(i))==pixel
       %�����Ӽ��
       if  image(headr+randr(i)-1,headc+randc(i))==~pixel || image(headr+randr(i)+1,headc+randc(i))==~pixel || image(headr+randr(i),headc+randc(i)-1)==~pixel || image(headr+randr(i),headc+randc(i)+1)==~pixel ||  image(headr+randr(i)-1,headc+randc(i)-1)==~pixel || image(headr+randr(i)-1,headc+randc(i)+1)==~pixel|| image(headr+randr(i)+1,headc+randc(i)-1)==~pixel ||  image(headr+randr(i)+1,headc+randc(i)+1)==~pixel 
           image(headr+randr(i),headc+randc(i))=~pixel+0.01;
           
           c=c+1;
       end
   end
   if c==count
       return
   end
end
if c~=count
   disp('warning!����ѡ�񲻵�,δ����ȫ��Ҫ���޸ı�������,��Ϣ�����޷���ȡ,��������');
end
          