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