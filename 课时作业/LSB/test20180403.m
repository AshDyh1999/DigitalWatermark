clc;
clear;
%��ȡ������ͼƬ����
picture1 = imread('picture1.bmp');
%��������������
[row,col] = size(picture1);

% picture1 = round(rand(400,500));
% imshow(picture1);

sno = 'wangjiangning8001715054.It''s so difficylt ';
%��8λ�����Ʊ�ʾ��ѧ�ŵ�ASCII2
bin_asc2_sno = dec2bin(sno,8);
%Ҫд��Ķ���������
bin_data = join(string(bin_asc2_sno),'');

%8λ2���ơ�11111111��������β��
bin_end = string(dec2bin(hex2dec('FF'),8));
%8λ2���ơ�11111110��������ʼ��
bin_start = string(dec2bin(hex2dec('FE'),8));

%��д�����ݣ���ʼ�� + ���� + ��β����
write_data = cast(bin_start + bin_data + bin_end,'char');
write_data_length = length(write_data);

%disp(length(cast(bin_data,'char')));
%disp(write_data_length);
%�������
index = 1;
flag = 1;
for x = 1:10:row
    for y = 1:10:col
        sub_matrix = picture1(x:x+9,y:y+9);
        sum_sub_matrix = sum(sum(sub_matrix));
        %�鿴�Ƿ�Ϊ��Ч���飬20%
        if sum_sub_matrix>80 || sum_sub_matrix<20
            continue;
        else
            %��������Ч
            %����Ҫд��Ķ����������������
            switch write_data(index)
                case '0'
                    output_matrix = BinPictureFill(picture1(x:x+9,y:y+9),sum_sub_matrix,0.4);
                case '1'
                    output_matrix = BinPictureFill(picture1(x:x+9,y:y+9),sum_sub_matrix,0.6);
            end
            %��������ͼƬ����ֵ
            for r = 1:10
                for c = 1:10
                    picture1(x+r-1,y+c-1) = output_matrix(r,c);
                end
            end
            index = index +1;
            %�ж������Ƿ�ȫ��д��
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
    disp("ͼƬ�ѱ���Ϊpicture2.bmp");
else
    disp("ͼƬ̫С�����治����ô����Ϣ");
end

function input_matrix = BinPictureFill(input_matrix,now_one_count,percentage)
    [row,col] = size(input_matrix);
    next_one_count = row * col * percentage;
    if percentage > 0.5
        %����1�ı���Ҫ����50%�������ڵ�С��50%
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
        %�Ѿ�����50%�Ͳ���Ҫ��ʲô������
    else
        %����1�ı���ҪС��50%�������ڵĴ���50%
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