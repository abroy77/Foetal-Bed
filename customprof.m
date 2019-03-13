%--------------------------------------------------------------------------
%3rd Year Group Panda Project: Fetal Movement Sensor Testbed
%--------------------------------------------------------------------------

%Matlab Code for Custom Kicking Profile: consists of a function which takes
%in 4 variables from the user via de UI and hence runs a kicking profile
%with these specifications


%This function takes in from user via the UI the following variables: number 
%of kicks for custom profile, percentage extension of kick, percentage
%retraction between kicks, delay between kicks
function customprof(numkicks, extension, retraction, delay)

%Connect to arduino
a = arduino('/dev/cu.usbmodem143101','Uno');    

%Connect to the actuator
s = servo(a, 'D9','MinPulseDuration', 1*10^-3, 'MaxPulseDuration', 2*10^-3)

extension = extension/100;  %convert percentage extension to decimal
retraction = retraction / 100;  %convert percentage retraction to decimal

for pos = 0:0.01:extension
    writePosition (s,pos);  %initial kick to extension requested by user
end

pause(2);

%for loop for the remaining number of kicks requested by user 
for i = 1:numkicks-1    %minus 1 since first kick has already taken place
    
    for pos = extension:-0.01:retraction
        writePosition(s, pos);  %retract kick to requested retraction
    end
    pause(delay);   %accounts for the delay specified by user
    for pos = retraction:0.01:extension
        writePosition(s,pos);   %extends again to requested extension       
    end
    pause(2);   %to avoid overloading
    
end

for pos = extension:-0.01:0
    writePosition(s, pos);  %final retraction back to initial position 
end

pause(2);

clear all;
