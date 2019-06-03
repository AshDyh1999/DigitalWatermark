function [] = LSBqianru(image)
    disp 'ͼƬΪ��ɫͼƬ������LSB�㷨';
    %global picture1;
    %��ȡ������ͼƬ����
    %��������������
    [row,col] = size(image);

    %picture1 = logical(round(rand(400,500)));
    % imshow(picture1);

    info = '71';
    %�����С��������λ������8λ���Ļ����룬����С��С��16λ������ʾ����
    code_size = 16;
    % if max(uint16(info)) > (2^8 - 1)
    %     code_size = 16;
    % else
    %     code_size = 8;
    % end
    %��8λ�����Ʊ�ʾ��ѧ�ŵ�ASCII2
    bin_asc2_info = dec2bin(info,code_size);
    %Ҫд��Ķ���������
    bin_info = join(string(bin_asc2_info),'');

    %8λ2���ơ�11111111��������β��
    bin_end_flag = string(dec2bin(hex2dec('FF'),code_size));
    %8λ2���ơ�11111110��������ʼ��
    bin_start_flag = string(dec2bin(hex2dec('FE'),code_size));

    %��д�����ݣ���ʼ�� + ���� + ��β����
    write_info = cast(bin_start_flag + bin_info + bin_end_flag,'char');
    write_info_length = length(write_info);

    %disp(length(cast(bin_data,'char')));
    %disp(write_data_length);
    %�������
    index = 1;
    flag = 1;
    for x = 1:10:row
        for y = 1:10:col
            sub_matrix = image(x:x+9,y:y+9);
            sum_sub_matrix = sum(sum(sub_matrix));
            %�鿴�Ƿ�Ϊ��Ч���飬20%
            if sum_sub_matrix > 80 || sum_sub_matrix < 20
                continue;
            else
                %��������Ч
                %����Ҫд��Ķ����������������
                %��ʱ�պ÷�������Ͳ��õ�����亯����
                if abs(str2double(write_info(index)) - sum_sub_matrix/100) > 0.4
                %if ~strcmp("" + write_data(index),"" + round(sum_sub_matrix/100))
                    switch write_info(index)
                        case '0'
                            output_matrix = BinPictureFill(sub_matrix,0.4);
                        case '1'
                            output_matrix = BinPictureFill(sub_matrix,0.6);
                    end
                    %��������ͼƬ����ֵ
                    for r = 1:10
                        for c = 1:10
                            image(x+r-1,y+c-1) = output_matrix(r,c);
                        end
                    end
                end
                index = index +1;
                %�ж������Ƿ�ȫ��д��
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
    disp("ͼƬ�ѱ���ΪLSB.bmp");
else
    disp("ͼƬ̫С�����治����ô����Ϣ");
end
end