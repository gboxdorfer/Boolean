%Grid_Network provides output of 99 x 99 network, along with density of
%ones by time and by node, with sum of density of ones WITHOUT PLOT 

clear;clf;
 
N = 99; %#nodes
k = 2; %#parents for each node (neighborhood size)
it = 99; %#iterations
rule_name = '234'; %the rule number with quotes
 
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
TotalNodes