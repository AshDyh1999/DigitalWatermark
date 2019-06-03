%�ļ���:csf.m
%����Ա:����
%��дʱ��:2004.3.22
%��������:�����������һ��CSF�����
%�����ʽ����:filtercoefficients=csf
%����˵��:
%filtercoefficientsΪCSF���˲���ϵ��
function filtercoefficients=csf()

%�����Ӻ�������Ƶ����Ӧ����
Fmatrix = csfmat;
%����Ƶ����Ӧ
%figure(1);mesh(Fmatrix),title('Ƶ����Ӧ'),xlabel('ˮƽ����ռ�Ƶ��');ylabel('��ֱ����ռ�Ƶ��');zlabel('CSFƵ����Ӧ'); 
%����FSAMP2��������Ƶ��ϵ��
filtercoefficients=fsamp2(Fmatrix);   

%===================
%�Ӻ���,����Ƶ����Ӧ����
function Fmatrix=csfmat()
%===================
u = -20:1:20; 
v = -20:1:20;
n = length(u);
Z = zeros(n);
for i=1:n
	for j=1:n
		Z(i,j)=csffun(u(i),v(j));	% �����Ӻ���������Ӧ�ռ�Ƶ���µ�Ƶ��
	end
end
Fmatrix = Z;

%========================
%�Ӻ���,����u,v�µ�Ƶ����Ӧ
function Sa=csffun(u,v)
%========================
%CSFƵ����Ӧ
sigma = 2;
f = sqrt(u.*u+v.*v);
w = 2*pi*f/60;
Sw = 1.5*exp(-sigma^2*w^2/2)-exp(-2*sigma^2*w^2/2);

%��Ƶ����
sita = atan(v./(u+eps));% eps= 2^(-52)�Ǳ���0��һ������
bita = 8;
f0 = 11.13;
w0 = 2*pi*f0/60;
Ow = ( 1 + exp(bita*(w-w0)) * (cos(2*sita))^4) / (1+exp(bita*(w-w0)));

%���ս��
Sa = Sw * Ow;
