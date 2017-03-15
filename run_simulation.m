clc;
clear;

rng(6)


% PARAMETERS
%  m          - number of devices
%  a          - probability for device to form own cluster
%  wa_1       - weight for ID in cluster creation
%  wa_2       - weight for D in cluster creation
%  wb_1       - weight for ID in clusterhead selection
%  wb_2       - weight for D in clusterhead selection
%  wb_3       - weight for E in clusterhead selection
%  alpha      - t1 = a*t, t2 = (1-a)t
%  timeslot   - time frame
%  n          - energy conversion efficiency factor

area = 10;
min_dist = 1;
m = 20;
a = 2;
wa_1 = 0.5;
wa_2 = 0.5;
wb_1 = 0.5;
wb_2 = 0.5;
wb_3 = 0.5;
wb_4 = 0.5;

alpha = 0.4;
n = 0.6;
timeslot = 0.0005;

if wa_1 + wa_2 ~= 1
    error('wa_1 and wa_2 don''t sum to 1');
end
if wb_1 + wb_2 ~= 1
    error('wb_1 and wb_2 don''t sum to 1');
end
if wb_3 + wb_4 ~= 1
    error('wb_3 and wb_4 don''t sum to 1');
end

params = struct('m', m, 'a', a, 'wa_1', wa_1, 'wa_2', wa_2, 'wb_1', wb_1, ...
                'wb_2', wb_2, 'wb_3', wb_3, 'wb_4', wb_4, 'alpha', alpha, ...
                'n', n, 'timeslot', timeslot, 'area', area, 'min_dist', min_dist);

[E_i, distances] = create_matrices(params);

max_dist = max(max(distances));
E_d = distances/max_dist;

ID = -log2(E_i);
D = -log2(E_d);

clusters = create_clusters(ID, D, params);

E = create_energy_availability(params);
G = calculate_channel_gain(distances);

num_rounds = 20;
round = 0;

while round < num_rounds

clusterheads = find_clusterheads(clusters, ID, D, E, params);

powers_requested = find_powers_to_maximize_utility(clusters,clusterheads,G);

power_from_clusterheads = find_powers_clusterheads_must_transmit(powers_requested,clusters,clusterheads, G, E, params);

E = decrease_energy_availability(E, clusterheads, power_from_clusterheads, params);

round = round + 1;

end

disp('Number of rounds the process was repeated');
disp(round);