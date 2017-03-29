clc;
clear;

rng(6)

% PARAMETERS
area = 10;      % area x area the area where devices will be places
min_dist = 1;   % minimum distance of devices allowed
m = 20;         % number of devies
a = 2;          % parameter to change probability for device to form own cluster
wa_1 = 0.5;     % weight for ID in cluster creation
wa_2 = 0.5;     % weight for D in cluster creation
wb_1 = 0.5;     % weight for ID in clusterhead selection
wb_2 = 0.5;     % weight for D in clusterhead selection
wb_3 = 1;     % weight for CC in clusterhead selection
wb_4 = 0;     % weight for E in clusterhead selection

alpha = 0.4;    % t1 = a*t, t2 = (1-a)t
n = 0.6;        % energy conversion efficiency factor
timeslot = 0.0005; % time frame

rounds = 2;

% w = {[0.5, 0.5] [0.5, 0.5]};
% w = {[0, 1] [0, 1]};
w = {[1, 0] [1, 0]};

wa_1 = w{1}(1);
wa_2 = w{1}(2);
wb_1 = w{2}(1);
wb_2 = w{2}(2);

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
                'n', n, 'timeslot', timeslot, 'area', area, ...
                'min_dist', min_dist, 'rounds',rounds);
            
            
[E_i, distances] = create_matrices(params);

max_dist = max(max(distances(1:m,1:m)));
E_d = distances(1:m,1:m)/max_dist;

ID = -log2(E_i);
D = -log2(E_d);

E = create_energy_availability(params);
G = calculate_channel_gain(distances);

[total_system_energy_consumed, total_power_info_transmission] = interest_aware_simulation(D, ID, E, G, params);