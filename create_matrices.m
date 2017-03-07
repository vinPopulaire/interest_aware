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

x_min = 0.3;
x_max = 1;

% random values on matrix between x_min and x_max
a = (x_max-x_min).*rand(params.m,params.m) + x_min;

% make matrix symmetric with 0 on the diagonal
matrix = triu(a,1) + triu(a,1)';

end

