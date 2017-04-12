m10 = load('resultsdiff_balances_all_m_10_balance_1.1_repetitions_10_rounds_10.mat');
m20 = load('resultsdiff_balances_all_m_20_balance_1.1_repetitions_10_rounds_10.mat');
m30 = load('resultsdiff_balances_all_m_30_balance_1.1_repetitions_10_rounds_10.mat');
m40 = load('resultsdiff_balances_all_m_40_balance_1.1_repetitions_10_rounds_10.mat');

% gia kathe case
average_power_info_transmission_only_devices = cell(1,3);

num_rounds = size(m10.total_system_energy_consumed{1}{1,1},1);
num_repetitions = size(m10.total_system_energy_consumed,1);

% arxikopoiisi gia kathe size
for ii = 1:size(average_power_info_transmission_only_devices,2);
    average_power_info_transmission_only_devices{ii} = zeros(4,1);
end

for repetition = 1:num_repetitions
    
    average_power_info_transmission_only_devices{1}(1) = average_power_info_transmission_only_devices{1}(1) + m10.total_power_info_transmission_only_devices{repetition}{1}(num_rounds);
    average_power_info_transmission_only_devices{2}(1) = average_power_info_transmission_only_devices{2}(1) + m10.total_power_info_transmission_only_devices{repetition}{3}(num_rounds);
    average_power_info_transmission_only_devices{3}(1) = average_power_info_transmission_only_devices{3}(1) + m10.total_power_info_transmission_only_devices{repetition}{11}(num_rounds);
    
    average_power_info_transmission_only_devices{1}(2) = average_power_info_transmission_only_devices{1}(2) + m20.total_power_info_transmission_only_devices{repetition}{1}(num_rounds);
    average_power_info_transmission_only_devices{2}(2) = average_power_info_transmission_only_devices{2}(2) + m20.total_power_info_transmission_only_devices{repetition}{3}(num_rounds);
    average_power_info_transmission_only_devices{3}(2) = average_power_info_transmission_only_devices{3}(2) + m20.total_power_info_transmission_only_devices{repetition}{11}(num_rounds);

    average_power_info_transmission_only_devices{1}(3) = average_power_info_transmission_only_devices{1}(3) + m30.total_power_info_transmission_only_devices{repetition}{1}(num_rounds);
    average_power_info_transmission_only_devices{2}(3) = average_power_info_transmission_only_devices{2}(3) + m30.total_power_info_transmission_only_devices{repetition}{3}(num_rounds);
    average_power_info_transmission_only_devices{3}(3) = average_power_info_transmission_only_devices{3}(3) + m30.total_power_info_transmission_only_devices{repetition}{11}(num_rounds);

    average_power_info_transmission_only_devices{1}(4) = average_power_info_transmission_only_devices{1}(4) + m40.total_power_info_transmission_only_devices{repetition}{1}(num_rounds);
    average_power_info_transmission_only_devices{2}(4) = average_power_info_transmission_only_devices{2}(4) + m40.total_power_info_transmission_only_devices{repetition}{3}(num_rounds);
    average_power_info_transmission_only_devices{3}(4) = average_power_info_transmission_only_devices{3}(4) + m40.total_power_info_transmission_only_devices{repetition}{11}(num_rounds);

end

for ii = 1:size(average_power_info_transmission_only_devices,2)
    average_power_info_transmission_only_devices{ii} = average_power_info_transmission_only_devices{ii}/num_repetitions;
end

average_interest_based_aggragation_metric1 = cell(1,3);

for ii = 1:size(average_interest_based_aggragation_metric1,2)
    average_interest_based_aggragation_metric1{ii} = zeros(4,1);
end

for repetition = 1:num_repetitions
    
    average_interest_based_aggragation_metric1{1}(1) = average_interest_based_aggragation_metric1{1}(1) + m10.metric_iaf1{repetition}{1}(num_rounds);
    average_interest_based_aggragation_metric1{2}(1) = average_interest_based_aggragation_metric1{2}(1) + m10.metric_iaf1{repetition}{3}(num_rounds);
    average_interest_based_aggragation_metric1{3}(1) = average_interest_based_aggragation_metric1{3}(1) + m10.metric_iaf1{repetition}{11}(num_rounds);
    
    average_interest_based_aggragation_metric1{1}(2) = average_interest_based_aggragation_metric1{1}(2) + m20.metric_iaf1{repetition}{1}(num_rounds);
    average_interest_based_aggragation_metric1{2}(2) = average_interest_based_aggragation_metric1{2}(2) + m20.metric_iaf1{repetition}{3}(num_rounds);
    average_interest_based_aggragation_metric1{3}(2) = average_interest_based_aggragation_metric1{3}(2) + m20.metric_iaf1{repetition}{11}(num_rounds);

    average_interest_based_aggragation_metric1{1}(3) = average_interest_based_aggragation_metric1{1}(3) + m30.metric_iaf1{repetition}{1}(num_rounds);
    average_interest_based_aggragation_metric1{2}(3) = average_interest_based_aggragation_metric1{2}(3) + m30.metric_iaf1{repetition}{3}(num_rounds);
    average_interest_based_aggragation_metric1{3}(3) = average_interest_based_aggragation_metric1{3}(3) + m30.metric_iaf1{repetition}{11}(num_rounds);

    average_interest_based_aggragation_metric1{1}(4) = average_interest_based_aggragation_metric1{1}(4) + m40.metric_iaf1{repetition}{1}(num_rounds);
    average_interest_based_aggragation_metric1{2}(4) = average_interest_based_aggragation_metric1{2}(4) + m40.metric_iaf1{repetition}{3}(num_rounds);
    average_interest_based_aggragation_metric1{3}(4) = average_interest_based_aggragation_metric1{3}(4) + m40.metric_iaf1{repetition}{11}(num_rounds);

