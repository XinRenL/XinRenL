% 确定要生成的序列的数量
num_sequences = 20;

% 确定序列长度的上限和下限
min_length = 12;
max_length = 12;

% 初始化序列存储数组
sequences = cell(1, num_sequences);

% 生成指定数量的序列
for i = 1:num_sequences
    % 为当前序列生成一个随机长度
    seq_length = randi([min_length, max_length]);

    % 生成一个随机的字符向量
    seq_chars = ['A', 'T', 'C', 'G'];
    seq_rand_idx = randi([1, length(seq_chars)], [1, seq_length]);
    seq = seq_chars(seq_rand_idx);

    % 将生成的序列保存到一个单元数组中
    sequences{i} = seq;
end

% 检测所有序列是否互补
is_complementary = true;
while is_complementary
    is_complementary = false; % 假设没有互补序列
    
    % 遍历所有序列进行互补检测
    for i = 1:num_sequences
        for j = i+1:num_sequences
            if isequal(complementary(sequences{i}), complementary(sequences{j}))
                % 如果发现互补序列，则删除这两个序列并重新生成两个序列
                sequences(i) = [];
                sequences(j-1) = [];
                num_sequences = num_sequences - 2;
                is_complementary = true; % 标记为有互补序列
                break;
            end
        end
        if is_complementary
            break;
        end
    end
    
    % 重新生成新的序列
    for i = 1:num_sequences+2
        % 为当前序列生成一个随机长度
        seq_length = randi([min_length, max_length]);

        % 生成一个随机的字符向量
        seq_chars = ['A', 'T', 'C', 'G'];
        seq_rand_idx = randi([1, length(seq_chars)], [1, seq_length]);
        seq = seq_chars(seq_rand_idx);

        % 将生成的序列保存到一个单元数组中
        sequences{end+1} = seq;
    end
end

% 显示所有序列
for i = 1:length(sequences)
    fprintf('Sequence %d: %s\n', i, sequences{i});
end

% 函数用于检测互补序列
function comp_seq = complementary(seq)
    comp_map = containers.Map({'A', 'T', 'C', 'G'}, {'T', 'A', 'G', 'C'});
    comp_seq = '';

    for k = 1:length(seq)
        comp_seq = [comp_seq, comp_map(seq(k))];
    end
end
%生成指定数量的序列，然后开始检测所有生成的序列，直到任意两个序列都不会互补为止。如果有互补的序列，会删除它们并重新生成两个序列，直到所有的序列都符合要求，然后将所有的序列输出。