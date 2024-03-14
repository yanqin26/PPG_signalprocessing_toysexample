function [dicroticNotchAmplitude, dicroticNotchIndex] = dicroticNotchPpg(ppgData)
%获取降中峡
%输出：降中峡幅值，降中峡下标
%输入：ppg信号

dicroticNotchIndex = [];
dicroticNotchAmplitude = [];

%将ppg信号反转，此时波峰变为波谷，波谷变为波峰
inversePpgData = -ppgData;

%找出反转后的图像中所有波峰
[allPeakAmplitude, allPeakIndex] = findpeaks(inversePpgData, MinPeakDistance=500);

%获取降中峡坐标
for index1 = 1 : 1 : length(allPeakIndex)
    if allPeakAmplitude(index1) < 0.016
        dicroticNotchIndex = cat(2, dicroticNotchIndex, allPeakIndex(index1));
    end
end

for index2 = 1 : 1 : length(dicroticNotchIndex)
    dicroticNotchAmplitude = cat(2, dicroticNotchAmplitude, ppgData(dicroticNotchIndex(index2)));
end


end