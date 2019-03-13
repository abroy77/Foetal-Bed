%--------------------------------------------------------------------------
%3rd Year Group Panda Project: Fetal Movement Sensor Testbed
%--------------------------------------------------------------------------

%Matlab Code for Custom Kicking Profile: consists of a function which takes
%in 4 variables from the user via de UI and hence runs a kicking profile
%with these specifications

function customprof2(numkicks, extension, retraction, delay)

a = arduino('/dev/cu.usbmodem1431','Uno');
 
s = servo(a, 'D9','MinPulseDuration', 1*10^-3, 'MaxPulseDuration', 2*10^-3);

extension = extension/100;
retraction = retraction / 100;

for pos = 0:0.01:extension
    writePosition (s,pos);
end

pause(2);

for i = 1:numkicks-1
    
    for pos = extension:-0.01:retraction
        writePosition(s, pos);        
    end
    pause(delay);
    for pos = retraction:0.01:extension
        writePosition(s,pos);         
    end
    pause(2);
    
end

for pos = extension:-0.01:0
    writePosition(s, pos);
end

pause(2);

clear all;
