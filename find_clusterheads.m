function clusterheads = find_clusterheads(clusters, ID, D, E, wb_1, wb_2, wb_3)

% USAGE
%  clusterheads = find_clusterheads(ID, D, wb_1, wb_2, wb_3)
%
% INPUTS
%  clusters   - [1 x c] cell array with corresponding clusters
%  ID         - [m x m] Interest Distance matrix
%  D          - [m x m] Physical Distance matrix
%  E          - [m x 1] Energy efficiency matrix
%  wb_1        - weight for ID in clusterhead formation
%  wb_2        - weight for D in clusterhead formation
%  wb_3        - weight for E in clusterhead formation
%
% OUTPUTS
%  clusterheads - [1 x c] array with clusterheads for each cluster

% c -> number of clusters
c = size(clusters,2);

clusterheads = zeros(1,c);

for ii = 1:c
    
    if size(clusters{ii},2) == 1
        clusterheads(ii) = clusters{ii};
        continue
    end
    
    sub_ID = submatrix(ID, clusters{ii});
    sub_D = submatrix(D, clusters{ii});
    sub_E = E(clusters{ii});
    
    num_members = size(sub_ID,2);
    
    sub_ID(isinf(sub_ID)) = 0;
    sub_D(isinf(sub_D)) = 0;
    
    IDo = mean(mean(sub_ID));
    Do = mean(mean(sub_D));
    Eo = mean(sub_E);
    
    w = zeros(size(sub_ID));

    for jj = 1:num_members
        for kk = jj+1:num_members
            w(jj,kk) = (wb_1/IDo)*sub_ID(jj,kk) + (wb_2*Do)/sub_D(jj,kk) + (wb_3*Eo)/max(sub_E(jj),sub_E(kk));
        end
    end
    w = w + triu(w,1)';
    
    sp = zeros(size(w));
    for jj = 1:num_members
        sp(jj,:) = simple_dijkstra(w,jj);
    end
    
    sum_sp = sum(sp,2);
    
    CC = zeros(1,size(sp,2));
    for jj = 1:num_members
        CC(jj) = (num_members-1)/sum_sp(jj);
    end
    
    [max_val, max_val_index] = max(CC);
    
    clusterheads(ii) = clusters{ii}(max_val_index);
    
end

end

