%Lowpass filter implementation for Third Year Project 9/3/19

lowpass_filter_signal = lowpass(acoustic_results(2,:), 0.01)
time = acoustic_results(1, :);

plot(time, lowpass_filter_signal)