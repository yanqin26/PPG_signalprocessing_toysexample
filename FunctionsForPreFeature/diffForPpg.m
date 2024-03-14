function [vpgData, apgData] = diffForPpg(ppgData)
%求得ppg信号的速度波(一阶差分)，加速度波(二阶差分)
%输入：ppg信号
%输出：速度波，加速度波

vpgData = diff(ppgData);
apgData = diff(ppgData, 2);


end