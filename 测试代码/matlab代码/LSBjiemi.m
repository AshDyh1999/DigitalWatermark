function [] = LSBjiemi(image)
disp '图片为灰色图片，采用LSB算法'
    [row,col] = size(image);

    %编码大小（二进制位数），8位中文会乱码，但大小更小，16位可以显示中文
    code_size = 16;
    %8位2进制‘11111111’用作结尾符
    bin_end = string(dec2bin(hex2dec('FF'),code_size));
    %8位2进制‘11111110’用作起始符
    bin_start = string(dec2bin(hex2dec('FE'),code_size));

    hide_bin_asc2_char = '00000000';
    hide_string = "";
    count = 0;
    start_flag = 1;
    exit_flag = 1;
    for x = 1:10:row
        for y = 1:10:col
            sub_matrix = image(x:x+9,y:y+9);
            num = sum(sum(sub_matrix));
            %查看是否为有效区块，20%
            if num>80 || num<20
                %该区块无效
                continue;
            else
                count = count + 1;
                if num > 50 
                    hide_bin_asc2_char(count) = '1';
                else
                    hide_bin_asc2_char(count) = '0';
                end
                if count == code_size
                    count = 0;
                    %第一个字符二进制编码为开始符 ---- 11111110，代表该文件有隐藏信息
                    if start_flag == 1 && strcmp(hide_bin_asc2_char,bin_start) == 1
                        start_flag = 0;
                        continue;
                    else
                        %第一个字符不是开始符 || 读到结束符
                        if start_flag == 1 || strcmp(hide_bin_asc2_char,bin_end) == 1
                            exit_flag = 0;
                            break;
                        else
                            %从第二个字符开始累加，直到结束
                            hide_string = hide_string + cast(bin2dec(hide_bin_asc2_char),'char');
                        end
                    end
                end
            end
        end
        %继续跳出循环
        if exit_flag == 0
            break;
        end
    end
    %隐藏信息不为空
    if strcmp(hide_string,"") == 0
        disp("隐藏信息为：");
        disp(hide_string);
    else
        disp("该二进制图片不存在隐藏信息！");
    end
end