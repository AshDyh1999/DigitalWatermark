%�ļ���:detectbasic_wm.m
%����Ա:��Ρ
%��дʱ��:2004.3.20
%��������:��������һ��������ͨ��ˮӡ�ĺ���
%�����ʽ����:
%Mn=detectbasic_wm(watermarkimage,2000,0.7)
%����˵��:
%watermarkimageǶ��ˮӡ���ͼ�����ݾ���
%seedΪ�����������
%tlp�Ǽ����ֵ
%Mn�Ǽ���� 
function Mn=detectbasic_wm(watermarkimage,seed,tlp)
P=watermarkimage;
[row,col]=size(P);
%���ú���rand.m����һ�����Ӿ��ȷֲ����������
rand('seed',seed);
wr=rand(row,col)*3;
%�����������Zlp 
Zlp=0;
for j=1:col
    for i=1:row
        Zlp=Zlp+P(i,j)*wr(i,j);
    end
end
Zlp=Zlp/(row*col);
%���ݼ����ֵ�жϼ����
if Zlp>tlp
    Mn=1;
elseif -tlp>Zlp
    Mn=0;
else Mn=-1;%��ˮӡ
end
