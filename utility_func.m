function best_powers = utility_func(powers, G, clusters, clusterheads)
% USAGE
%  best_powers = utility_func(powers, G, clusters, clusterheads)
%
% INPUTS
%  powers   - [1 x y] array with powers of transmission to the clusterhead
%                     for each device
%  G        - [y x m] matrix with channel gain for each device of cluster
%                     with all other devices
%  cluster  - [1 x y] array with ids of devices in cluster
%  clusterhead - id of the clusterhead
%
% OUTPUTS
%  best_powers    - [1 x y] array with the best response powers of every device

% PARAMETERS
% W -> bandwidth
% Io -> constant power spectral density
W = 10^6;
Io = 0.2;

num_all_devices = size(G, 2);

% Sensed Interference from all devices not just those inside cluster
% since all contribute to the interference detected
sensed_interference = zeros(1,num_all_devices);
for ii = 1:num_all_devices
    for jj = 1:num_all_devices
        % TODO check if removing the if changes the result
        if ii ~= jj
            sensed_interference(ii) = sensed_interference(ii) + G(ii,jj)*powers(jj);
        end
    end
    sensed_interference(ii) = sensed_interference(ii) + Io;
end

best_powers = zeros(1,num_all_devices);

num_clusters = size(clusters,2);

for kk = 1:num_clusters
    cluster = clusters{kk};
    clusterhead = clusterheads(kk);
    
    num_devices = size(cluster,2);
    % keep the index of the clusterhead for later use
    head_index = arrayfun(@(x) find(cluster == x,1,'first'), clusterhead);
    
    for ii = 1:num_devices
        if cluster(ii) == clusterhead
            continue;
        end

        % We add a '-' because the fminbnd tries to minimize the function
        % provided
        fun = @(x)(-(W*efficiency_function(G(cluster(ii),cluster(head_index))*x/sensed_interference(cluster(ii)))/x));
        best_powers(cluster(ii)) = fminbnd(fun,0,100);
    end
end

end


function f = efficiency_function(gamma)

M = 2;
A = 80;

f = (1-exp(-A*gamma))^M;

end
