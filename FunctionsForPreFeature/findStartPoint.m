function [startAmplitude, startIndex] = findStartPoint(ppgData, abpData)
%二阶差分的极值点对应ppg信号的起始点
%输出：起始点的幅值，起始点的下标
%输入：ppg信号，abp信号

startAmplitude = [];

%寻找vbp极值点
[startAmplitude, startIndex] = findpeaks(abpData(200:end), MinPeakDistance=2500);
startIndex = startIndex(1:length(startIndex) - 1);

for index = 1 : 1 : length(startIndex)
    startAmplitude = ppgData(startIndex);
end

end