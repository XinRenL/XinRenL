% 输入需要转换的核酸序列
sequence = input('请输入核酸序列：', 's');

% 定义互补碱基的映射关系
complement_map = struct('A', 'T', 'T', 'A', 'C', 'G', 'G', 'C');

% 反向互补转换
reverse_complement = '';
for i = 1:length(sequence)
    base = sequence(i);
    if isfield(complement_map, base)
        reverse_complement = [complement_map.(base), reverse_complement];
    else
        error('输入的序列含有非法碱基！');
    end
end

% 输出转换结果
disp(['反向互补序列为：', reverse_complement]);