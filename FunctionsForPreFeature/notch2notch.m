function distance = notch2notch(Index, TS)
%获取峰间距离
%输出：峰间距离数组，以时间计算
%输入：波峰下标数组，采样周期

%峰间样本数
Notch2NotchSample = diff(Index);
%峰间距离
distance = Notch2NotchSample * TS;


end