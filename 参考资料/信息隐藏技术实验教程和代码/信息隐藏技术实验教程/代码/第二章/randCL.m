%�ļ�����randCL.m
%���ߣ�����
%����޸����ڣ�2004.2.6
%Ŀ�ģ�����Logistic���̲�����������
%Ӧ�þ���:a=randCL(10,10,0.5,3.9);
%����˵�����˺�������һ�����о���,
%row��Ϊ�������
%col��Ϊ�������
%seed��Ϊ��ֵ(0��1)
%u ����Ϊ��ʽ�еĦ�(����3.5699С�ڵ���4)
function randmtx=randCL(row,col,seed,u)
  randmtx(1,1)=seed;
  for i=2:row*col
      randmtx(1,i)=u*randmtx(1,i-1)*(1-randmtx(1,i-1));
  end
  randmtx=reshape(randmtx,row,col);
      