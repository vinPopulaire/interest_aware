m = 40;
m = num2str(m);
m = [m 'diff_balance_10_rep'];

%% Average system energy consumed
average_system_energy_consumed = cell(1,11);
num_rounds = size(total_system_energy_consumed{1}{1},1);

for ii = [1 3 11]
    average_system_energy_consumed{ii} = zeros(num_rounds,1);
end

num_repetitions = size(total_system_energy_consumed,1);
% num_repetitions = 2;
for repetition = 1:num_repetitions
    
    for ii = [1 3 11]
        average_system_energy_consumed{ii} = average_system_energy_consumed{ii} + total_system_energy_consumed{repetition}{ii};
    end
    
end

for ii = [1 3 11]
    average_system_energy_consumed{ii} = average_system_energy_consumed{ii}/num_repetitions;
end

figure;
hold on;

title('Total system energy consumed');
plot(1:num_rounds,average_system_energy_consumed{1},'g','LineWidth',2,'DisplayName','interest');
% plot(1:num_rounds,average_system_energy_consumed{2},'r','LineWidth',2,'DisplayName','0.1');
plot(1:num_rounds,average_system_energy_consumed{3},'b','LineWidth',2,'DisplayName','0.2');
% plot(1:num_rounds,average_system_energy_consumed{4},'Color',[0.3 0.3 0.3],'LineWidth',2,'DisplayName','0.3');
% plot(1:num_rounds,average_system_energy_consumed{5},'Color',[0.4 0.4 0.4],'LineWidth',2,'DisplayName','0.4');
% plot(1:num_rounds,average_system_energy_consumed{6},'Color',[0.5 0.5 0.5],'LineWidth',2,'DisplayName','0.5');
% plot(1:num_rounds,average_system_energy_consumed{7},'Color',[0.6 0.6 0.6],'LineWidth',2,'DisplayName','0.6');
% plot(1:num_rounds,average_system_energy_consumed{8},'Color',[0.7 0.7 0.7],'LineWidth',2,'DisplayName','0.7');
% plot(1:num_rounds,average_system_energy_consumed{9},'Color',[0.8 0.8 0.8],'LineWidth',2,'DisplayName','0.8');
% plot(1:num_rounds,average_system_energy_consumed{10},'Color',[0.9 0.9 0.9],'LineWidth',2,'DisplayName','0.9');
plot(1:num_rounds,average_system_energy_consumed{11},'Color',[0 1 1],'LineWidth',2,'DisplayName','distance');
legend('show')

printpdf(['figures/total_energy_consumed_m_', m]);

set(gcf, 'PaperPositionMode','auto')
print('-dpng',['figures/total_energy_consumed_m_', m])

%% Average power info transmission
average_power_info_transmission = cell(1,11);
num_rounds = size(total_power_info_transmission{1}{1},1);

for ii = [1 3 11]
    average_power_info_transmission{ii} = zeros(num_rounds,1);
end

num_repetitions = size(total_power_info_transmission,1);
% num_repetitions = 2;
for repetition = 1:num_repetitions 
    
    for ii = [1 3 11]
        average_power_info_transmission{ii} = average_power_info_transmission{ii} + total_power_info_transmission{repetition}{ii};
    end
    
end

for ii = [1 3 11]
    average_power_info_transmission{ii} = average_power_info_transmission{ii}/num_repetitions;
end

figure;
hold on;

title('Total power used for information transmision');
plot(1:num_rounds,average_power_info_transmission{1},'g','LineWidth',2,'DisplayName','interest');
% plot(1:num_rounds,average_power_info_transmission{2},'r','LineWidth',2,'DisplayName','0.1');
plot(1:num_rounds,average_power_info_transmission{3},'b','LineWidth',2,'DisplayName','0.2');
% plot(1:num_rounds,average_power_info_transmission{4},'Color',[0.3 0.3 0.3],'LineWidth',2,'DisplayName','0.3');
% plot(1:num_rounds,average_power_info_transmission{5},'Color',[0.4 0.4 0.4],'LineWidth',2,'DisplayName','0.4');
% plot(1:num_rounds,average_power_info_transmission{6},'Color',[0.5 0.5 0.5],'LineWidth',2,'DisplayName','0.5');
% plot(1:num_rounds,average_power_info_transmission{7},'Color',[0.6 0.6 0.6],'LineWidth',2,'DisplayName','0.6');
% plot(1:num_rounds,average_power_info_transmission{8},'Color',[0.7 0.7 0.7],'LineWidth',2,'DisplayName','0.7');
% plot(1:num_rounds,average_power_info_transmission{9},'Color',[0.8 0.8 0.8],'LineWidth',2,'DisplayName','0.8');
% plot(1:num_rounds,average_power_info_transmission{10},'Color',[0.9 0.9 0.9],'LineWidth',2,'DisplayName','0.9');
plot(1:num_rounds,average_power_info_transmission{11},'Color',[0 1 1],'LineWidth',2,'DisplayName','distance');
legend('show')

