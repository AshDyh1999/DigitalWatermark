%cover='lena512.bmp';
%massage='yincang.bmp';
cover='314745.jpg';
massage='lena512.bmp';
goleimage='zaimi.bmp';
permission='bmp';
permission1='jpg';
level=3;
threshold=0.7;
%imshow(A);
% imshow(goleimage);
%����
%data2=fourthbitcmp1(cover,massage,goleimage,permission,permission1,level,threshold);
%����
%dataany=test(cover,massage,goleimage,permission,permission1,level,threshold);
data=imagehide(cover,massage,goleimage,permission,permission1,level);
%dataany=imagahide(cover,massage,goleimage,permission,permission1,level,threshold);
