function clusterheads = find_clusterheads(clusters, ID, D, E, params)

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
    
    num_members = size(clusters{ii},2);
    
    % if cluster has only one member, assign that as clusterhead
    if num_members == 1
        clusterheads(ii) = clusters{ii};
        continue
    end
    
    sub_ID = submatrix(ID, clusters{ii});
    sub_D = submatrix(D, clusters{ii});
    sub_E = E(clusters{ii});
    
    sub_ID(isinf(sub_ID)) = 0;
    sub_D(isinf(sub_D)) = 0;
    
    use_means = 0;
    if use_means == 1
        % use *means* for normalization
        IDo = mean(mean(sub_ID));
        Do = mean(mean(sub_D));
        Eo = mean(sub_E);
    else
        % use *max* for normalization
        IDo = max(max(sub_ID));
        Do = max(max(sub_D));
        Eo = max(sub_E);
    end
    
    w = assign_weights(sub_ID, IDo, sub_D, Do, num_members, params);

    sp = find_shortest_paths(w, num_members);
    
    CC = find_centralities(sp, num_members);
    
    rating = calculate_clusterhead_strength(CC, sub_E, Eo, num_members, params);
    
    [~, max_val_index] = max(rating);
    
    clusterheads(ii) = clusters{ii}(max_val_index);
    
end

end


function rating = calculate_clusterhead_strength(CC, sub_E, Eo, num_members, params)
    
    rating = zeros(1,num_members);
    for ii = 1:num_members
        rating(ii) = params.wb_3*CC(ii) + (params.wb_4/Eo)*sub_E(ii);
    end

end

function CC = find_centralities(sp, num_members)
    
    sum_sp = sum(sp,2);
    
    CC = zeros(1,num_members);
    for ii = 1:num_members
        CC(ii) = (num_members-1)/sum_sp(ii);
    end
    
end

function sp = find_shortest_paths(w, num_members)

    sp = zeros(num_members);
    for ii = 1:num_members
        sp(ii,:) = simple_dijkstra(w,ii);
    end
    
end

function w = assign_weights(sub_ID, IDo, sub_D, Do, num_members, params)

    w = zeros(num_members);
    for ii = 1:num_members
        for jj = ii+1:num_members
            w(ii,jj) = (params.wb_1/IDo)*sub_ID(ii,jj) + (params.wb_2*Do)/sub_D(ii,jj);
        end
    end
    w = w + triu(w,1)';
    
end

