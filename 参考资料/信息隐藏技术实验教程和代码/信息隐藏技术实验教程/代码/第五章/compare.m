%�ļ���:compare.m
%����Ա:��Ρ
%��дʱ��:2004.3.3
%��������:���������
%�����ʽ����:F=compare('lena.bmp','lenahided.bmp')
%����˵��:
%original��ԭʼ����ͼ��
%hided�����غ��ͼ��
%F�ǲ�ֵ���� 
function F=compare(original,hided)
%��ȡԭʼ����ͼ����� 
w=imread(original);
A=double(w)/255;
%��ȡ���غ�ͼ����� 
e=imread(hided);
B=double(e)/255;
%����ͼ�������� ����ʾЧ�� 
F=A-B;%ע�⣬MATLAB�о������ֻ֧��double��
imshow(mat2gray(F))
