%--------------------------------------------------------------------------
%3rd Year Group Panda Project: Fetal Movement Sensor Testbed
%--------------------------------------------------------------------------

%Matlab Code for Custom Kicking Profile: consists of a function which takes
%in 4 variables from the user via de UI and hence runs a kicking profile
%with these specifications

function customprof_for2(numkicks1, extension1, retraction1)

a = arduino('/dev/cu.usbmodem1431','Uno');
a2 = arduino('/dev/cu.usbmodem14111','Uno'); 
 
one = servo(a, 'D9','MinPulseDuration', 1*10^-3, 'MaxPulseDuration', 2*10^-3);
two = servo(a2, 'D9','MinPulseDuration', 1*10^-3, 'MaxPulseDuration', 2*10^-3);



extension = extension1/100;
retraction = retraction1 / 100;

numkicks1;
extension1;
retraction1;


for pos = 0:0.01:extension
    writePosition (one,pos);
    writePosition(two, pos);
end

pause(2);

for i = 1:numkicks1-1
    
    for pos = extension:-0.01:retraction
        writePosition (one,pos);
        writePosition(two, pos);
    end
    pause(2);
    for pos = retraction:0.01:extension
        writePosition (one,pos);
        writePosition(two, pos);
    end
    pause(2);
    
end

for pos = extension:-0.01:0
    writePosition (one,pos);
    writePosition(two, pos);
end

pause(2);

clear all;
