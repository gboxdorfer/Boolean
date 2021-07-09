%Grid_Network provides output of 99 x 99 network, along with density of
%ones by time and by node, with sum of density of ones 

clear;clf;
 
N = 99; %#nodes
k = 4; %#parents for each node (neighborhood size)
it = 99; %#iterations
%D1 = 0; D2 = 1; %generalized Rule 126
%D1 = 1/(k+1); D2 = 1/(k+1); %generalized Rule 22
D1 = 0; D2 = 0.75; %changing D1, D2 values 
 
marker = 2;
fsize = 14;
numlines = 3;
numcolumns = 1;
numplot = 1;
linewidth = 2;
 
% generate the neighborhood for each node
parents = parents_CA_includingthenode(N,k,N); %CA: k adjacent nodes
%parents = parents_random(N,k,N); %random choice of k parents
 
% generate the initial state of the network
%A = zeros(it,N); A(1,floor(N/2))=1; %one black cell
%A = ones(it,N);
A = randominitialstate(N); %random initial state
p(1) = sum(A(1,:));
 
% iterate the network and count the ON cells at each step
for j=2:it
A(j,:) = one_network_iteration_generalizedRule22(A(j-1,:),parents,D1,D2);
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
 

% plot the pattern formation and the density of ones
subplot(numlines,numcolumns,numplot);
for j=1:d1
    for i=1:d2
        if B(j,i) == 1
            plot(d1-(j-1),d2-(i-1),'sk','MarkerSize',marker,...
                'MarkerEdgeColor','k','MarkerFaceColor','k');
            hold on;
        else
            plot(d1-(j-1),d2-(i-1),'sy','MarkerSize',marker,...
                'MarkerEdgeColor','y','MarkerFaceColor','y');
        end
    end
end
axis equal;
axis([1 N 1 it]);
axis off;
title(['Network evolution, N=',num2str(N), ', k=',num2str(k),...
    ', d_1 = ',num2str(D1),', d_2 = ',num2str(D2)],...
    'FontSize',14,'FontWeight','bold');
numplot = numplot+1;
subplot(numlines,numcolumns,numplot);
plot(p,'LineWidth',linewidth);
xlabel('t','FontSize',fsize,'FontWeight','bold');
ylabel('p(t)','FontSize',fsize,'FontWeight','bold');
title('Active nodes, by time steps','FontSize',fsize,'FontWeight','bold');
%%%%%%%%%%%%%%%%%%%%
%plot of density of ones by node + the overall density of the
%network averaged over nodes snd time steps.
numplot = numplot+1;
subplot(numlines,numcolumns,numplot);
plot(C,'LineWidth',linewidth);
xlabel('node number','FontSize',fsize,'FontWeight','bold');
ylabel('q(node)','FontSize',fsize,'FontWeight','bold');
title('Active Nodes, by nodes','FontSize',fsize,'FontWeight','bold');
legend(['Total Active Nodes = ', num2str(TotalNodes)],'Location','southeast');