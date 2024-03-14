function [peakAmplitude, peakIndex] = peakForPpg(ppgData, type)
%此函数用于寻找到峰值以及坐标索引
%输出：峰值，峰值索引
%输入：ppg信号,波峰类型字符串

[dominantPeakAmplitude, dominantPeakIndex] = findpeaks(ppgData, MinPeakDistance=2000, MinPeakHeight=0.002);
[allPeakAmplitude, allPeakIndex] = findpeaks(ppgData, MinPeakDistance=800, MinPeakHeight=-0.015);
reboundPeakAmplitude = [];
reboundPeakIndex = [];

%获取主波
if strcmp(type, "dominant")
    peakAmplitude = dominantPeakAmplitude;
    peakIndex = dominantPeakIndex;

%获取重搏波
elseif strcmp(type, "rebound")
    %判断出所有峰值中哪些元素与主波峰值中相同
    listContain = ismember(allPeakIndex, dominantPeakIndex);
    
    %循环遍历listContain非零值下标，将allPeakIndex中非主波元素拼接进reboundPeak数组
    for index = 1 : 1 : length(allPeakIndex)
        if listContain(index) == 0
            reboundPeakAmplitude = cat(2, reboundPeakAmplitude, allPeakAmplitude(index));
            reboundPeakIndex = cat(2, reboundPeakIndex, allPeakIndex(index));
        end
    end

    peakAmplitude = reboundPeakAmplitude;
    peakIndex = reboundPeakIndex;

end



end