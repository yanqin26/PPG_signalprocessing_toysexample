function [endAmplitude, endIndex] = findEndPoint(ppgData, abpData)
%二阶差分的极值点对应ppg信号的起始点
%输出：起始点的幅值，起始点的下标
%输入：ppg信号，abp信号

endAmplitude = [];

%寻找vbp极值点
[endAmplitude, endIndex] = findpeaks(abpData(200:end), MinPeakDistance=2500);
endIndex = endIndex(2:length(endIndex));

for index = 1 : 1 : length(endIndex)
    endAmplitude = ppgData(endIndex);
end

end