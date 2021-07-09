% "randominitialstate.m"
% Inputs:
% N = number of nodes

function initialstate = randominitialstate(N)

numberblackcells = unidrnd(N);
%numberblackcells = 1;
x = randperm(N);
blackcells = x(1:numberblackcells);
initialstate = zeros(1,N);
initialstate(blackcells) = ones(1,numberblackcells);



