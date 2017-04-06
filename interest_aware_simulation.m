function [clusters, total_system_energy_consumed, total_power_info_transmission, metric_iaf1, metric_iaf2] = interest_aware_simulation(D, ID, E, E_i, G, params)

% Interest aware simulation

total_energy = sum(E);

clusters = create_clusters(ID, D, params);

num_rounds = params.rounds;

round_power_info_transmission = zeros(num_rounds,1);
total_system_energy_consumed = zeros(num_rounds,1);
round_metric_iaf1 = zeros(num_rounds,1);
round_metric_iaf2 = zeros(num_rounds,1);

for round = 1:num_rounds

    clusterheads = find_clusterheads(clusters, ID, D, E, params);

    master_cluster = [clusterheads, params.m+1];

    powers_requested = find_powers_to_maximize_utility([clusters master_cluster],[clusterheads params.m+1],G);
    % if powers increase without converging break and use total_power to
    % try an other topology instead
    if sum(powers_requested) == 0
        total_system_energy_consumed(num_rounds) = 0;
        break;
    end

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
    
    [round_metric_iaf1(round), round_metric_iaf2(round)] = calculate_metric_with_interest(powers_info_transmission, E_i, clusters, clusterheads);
end

metric_iaf1 = cumsum(round_metric_iaf1);
metric_iaf2 = cumsum(round_metric_iaf2);
total_power_info_transmission = cumsum(round_power_info_transmission);

disp('Number of rounds the process was repeated');
disp(round);

end

