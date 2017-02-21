function power = find_powers_clusterheads_must_transmit(powers_requested,clusters,clusterheads, G, alpha, n)
% USAGE
%  power = find_powers_clusterheads_must_transmit(powers_requested,clusters,clusterheads)
%
% INPUTS
%  powers_requested - [1 x y] array with powers needed for transmission
%  clusters         - [1 x c] cells with [1 x m] array with ids of nodes in cluster
%  clusterheads     - [1 x c] ids of the clusterhead
%  G                - [y x y] matrix with Channel Gains of pairs
%  alpha            - t1 = a*t, t2 = (1-a)t
%  n                - energy conversion efficiency factor
%
% OUTPUTS
%  powers    - [1 x c] array with power each clusterhead will transmit

num_clusters = size(clusters,2);
power = zeros(1,num_clusters);

for kk = 1:num_clusters
    cluster = clusters{kk};
    clusterhead = clusterheads(kk);
    num_devices = size(cluster,2);
    
    powers_of_devices = powers_requested(cluster);
    powers_to_send = zeros(1,num_devices);
    
    for ii = 1:num_devices
        if (cluster(ii) ~= clusterhead)
            powers_to_send(ii) = powers_of_devices(ii)*(1-alpha)/(n*alpha*G(cluster(ii),clusterhead));
        end
    end
    
    power(kk) = max(powers_to_send); 
end

end