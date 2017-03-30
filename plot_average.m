%% Average system energy consumed
average_system_energy_consumed = cell(1,3);
num_rounds = size(total_system_energy_consumed{1}{1,1},1);

for ii = 1:size(average_system_energy_consumed,2)
    average_system_energy_consumed{ii} = zeros(num_rounds,1);
end

num_repetitions = size(total_system_energy_consumed,1);
% num_repetitions = 2;
for repetition = 1:num_repetitions
    
    average_system_energy_consumed{1} = average_system_energy_consumed{1} + total_system_energy_consumed{repetition}{1,1};
    average_system_energy_consumed{2} = average_system_energy_consumed{2} + total_system_energy_consumed{repetition}{2,2};
    average_system_energy_consumed{3} = average_system_energy_consumed{3} + total_system_energy_consumed{repetition}{3,3};

end

for ii = 1:size(average_system_energy_consumed,2)
    average_system_energy_consumed{ii} = average_system_energy_consumed{ii}/num_repetitions;
end

figure;
hold on;

title('Total system energy consumed');
plot(1:num_rounds,average_system_energy_consumed{1},'b','DisplayName','distance');
plot(1:num_rounds,average_system_energy_consumed{2},'g','DisplayName','balanced');
plot(1:num_rounds,average_system_energy_consumed{3},'r','DisplayName','interest');
legend('show')

%% Average power info transmission
average_power_info_transmission = cell(1,3);
num_rounds = size(total_power_info_transmission{1}{1,1},1);

for ii = 1:size(average_power_info_transmission,2)
    average_power_info_transmission{ii} = zeros(num_rounds,1);
end

num_repetitions = size(total_power_info_transmission,1);
% num_repetitions = 2;
for repetition = 1:num_repetitions
    
    average_power_info_transmission{1} = average_power_info_transmission{1} + total_power_info_transmission{repetition}{1,1};
    average_power_info_transmission{2} = average_power_info_transmission{2} + total_power_info_transmission{repetition}{2,2};
    average_power_info_transmission{3} = average_power_info_transmission{3} + total_power_info_transmission{repetition}{3,3};

end

for ii = 1:size(average_power_info_transmission,2)
    average_power_info_transmission{ii} = average_power_info_transmission{ii}/num_repetitions;
end

figure;
hold on;

title('Total power used for information transmision');
plot(1:num_rounds,average_power_info_transmission{1},'b','DisplayName','distance');
plot(1:num_rounds,average_power_info_transmission{2},'g','DisplayName','balanced');
plot(1:num_rounds,average_power_info_transmission{3},'r','DisplayName','interest');
legend('show')

%% average interest based aggragation metric
% IAF1
average_interest_based_aggragation_metric = cell(1,3);
num_rounds = size(metric_iaf1{1}{1,1},1);

for ii = 1:size(average_interest_based_aggragation_metric,2)
    average_interest_based_aggragation_metric{ii} = zeros(num_rounds,1);
end

% num_repetitions = size(metric_iaf1,1);
num_repetitions = 1;
for repetition = 1:num_repetitions
    
    average_interest_based_aggragation_metric{1} = average_interest_based_aggragation_metric{1} + metric_iaf1{repetition}{1,1};
    average_interest_based_aggragation_metric{2} = average_interest_based_aggragation_metric{2} + metric_iaf1{repetition}{2,2};
    average_interest_based_aggragation_metric{3} = average_interest_based_aggragation_metric{3} + metric_iaf1{repetition}{3,3};

end

for ii = 1:size(average_interest_based_aggragation_metric,2)
    average_interest_based_aggragation_metric{ii} = average_interest_based_aggragation_metric{ii}/num_repetitions;
end

figure;
hold on;

title('Interest based aggragation metric 1');
plot(1:num_rounds,average_interest_based_aggragation_metric{1},'b','DisplayName','distance');
plot(1:num_rounds,average_interest_based_aggragation_metric{2},'g','DisplayName','balanced');
plot(1:num_rounds,average_interest_based_aggragation_metric{3},'r','DisplayName','interest');
legend('show')

% IAF2
average_interest_based_aggragation_metric = cell(1,3);
num_rounds = size(metric_iaf2{1}{1,1},1);

for ii = 1:size(average_interest_based_aggragation_metric,2)
    average_interest_based_aggragation_metric{ii} = zeros(num_rounds,1);
end

% num_repetitions = size(metric_iaf1,1);
num_repetitions = 1;
for repetition = 1:num_repetitions
    
    average_interest_based_aggragation_metric{1} = average_interest_based_aggragation_metric{1} + metric_iaf2{repetition}{1,1};
    average_interest_based_aggragation_metric{2} = average_interest_based_aggragation_metric{2} + metric_iaf2{repetition}{2,2};
    average_interest_based_aggragation_metric{3} = average_interest_based_aggragation_metric{3} + metric_iaf2{repetition}{3,3};

end

for ii = 1:size(average_interest_based_aggragation_metric,2)
    average_interest_based_aggragation_metric{ii} = average_interest_based_aggragation_metric{ii}/num_repetitions;
end

figure;
hold on;

title('Interest based aggragation metric 1');
plot(1:num_rounds,average_interest_based_aggragation_metric{1},'b','DisplayName','distance');
plot(1:num_rounds,average_interest_based_aggragation_metric{2},'g','DisplayName','balanced');
plot(1:num_rounds,average_interest_based_aggragation_metric{3},'r','DisplayName','interest');
legend('show')