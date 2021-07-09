%ClassSize_Class_Rule_N_d_Stats
%Stats fractal dimensions 
%Gretchen Boxdorfer thesis

clear; clf; 
load ClassSize_Class_Rule_N_d.txt;
data = ClassSize_Class_Rule_N_d; 

plot3(data(:,2),data(:,4), data(:,5),'*','MarkerSize',6);
title('d vs N by ECA class, correlation coefficient = 0.8031','Fontsize',14,'FontWeight','bold')
xlabel('ECA class','Fontsize',14,'FontWeight','bold')
ylabel('N','Fontsize',14,'FontWeight','bold')
zlabel('d','Fontsize',14,'FontWeight','bold')
grid on
rotate3d

figure
boxplot(data(:,5), data(:,2));
title('Boxplots by ECA classes','Fontsize',14,'FontWeight','bold')
xlabel('ECA class','Fontsize',14,'FontWeight','bold')
ylabel('d','Fontsize',14,'FontWeight','bold')

y1=anova1(data(25:end,5), data(25:end,2))
title('ANOVA ECA classes','Fontsize',14,'FontWeight','bold')
xlabel('ECA class','Fontsize',14,'FontWeight','bold')
ylabel('d','Fontsize',14,'FontWeight','bold')

y2=anova1(data(220:end,5), data(220:end,2))
title('ANOVA ECA classes','Fontsize',14,'FontWeight','bold')
xlabel('ECA class','Fontsize',14,'FontWeight','bold')
ylabel('d','Fontsize',14,'FontWeight','bold')
