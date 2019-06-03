function input_matrix = BinPictureFill(input_matrix,percentage)
    [row,col] = size(input_matrix);
    %当前矩阵中 1 的数量
    now_one_count = sum(sum(input_matrix));
    %目标矩阵中 1 的数量
    next_one_count = row * col * percentage;
    %需要改变的矩阵中的 1 的数量
    fill_count = abs(next_one_count - now_one_count);
    %要增加 1 还是减少 1
    if percentage > 0.5
        fill_value = true;
    else
        fill_value = false;
    end
    %有可能需要遍历多次
    while fill_count > 0
        % matlab 中 for 循环不可以改变索引，所以用wile循环
        index = 1;
        %当还没遍历完，并且还没填充完的时候继续
        while index < row * col && fill_count > 0
            %当下一个点和这个点的值不一样的时候
            if input_matrix(index) ~= input_matrix(index + 1)
                %当这个点与要填充的点一致的时候，填充下一个点，因为下一个点肯定和这个点不一样
                if input_matrix(index) == fill_value
                    index = index + 1;
                end
                %改变当前点的值
                input_matrix(index) = fill_value;
                %需要改变的元素数量 -1
                fill_count = fill_count - 1;
            end
            index = index + 1;
        end
    end
end