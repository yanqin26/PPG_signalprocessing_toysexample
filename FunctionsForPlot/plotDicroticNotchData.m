function numberRowSample = plotDicroticNotchData(ppgData, dicroticNotchIndex, dicroticNotchAmplitude)
%该函数用于绘制原始PPG信号主波的图像
%输入参数：csv文件PPG信号
%输出参数：ppg信号的个数
figure (7);

%坐标建立
x1 = 1 : length(ppgData); %横轴：样本个数
y1 = ppgData; %纵轴：样本

%制图
plot(x1, y1);
hold on;
plot(dicroticNotchIndex, dicroticNotchAmplitude, "o");
title('DicroticNotchData');
xlabel('sample');
ylabel('amplitude');
end