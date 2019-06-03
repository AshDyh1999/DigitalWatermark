function [] = LSBqianru(image)
    disp '图片为灰色图片，采用LSB算法';
    %global picture1;
    %读取二进制图片数据
    %读出行数和列数
    [row,col] = size(image);

    %picture1 = logical(round(rand(400,500)));
    % imshow(picture1);

    info = '71';
    %编码大小（二进制位数），8位中文会乱码，但大小更小，16位可以显示中文
    code_size = 16;
    % if max(uint16(info)) > (2^8 - 1)
    %     code_size = 16;
    % else
    %     code_size = 8;
    % end
    %以8位二进制表示的学号的ASCII2
    bin_asc2_info = dec2bin(info,code_size);
    %要写入的二进制数据
    bin_info = join(string(bin_asc2_info),'');

    %8位2进制‘11111111’用作结尾符
    bin_end_flag = string(dec2bin(hex2dec('FF'),code_size));
    %8位2进制‘11111110’用作起始符
    bin_start_flag = string(dec2bin(hex2dec('FE'),code_size));

    %待写入数据（起始符 + 数据 + 结尾符）
    write_info = cast(bin_start_flag + bin_info + bin_end_flag,'char');
    write_info_length = length(write_info);

    %disp(length(cast(bin_data,'char')));
    %disp(write_data_length);
    %进行填充
    index = 1;
    flag = 1;
    for x = 1:10:row
        for y = 1:10:col
            sub_matrix = image(x:x+9,y:y+9);
            sum_sub_matrix = sum(sum(sub_matrix));
            %查看是否为有效区块，20%
            if sum_sub_matrix > 80 || sum_sub_matrix < 20
                continue;
            else
                %该区块有效
                %根据要写入的二进制数据填充区块
                %有时刚好符合情况就不用调用填充函数了
                if abs(str2double(write_info(index)) - sum_sub_matrix/100) > 0.4
                %if ~strcmp("" + write_data(index),"" + round(sum_sub_matrix/100))
                    switch write_info(index)
                        case '0'
                            output_matrix = BinPictureFill(sub_matrix,0.4);
                        case '1'
                            output_matrix = BinPictureFill(sub_matrix,0.6);
                    end
                    %输出矩阵给图片矩阵赋值
                    for r = 1:10
                        for c = 1:10
                            image(x+r-1,y+c-1) = output_matrix(r,c);
                        end
                    end
                end
                index = index +1;
                %判断数据是否全部写完
                if index > write_info_length
                    flag = 0;
                    break;
                end
            end
        end
        if flag == 0
            break;
    end
end
if index > write_info_length
    imwrite(image,'C:\Users\Administrator\Desktop\LSB.bmp');
    disp("图片已保存为LSB.bmp");
else
    disp("图片太小，保存不了这么多信息");
end
end