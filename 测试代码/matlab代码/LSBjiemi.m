function [] = LSBjiemi(image)
disp 'ͼƬΪ��ɫͼƬ������LSB�㷨'
    [row,col] = size(image);

    %�����С��������λ������8λ���Ļ����룬����С��С��16λ������ʾ����
    code_size = 16;
    %8λ2���ơ�11111111��������β��
    bin_end = string(dec2bin(hex2dec('FF'),code_size));
    %8λ2���ơ�11111110��������ʼ��
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
            %�鿴�Ƿ�Ϊ��Ч���飬20%
            if num>80 || num<20
                %��������Ч
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
                    %��һ���ַ������Ʊ���Ϊ��ʼ�� ---- 11111110��������ļ���������Ϣ
                    if start_flag == 1 && strcmp(hide_bin_asc2_char,bin_start) == 1
                        start_flag = 0;
                        continue;
                    else
                        %��һ���ַ����ǿ�ʼ�� || ����������
                        if start_flag == 1 || strcmp(hide_bin_asc2_char,bin_end) == 1
                            exit_flag = 0;
                            break;
                        else
                            %�ӵڶ����ַ���ʼ�ۼӣ�ֱ������
                            hide_string = hide_string + cast(bin2dec(hide_bin_asc2_char),'char');
                        end
                    end
                end
            end
        end
        %��������ѭ��
        if exit_flag == 0
            break;
        end
    end
    %������Ϣ��Ϊ��
    if strcmp(hide_string,"") == 0
        disp("������ϢΪ��");
        disp(hide_string);
    else
        disp("�ö�����ͼƬ������������Ϣ��");
    end
end