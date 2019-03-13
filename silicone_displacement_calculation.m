%code to calculate displacement of silicone

%dimensions of silicone in m
length=0.14;
breadth=length;
height=0.025;


% Material properties of silicone in Pa
E=46000;
nu=0.4; % Poisson Ration

% Stress to be applied in longitudinal cross section in Pa
stress=25400;

%calling the functions
max_length(stress,E,nu,length)
force(length,height,stress)

function disp=max_length(stress,E,nu,length)
disp=stress*length/E;
disp=disp*(1-nu);
disp=disp+length;
end

function f = force(length,height,stress)
f=stress*length*height;
end


