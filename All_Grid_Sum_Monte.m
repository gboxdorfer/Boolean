%Grid_Sum_Monte_Carlo runs many iterations of the Grid_Sum_Analysis 
 
clear;
clf;
 
num_of_runs = 100;
 
N = 99; %#nodes
k = 2; %#parents for each node (neighborhood size)
it = 99; %#iterations
rule_name = '30'; %the rule number with quotes
 
marker = 2;
fsize = 14;
numlines = 3;
numcolumns = 1;
numplot = 1;
linewidth = 2;

for n = 1:num_of_runs
    clear A p B C
    
% generate the neighborhood for each node
%parents = parents_CA_includingthenode(N,k,N); %CA: k adjacent nodes
parents = parents_random(N,k,N); %random choice of k parents
%the choice of parents is fixed when averaging over initial conditions
    
% generate the initial state of the network
A = zeros(it,N); A(1,floor(N/2))=1; %one black cell
%A = ones(it,N);
%A = randominitialstate(N); %random initial state
p(1) = sum(A(1,:));
 
% convert the rule to a binary array
rule = binary_rule(rule_name, k);

    % iterate the network and count the ON cells at each step
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
    
    %density of ones by nodes (denoted q(node)), and over the entire network
    C = sum(A,2); %density of ones by node instead of time
    TotalDensity(n) = sum(C);
    
end
plot(TotalDensity);
xlabel('runs');
ylabel('Number of ON nodes');
title('Activity by node (across time steps)','FontWeight','bold');
MonteTotalDensity = mean(TotalDensity);
legend(['Avg Total Activity = ', num2str(MonteTotalDensity)],'Location','southeast');
disp(MonteTotalDensity)