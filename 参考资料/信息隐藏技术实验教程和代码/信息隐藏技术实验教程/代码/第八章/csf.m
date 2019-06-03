%文件名:csf.m
%程序员:郭迟
%编写时间:2004.3.22
%函数功能:本函数将完成一个CSF的设计
%输入格式举例:filtercoefficients=csf
%参数说明:
%filtercoefficients为CSF的滤波器系数
function filtercoefficients=csf()

%调用子函数计算频率响应矩阵
Fmatrix = csfmat;
%画出频率响应
%figure(1);mesh(Fmatrix),title('频率响应'),xlabel('水平方向空间频率');ylabel('垂直方向空间频率');zlabel('CSF频率响应'); 
%利用FSAMP2函数计算频率系数
filtercoefficients=fsamp2(Fmatrix);   

%===================
%子函数,计算频率响应矩阵
function Fmatrix=csfmat()
%===================
u = -20:1:20; 
v = -20:1:20;
n = length(u);
Z = zeros(n);
for i=1:n
	for j=1:n
		Z(i,j)=csffun(u(i),v(j));	% 调用子函数计算响应空间频率下的频响
	end
end
Fmatrix = Z;

%========================
%子函数,计算u,v下的频率响应
function Sa=csffun(u,v)
%========================
%CSF频率响应
sigma = 2;
f = sqrt(u.*u+v.*v);
w = 2*pi*f/60;
Sw = 1.5*exp(-sigma^2*w^2/2)-exp(-2*sigma^2*w^2/2);

%高频修正
sita = atan(v./(u+eps));% eps= 2^(-52)是避免0的一种修正
bita = 8;
f0 = 11.13;
w0 = 2*pi*f0/60;
Ow = ( 1 + exp(bita*(w-w0)) * (cos(2*sita))^4) / (1+exp(bita*(w-w0)));

%最终结果
Sa = Sw * Ow;
