function ratioNotchHeight = ratioDicroticNotchHeight(dominantPeakAmplitude, dicroticNotchAmplitude, startAmplitude, endAmplitude)
%该函数用于计算降中峡的相对高度
%输出：降中峡的相对高度
%输入：主波幅值，降中峡幅值，起始点幅值，终点幅值

%避免因幅值过小导致的科学计算错误，令放大器增幅100000倍
gain = 100000;

%增幅后的降中峡高度 = gain * (降中峡幅值 - mean(起始点幅值，终点幅值))
notchHeight = gain * ((dicroticNotchAmplitude.') - ((startAmplitude + endAmplitude) ./ 2));

%增幅后的主波高度 = gain * (主波幅值 - mean(起始点幅值，终点幅值))
dominantPeakHeight = gain * (dominantPeakAmplitude - ((startAmplitude + endAmplitude) ./ 2));

%相对高度
ratioNotchHeight = notchHeight ./ dominantPeakHeight;