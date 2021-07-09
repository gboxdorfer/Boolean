% "parents_CA_includingthenode.m"
%pa = parents_CA_includingthenode(N,k,M)
%N=number nodes, k=number parents, M=#nodes w/ k parents
%generate the k nearest nodes as parents
%like in cellular automata

function pa = parents_CA_includingthenode(N,k,M)

pa = cell(1,N);
u = [1:N 1:N 1:N];
for n = 1:M(1)
    pa{1,n} = [u(n+N-floor(k(1)/2):n+N-1) n ...
        u(n+N+1:n+N+k(1)-floor(k(1)/2))];
end
if length(M) > 1
    for j = 1:length(M)-1
        for n = M(j)+1:M(j)+M(j+1)
            pa{1,n} = [u(n+N-floor(k(1)/2):n+N-1) n ...
                u(n+N+1:n+N+k(1)-floor(k(1)/2))];
        end
    end
end
