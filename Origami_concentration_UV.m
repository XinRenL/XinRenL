% 输入摩尔吸光系数，光路程（cm），和吸光度
molar_extinction_coefficient = 123735380; % L*mol-1*cm-1
path_length = 1; % cm
absorbance = input("请输入吸光度值：");

% 计算浓度
concentration = absorbance / (molar_extinction_coefficient * path_length) * 1e9;

% 输出结果
disp(['物质浓度为 ' num2str(concentration) ' nmol/L']);

