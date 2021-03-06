%--------------------------------------------------------------------------
%3rd Year Group Panda Project: Fetal Movement Sensor Testbed
%--------------------------------------------------------------------------

%Matlab Code for Kick and Hold Profile: consists of a single full extension
%and retraction

clear all;  

%Connect to arduino
a1 = arduino('/dev/cu.usbmodem1431','Uno'); 
a2 = arduino('/dev/cu.usbmodem1411','Uno'); 

%Connect to the actuator in pin 9, using servo, allows it to be controlled
%to max and min length. Specifications for max and min pulse duration come 
%from the datasheet of the actuator
one = servo(a1, 'D9','MinPulseDuration', 1*10^-3, 'MaxPulseDuration', 2*10^-3);
two = servo(a2, 'D9','MinPulseDuration', 1*10^-3, 'MaxPulseDuration', 2*10^-3);


for pos = 0:0.01:1    %Extend fully to max position 1
    writePosition(two, pos);
    writePosition(one, pos);    
end



pause(2);  %Hold for 5 seconds at max extension

for pos = 1:-0.01:0  
    writePosition(two, pos);   %Retract fully to min position 0
    writePosition(one, pos);
end



pause(2);   %Hold for 2 seconds at min position; avoids overloading 

clear all;  %Clears workspace to avoid errors with saved variables when 
%calling the function again from guide