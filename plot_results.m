figure;
hold on;

repetition = 1;

title('Total system energy consumed');
plot(1:rounds,total_system_energy_consumed{repetition}{1,1},'b','DisplayName','distance');
plot(1:rounds,total_system_energy_consumed{repetition}{2,2},'g','DisplayName','balanced');
plot(1:rounds,total_system_energy_consumed{repetition}{3,3},'r','DisplayName','interest');
legend('show')

figure;
hold on;
title('Total power used for information transmission');
plot(1:rounds,total_power_info_transmission{repetition}{1,1},'b','DisplayName','distance');
plot(1:rounds,total_power_info_transmission{repetition}{2,2},'g','DisplayName','balanced');
plot(1:rounds,total_power_info_transmission{repetition}{3,3},'r','DisplayName','interest');
legend('show')