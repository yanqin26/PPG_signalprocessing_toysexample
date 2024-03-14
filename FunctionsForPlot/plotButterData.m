function numberSample = plotButterData(rowPpgData, ppgData)
%该函数用于绘制PPG信号的图像
%输入参数：main函数中传入的ppg信号
%输出参数：ppg信号的个数
figure (3);

%坐标建立
x1 = 1 : length(ppgData); %横轴：样本个数
y1 = rowPpgData; %纵轴：原始ppg样本
y2 = ppgData; %纵轴：处理后样本

%制图
plot(x1, y1, "b");

grid on;
hold on;

plot(x1, y2, "r");

hold off;
legend("RowPPG", "FilteredPPG")

title('PPG waveform');
xlabel('sample');
ylabel('amplitude');

numberSample = length(ppgData);

end