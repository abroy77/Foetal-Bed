%Peak detection algorithm for Third Year Project 9/3/19

%Create signal and time vectors
signal = acoustic_results(2,:);
time = acoustic_results(1,:);

%Normalise signal with mean = 0 and std ~ 1
signal_center = abs((signal-mean(signal))/std(signal));

%Find peaks and store y-value (pks) and x-value (locs)
[pks,locs] = findpeaks(signal_center);

%Locate local maxima in intervals of length(signal)/25 with movmax and store
max_pks_sections = movmax(pks, length(signal)/25);

%Plot top five peaks
%figure(1); plot(time, signal_center, time(max_five_locs), max_five_pks,'or')
figure(1); plot(time, signal)
figure(2); plot(time, signal_center)
figure(3); plot(pks)
figure(4); plot(max_pks_sections); hold on; plot(pks); hold off;



%Method 2: Smooth max_pks_sections such that 5 peaks can be found
smooth_plot = smooth(max_pks_sections, 0.21,'loess');
[smooth_pks, smooth_locs] = findpeaks(smooth_plot);

%Plot original signal with kick indication
figure(6); plot(time, signal) %plot(time, signal_center, time(locs(smooth_locs)), smooth_pks,'or')
for iter = 1:length(smooth_locs)
    hold on
    y = ylim;
    plot([time(locs(smooth_locs(iter))) time(locs(smooth_locs(iter)))], [y(1), y(2)]) 
end
hold off
figure(5)
plot(smooth_plot)
hold on 
plot(pks)
hold off

