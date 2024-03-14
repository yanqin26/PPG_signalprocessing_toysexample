function outPutData = notchFilterForPpg(ppgData, TS, FC)
%陷波器: 消除特定频率干扰
%输入：ppg信号, 采样周期，陷波频率
%输出：去除特定频率干扰后的ppg信号

%陷波器传递函数
alpha = -2 * cos(2 * pi * FC * TS);
beta = 0.96;

b = [1, alpha, 1];
a = [1, alpha * beta, beta^2];

outPutData = dlsim(b, a, ppgData);

end

