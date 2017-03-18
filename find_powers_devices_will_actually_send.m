function powers = find_powers_devices_will_actually_send(powers_info_transmission, power_from_clusterheads, powers_requested, clusters, clusterheads, G, params)
% USAGE
%  powers = find_powers_devices_will_actually_send(powers_info_transmission, power_from_clusterheads, G, params)
%
% INPUTS
%  powers_info_transmission - [1 x y] array with powers devices will
%                             eventually transmit
%  power_from_clusterheads  - [1 x c] powers clusterheads are sending
%  G                - [y x y] matrix with Channel Gains of pairs
%  alpha            - t1 = a*t, t2 = (1-a)t
%  n                - energy conversion efficiency factor
%
% OUTPUTS
%  powers           - [1 x y] array with powers it will transmit info

num_clusters = size(clusters,2);

powers = powers_info_transmission;

for kk = 1:num_clusters
    cluster = clusters{kk};
    clusterhead = clusterheads(kk);
    
    num_cluster_devices = size(cluster,2);
    
    for ii = 1:num_cluster_devices
        device = cluster(ii);
        
        if device ~= clusterhead
            powers(device) = params.n*params.alpha*power_from_clusterheads(kk)*G(device,clusterhead)/(1-params.alpha);
            if powers(device) > powers_requested(device)
                powers(device) = powers_requested(device);
            end
        end        
    end
end
end