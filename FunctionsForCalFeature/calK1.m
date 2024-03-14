function K1 = calK1(startAmplitude, dominantPeakAmplitude, ppgData, startIndex, dicroticNotchIndex)
%求出面积占比K1
%输入
%输出

recWidth = dicroticNotchIndex.' - startIndex; %宽度数组
recHeight = dominantPeakAmplitude - startAmplitude; %高度数组
recArea = recWidth .* recHeight; %各个矩形的面积

ppgArea = [];

%求出各个ppg波的面积
for index = 1 : 1 : length(startIndex) %有多少个起点就有多少个波
    %ppg波对应下标数组
    ppgIndex = [startIndex(index) : dicroticNotchIndex(index)];
    %将下标对应的幅值全部累加，减去起始点幅值基线
    area = sum(ppgData(ppgIndex) - startAmplitude(index));
    ppgArea = cat(1, ppgArea, area);

end

K1 = ppgArea ./ recArea;

end 