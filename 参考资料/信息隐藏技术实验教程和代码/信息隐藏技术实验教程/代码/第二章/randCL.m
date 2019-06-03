%文件名：randCL.m
%作者：李鹏
%最后修改日期：2004.2.6
%目的：利用Logistic方程产生混沌序列
%应用举例:a=randCL(10,10,0.5,3.9);
%参数说明：此函数产生一个序列矩阵,
%row：为矩阵的行
%col：为矩阵的列
%seed：为初值(0到1)
%u ：即为公式中的μ(大于3.5699小于等于4)
function randmtx=randCL(row,col,seed,u)
  randmtx(1,1)=seed;
  for i=2:row*col
      randmtx(1,i)=u*randmtx(1,i-1)*(1-randmtx(1,i-1));
  end
  randmtx=reshape(randmtx,row,col);
      