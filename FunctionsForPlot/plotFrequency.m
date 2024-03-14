function numberSample = plotFrequency(FS, rowPpgData, ppgData)
%该函数用于绘制PPG信号的图像
%输入参数：main函数中传入的ppg信号
%输出参数：ppg信号的个数
figure (10);

numberSample = length(rowPpgData);

%使用fft得出离散傅里叶变换，并将零频分量移动到数组中心
y1 = fftshift(fft(rowPpgData ./ numberSample));
x=linspace(-FS/2,FS/2-1,numberSample);
plot(x, abs(y1), "b"); %双边频谱幅度图

grid on;
hold on;

y2 = fftshift(fft(ppgData ./ numberSample));
plot(x, abs(y2), "r");

hold off;
legend("RowPPG", "FilteredPPG")

title("FFT");
xlabel("frequency");
ylabel("amplitude");

end