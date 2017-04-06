clc;
clear;

% rng(6)

% PARAMETERS
area = 500;      % area x area the area where devices will be places
min_dist = 10;   % minimum distance of devices allowed
m = 30;

params = struct('m', m, 'area', area, 'min_dist', min_dist);

[E_i, distances] = create_matrices(params);

G = calculate_channel_gain(distances);

clusters = cell(1,1);
clusters{1} = [1:m+1];
clusterheads = m+1;

powers = find_powers_to_maximize_utility(clusters,clusterheads, G);