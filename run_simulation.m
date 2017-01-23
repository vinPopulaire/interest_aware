clc;
clear;

% PARAMETERS
%  m          - number of devices
%  a          - probability for device to form own cluster
%  w_1        - weight for ID in cluster creation
%  w_2        - weight for D in cluster creation

m = 5;
a = 2;
w_1 = 0.5;
w_2 = 0.5;

if w_1 + w_2 ~= 1
    error('w_1 and w_2 don''t sum to 1');
end

[E_i, E_d] = create_matrices(m);

ID = -log2(E_i);
D = -log2(E_d);

clusters = create_clusters(ID, D, a, w_1, w_2);