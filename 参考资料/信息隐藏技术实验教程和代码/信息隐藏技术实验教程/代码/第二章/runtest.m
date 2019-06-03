%�ļ���:runstest.m
%����Ա:����
%��дʱ��:2004.1.12
%��������:����������ɶ������[0,1]������е��γ̼���.
%�����ʽ����:[r,zr]=runstest(a);
%a��һ��1x nobs������
%����˵��:
%randomnumΪ��������
%rΪ�γ���
%zr Ϊ������
function [r,zr]=runtest(randomnum)
if size(randomnum(1,:))<=20
    error('��������̫��'); 
end;
logic=(randomnum>=0.5); 
%���ж�ֵ��,���ڵ���0.5��ȡ1,��ʾ+
run=abs(diff(logic));
%����Ȳ����ֵ
%����+,-���������γ���
n=length(logic);
n1=sum(logic)+1; 
n2=n-n1;
r=sum(run);
%����ͳ����ֵ
u_r=(2*n1*n2)/(n1+n2)+1;
std_r=sqrt((2*n1*n2*(2*n1*n2-n1-n2))/(((n1+n2)^2)*(n1+n2-1)));
zr=(r-u_r)/std_r;
%����������ˮƽ0.05�µ���̬��2/����λ��ֵ
sz=abs(norminv(0.025,0,1));
if abs(zr)<sz
    disp('���ܶ�������');
else
    disp('�ܾ���������');
end



