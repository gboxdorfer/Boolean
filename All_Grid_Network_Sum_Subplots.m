%Grid_Network provides output of 99 x 99 network, along with density of
%ones by time and by node, with sum of density of ones 

clear;clf;
 
N = 99; %#nodes
k = 2; %#parents for each node (neighborhood size)
it = 99; %#iterations
rule_name = '126'; %the rule number with quotes

%Some combos tried by Dora
%k = 2; rule_name = '126'; 
%k = 2; rule_name = '30'; 
%k = 2; rule_name = '126'; 
%k = 6; rule_name = '30'; 
%k = 6; rule_name = '12345678';
 
marker = 2;
fsize = 14;
numlines = 2;
numcolumns = 2;
numplot = 1;
linewidth = 2;
 
% generate the neighborhood for each node
parents = parents_CA_includingthenode(N,k,N); %CA: k adjacent nodes
%parents = parents_random(N,k,N); %random choice of k parents
 
% generate the initial state of the network
A = zeros(it,N); A(1,floor(N/2))=1; %one black cell
%A = ones(it,N);
%A = randominitialstate(N); %random initial state
p(1) = sum(A(1,:));

% convert the rule to a binary array
rule = binary_rule(rule_name, k);

% iterate the network 
for j=2:it
    A(j,:) = one_network_iteration_rules(A(j-1,:),parents,rule);
    if mod(j,100) == 0
        display(['# iterations performed so far: ', num2str(j)]);
    end
    p(j) = sum(A(j,:));
end
 
% adjust the matrix for plots
A=A'; B=[];
[d1,d2]=size(A);
for i=1:d1
    B(i,:)=A(N-(i-1),:);
end
%%%%%%%%%%%%%%%%%%%%%
%density of ones by nodes (denoted q(node)), and over the entire network
C = sum(A,2); %density of ones by node instead of time
TotalNodes = sum(C);
 
% plot the pattern formation by time steps 
subplot(numlines,numcolumns,numplot);
for j=1:d1
    for i=1:d2
        if B(j,i) == 1
            plot((i-1),d1-(j-1),'sk','MarkerSize',marker,...
                'MarkerEdgeColor','k','MarkerFaceColor','k', 'Markersize',6);
            hold on;
        else
            plot((i-1),d1-(j-1),'sy','MarkerSize',marker,...
                'MarkerEdgeColor','y','MarkerFaceColor','y', 'Markersize',6);
        end
    end
end
%axis equal;
axis([0 it 0 N]);
axis off;
axis fill;
title(['Pattern by time steps, N=',num2str(N), ', k=',num2str(k),...
    ', Rule = ',rule_name,', iterations = ',num2str(it)],...
    'FontSize',14,'FontWeight','bold');
numplot = numplot+1;

% plot the pattern formation by nodes
subplot(numlines,numcolumns,numplot);
for j=1:d1
    for i=1:d2
        if B(j,i) == 1
            plot(d1-(j-1),d2-(i-1),'sk','MarkerSize',marker,...
                'MarkerEdgeColor','k','MarkerFaceColor','k', 'Markersize',6);
            hold on;
        else
            plot(d1-(j-1),d2-(i-1),'sy','MarkerSize',marker,...
                'MarkerEdgeColor','y','MarkerFaceColor','y', 'Markersize',6);
        end
    end
end
axis([0 N 0 it]);
axis off;
axis fill;
title(['Pattern by nodes, N=',num2str(N), ', k=',num2str(k),...
    ', Rule = ',rule_name,', iterations = ',num2str(it)],...
    'FontSize',14,'FontWeight','bold');
numplot = numplot+1;

%%%%%%%%%%%%%%%%%%%%
%plot of density of ones by time steps + the overall density of the
%network averaged over nodes snd time steps.
subplot(numlines,numcolumns,numplot);
plot(p,'LineWidth',linewidth);
axis([0 it 0 N]);
xlabel('t','FontSize',fsize,'FontWeight','bold');
ylabel('p(t)','FontSize',fsize,'FontWeight','bold');
title('Activity by time steps','FontSize',fsize,'FontWeight','bold');

%%%%%%%%%%%%%%%%%%%%
%plot of density of ones by node + the overall density of the
%network averaged over nodes snd time steps.
numplot = numplot+1;
subplot(numlines,numcolumns,numplot);
plot(C,'LineWidth',linewidth);
axis([0 N 0 it]);
xlabel('node number','FontSize',fsize,'FontWeight','bold');
ylabel('q(node)','FontSize',fsize,'FontWeight','bold');
title('Activity by nodes','FontSize',fsize,'FontWeight','bold');
legend(['Total Active Nodes = ', num2str(TotalNodes)],'Location','southeast');