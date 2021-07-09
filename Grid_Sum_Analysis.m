%Grid_Sum_Analysis provides only the average density of ones over network

clear;clf;
 
N = 99; %#nodes
k = 2; %#parents for each node (neighborhood size)
it = 99; %#iterations
D1 = 0; D2 = 1; %generalized Rule 126
 
% generate the neighborhood for each node
parents = parents_CA_includingthenode(N,k,N); %CA: k adjacent nodes
%parents = parents_random(N,k,N); %random choice of k parents
 
% generate the initial state of the network
A = zeros(it,N); A(1,floor(N/2))=1; %one black cell
%A = ones(it,N);
%A = randominitialstate(N); %random initial state
p(1) = sum(A(1,:));
 
% iterate the network and count the ON cells at each step
for j=2:it
A(j,:) = one_network_iteration_generalizedRule22(A(j-1,:),parents,D1,D2);
p(j) = sum(A(j,:));
end
 

%%%%%%%%%%%%%%%%%%%%%
%density of ones by nodes (denoted q(node)), and over the entire network
C = sum(A,2); %density of ones by node instead of time
TotalNodes = sum(C);

disp(TotalNodes)

