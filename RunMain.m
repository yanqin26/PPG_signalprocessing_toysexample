%此文件作为主运行文件，调用函数，脚本，并得到最终的特征值数据文件
%使用数据为指尖光电容积脉搏波，采样率为 4000Hz
%版本: 1.0 测试用，0次迭代
%作者: 陈羿乔，2024年2月12日 - 2024年2月14日

clc; clear; close all;
format compact; %命令行显示不换行

%1.找波峰使用自适应阈值法(现有代码找波峰不准确)

%添加路径
addpath(".\FunctionsForPlot"); %用于绘制图像
addpath(".\FunctionsForFilter"); %用于设计滤波器
addpath(".\FunctionsForPreFeature"); %用于获取计算特征所需要的数据
addpath(".\FunctionsForCalFeature"); %用于计算特征
addpath(".\Table"); %数据说明表单

%读取PPG文件
rowPpgData = csvread("ppg_sample.csv");

%常量
FS = 4000; %采样频率，4000Hz
TS = 1 / 4000; %采样周期，0.25ms
FC = 62.5; %截止频率，62.5Hz

%绘制原始PPG信号图像，得到数据样本总量
numberRowData = plotRowData(rowPpgData);

%-----------------------------------滤波-----------------------------------

%陷波器过滤
ppgData = notchFilterForPpg(rowPpgData, TS, 50); %消除50Hz工频杂讯干扰
plotNotchData(ppgData); %肉眼无区别，说明可能该数据提前做过陷波器过滤

%通过巴特沃斯低通滤波器
ppgData = butterworthFilterForPpg(ppgData, FS, FC, 3); %3阶滤波器
plotButterData(rowPpgData, ppgData);

%----------------------------------时域预特征提取---------------------------------

%提取ppg信号的速度波VPG与加速度波APG
[vpgData, apgData] = diffForPpg(ppgData); %一阶二阶差分
plotDiffData(ppgData, vpgData, apgData);

%获取信号主波幅值
[dominantPeakAmplitude, dominantPeakIndex] = peakForPpg(ppgData,"dominant");
plotDominantPeakData(ppgData, dominantPeakIndex, dominantPeakAmplitude);

%获取信号重搏波幅值
[reboundPeakAmplitude, reboundPeakIndex] = peakForPpg(ppgData,"rebound");
plotReboundPeakData(ppgData, reboundPeakIndex, reboundPeakAmplitude);

%获取主波峰间距
dominantPeak2Peak = peak2peak(dominantPeakIndex, TS);

%获取重搏波峰间距
reboundPeak2Peak = peak2peak(reboundPeakIndex, TS);

%获取降中峡
[dicroticNotchAmplitude, dicroticNotchIndex] = dicroticNotchPpg(ppgData);
plotDicroticNotchData(ppgData, dicroticNotchIndex, dicroticNotchAmplitude);

%获取降中峡间距
dicroticNotch2Notch = notch2notch(dicroticNotchIndex, TS);

%获取脉搏波段的起始点
[startAmplitude, startIndex] = findStartPoint(ppgData, apgData);
plotStartData(ppgData, startIndex, startAmplitude);

%获取脉搏波段的终点(第二个波的起始点是第一个波的终点)
[endAmplitude, endIndex] = findEndPoint(ppgData, apgData);
plotEndData(ppgData, endIndex, endAmplitude);

%----------------------------------时域特征工程---------------------------------

%特征1：收缩期时间占比(ppg升支时间/心动周期时间)
ratioSysTime = ratioForSysTime(dominantPeakIndex,startIndex, endIndex, TS);
disp("F1: ratioSysTime = ");
disp(ratioSysTime.');

%特征2：舒张期时间占比(ppg降支时间/心动周期时间)
ratioDiaTime = ratioForDiaTime(dominantPeakIndex,startIndex, endIndex, TS);
disp("F2: ratioDiaTime = ");
disp(ratioDiaTime.');

%特征3：降中峡相对高度(降中峡高度 / 主波高度)
ratioNotchHeight = ratioDicroticNotchHeight(dominantPeakAmplitude, dicroticNotchAmplitude, startAmplitude, endAmplitude);
disp("F3: ratioNotchHeight = ");
disp(ratioNotchHeight.');

%特征4：重搏波相对高度(重搏波高度 / 主波高度)
ratioReboundHeight = ratioReboundPeakHeight(dominantPeakAmplitude, reboundPeakAmplitude, startAmplitude, endAmplitude);
disp("F4: ratioReboundHeight = ");
disp(ratioReboundHeight.');

%特征5：主波峰间距(可能意义不大)
disp("F5: dominantPeak2Peak = ");
disp(dominantPeak2Peak.');

%特征6：重搏波峰间距(可能意义不大)
disp("F6: reboundPeak2Peak = ");
disp(reboundPeak2Peak);

%特征7：降中峡间距(可能意义不大)
disp("F7: dicroticNotch2Notch = ");
disp(dicroticNotch2Notch);

%特征8：心率 (或许可以改成每一个波预测一次心率)
heartRate = calHeartRate(dominantPeak2Peak, reboundPeak2Peak, dicroticNotch2Notch);
disp("F8: heartRate = ");
disp(heartRate);

%特征9到特征11算法有瑕疵
%特征9：面积占比K1
K1 = calK1(startAmplitude, dominantPeakAmplitude, ppgData, startIndex, dicroticNotchIndex);
disp("F9: K1 = ");
disp(K1.');

%特征10：面积占比K2
K2 = calK2(startAmplitude, dominantPeakAmplitude, ppgData, dicroticNotchIndex, endIndex);
disp("F10: K2 = ");
disp(K2.');

%特征11：总面积占比
K = K1 + K2;
disp("F11: K = ");
disp(K.');

%{同样的分析方式也可以用在VPG和APG上,一共可以得到近三十种特征
% 但收益不大(精度不一定提升，时间复杂度内存复杂度指数式上升)
%}


%----------------------------------频域预特征提取---------------------------------

%绘制原始ppg信号以及滤波过后的ppg信号的幅值频谱(去除了直流分量过后的)
plotFrequency(FS, rowPpgData, ppgData);



























