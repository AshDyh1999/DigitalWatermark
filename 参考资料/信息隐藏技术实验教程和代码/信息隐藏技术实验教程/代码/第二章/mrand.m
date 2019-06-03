%文件名:mrand.m
%程序员:郭迟
%编写时间:2003.12.15
%函数功能:本函数将生成m序列.
%输入格式举例:seq=mrand([1 0 0 1 0])
%参数说明:
%connection为连接多项式,1表示相联,0表示断开
%seq为输出的m序列
function [seq]=mrand(connection)
m=length(connection);
L=2^m-1;
registers=[zeros(1,m-1) 1];
seq(1)=registers(m);
for i=2:L
    new_reg_cont(1)=connection(1)*seq(i-1);
    for j=2:m
        new_reg_cont(j)=bitxor(registers(j-1),connection(j)*seq(i-1));
    end
    registers=new_reg_cont;
    seq(i)=registers(m);
end