printpdf(['figures/total_power_info_transmission_m_', m]);

set(gcf, 'PaperPositionMode','auto')
print('-dpng',['figures/total_power_info_transmission_m_', m])

%% Average power info transmission devices only
average_power_info_transmission_only_devices = cell(1,11);
num_rounds = size(total_power_info_transmission_only_devices{1}{1},1);

for ii = [1 3 11]
    average_power_info_transmission_only_devices{ii} = zeros(num_rounds,1);
end

num_repetitions = size(total_power_info_transmission,1);
% num_repetitions = 2;
for repetition = 1:num_repetitions
    
    for ii = [1 3 11]
        average_power_info_transmission_only_devices{ii} = average_power_info_transmission_only_devices{ii} + total_power_info_transmission_only_devices{repetition}{ii};
    end

end

for ii = [1 3 11]
    average_power_info_transmission_only_devices{ii} = average_power_info_transmission_only_devices{ii}/num_repetitions;
end

figure;
hold on;

title('Total power used for information transmision by devices only');
plot(1:num_rounds,average_power_info_transmission_only_devices{1},'g','LineWidth',2,'DisplayName','interest');
% plot(1:num_rounds,average_power_info_transmission_only_devices{2},'r','LineWidth',2,'DisplayName','0.1');
plot(1:num_rounds,average_power_info_transmission_only_devices{3},'b','LineWidth',2,'DisplayName','0.2');
% plot(1:num_rounds,average_power_info_transmission_only_devices{4},'Color',[0.3 0.3 0.3],'LineWidth',2,'DisplayName','0.3');
% plot(1:num_rounds,average_power_info_transmission_only_devices{5},'Color',[0.4 0.4 0.4],'LineWidth',2,'DisplayName','0.4');
% plot(1:num_rounds,average_power_info_transmission_only_devices{6},'Color',[0.5 0.5 0.5],'LineWidth',2,'DisplayName','0.5');
% plot(1:num_rounds,average_power_info_transmission_only_devices{7},'Color',[0.6 0.6 0.6],'LineWidth',2,'DisplayName','0.6');
% plot(1:num_rounds,average_power_info_transmission_only_devices{8},'Color',[0.7 0.7 0.7],'LineWidth',2,'DisplayName','0.7');
% plot(1:num_rounds,average_power_info_transmission_only_devices{9},'Color',[0.8 0.8 0.8],'LineWidth',2,'DisplayName','0.8');
% plot(1:num_rounds,average_power_info_transmission_only_devices{10},'Color',[0.9 0.9 0.9],'LineWidth',2,'DisplayName','0.9');
plot(1:num_rounds,average_power_info_transmission_only_devices{11},'Color',[0 1 1],'LineWidth',2,'DisplayName','distance');
legend('show')

printpdf(['figures/total_power_info_transmission_only_devices_m_', m]);

set(gcf, 'PaperPositionMode','auto')
print('-dpng',['figures/total_power_info_transmission_only_devices_m_', m])

%% average interest based aggragation metric
% IAF1
average_interest_based_aggragation_metric = cell(1,11);
num_rounds = size(metric_iaf1{1}{1},1);

for ii = [1 3 11]
    average_interest_based_aggragation_metric{ii} = zeros(num_rounds,1);
end

num_repetitions = size(metric_iaf1,1);
% num_repetitions = 1;
for repetition = 1:num_repetitions
    
    for ii = [1 3 11]
        average_interest_based_aggragation_metric{ii} = average_interest_based_aggragation_metric{ii} + metric_iaf1{repetition}{ii};
    end

