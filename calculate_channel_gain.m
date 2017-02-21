function G = calculate_channel_gain(distances)
% USAGE
%  [powers, G] = find_powers_to_maximize_utility(cluster,clusterhead, distances)
%
% INPUTS
%  clusters     - [1 x m] cells with[1 x y] array with ids of nodes in cluster
%  clusterheads - [1 x m] ids of the clusterhead
%  distances    - physical distance between nodes of cluster
%
% OUTPUTS
%  G           - [y x y] matrix with Channel Gain of pairs

num_all_devices = size(distances,2);

% G   ->channel gain
% a=2 -> indoor only communication
G = zeros(num_all_devices,num_all_devices);
a = 2;

% Calculate channel gain for all devices
% (not only those of the cluster) because all contribute to the
% interference detected (will be needed later)
for ii = 1:num_all_devices
    for jj = ii:num_all_devices
%         G(ii,jj) = lognrnd(0,1.84)/distances(ii,jj);
        G(ii,jj) = 0.097/(distances(ii,jj)^a);
        G(jj,ii) = G(ii,jj);
    end
    G(ii,ii) = 0;
end

end