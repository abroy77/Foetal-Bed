%--------------------------------------------------------------------------
%3rd Year Group Panda Project: Fetal Movement Sensor Testbed
%--------------------------------------------------------------------------

%Matlab Code for Kick and Hold Profile: consists of a single full extension
%and retraction

clear all;  

%Connect to arduino
a1 = arduino('/dev/cu.usbmodem143101','Uno'); 

%Connect to the actuator in digital pin 9, using servo, allows it to be controlled
%to max and min length. Specifications for max and min pulse duration come 
%from the datasheet of the actuator
one = servo(a1, 'D9','MinPulseDuration', 1*10^-3, 'MaxPulseDuration', 2*10^-3);


for pos = 0:0.01:1    %Extend fully to max position 1
    writePosition(one, pos);
end

pause(2);  %Hold for 2 seconds at max extension

for pos = 1:-0.01:0  
    writePosition(one, pos);   %Retract fully to min position 0
end



pause(2);   %Hold for 2 seconds at min position; avoids overloading 

clear all;  %Clears workspace to avoid errors with saved variables when 
%calling the function again from guide