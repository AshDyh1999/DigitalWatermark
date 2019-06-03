C='1.bmp';
M='1.txt';
C1=imread(C);
[row,col]=size(C1);
%调用嵌入函数lsbshide
if row>=400 && col>=400
    disp '图片尺寸小于等于400*400,使用LSB顺序嵌入';
    [C_M,C_C,L]=lsbshunxuqianru(C,M);
%调用提取函数lsbsget
    lsbshunxutiqu('lsbshunxuqianru.bmp',L);
else
    disp '图片尺寸大于500*500,使用LSB随机嵌入';
    k=100;
    %嵌入消息，使用函数lsbsuijiqianru
    [C_M,C_C,L]=lsbsuijiqianru(C,M,k);
    %将载密图像保存到lsbshuijiqianru.bmp中
    imwrite(C_M,'lsbshuijiqianru.bmp','bmp');
    %提取消息，使用函数lsbsuijitiqu
    lsbsuijitiqu('lsbshuijiqianru.bmp',L,k);
end


