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
% Io -> constant power spectral density of Additive White Gaussian Noise
%       process
W = 10^6;
Io = 5*10^(-15);

num_all_devices = size(G, 2);

% Here we calculate Sensed Interference for all devices even though we will
% eventually use only the Sensed Interference on clusterheads
% Sensed Interference from all devices not just those inside cluster
% since all contribute to the interference detected
sensed_power = zeros(1,num_all_devices);
for ii = 1:num_all_devices
    for jj = 1:num_all_devices
        % TODO check if removing the if changes the result
        if ii ~= jj
            sensed_power(ii) = sensed_power(ii) + G(ii,jj)*powers(jj);
        end
    end
    sensed_power(ii) = sensed_power(ii) + Io;
end

best_powers = zeros(1,num_all_devices);

num_clusters = size(clusters,2);

for kk = 1:num_clusters
    cluster = clusters{kk};
    clusterhead = clusterheads(kk);
    
    num_devices = size(cluster,2);
    
    for ii = 1:num_devices
        if cluster(ii) == clusterhead
            continue;
        end

        % We add a '-' because the fminbnd tries to minimize the function
        % provided
        
        options = optimset('MaxFunEvals',100,'MaxIter',100,'TolX',10^-12);
        sensed_interference = sensed_power(clusterhead)-(G(cluster(ii),clusterhead)*powers(cluster(ii)));
        fun = @(x)(-(W*f(G(cluster(ii),clusterhead)*x/sensed_interference)/x));
        best_powers(cluster(ii)) = fminbnd(fun,0,max(powers)*6,options);

%         x = linspace(0,0.0001,10000);
%         x = linspace(0,max(powers)*2,10000);
%         sensed_interference = sensed_power(clusterhead)-(G(cluster(ii),clusterhead)*powers(cluster(ii)));
%         gamma = G(cluster(ii),clusterhead).*x/sensed_interference;
%         f = W*f(gamma)./x;
%         [M, index] = max(f);
%         best_powers(cluster(ii)) = x(index);

%         syms x;
%         gamma = (G(cluster(ii),clusterhead)*x)/(sensed_power(clusterhead)-(G(cluster(ii),clusterhead)*powers(cluster(ii))));
%         f = W*f(gamma)/x;
%         g = diff(f);
%         best_powers(cluster(ii))= max(double(solve(g,x, 'Real', true)));

    end
    
%         figure
%         plot(x,f);
end

end


function f = f(gamma)
% 
% M = 800;
% A = 170;


M = 800;
A = 550;

% converge se 0.4*10^-4 se 3671 iterations
% M = 80;
% A = 118.2;

% converge se 0.7*10^-4 se 6469 iterations
% M = 80;
% A = 118.1;

f = (1-exp(-A*gamma)).^M;
% f = (1-exp(-A*gamma))^M;

end
