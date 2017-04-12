m10 = load('results_balanced_cases_m_10_repetitions_100_rounds_10.mat');
m20 = load('results_balanced_cases_m_20_repetitions_100_rounds_10.mat');
m30 = load('results_balanced_cases_m_30_repetitions_100_rounds_10.mat');
m40 = load('results_balanced_cases_m_40_repetitions_100_rounds_10.mat');
m50 = load('results_balanced_cases_m_50_repetitions_100_rounds_10.mat');

% gia kathe case
average_system_energy_consumed = cell(1,3);

num_rounds = size(m10.total_system_energy_consumed{1}{1,1},1);
num_repetitions = size(m10.total_system_energy_consumed,1);

% arxikopoiisi gia kathe size
for ii = 1:size(average_system_energy_consumed,2)
    average_system_energy_consumed{ii} = zeros(5,1);
end

for repetition = 1:num_repetitions
    
    average_system_energy_consumed{1}(1) = average_system_energy_consumed{1}(1) + m10.total_system_energy_consumed{repetition}{1}(num_rounds);
    average_system_energy_consumed{2}(1) = average_system_energy_consumed{2}(1) + m10.total_system_energy_consumed{repetition}{2}(num_rounds);
    average_system_energy_consumed{3}(1) = average_system_energy_consumed{3}(1) + m10.total_system_energy_consumed{repetition}{3}(num_rounds);
    
    average_system_energy_consumed{1}(2) = average_system_energy_consumed{1}(2) + m20.total_system_energy_consumed{repetition}{1}(num_rounds);
    average_system_energy_consumed{2}(2) = average_system_energy_consumed{2}(2) + m20.total_system_energy_consumed{repetition}{2}(num_rounds);
    average_system_energy_consumed{3}(2) = average_system_energy_consumed{3}(2) + m20.total_system_energy_consumed{repetition}{3}(num_rounds);

    average_system_energy_consumed{1}(3) = average_system_energy_consumed{1}(3) + m30.total_system_energy_consumed{repetition}{1}(num_rounds);
    average_system_energy_consumed{2}(3) = average_system_energy_consumed{2}(3) + m30.total_system_energy_consumed{repetition}{2}(num_rounds);
    average_system_energy_consumed{3}(3) = average_system_energy_consumed{3}(3) + m30.total_system_energy_consumed{repetition}{3}(num_rounds);

    average_system_energy_consumed{1}(4) = average_system_energy_consumed{1}(4) + m40.total_system_energy_consumed{repetition}{1}(num_rounds);
    average_system_energy_consumed{2}(4) = average_system_energy_consumed{2}(4) + m40.total_system_energy_consumed{repetition}{2}(num_rounds);
    average_system_energy_consumed{3}(4) = average_system_energy_consumed{3}(4) + m40.total_system_energy_consumed{repetition}{3}(num_rounds);

    average_system_energy_consumed{1}(5) = average_system_energy_consumed{1}(5) + m50.total_system_energy_consumed{repetition}{1}(num_rounds);
    average_system_energy_consumed{2}(5) = average_system_energy_consumed{2}(5) + m50.total_system_energy_consumed{repetition}{2}(num_rounds);
    average_system_energy_consumed{3}(5) = average_system_energy_consumed{3}(5) + m50.total_system_energy_consumed{repetition}{3}(num_rounds);

end

for ii = 1:size(average_system_energy_consumed,2)
    average_system_energy_consumed{ii} = average_system_energy_consumed{ii}/num_repetitions;
end

figure;
hold on;

title('Total system energy consumed');
plot(10:10:50,average_system_energy_consumed{1},'b','DisplayName','worst case');
plot(10:10:50,average_system_energy_consumed{2},'g','DisplayName','random case');
plot(10:10:50,average_system_energy_consumed{3},'r','DisplayName','best case');
legend('show')


printpdf('figures/total_energy_consumed_different_ms');

set(gcf, 'PaperPositionMode','auto')
print('-dpng','figures/total_energy_consumed_different_ms')