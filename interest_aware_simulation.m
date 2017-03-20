function [total_system_energy_consumed, total_power_info_transmission] = interest_aware_simulation(D, ID, E, G, params)

% Interest aware simulation

total_energy = sum(E);

clusters = create_clusters(ID, D, params);

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
    E = decrease_energy_availability(E, clusterheads, powers_info_transmission, 'info', params);

    power_from_clusterheads = find_powers_clusterheads_must_transmit(powers_requested,clusters,clusterheads, G, E, params);

    E = decrease_energy_availability(E, clusterheads, power_from_clusterheads, 'energy', params);
    powers_info_transmission = find_powers_devices_will_actually_send(powers_info_transmission, power_from_clusterheads, powers_requested, clusters, clusterheads, G, params);

    round_power_info_transmission(round) = sum(powers_info_transmission);

    total_system_energy_consumed(round) = total_energy - sum(E);
end

total_power_info_transmission = cumsum(round_power_info_transmission);

disp('Number of rounds the process was repeated');
disp(round);

end

