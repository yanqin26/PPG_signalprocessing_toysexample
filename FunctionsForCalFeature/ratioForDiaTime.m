function ratioDiaTime = ratioForDiaTime(dominantPeakIndex,startIndex, endIndex, TS)
%函数用于计算收缩期时间占比
%输出：收缩期时间占比
%输入：主波下标用于计算升支时间；起始点下标，终点下标用于计算心动周期；采样周期

%升支时间 = 升支样本数 * 采样周期
raiseTime = (dominantPeakIndex - startIndex) * TS;

%心动周期时间 = 心动周期样本数 * 采样周期
cardiacCycle = (endIndex - startIndex) * TS;

%降支时间 = 心动周期时间 - 升支时间
DiaTime = cardiacCycle - raiseTime;

ratioDiaTime = DiaTime ./ cardiacCycle;

end