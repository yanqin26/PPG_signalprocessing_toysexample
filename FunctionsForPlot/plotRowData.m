function numberRowSample = plotRowData(ppgData)
%该函数用于绘制原始PPG信号的图像
%输入参数：csv文件原始PPG信号
%输出参数：ppg信号的个数
figure (1);

%坐标建立
x1 = 1 : length(ppgData); %横轴：样本个数
y1 = ppgData; %纵轴：样本

%制图
plot(x1, y1);
title('Row PPG waveform');
xlabel('sample');
ylabel('amplitude');
grid on;

numberRowSample = length(ppgData);

end
