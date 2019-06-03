cover=imread('C:\Users\Administrator\Desktop\1.bmp');
msg=imread('C:\Users\Administrator\Desktop\2.bmp');

[ra ca]=size(cover);
[rb cb]=size(msg);
a=ra;
b=rb;
c=ca;
d=cb;
if ra>rb
    ra=rb;
else(ca>cb)
    ca=cb;
end
cover=imresize(cover,[ra ca]);
msg=imresize(msg,[ra ca]);

figure(1);
imshow(cover);

figure(2);
imshow(msg);
%cover1=cover(:,:,3);
%cover1=bitand(cover1,240);
%takemsg4=bitand(msg,240);
%shiftmsg4=bitshift(takemsg4,-4);
%cover1=bitor(cover1,shiftmsg4);
%data(:,:,3)=cover1;
%imwrite(data,'C:\Users\Administrator\Desktop\ÔØÌåÍ¼Ïñ.bmp')