end

for ii = [1 3 11]
    average_interest_based_aggragation_metric{ii} = average_interest_based_aggragation_metric{ii}/num_repetitions;
end

figure;
hold on;

title('Interest based aggragation metric 1');
plot(1:num_rounds,average_interest_based_aggragation_metric{1},'g','LineWidth',2,'DisplayName','interest');
% plot(1:num_rounds,average_interest_based_aggragation_metric{2},'r','LineWidth',2,'DisplayName','0.1');
plot(1:num_rounds,average_interest_based_aggragation_metric{3},'b','LineWidth',2,'DisplayName','0.2');
% plot(1:num_rounds,average_interest_based_aggragation_metric{4},'Color',[0.3 0.3 0.3],'LineWidth',2,'DisplayName','0.3');
% plot(1:num_rounds,average_interest_based_aggragation_metric{5},'Color',[0.4 0.4 0.4],'LineWidth',2,'DisplayName','0.4');
% plot(1:num_rounds,average_interest_based_aggragation_metric{6},'Color',[0.5 0.5 0.5],'LineWidth',2,'DisplayName','0.5');
% plot(1:num_rounds,average_interest_based_aggragation_metric{7},'Color',[0.6 0.6 0.6],'LineWidth',2,'DisplayName','0.6');
% plot(1:num_rounds,average_interest_based_aggragation_metric{8},'Color',[0.7 0.7 0.7],'LineWidth',2,'DisplayName','0.7');
% plot(1:num_rounds,average_interest_based_aggragation_metric{9},'Color',[0.8 0.8 0.8],'LineWidth',2,'DisplayName','0.8');
% plot(1:num_rounds,average_interest_based_aggragation_metric{10},'Color',[0.9 0.9 0.9],'LineWidth',2,'DisplayName','0.9');
plot(1:num_rounds,average_interest_based_aggragation_metric{11},'Color',[0 1 1],'LineWidth',2,'DisplayName','distance');
legend('show')

printpdf(['figures/power_iaf1_m_', m]);

set(gcf, 'PaperPositionMode','auto')
print('-dpng',['figures/power_iaf1_m_', m])

% IAF2
average_interest_based_aggragation_metric2 = cell(1,11);
num_rounds = size(metric_iaf2{1}{1},1);

for ii = [1 3 11]
    average_interest_based_aggragation_metric2{ii} = zeros(num_rounds,1);
end

num_repetitions = size(metric_iaf1,1);
% num_repetitions = 1;
for repetition = 1:num_repetitions
    
    for ii = [1 3 11]
        average_interest_based_aggragation_metric2{ii} = average_interest_based_aggragation_metric2{ii} + metric_iaf2{repetition}{ii};
    end

end

for ii = [1 3 11]
    average_interest_based_aggragation_metric2{ii} = average_interest_based_aggragation_metric2{ii}/num_repetitions;
end

figure;
hold on;

title('Interest based aggragation metric 2');
plot(1:num_rounds,average_interest_based_aggragation_metric2{1},'g','LineWidth',2,'DisplayName','interest');
% plot(1:num_rounds,average_interest_based_aggragation_metric2{2},'r','LineWidth',2,'DisplayName','0.1');
plot(1:num_rounds,average_interest_based_aggragation_metric2{3},'b','LineWidth',2,'DisplayName','0.2');
% plot(1:num_rounds,average_interest_based_aggragation_metric2{4},'Color',[0.3 0.3 0.3],'LineWidth',2,'DisplayName','0.3');
% plot(1:num_rounds,average_interest_based_aggragation_metric2{5},'Color',[0.4 0.4 0.4],'LineWidth',2,'DisplayName','0.4');
% plot(1:num_rounds,average_interest_based_aggragation_metric2{6},'Color',[0.5 0.5 0.5],'LineWidth',2,'DisplayName','0.5');
% plot(1:num_rounds,average_interest_based_aggragation_metric2{7},'Color',[0.6 0.6 0.6],'LineWidth',2,'DisplayName','0.6');
% plot(1:num_rounds,average_interest_based_aggragation_metric2{8},'Color',[0.7 0.7 0.7],'LineWidth',2,'DisplayName','0.7');
% plot(1:num_rounds,average_interest_based_aggragation_metric2{9},'Color',[0.8 0.8 0.8],'LineWidth',2,'DisplayName','0.8');
% plot(1:num_rounds,average_interest_based_aggragation_metric2{10},'Color',[0.9 0.9 0.9],'LineWidth',2,'DisplayName','0.9');
plot(1:num_rounds,average_interest_based_aggragation_metric2{11},'Color',[0 1 1],'LineWidth',2,'DisplayName','distance');
legend('show')

