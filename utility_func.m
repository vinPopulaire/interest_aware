function bests_powers = utility_func(powers, G, cluster, clusterhead)
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
%  bests_powers    - [1 x y] array with the best response powers of every device

% PARAMETERS
% W -> bandwidth
% Io -> constant power spectral density
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

bests_powers = zeros(1,num_devices);
for ii = 1:num_devices
    if cluster(ii) == clusterhead
        continue;
    end
    
%     gamma = G(ii,head_index)*powers(ii)/sensed_interference(ii);
%     scores(ii) = W*efficiency_function(gamma)/powers(ii);
    
    % We add a '-' because the fminbnd tries to minimize the function
    % provided
    fun = @(x)-W*efficiency_function(G(ii,head_index)*x/sensed_interference(ii))/x;
    bests_powers(ii) = fminbnd(fun,0,1);
end

end


function f = efficiency_function(gamma)

M = 80;
A = 1.2;

f = (1-exp(-A*gamma))^M;

end
