%--------------------------------------------------------------------------
%3rd Year Group Panda Project: Fetal Movement Sensor Testbed
%--------------------------------------------------------------------------

%Matlab Code for Pulsated Kicks Profile: consists of a series of 4 kicks
%that go to maximum extension and retract to 60% maximum length, having a 2
%second delay between each action

clear all;

%Connect to arduino
a1 = arduino('/dev/cu.usbmodem1431','Uno');
a2 = arduino('/dev/cu.usbmodem1411','Uno');
%Connect to the actuator
one = servo(a1, 'D9','MinPulseDuration', 1*10^-3, 'MaxPulseDuration', 2*10^-3);
two = servo(a2, 'D9','MinPulseDuration', 1*10^-3, 'MaxPulseDuration', 2*10^-3);

%First kick
for pos = 0:0.01:1  
    writePosition(one, pos);  %Fully extend to 100%   
    writePosition(two, pos);
end

pause(2);   %Hold for 2 seconds

%For loop for 3 more kicks
for i = 1:3 
    for pos = 1:-0.01:0.6
        writePosition(one,pos);   %Retract to 60% of maximum length
        writePosition(two, pos);
    end
    pause(2);
    for pos = 0.6:0.01:1
        writePosition(one,pos);   %Extend again to 100% max length
        writePosition(two, pos);
    end
    pause(2);
end

for pos = 1:-0.01:0
    writePosition(one,pos);   %Brings back to min length
    writePosition(two, pos);
end

pause(2);   %Hold for 2 seconds at min position; avoids overloading 

clear all;  %Clears workspace