function numberSample = plotDiffData(ppgData, vpgData, apgData)
%该函数用于绘制PPG信号的图像
%输入参数：main函数中传入的ppg信号
%输出参数：ppg信号的个数
figure (4);

%坐标建立
x1 = 1 : length(ppgData); %横轴：样本个数
x2 = 1 : length(ppgData) - 1; %横轴：样本个数
x3 = 1 : length(ppgData) - 2; %横轴：样本个数
y1 = ppgData; %纵轴：样本
y2 = vpgData; %纵轴：样本
y3 = apgData; %纵轴：样本

%制图
subplot(3, 1, 1);
plot(x1, y1);
title('PPG waveform');
xlabel('sample');
ylabel('amplitude');

subplot(3, 1, 2);
plot(x2, y2);
title('VPG waveform');
xlabel('sample');
ylabel('amplitude');

subplot(3, 1, 3);
plot(x3, y3);
title('APG waveform');
xlabel('sample');
ylabel('amplitude');

grid on;

numberSample = length(ppgData);

end