function heartRate = calHeartRate(dominantPeak2Peak, reboundPeak2Peak, dicroticNotch2Notch)
%计算心率
%输出：心率整数
%输入：主波峰间距，重搏波峰间距，降中峡间距

%求出大概的心动周期(使用与上一文件不一样的方式)
cardiacCycle = (mean((dominantPeak2Peak + reboundPeak2Peak + dicroticNotch2Notch) / 3));

n = length(cardiacCycle);
n = round(n / 2);
heartRate = int32(60 / cardiacCycle(n));

end