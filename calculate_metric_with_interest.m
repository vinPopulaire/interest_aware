function [metric_iaf1, metric_iaf2, iaf1, iaf2] = calculate_metric_with_interest(powers, E_i, clusters, clusterheads)
% USAGE
%  [metric_iaf1, metric_iaf2] = calculate_metric_with_interest(powers, ID, clusters, clusterheads);
%
% INPUTS
%  powers       - [1 x y] array with powers used for transmission
%  clusters     - [1 x m] cells with[1 x y] array with ids of nodes in cluster
%  clusterheads - [1 x m] ids of the clusterheads
%
% OUTPUTS
%  result - value of metric

num_clusters = size(clusters, 2);

% % because I don't want to count the basestation
% num_all_devices = size(powers, 2) - 1;

metric_iaf1 = zeros(num_clusters,1);
metric_iaf2 = zeros(num_clusters,1);
iaf1 = zeros(num_clusters,1);
iaf2 = zeros(num_clusters,1);

E_i(isinf(E_i)) = 0;

for kk = 1:num_clusters
    cluster = clusters{kk};
    clusterhead = clusterheads(kk);
    
    num_devices = size(cluster, 2);
    
    for ii = 1:num_devices
        if cluster(ii) == clusterhead
            clusterhead_index = ii;
        end
    end
    
    sub_E_i = submatrix(E_i, cluster);
    
    IAF1 = num_devices - sum(sub_E_i(:,clusterhead_index));
    
    iaf1(kk) = IAF1;
    metric_iaf1(kk) = powers(clusterhead)*iaf1(kk);
    
    IAF2 = sqrt(num_devices*(num_devices-1) - sum(sum(sub_E_i)));
    
    iaf2(kk) = IAF2;
    metric_iaf2(kk) = powers(clusterhead)*iaf2(kk);
end

iaf1 = sum(iaf1);
iaf2 = sum(iaf2);
metric_iaf1 = sum(metric_iaf1);
metric_iaf2 = sum(metric_iaf2);

end