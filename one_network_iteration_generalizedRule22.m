% "one_network_iteration_generalizedRule22.m"
% generates one iteration of the network
% Inputs:
% inputvector = the initial state, a vector
% parents = neighborhood of each node, obtained with a different function
% d1, d2 = bounds for proportion of ones, 0 <= d1 <= d2 <= 1

function outputvector = one_network_iteration_generalizedRule22(inputvector,parents,d1,d2)

for index=1:length(inputvector)
    inputnodes = parents{1,index};
    flag = 0;
    for j = parents{1,index}
        if j == index
            flag = 1;
        end
    end
    if flag == 0
        inputnodes = [inputnodes index];
    end
    t = inputvector(inputnodes);
    if d1 <= sum(t)/length(t) & sum(t)/length(t) <= d2
        outputvector(index) = 1;
    else
        outputvector(index) = 0;
    end
    if sum(t)/length(t) == 0 || sum(t)/length(t) == 1
        outputvector(index) = 0;
    end
end