printpdf(['figures/power_iaf2_m_', m]);

set(gcf, 'PaperPositionMode','auto')
print('-dpng',['figures/power_iaf2_m_', m])

%% Average cluster size
average_cluster_size = cell(1,11);
num_rounds = size(total_system_energy_consumed{1}{1},1);

for ii = [1 3 11]
    average_cluster_size{ii} = zeros(num_rounds,1);
end

num_repetitions = size(total_system_energy_consumed,1);

for repetition = 1:num_repetitions
    
    for ii = [1 3 11]
        average_cluster_size{ii} = average_cluster_size{ii} + size(all_clusters{repetition}{ii},2);
    end
   
end

for ii = [1 3 11]
    average_cluster_size{ii} = average_cluster_size{ii}/num_repetitions;
end

figure;
hold on;

title('Average cluster size');
plot(1:num_rounds,average_cluster_size{1},'g','LineWidth',2,'DisplayName','interest');
% plot(1:num_rounds,average_cluster_size{2},'r','LineWidth',2,'DisplayName','0.1');
plot(1:num_rounds,average_cluster_size{3},'b','LineWidth',2,'DisplayName','0.2');
% plot(1:num_rounds,average_cluster_size{4},'Color',[0.3 0.3 0.3],'LineWidth',2,'DisplayName','0.3');
% plot(1:num_rounds,average_cluster_size{5},'Color',[0.4 0.4 0.4],'LineWidth',2,'DisplayName','0.4');
% plot(1:num_rounds,average_cluster_size{6},'Color',[0.5 0.5 0.5],'LineWidth',2,'DisplayName','0.5');
% plot(1:num_rounds,average_cluster_size{7},'Color',[0.6 0.6 0.6],'LineWidth',2,'DisplayName','0.6');
% plot(1:num_rounds,average_cluster_size{8},'Color',[0.7 0.7 0.7],'LineWidth',2,'DisplayName','0.7');
% plot(1:num_rounds,average_cluster_size{9},'Color',[0.8 0.8 0.8],'LineWidth',2,'DisplayName','0.8');
% plot(1:num_rounds,average_cluster_size{10},'Color',[0.9 0.9 0.9],'LineWidth',2,'DisplayName','0.9');
plot(1:num_rounds,average_cluster_size{11},'Color',[0 1 1],'LineWidth',2,'DisplayName','distance');
legend('show')

printpdf(['figures/cluster_size_m_', m]);

set(gcf, 'PaperPositionMode','auto')
print('-dpng',['figures/cluster_size_m_', m])

%% average interest based aggragation metric only metric
% IAF1
average_interest_based_aggragation_metric_only_metric = cell(1,11);
num_rounds = size(iaf1{1}{1},1);

for ii = [1 3 11]
    average_interest_based_aggragation_metric_only_metric{ii} = zeros(num_rounds,1);
end

num_repetitions = size(metric_iaf1,1);
% num_repetitions = 1;
for repetition = 1:num_repetitions
    
    for ii = [1 3 11]
        average_interest_based_aggragation_metric_only_metric{ii} = average_interest_based_aggragation_metric_only_metric{ii} + iaf1{repetition}{ii};
    end

end

for ii = [1 3 11]
    average_interest_based_aggragation_metric_only_metric{ii} = average_interest_based_aggragation_metric_only_metric{ii}/num_repetitions;
end

figure;
hold on;

