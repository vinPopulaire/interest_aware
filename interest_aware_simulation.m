function [total_system_energy_consumed, total_power_info_transmission] = interest_aware_simulation(params)

% Interest aware simulation

[E_i, distances] = create_matrices(params);

max_dist = max(max(distances(1:params.m,1:params.m)));
E_d = distances(1:params.m,1:params.m)/max_dist;

ID = -log2(E_i);
D = -log2(E_d);

clusters = create_clusters(ID, D, params);

E = create_energy_availability(params);
total_energy = sum(E);
G = calculate_channel_gain(distances);

num_rounds = params.rounds;

round_power_info_transmission = zeros(num_rounds,1);
total_system_energy_consumed = zeros(num_rounds,1);

for round = 1:num_rounds

    clusterheads = find_clusterheads(clusters, ID, D, E, params);

    master_cluster = [clusterheads, params.m+1];

    powers_requested = find_powers_to_maximize_utility([clusters master_cluster],[clusterheads params.m+1],G);

    powers_info_transmission = find_powers_to_send_info(powers_requested, clusterheads, E, params);

    % calculate energy after information transmission of clusterheads first 
    % so that they give priority to their transmission instead of sending power
    % to other devices
    E = decrease_energy_availability_from_info_transmission(E, clusterheads, powers_info_transmission, params);

    power_from_clusterheads = find_powers_clusterheads_must_transmit(powers_requested,clusters,clusterheads, G, E, params);

    E = decrease_energy_availability_from_energy_transmission(E, clusterheads, power_from_clusterheads, params);
    powers_info_transmission = find_powers_devices_will_actually_send(powers_info_transmission, power_from_clusterheads, powers_requested, clusters, clusterheads, G, params);

    round_power_info_transmission(round) = sum(powers_info_transmission);

    total_system_energy_consumed(round) = total_energy - sum(E);
end

total_power_info_transmission = cumsum(round_power_info_transmission);

disp('Number of rounds the process was repeated');
disp(round);

end

