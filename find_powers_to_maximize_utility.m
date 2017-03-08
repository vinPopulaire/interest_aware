function powers = find_powers_to_maximize_utility(clusters,clusterheads, G)
% USAGE
%  powers = find_powers_to_maximize_utility(cluster,clusterhead, distances)
%
% INPUTS
%  clusters     - [1 x m] cells with[1 x y] array with ids of nodes in cluster
%  clusterheads - [1 x m] ids of the clusterhead
%  G            - [y x y] matrix with Channel Gain of pairs
%
% OUTPUTS
%  powers      - [1 x y] array with powers needed for transmission

num_all_devices = size(G,2);

% arbitrarily set all starting powers to 0.5
current_powers = 0.5*ones(1, num_all_devices);
previous_powers = zeros(1, num_all_devices);

iter = 0;

while sum(abs(current_powers-previous_powers)) > 10^-5 && iter < 200
    
    previous_powers = current_powers;
   
    current_powers = utility_func(previous_powers, G, clusters, clusterheads);
   
    iter = iter + 1;
end

disp('Number of iterations for convergence');
disp(iter);
powers = current_powers;

end