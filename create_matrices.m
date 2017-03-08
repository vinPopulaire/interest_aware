function [E_i,E_d]=create_matrices(params)

% USAGE
%  [E_i,E_d]=create_matrices(m)
%
% INPUTS
%  m          - number of devices
%
% OUTPUTS
%  E_i        - [m x m] Interest Distance graph weights
%  E_d        - [m x m] Physical Distance graph weights

E_i = create_level_of_interest_matrix(params);
E_d = create_distance_matrix(params);

end


function matrix = create_level_of_interest_matrix(params)

% random values on matrix
a = rand(params.m,params.m);

% make matrix symmetric with 0 on the diagonal
matrix = triu(a,1) + triu(a,1)';

end

function matrix = create_distance_matrix(params)

distances = zeros(params.m, params.m);
bad_positions = 1;

iter = 1;
while bad_positions
    x = params.area*rand(params.m,1);
    y = params.area*rand(params.m,1);
    
    [min_dist,distances] = calculate_distances(x,y);
    
    if min_dist > params.min_dist
        bad_positions = 0;
    end
    
    iter = iter + 1;
end
disp('Number of iterations for nicely positioned devices');
disp(iter);

max_dist = max(max(distances));

matrix = distances/max_dist;

end

function [min_dist, distances] = calculate_distances(x,y)

% min_dist returns the smallest distance between nodes
%          smallest value of the matrix except zero

min_dist = Inf;

num_devices = length(x);

distances = zeros(num_devices, num_devices);

for ii = 1:num_devices
    for jj = 1:num_devices
        distances(ii,jj) = sqrt((x(ii)-x(jj))^2+(y(ii)-y(jj))^2);
        if distances(ii,jj) < min_dist && distances(ii,jj) > 0
            min_dist = distances(ii,jj);
        end
    end
end

end
