%文件名：randCS.m
%作者：李鹏
%最后修改日期：2004.2.6
%目的：由混合光学双稳模型生成混沌序列
%应用举例:a=randCS(10,10,0.5);
%参数说明：此函数产生一个序列矩阵，
%row   为矩阵的行
%col   为矩阵的列
%seed  为初植（0到1）即公式中初值X0
%这里固定取A=4,Xb=2.5
function randmtx=randCS(row,col,seed)
 A=4;
 Xb=2.5;
 randmtx(1,1)=seed;
  for i=2:row*col
      randmtx(1,i)=A*sin(randmtx(1,i-1)-Xb)*sin(randmtx(1,i-1)-Xb);
  end
  randmtx=reshape(randmtx,row,col);