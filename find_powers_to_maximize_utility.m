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

num_iterations_for_convergence = 4000;
error_for_convergence = 10^-11;
num_all_devices = size(G,2);

% arbitrarily set all starting powers to 0.5
current_powers = 10^(-5)*ones(1, num_all_devices);
previous_powers = zeros(1, num_all_devices);

iter = 0;

% while sum(abs(current_powers-previous_powers)) > error_for_convergence && iter < num_iterations_for_convergence
% while sum(abs(current_powers-previous_powers)) > error_for_convergence
%     
%     previous_powers = current_powers
%    
%     current_powers = utility_func(previous_powers, G, clusters, clusterheads);
%    
%     iter = iter + 1;
% end

converged = zeros(1,num_all_devices);
while ~all(converged) && iter < num_iterations_for_convergence
    if sum(previous_powers) > 0.001
        for ii = 1:num_all_devices
            current_powers(ii) = 0;
        end
        break;
    end
    
    previous_powers = current_powers;
   
    current_powers = utility_func(previous_powers, G, clusters, clusterheads);
   
    iter = iter + 1;
    
    for ii = 1:num_all_devices
        if converged(ii) == 1
            current_powers(ii) = previous_powers(ii);
        else
            if abs(current_powers(ii)-previous_powers(ii)) < error_for_convergence
                converged(ii) = 1;
            end
        end
    end
end

disp('Number of iterations for convergence');
disp(iter);
powers = current_powers;

end