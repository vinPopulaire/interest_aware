clc;
clear;

% rng(6)
num_repetitions = 100;
total_system_energy_consumed = cell(num_repetitions,1);
total_power_info_transmission = cell(num_repetitions,1);
metric_iaf1 = cell(num_repetitions,1);
metric_iaf2 = cell(num_repetitions,1);
all_clusters = cell(num_repetitions,1);

random_repetition = 1;

while random_repetition <= num_repetitions

% PARAMETERS
area = 500;      % area x area the area where devices will be places
min_dist = 10;   % minimum distance of devices allowed
m = 50;
a = 2;          % parameter to change probability for device to form own cluster

balance = 0.5;

wa_1 = balance;     % weight for ID in cluster creation
wa_2 = 1-balance;     % weight for D in cluster creation
wb_1 = balance;     % weight for ID in clusterhead selection
wb_2 = 1-balance;     % weight for D in clusterhead selection
wb_3 = 0.5;     % weight for CC in clusterhead selection
wb_4 = 0.5;     % weight for E in clusterhead selection

alpha = 0.4;    % t1 = a*t, t2 = (1-a)t
n = 0.6;        % energy conversion efficiency factor
timeslot = 0.0005; % time frame

rounds = 10;

total_system_energy_consumed{random_repetition} = cell(1,3);
total_power_info_transmission{random_repetition} = cell(1,3);
metric_iaf1{random_repetition} = cell(1,3);
metric_iaf2{random_repetition} = cell(1,3);

distances = create_distance_matrix(struct('m', m, 'area', area, 'min_dist', min_dist));

cases = {'worst_case' 'random_case' 'best_case'};

for ii = 1:size(cases,2)

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
                    'min_dist', min_dist, 'rounds',rounds, ...
                    'case_type',cases{ii});
                
    E_i = create_interest_matrix(distances, params);

    max_dist = max(max(distances(1:m,1:m)));
    E_d = distances(1:m,1:m)/max_dist;

    ID = -log2(E_i);
    D = -log2(E_d);

    G = calculate_channel_gain(distances);
                
    E = create_energy_availability(params);

    [all_clusters{random_repetition}{ii}, total_system_energy_consumed{random_repetition}{ii}, total_power_info_transmission{random_repetition}{ii}, metric_iaf1{random_repetition}{ii}, metric_iaf2{random_repetition}{ii}] = interest_aware_simulation(D, ID, E, E_i, G, params);
    
    if total_system_energy_consumed{random_repetition}{ii}(rounds) == 0
        break;
    end
end

if total_system_energy_consumed{random_repetition}{1}(rounds) == 0
    continue;
elseif total_system_energy_consumed{random_repetition}{2}(rounds) == 0
    continue;
elseif total_system_energy_consumed{random_repetition}{3}(rounds) == 0
    continue;
else
    random_repetition = random_repetition + 1
end

end

save(['results', '_balanced_cases', '_m_', num2str(m), '_repetitions_', num2str(num_repetitions), '_rounds_', num2str(rounds), '.mat'], 'total_system_energy_consumed', 'total_power_info_transmission', 'metric_iaf1', 'metric_iaf2', 'all_clusters');
