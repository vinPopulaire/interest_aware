function powers = find_powers_to_maximize_utility(clusters,clusterheads, distances)
% USAGE
%  powers = find_powers_to_maximize_utility(cluster,clusterhead, distances)
%
% INPUTS
%  cluster   - [1 x y] array with ids of nodes in cluster
%  clusterhead - id of the clusterhead
%  distances   - physical distance between nodes of cluster
%
% OUTPUTS
%  powers      - [1 x y] array with powers needed for transmission

num_all_devices = size(distances,2);

% G   ->channel gain
% a=2 -> indoor only communication
G = zeros(num_all_devices,num_all_devices);
a = 2;

% Calculate channel gain for all devices
% (not only those of the cluster) because all contribute to the
% interference detected
for ii = 1:num_all_devices
    for jj = ii:num_all_devices
%         G(ii,jj) = lognrnd(0,1.84)/distances(ii,jj);
        G(ii,jj) = 0.097/distances(ii,jj)^a;
        G(jj,ii) = G(ii,jj);
    end
    G(ii,ii) = 0;
end

% arbitrarily set all starting powers to 0.5
current_powers = 0.5*ones(1, num_all_devices);
previous_powers = zeros(1, num_all_devices);

iter = 0;

while sum(abs(current_powers-previous_powers)) > 10^-5
    
    previous_powers = current_powers;
   
    current_powers = utility_func(previous_powers, G, clusters, clusterheads);
   
    iter = iter + 1;
end

disp('Number of iterations for convergence');
disp(iter);
powers = current_powers;

end