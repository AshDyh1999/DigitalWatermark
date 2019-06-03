function [msg_origin] = LSB_extract(name)
% LSB_extract(name, lsb)
% name: the picture's path and name
% LSB in steganography (extract)
%
% Author: Moming
% 2016-03-20
%image = imread('result.bmp');
image = imread('result.bmp');

lsb = 3;
index = 1;
rgb = zeros(0);
[len_R, len_G, len_B] = size(image);
flag = char('0');  % use to detect the end tag

for R = 1 : len_R
    for G = 1 : len_G
        tmp = blanks(0);
        for B = 1 : len_B
            tmp = strcat(tmp, mod(image(R, G, B), 2^lsb) + '0');  % '0' is useful!!! Placeholder...
        end
        tmp_bin = dec2bin(tmp - '0', 3)';
        rgb(index) = bin2dec(tmp_bin(1 : 8));
        if flag + tmp_bin(9) ~= 97  % '0'/'1' is the end tag
            msg_origin = native2unicode(rgb, 'UTF-8');
            return;
        end
        index = index + 1;
        flag = tmp_bin(9);
    end
end

end