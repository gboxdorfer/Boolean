% "parents_random.m"
%pa = parents_random(N,k,M)
%N=number nodes, k=number parents, M = number nodes w/ k parents
%generate k parents randomly from N-1 remaining nodes
%so a node cannot be its own parent

function pa = parents_random(N,k,M)

pa = cell(1,N);
for n = 1:M(1)
    u = randperm(N);
    pa{1,n} = u(1:k(1))
    for i=1:k(1)
        if pa{1,n}(i) == n;
           pa{1,n}(i) = u(k(1)+1);
        end
    end
    pa{1,n} = sort(pa{1,n});
end
if length(M) > 1
    for j = 1:length(M)-1
        for n = M(j)+1:M(j)+M(j+1)
            u = randperm(N);
            pa{1,n} = u(1:k(j+1));
            for i=1:k(j+1)
                if pa{1,n}(i) == n;
                    pa{1,n}(i) = u(k(j+1)+1);
                end
            end
            pa{1,n} = sort(pa{1,n});
        end
    end
end