%% extract data for tensile test of ecoflex 00_30
% use the import tool above in home>import data. import as column vectors
%dimensions
l = 5;
b = 5;
gauge = 23.37;




%%
plot(Strain,Stress);
title('Ecoflex 00-30');
ylabel('Stress in N/m^2');
xlabel('Strain');
%ylim([18000,38000]);
%xlim([0.5,1.7]);
%%
index=(18000<Stress)&(Stress<38000)&(0.5<Strain)&(Strain<1.7);
newstress=nonzeros(index.*Stress);
newstrain=nonzeros(index.*Strain);

plot(newstrain,newstress);
title('Stress vs Strain');
ylabel('Stress in N/m^2');
xlabel('Strain');
ylim([18000,38000]);
xlim([0.5,1.4]);