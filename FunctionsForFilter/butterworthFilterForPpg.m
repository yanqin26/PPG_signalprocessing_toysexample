function outPutData = butterworthFilterForPpg(ppgData, FS, FC, degree)
%巴特沃斯低通滤波器 去除PPG信号噪声
%输入：ppg信号，采样频率，截止频率，滤波器阶数
%输出：去除杂讯的ppg信号

%归一化截止频率
WN = FC / (FS / 2);

%巴特沃斯滤波器参数序列
[b, a] = butter(degree, WN, "low");

%滤波处理
outPutData = filtfilt(b, a, ppgData);

end
