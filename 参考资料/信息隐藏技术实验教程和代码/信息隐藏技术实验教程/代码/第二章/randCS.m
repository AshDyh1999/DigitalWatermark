%�ļ�����randCS.m
%���ߣ�����
%����޸����ڣ�2004.2.6
%Ŀ�ģ��ɻ�Ϲ�ѧ˫��ģ�����ɻ�������
%Ӧ�þ���:a=randCS(10,10,0.5);
%����˵�����˺�������һ�����о���
%row   Ϊ�������
%col   Ϊ�������
%seed  Ϊ��ֲ��0��1������ʽ�г�ֵX0
%����̶�ȡA=4,Xb=2.5
function randmtx=randCS(row,col,seed)
 A=4;
 Xb=2.5;
 randmtx(1,1)=seed;
  for i=2:row*col
      randmtx(1,i)=A*sin(randmtx(1,i-1)-Xb)*sin(randmtx(1,i-1)-Xb);
  end
  randmtx=reshape(randmtx,row,col);