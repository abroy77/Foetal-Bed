%--------------------------------------------------------------------------
%3rd Year Group Panda Project: Fetal Movement Sensor Testbed
%--------------------------------------------------------------------------

%Matlab Code for Custom Kicking Profile: consists of a function which takes
%in 4 variables from the user via de UI and hence runs a kicking profile
%with these specifications

function customprof_for2_delay(numkicks1, extension1, retraction1, numkicks2, extension2, retraction2, delay3)

% a = arduino('/dev/cu.usbmodem1431','Uno');
%  
% one = servo(a, 'D9','MinPulseDuration', 1*10^-3, 'MaxPulseDuration', 2*10^-3);

if (numkicks1<numkicks2)
    temp=numkicks2;
    numkicks2=numkicks1;
    numkicks1=temp;
end

counter=0;

for i=1:numkicks1
    
    customprof(1, extension1, retraction1, 2);
    
    if (counter<numkicks2)
         customprof2(1, extension2, retraction2, 2);
         counter=counter+1;
    end
    
end
% 
% for pos = 0:0.01:extension1
%     writePosition (one,pos);
% end
% 
% a2 = arduino('/dev/cu.usbmodem1411','Uno'); 
% two = servo(a2, 'D9','MinPulseDuration', 1*10^-3, 'MaxPulseDuration', 2*10^-3);
% 
% pause(2);
% 
% for i = 1:numkicks1-1
%     
%     for pos = extension1:-0.01:retraction1
%         writePosition (one,pos);
%     end
%     pause(2);
%     for pos = retraction1:0.01:extension1
%         writePosition (one,pos);
%     end
%     pause(2);
%     
% end
% 
% pause(delay3);
% 
% for i = 1:numkicks2-1
%     
%     for pos = extension2:-0.01:retraction2
%         writePosition (two,pos);
%     end
%     pause(2);
%     for pos = retraction2:0.01:extension2
%         writePosition (two,pos);
%     end
%     pause(2);
%     
% end
% 
% for pos = extension1:-0.01:0
%     writePosition (one,pos);
% end
% 
% for pos = extension2:-0.01:0
%     writePosition (two,pos);
% end
% 
% pause(2);