title('Interest based aggragation metric 1');
plot(1:num_rounds,average_interest_based_aggragation_metric_only_metric{1},'g','LineWidth',2,'DisplayName','interest');
% plot(1:num_rounds,average_interest_based_aggragation_metric_only_metric{2},'r','LineWidth',2,'DisplayName','0.1');
plot(1:num_rounds,average_interest_based_aggragation_metric_only_metric{3},'b','LineWidth',2,'DisplayName','0.2');
% plot(1:num_rounds,average_interest_based_aggragation_metric_only_metric{4},'Color',[0.3 0.3 0.3],'LineWidth',2,'DisplayName','0.3');
% plot(1:num_rounds,average_interest_based_aggragation_metric_only_metric{5},'Color',[0.4 0.4 0.4],'LineWidth',2,'DisplayName','0.4');
% plot(1:num_rounds,average_interest_based_aggragation_metric_only_metric{6},'Color',[0.5 0.5 0.5],'LineWidth',2,'DisplayName','0.5');
% plot(1:num_rounds,average_interest_based_aggragation_metric_only_metric{7},'Color',[0.6 0.6 0.6],'LineWidth',2,'DisplayName','0.6');
% plot(1:num_rounds,average_interest_based_aggragation_metric_only_metric{8},'Color',[0.7 0.7 0.7],'LineWidth',2,'DisplayName','0.7');
% plot(1:num_rounds,average_interest_based_aggragation_metric_only_metric{9},'Color',[0.8 0.8 0.8],'LineWidth',2,'DisplayName','0.8');
% plot(1:num_rounds,average_interest_based_aggragation_metric_only_metric{10},'Color',[0.9 0.9 0.9],'LineWidth',2,'DisplayName','0.9');
plot(1:num_rounds,average_interest_based_aggragation_metric_only_metric{11},'Color',[0 1 1],'LineWidth',2,'DisplayName','distance');
legend('show')

printpdf(['figures/iaf1_m_', m]);

set(gcf, 'PaperPositionMode','auto')
print('-dpng',['figures/iaf1_m_', m])

% IAF2
average_interest_based_aggragation_metric_only_metric2 = cell(1,11);
num_rounds = size(iaf2{1}{1},1);

for ii = [1 3 11]
    average_interest_based_aggragation_metric_only_metric2{ii} = zeros(num_rounds,1);
end

num_repetitions = size(metric_iaf1,1);
% num_repetitions = 1;
for repetition = 1:num_repetitions
    
    for ii = [1 3 11]
        average_interest_based_aggragation_metric_only_metric2{ii} = average_interest_based_aggragation_metric_only_metric2{ii} + iaf2{repetition}{ii};
    end

end

for ii = [1 3 11]
    average_interest_based_aggragation_metric_only_metric2{ii} = average_interest_based_aggragation_metric_only_metric2{ii}/num_repetitions;
end

figure;
hold on;

title('Interest based aggragation metric 2');
plot(1:num_rounds,average_interest_based_aggragation_metric_only_metric2{1},'g','LineWidth',2,'DisplayName','interest');
% plot(1:num_rounds,average_interest_based_aggragation_metric_only_metric2{2},'r','LineWidth',2,'DisplayName','0.1');
plot(1:num_rounds,average_interest_based_aggragation_metric_only_metric2{3},'b','LineWidth',2,'DisplayName','0.2');
% plot(1:num_rounds,average_interest_based_aggragation_metric_only_metric2{4},'Color',[0.3 0.3 0.3],'LineWidth',2,'DisplayName','0.3');
% plot(1:num_rounds,average_interest_based_aggragation_metric_only_metric2{5},'Color',[0.4 0.4 0.4],'LineWidth',2,'DisplayName','0.4');
% plot(1:num_rounds,average_interest_based_aggragation_metric_only_metric2{6},'Color',[0.5 0.5 0.5],'LineWidth',2,'DisplayName','0.5');
% plot(1:num_rounds,average_interest_based_aggragation_metric_only_metric2{7},'Color',[0.6 0.6 0.6],'LineWidth',2,'DisplayName','0.6');
% plot(1:num_rounds,average_interest_based_aggragation_metric_only_metric2{8},'Color',[0.7 0.7 0.7],'LineWidth',2,'DisplayName','0.7');
% plot(1:num_rounds,average_interest_based_aggragation_metric_only_metric2{9},'Color',[0.8 0.8 0.8],'LineWidth',2,'DisplayName','0.8');
% plot(1:num_rounds,average_interest_based_aggragation_metric_only_metric2{10},'Color',[0.9 0.9 0.9],'LineWidth',2,'DisplayName','0.9');
plot(1:num_rounds,average_interest_based_aggragation_metric_only_metric2{11},'Color',[0 1 1],'LineWidth',2,'DisplayName','distance');
legend('show')

