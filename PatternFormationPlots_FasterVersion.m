% Program PatternFormationPlots.m
% Works with CA rules written in quotes, e.g. '126', '22' etc.
% N = number of cells/nodes (N < 25 due to memory limitations)

clear;clf;
N = 25; %#nodes
k = 3; %#parents for each node (neighborhood size)
it = 25; %#iterations
rule_name = '22';%the rule number with quotes
marker = 5;

% generate the neighborhood for each node
parents = parents_CA_includingthenode(N,k,N); %CA: k adjacent nodes
%parents = parents_random(N,k+1,N); %random choice of k parents

% generate the initial state of the network
A = zeros(it,N); A(1,ceil(N/4))=1; A(1,ceil(3*N/4))=1;%one black cell
%A = randominitialstate(N); %random initial state

% convert the rule to a binary array
rule = binary_rule(rule_name, k);

% iterate the network 
for j=2:it
    A(j,:) = one_network_iteration_rules(A(j-1,:),parents,rule);
    if mod(j,100) == 0
        display(['# iterations performed so far: ', num2str(j)]);
    end
end

% adjust the matrix for plots
A=A'; B=[];
[d1,d2]=size(A);
for i=1:d1
    B(i,:)=A(N-(i-1),:);
end

% plot the pattern formation 
display('Plotting the pattern. Please wait...');

%This is a modified code to increase the computational speed
%The code plots the cellular automata states as a black and white image

image(1:N,1:it,255*(1-B)')

axis equal;
%axis([1 d1 1 d2]);
axis off;
title(['CA, N=',num2str(N), ', k=',num2str(k),...
    ', Rule ',rule_name,', iterations=',num2str(it)],'FontSize',14,'FontWeight','bold');

% savefig(strcat('Rule',rule_name,'.fig'))
% saveas(gcf,strcat('Rule',rule_name,'.jpg'))

