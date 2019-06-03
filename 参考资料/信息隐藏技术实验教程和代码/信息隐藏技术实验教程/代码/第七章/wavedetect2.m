%这是一个检测DCT水印的函数
function corr_coef=wavedetect2(test,permission1,original,permission2,seed,do_num,alpha)
dataoriginal=imread(original,permission2);
datatest=imread(test,permission1);
dataoriginal=dataoriginal(:,:,1);
[m,n]=size(dataoriginal);
datatest=datatest(:,:,1);
%提取加有水印的图像的DCT系数
waterdct=dct2(datatest);
%提取原始图像的DCT系数
waterdcto=dct2(dataoriginal);
%生成两种水印
realwatermark=cellauto(m,n,seed,do_num);
testwatermark=(waterdct-waterdcto)/alpha;
%计算相关性
corr_coef=trace(realwatermark'*testwatermark)/(norm(realwatermark,'fro')*norm(testwatermark,'fro'));
%corr_coef=corr2(realwatermark,testwatermark);