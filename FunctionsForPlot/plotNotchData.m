function numberSample = plotNotchData(ppgData)
%该函数用于绘制PPG信号的图像
%输入参数：main函数中传入的ppg信号
%输出参数：ppg信号的个数
figure (2);

%坐标建立
x1 = 1 : length(ppgData); %横轴：样本个数
y1 = ppgData; %纵轴：样本

%制图
plot(x1, y1);
title('PPG waveform');
xlabel('sample');
ylabel('amplitude');
grid on;

numberSample = length(ppgData);

end
