%����һ�����DCTˮӡ�ĺ���
function corr_coef=wavedetect2(test,permission1,original,permission2,seed,do_num,alpha)
dataoriginal=imread(original,permission2);
datatest=imread(test,permission1);
dataoriginal=dataoriginal(:,:,1);
[m,n]=size(dataoriginal);
datatest=datatest(:,:,1);
%��ȡ����ˮӡ��ͼ���DCTϵ��
waterdct=dct2(datatest);
%��ȡԭʼͼ���DCTϵ��
waterdcto=dct2(dataoriginal);
%��������ˮӡ
realwatermark=cellauto(m,n,seed,do_num);
testwatermark=(waterdct-waterdcto)/alpha;
%���������
corr_coef=trace(realwatermark'*testwatermark)/(norm(realwatermark,'fro')*norm(testwatermark,'fro'));
%corr_coef=corr2(realwatermark,testwatermark);