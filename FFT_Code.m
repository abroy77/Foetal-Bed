%FFT algorithm for Third Year Project 9/3/19

L = length(acoustic_results(2,:));                     
Fs = L/15;                           
X = fftshift(fft(acoustic_results(2,:)));
dF = Fs/L;
f = -Fs/2:dF:Fs/2-dF;

figure;
plot(f, abs(X)/L);
xlabel('Frequency (Hz)');
title('Magnitude Response');