%文件名:csf1.m
%程序员:郭迟
%编写时间:2004.3.22
%函数功能:本函数将完成一个CSF的设计
%输入格式举例:filtercoefficients=csf1(0.5)
%参数说明:
%filtercoefficients为CSF的滤波器系数
%distance为观察距离
function filtercoefficients=csf1(distance)

%调用子函数计算频率响应矩阵
Fmatrix = csfmat(distance);
%画出频率响应
%figure(1);mesh(Fmatrix),title('频率响应'),xlabel('水平方向空间频率');ylabel('垂直方向空间频率');zlabel('CSF频率响应'); 
%利用FSAMP2函数计算频率系数
filtercoefficients=fsamp2(Fmatrix);   

%===================
%子函数,计算频率响应矩阵
function Fmatrix=csfmat(distance)
%===================
u =-20:1:20; 
v =-20:1:20;
n = length(u);
Z = zeros(n);
for i=1:n
	for j=1:n
		Z(i,j)=csffun(u(i),v(j),distance);	% 调用子函数计算响应空间频率下的频响
	end
end
Fmatrix = Z;

%========================
%子函数,计算u,v下的频率响应
function Sa=csffun(u,v,distance)
%========================
%CSF频率响应
f1 =sqrt(u.*u+v.*v);
f2=180*asin(1/(sqrt(1+distance^2)));
fr=f1*pi/f2;
Sa=2.6*(0.0192+0.114*fr)*exp(-(0.114*fr)^1.1);