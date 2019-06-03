clc;
clear;
%读取二进制图片数据
picture1 = imread('picture1.bmp');
%读出行数和列数
[row,col] = size(picture1);

% picture1 = round(rand(400,500));
% imshow(picture1);

sno = 'wangjiangning8001715054.It''s so difficylt ';
%以8位二进制表示的学号的ASCII2
bin_asc2_sno = dec2bin(sno,8);
%要写入的二进制数据
bin_data = join(string(bin_asc2_sno),'');

%8位2进制‘11111111’用作结尾符
bin_end = string(dec2bin(hex2dec('FF'),8));
%8位2进制‘11111110’用作起始符
bin_start = string(dec2bin(hex2dec('FE'),8));

%待写入数据（起始符 + 数据 + 结尾符）
write_data = cast(bin_start + bin_data + bin_end,'char');
write_data_length = length(write_data);

%disp(length(cast(bin_data,'char')));
%disp(write_data_length);
%进行填充
index = 1;
flag = 1;
for x = 1:10:row
    for y = 1:10:col
        sub_matrix = picture1(x:x+9,y:y+9);
        sum_sub_matrix = sum(sum(sub_matrix));
        %查看是否为有效区块，20%
        if sum_sub_matrix>80 || sum_sub_matrix<20
            continue;
        else
            %该区块有效
            %根据要写入的二进制数据填充区块
            switch write_data(index)
                case '0'
                    output_matrix = BinPictureFill(picture1(x:x+9,y:y+9),sum_sub_matrix,0.4);
                case '1'
                    output_matrix = BinPictureFill(picture1(x:x+9,y:y+9),sum_sub_matrix,0.6);
            end
            %输出矩阵给图片矩阵赋值
            for r = 1:10
                for c = 1:10
                    picture1(x+r-1,y+c-1) = output_matrix(r,c);
                end
            end
            index = index +1;
            %判断数据是否全部写完
            if index > write_data_length
                flag = 0;
                break;
            end
        end
    end
    if flag == 0
        break;
    end
end
if index > write_data_length
    imwrite(picture1,'picture2.bmp');
    disp("图片已保存为picture2.bmp");
else
    disp("图片太小，保存不了这么多信息");
end

function input_matrix = BinPictureFill(input_matrix,now_one_count,percentage)
    [row,col] = size(input_matrix);
    next_one_count = row * col * percentage;
    if percentage > 0.5
        %填充的1的比例要大于50%，而现在的小于50%
        while now_one_count < next_one_count
            for r = 1:row
                for c = 1:col
                    if input_matrix(r,c)==0
                        switch round(rand())
                            case 0
                                if r+1<=row && c+1<=col
                                    if input_matrix(r+1,c) + input_matrix(r,c+1) > 0
                                        input_matrix(r,c) = 1;
                                        now_one_count = now_one_count + 1;
                                    end
                                end
                            case 1
                                if r-1>0 && c-1>0
                                    if input_matrix(r-1,c) + input_matrix(r,c-1) > 0
                                        input_matrix(r,c) = 1;
                                        now_one_count = now_one_count + 1;
                                    end
                                end
                        end
                        if now_one_count == next_one_count
                            return;
                        end
                    end
                end
            end
        end
        %已经大于50%就不需要做什么动作了
    else
        %填充的1的比例要小于50%，而现在的大于50%
        while now_one_count > next_one_count
            for r = 1:row
                for c = 1:col
                    if input_matrix(r,c) == 1
                        switch round(rand())
                            case 0
                                if r+1<=row && c+1<=col
                                    if input_matrix(r+1,c) + input_matrix(r,c+1) < 2
                                        input_matrix(r,c) = 0;
                                        now_one_count = now_one_count - 1;
                                    end
                                end
                            case 1
                                if r-1>0 && c-1>0
                                    if input_matrix(r-1,c) + input_matrix(r,c-1) < 2
                                        input_matrix(r,c) = 0;
                                        now_one_count = now_one_count - 1;
                                    end
                                end
                        end
                        if now_one_count == next_one_count
                            return;
                        end
                    end
                end
            end
        end
    end
end