%Peak detection algorithm for Third Year Project 9/3/19

%Total time
total_time = 26;

%Fourier Plot
L = length(acoustic_results(2,:));                     
Fs = L/total_time;                           
X = fftshift(fft(acoustic_results(2,:)));
dF = Fs/L;
f = -Fs/2:dF:Fs/2-dF;

figure(7);
plot(f, abs(X)/L);
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('Magnitude Response');
axis([-1 1 0 0.1]);

%Create signal and time vectors
signal = acoustic_results(2,:);
time = (total_time/15).*acoustic_results(1,:);

%Normalise signal with mean = 0 and std ~ 1
signal_center = abs((signal-mean(signal))/std(signal));

%Find peaks and store y-value (pks) and x-value (locs)
[pks,locs] = findpeaks(signal_center);

%Locate local maxima in intervals of length(signal)/25 with movmax and store
max_pks_sections = movmax(pks, length(signal)/25);

%Plot top five peaks
figure(1); plot(time, signal)
xlabel('Time (s)');
ylabel('Amplitude');
title('Original Signal');
axis([0 26 0 1.5]);

figure(2); plot(time, signal_center)
figure(3); plot(pks)
figure(4); plot(max_pks_sections); hold on; plot(pks); hold off;

%Method 2: Smooth max_pks_sections such that 5 peaks can be found
smooth_plot = smooth(max_pks_sections, 0.21,'loess');
[smooth_pks, smooth_locs] = findpeaks(smooth_plot);

%Plot original signal with kick indication
figure(6); plot(time, signal) %plot(time, signal_center, time(locs(smooth_locs)), smooth_pks,'or')
axis([0 26 0 1.5]);
for iter = 1:length(smooth_locs)
    hold on
    y = ylim;
    plot([time(locs(smooth_locs(iter))) time(locs(smooth_locs(iter)))], [y(1), y(2)]) 
end
xlabel('Time (s)');
ylabel('Amplitude');
title('Estimated Kicks');
hold off

%Print estimated kick times
kick_time = transpose(time(locs(smooth_locs)))

figure(5)
plot(smooth_plot)
hold on 
plot(pks)
hold off

