%Lowpass filter implementation for Third Year Project 9/3/19
total_time = 26;

lowpass_filter_signal = lowpass(acoustic_results(2,:), 0.01)
time = (total_time/15).*acoustic_results(1,:);

plot(time, lowpass_filter_signal)
xlabel('Time (s)');
ylabel('Amplitude');
title('Filtered Signal');
axis([0 26 0 1.5]);
