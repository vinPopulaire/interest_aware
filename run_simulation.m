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

m = 20;
a = 2;
wa_1 = 0.5;
wa_2 = 0.5;
wb_1 = 0.2;
wb_2 = 0.2;
wb_3 = 0.6;

if wa_1 + wa_2 ~= 1
    error('wa_1 and wa_2 don''t sum to 1');
end

if wb_1 + wb_2 + wb_3 ~= 1
    error('wb_1, wb_2 and wb_3 don''t sum to 1');
end

[E_i, E_d] = create_matrices(m);

ID = -log2(E_i);
D = -log2(E_d);

clusters = create_clusters(ID, D, a, wa_1, wa_2);

E = create_energy_availability(m);

clusterheads = find_clusterheads(clusters, ID, D, E, wb_1, wb_2, wb_3);