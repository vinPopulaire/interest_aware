function [E_i,E_d]=create_matrices(m)

% USAGE
%  [E_i,E_d]=create_matrices(m)
%
% INPUTS
%  m          - number of devices
%
% OUTPUTS
%  E_i        - [m x m] Interest Distance graph weights
%  E_d        - [m x m] Physical Distance graph weights

E_i = create_level_of_interest_matrix(m);
E_d = create_distance_matrix(m);

end


function matrix = create_level_of_interest_matrix(m)

% random values on matrix
a = rand(m,m);

% make matrix symmetric with 0 on the diagonal
matrix = triu(a,1) + triu(a,1)';

end

function matrix = create_distance_matrix(m)

% random values on matrix
a = rand(m,m);

% make matrix symmetric with 0 on the diagonal
matrix = triu(a,1) + triu(a,1)';

end

