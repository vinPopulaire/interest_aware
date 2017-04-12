m = 20;
m = num2str(m);
m = [m 'no_sp'];

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

printpdf(['figures/total_energy_consumed_m_', m]);

set(gcf, 'PaperPositionMode','auto')
print('-dpng',['figures/total_energy_consumed_m_', m])

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

printpdf(['figures/total_power_info_transmission_m_', m]);

set(gcf, 'PaperPositionMode','auto')
print('-dpng',['figures/total_power_info_transmission_m_', m])

%% Average power info transmission devices only
average_power_info_transmission = cell(1,3);
num_rounds = size(total_power_info_transmission_only_devices{1}{1,1},1);

for ii = 1:size(average_power_info_transmission,2)
    average_power_info_transmission{ii} = zeros(num_rounds,1);
end

num_repetitions = size(total_power_info_transmission,1);
% num_repetitions = 2;
for repetition = 1:num_repetitions
    
    average_power_info_transmission{1} = average_power_info_transmission{1} + total_power_info_transmission_only_devices{repetition}{1,1};
    average_power_info_transmission{2} = average_power_info_transmission{2} + total_power_info_transmission_only_devices{repetition}{2,2};
    average_power_info_transmission{3} = average_power_info_transmission{3} + total_power_info_transmission_only_devices{repetition}{3,3};

end

for ii = 1:size(average_power_info_transmission,2)
    average_power_info_transmission{ii} = average_power_info_transmission{ii}/num_repetitions;
end

figure;
hold on;

title('Total power used for information transmision by devices only');
plot(1:num_rounds,average_power_info_transmission{1},'b','DisplayName','distance');
plot(1:num_rounds,average_power_info_transmission{2},'g','DisplayName','balanced');
plot(1:num_rounds,average_power_info_transmission{3},'r','DisplayName','interest');
legend('show')

printpdf(['figures/total_power_info_transmission_only_devices_m_', m]);

set(gcf, 'PaperPositionMode','auto')
print('-dpng',['figures/total_power_info_transmission_only_devices_m_', m])

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

printpdf(['figures/power_iaf1_m_', m]);

set(gcf, 'PaperPositionMode','auto')
print('-dpng',['figures/power_iaf1_m_', m])

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

title('Interest based aggragation metric 2');
plot(1:num_rounds,average_interest_based_aggragation_metric{1},'b','DisplayName','distance');
plot(1:num_rounds,average_interest_based_aggragation_metric{2},'g','DisplayName','balanced');
plot(1:num_rounds,average_interest_based_aggragation_metric{3},'r','DisplayName','interest');
legend('show')

printpdf(['figures/power_iaf2_m_', m]);

set(gcf, 'PaperPositionMode','auto')
print('-dpng',['figures/power_iaf2_m_', m])

%% Average cluster size
average_cluster_size = cell(1,3);
num_rounds = size(total_system_energy_consumed{1}{1,1},1);

for ii = 1:size(average_cluster_size,2)
    average_cluster_size{ii} = zeros(num_rounds,1);
end

num_repetitions = size(total_system_energy_consumed,1);

for repetition = 1:num_repetitions
    
    average_cluster_size{1} = average_cluster_size{1} + size(all_clusters{repetition}{1,1},2);
    average_cluster_size{2} = average_cluster_size{2} + size(all_clusters{repetition}{2,2},2);
    average_cluster_size{3} = average_cluster_size{3} + size(all_clusters{repetition}{3,3},2);

end

for ii = 1:size(average_cluster_size,2)
    average_cluster_size{ii} = average_cluster_size{ii}/num_repetitions;
end

figure;
hold on;

title('Average cluster size');
plot(1:num_rounds,average_cluster_size{1},'b','DisplayName','distance');
plot(1:num_rounds,average_cluster_size{2},'g','DisplayName','balanced');
plot(1:num_rounds,average_cluster_size{3},'r','DisplayName','interest');
legend('show')

printpdf(['figures/cluster_size_m_', m]);

set(gcf, 'PaperPositionMode','auto')
print('-dpng',['figures/cluster_size_m_', m])

%% average interest based aggragation metric only metric
% IAF1
average_interest_based_aggragation_metric_only_metric = cell(1,3);
num_rounds = size(iaf1{1}{1,1},1);

for ii = 1:size(average_interest_based_aggragation_metric_only_metric,2)
    average_interest_based_aggragation_metric_only_metric{ii} = zeros(num_rounds,1);
end

% num_repetitions = size(metric_iaf1,1);
num_repetitions = 1;
for repetition = 1:num_repetitions
    
    average_interest_based_aggragation_metric_only_metric{1} = average_interest_based_aggragation_metric_only_metric{1} + iaf1{repetition}{1,1};
    average_interest_based_aggragation_metric_only_metric{2} = average_interest_based_aggragation_metric_only_metric{2} + iaf1{repetition}{2,2};
    average_interest_based_aggragation_metric_only_metric{3} = average_interest_based_aggragation_metric_only_metric{3} + iaf1{repetition}{3,3};

end

for ii = 1:size(average_interest_based_aggragation_metric_only_metric,2)
    average_interest_based_aggragation_metric_only_metric{ii} = average_interest_based_aggragation_metric_only_metric{ii}/num_repetitions;
end

figure;
hold on;

title('Interest based aggragation metric 1');
plot(1:num_rounds,average_interest_based_aggragation_metric_only_metric{1},'b','DisplayName','distance');
plot(1:num_rounds,average_interest_based_aggragation_metric_only_metric{2},'g','DisplayName','balanced');
plot(1:num_rounds,average_interest_based_aggragation_metric_only_metric{3},'r','DisplayName','interest');
legend('show')

printpdf(['figures/iaf1_m_', m]);

set(gcf, 'PaperPositionMode','auto')
print('-dpng',['figures/iaf1_m_', m])

% IAF2
average_interest_based_aggragation_metric_only_metric = cell(1,3);
num_rounds = size(iaf2{1}{1,1},1);

for ii = 1:size(average_interest_based_aggragation_metric_only_metric,2)
    average_interest_based_aggragation_metric_only_metric{ii} = zeros(num_rounds,1);
end

% num_repetitions = size(metric_iaf1,1);
num_repetitions = 1;
for repetition = 1:num_repetitions
    
    average_interest_based_aggragation_metric_only_metric{1} = average_interest_based_aggragation_metric_only_metric{1} + iaf2{repetition}{1,1};
    average_interest_based_aggragation_metric_only_metric{2} = average_interest_based_aggragation_metric_only_metric{2} + iaf2{repetition}{2,2};
    average_interest_based_aggragation_metric_only_metric{3} = average_interest_based_aggragation_metric_only_metric{3} + iaf2{repetition}{3,3};

end

for ii = 1:size(average_interest_based_aggragation_metric_only_metric,2)
    average_interest_based_aggragation_metric_only_metric{ii} = average_interest_based_aggragation_metric_only_metric{ii}/num_repetitions;
end

figure;
hold on;

title('Interest based aggragation metric 2');
plot(1:num_rounds,average_interest_based_aggragation_metric_only_metric{1},'b','DisplayName','distance');
plot(1:num_rounds,average_interest_based_aggragation_metric_only_metric{2},'g','DisplayName','balanced');
plot(1:num_rounds,average_interest_based_aggragation_metric_only_metric{3},'r','DisplayName','interest');
legend('show')

printpdf(['figures/iaf2_m_', m]);

set(gcf, 'PaperPositionMode','auto')
print('-dpng',['figures/iaf2_m_', m])