function input_matrix = BinPictureFill(input_matrix,percentage)
    [row,col] = size(input_matrix);
    %��ǰ������ 1 ������
    now_one_count = sum(sum(input_matrix));
    %Ŀ������� 1 ������
    next_one_count = row * col * percentage;
    %��Ҫ�ı�ľ����е� 1 ������
    fill_count = abs(next_one_count - now_one_count);
    %Ҫ���� 1 ���Ǽ��� 1
    if percentage > 0.5
        fill_value = true;
    else
        fill_value = false;
    end
    %�п�����Ҫ�������
    while fill_count > 0
        % matlab �� for ѭ�������Ըı�������������wileѭ��
        index = 1;
        %����û�����꣬���һ�û������ʱ�����
        while index < row * col && fill_count > 0
            %����һ�����������ֵ��һ����ʱ��
            if input_matrix(index) ~= input_matrix(index + 1)
                %���������Ҫ���ĵ�һ�µ�ʱ�������һ���㣬��Ϊ��һ����϶�������㲻һ��
                if input_matrix(index) == fill_value
                    index = index + 1;
                end
                %�ı䵱ǰ���ֵ
                input_matrix(index) = fill_value;
                %��Ҫ�ı��Ԫ������ -1
                fill_count = fill_count - 1;
            end
            index = index + 1;
        end
    end
end