end

for ii = 1:size(average_interest_based_aggragation_metric1,2)
    average_interest_based_aggragation_metric1{ii} = average_interest_based_aggragation_metric1{ii}/num_repetitions;
end

average_interest_based_aggragation_metric2 = cell(1,3);

for ii = 1:size(average_interest_based_aggragation_metric2,2)
    average_interest_based_aggragation_metric2{ii} = zeros(4,1);
end

for repetition = 1:num_repetitions
    
    average_interest_based_aggragation_metric2{1}(1) = average_interest_based_aggragation_metric2{1}(1) + m10.metric_iaf2{repetition}{1}(num_rounds);
    average_interest_based_aggragation_metric2{2}(1) = average_interest_based_aggragation_metric2{2}(1) + m10.metric_iaf2{repetition}{3}(num_rounds);
    average_interest_based_aggragation_metric2{3}(1) = average_interest_based_aggragation_metric2{3}(1) + m10.metric_iaf2{repetition}{11}(num_rounds);
    
    average_interest_based_aggragation_metric2{1}(2) = average_interest_based_aggragation_metric2{1}(2) + m20.metric_iaf2{repetition}{1}(num_rounds);
    average_interest_based_aggragation_metric2{2}(2) = average_interest_based_aggragation_metric2{2}(2) + m20.metric_iaf2{repetition}{3}(num_rounds);
    average_interest_based_aggragation_metric2{3}(2) = average_interest_based_aggragation_metric2{3}(2) + m20.metric_iaf2{repetition}{11}(num_rounds);

    average_interest_based_aggragation_metric2{1}(3) = average_interest_based_aggragation_metric2{1}(3) + m30.metric_iaf2{repetition}{1}(num_rounds);
    average_interest_based_aggragation_metric2{2}(3) = average_interest_based_aggragation_metric2{2}(3) + m30.metric_iaf2{repetition}{3}(num_rounds);
    average_interest_based_aggragation_metric2{3}(3) = average_interest_based_aggragation_metric2{3}(3) + m30.metric_iaf2{repetition}{11}(num_rounds);

    average_interest_based_aggragation_metric2{1}(4) = average_interest_based_aggragation_metric2{1}(4) + m40.metric_iaf2{repetition}{1}(num_rounds);
    average_interest_based_aggragation_metric2{2}(4) = average_interest_based_aggragation_metric2{2}(4) + m40.metric_iaf2{repetition}{3}(num_rounds);
    average_interest_based_aggragation_metric2{3}(4) = average_interest_based_aggragation_metric2{3}(4) + m40.metric_iaf2{repetition}{11}(num_rounds);

end

for ii = 1:size(average_interest_based_aggragation_metric2,2)
    average_interest_based_aggragation_metric2{ii} = average_interest_based_aggragation_metric2{ii}/num_repetitions;
end

average_power_with_metric1 = cell(1,3);

for ii = 1:size(average_power_with_metric1,2)
    average_power_with_metric1{ii} = average_power_info_transmission_only_devices{ii} + average_interest_based_aggragation_metric1{ii};
end

average_power_with_metric2 = cell(1,3);
for ii = 1:size(average_power_with_metric2,2)
    average_power_with_metric2{ii} = average_power_info_transmission_only_devices{ii} + average_interest_based_aggragation_metric2{ii};
end

figure;
hold on;

title('IAF1');
plot(10:10:40,average_power_with_metric1{1},'r','DisplayName','I-approach');
plot(10:10:40,average_power_with_metric1{2},'g','DisplayName','IP-approach');
plot(10:10:40,average_power_with_metric1{3},'b','DisplayName','P-approach');
legend('show')

figure;
hold on;

title('IAF2');
plot(10:10:40,average_power_with_metric2{1},'r','DisplayName','I-approach');
plot(10:10:40,average_power_with_metric2{2},'g','DisplayName','IP-approach');
plot(10:10:40,average_power_with_metric2{3},'b','DisplayName','P-approach');
legend('show')