printpdf(['figures/iaf2_m_', m]);

set(gcf, 'PaperPositionMode','auto')
print('-dpng',['figures/iaf2_m_', m])

%% total power with metric
average_power_with_metric1 = cell(1,11);
num_rounds = size(average_power_info_transmission_only_devices{1},1);

for ii = [1 3 11]
    average_power_with_metric1{ii} = average_power_info_transmission_only_devices{ii} + average_interest_based_aggragation_metric{ii};
end

figure;
hold on;

title('Total power with metric 1');
plot(1:num_rounds,average_power_with_metric1{1},'r','DisplayName','I-approach');
% plot(1:num_rounds,average_power_with_metric1{2},'r','LineWidth',2,'DisplayName','0.1');
plot(1:num_rounds,average_power_with_metric1{3},'g','DisplayName','IP-approach');
% plot(1:num_rounds,average_power_with_metric1{4},'Color',[0.3 0.3 0.3],'LineWidth',2,'DisplayName','0.3');
% plot(1:num_rounds,average_power_with_metric1{5},'Color',[0.4 0.4 0.4],'LineWidth',2,'DisplayName','0.4');
% plot(1:num_rounds,average_power_with_metric1{6},'Color',[0.5 0.5 0.5],'LineWidth',2,'DisplayName','0.5');
% plot(1:num_rounds,average_power_with_metric1{7},'Color',[0.6 0.6 0.6],'LineWidth',2,'DisplayName','0.6');
% plot(1:num_rounds,average_power_with_metric1{8},'Color',[0.7 0.7 0.7],'LineWidth',2,'DisplayName','0.7');
% plot(1:num_rounds,average_power_with_metric1{9},'Color',[0.8 0.8 0.8],'LineWidth',2,'DisplayName','0.8');
% plot(1:num_rounds,average_power_with_metric1{10},'Color',[0.9 0.9 0.9],'LineWidth',2,'DisplayName','0.9');
plot(1:num_rounds,average_power_with_metric1{11},'b','DisplayName','P-approach');
legend('show')

printpdf(['figures/total_power_with_metric1', m]);

set(gcf, 'PaperPositionMode','auto')
print('-dpng',['figures/total_power_with_metric1', m])

average_power_with_metric2 = cell(1,11);

for ii = [1 3 11]
    average_power_with_metric2{ii} = average_power_info_transmission_only_devices{ii} + average_interest_based_aggragation_metric2{ii};
end

figure;
hold on;

title('Total power with metric 2');
plot(1:num_rounds,average_power_with_metric2{1},'r','DisplayName','I-approach');
% plot(1:num_rounds,average_power_with_metric2{2},'r','LineWidth',2,'DisplayName','0.1');
plot(1:num_rounds,average_power_with_metric2{3},'g','DisplayName','IP-apprach');
% plot(1:num_rounds,average_power_with_metric2{4},'Color',[0.3 0.3 0.3],'LineWidth',2,'DisplayName','0.3');
% plot(1:num_rounds,average_power_with_metric2{5},'Color',[0.4 0.4 0.4],'LineWidth',2,'DisplayName','0.4');
% plot(1:num_rounds,average_power_with_metric2{6},'Color',[0.5 0.5 0.5],'LineWidth',2,'DisplayName','0.5');
% plot(1:num_rounds,average_power_with_metric2{7},'Color',[0.6 0.6 0.6],'LineWidth',2,'DisplayName','0.6');
% plot(1:num_rounds,average_power_with_metric2{8},'Color',[0.7 0.7 0.7],'LineWidth',2,'DisplayName','0.7');
% plot(1:num_rounds,average_power_with_metric2{9},'Color',[0.8 0.8 0.8],'LineWidth',2,'DisplayName','0.8');
% plot(1:num_rounds,average_power_with_metric2{10},'Color',[0.9 0.9 0.9],'LineWidth',2,'DisplayName','0.9');
plot(1:num_rounds,average_power_with_metric2{11},'b','DisplayName','P-approach');
legend('show')

printpdf(['figures/total_power_with_metric2', m]);

set(gcf, 'PaperPositionMode','auto')
print('-dpng',['figures/total_power_with_metric2', m])