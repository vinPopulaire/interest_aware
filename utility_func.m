function scores = utility_func(powers, G, cluster, clusterhead)
% USAGE
%  score = utility_func(powers)
%
% INPUTS
%  powers   - [1 x y] array with powers of transmission to the clusterhead for each device
%  G        - [y x y] matrix with channel gain for each pair
%  cluster  - [1 x y] array with ids of devices in cluster
%  clusterhead - id of the clusterhead
%
% OUTPUTS
%  scores    - [1 x y] array with the score of the utility function

% PARAMETERS
W = 10^6;
Io = 0.2;

num_devices = size(cluster,2);

head_index = arrayfun(@(x) find(cluster == x,1,'first'), clusterhead);

sensed_interference = zeros(1,num_devices);
for ii = 1:num_devices
    
%     % keep the index of the clusterhead for later use
%     if cluster(ii) == clusterhead
%         head_index = ii;
%     end
    
    for jj = 1:num_devices
        if ii ~= jj
            sensed_interference(ii) = sensed_interference(ii) + G(ii,jj)*powers(jj);
        end
    end
    sensed_interference(ii) = sensed_interference(ii) + Io;
end

gamma = zeros(1,num_devices);
scores = zeros(1,num_devices);
for ii = 1:num_devices
    if cluster(ii) == clusterhead
        continue;
    end
    
    gamma(ii) = G(ii,head_index)*powers(ii)/sensed_interference(ii);
    
    scores(ii) = W*efficiency_function(gamma(ii))/powers(ii);
    
end

end


function f = efficiency_function(gamma)

M = 80;
A = 1.2;

f = (1-exp(-A*gamma))^M;

end
