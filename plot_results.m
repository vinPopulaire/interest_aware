figure;
hold on;

title('Total system energy consumed');
plot(1:rounds,total_system_energy_consumed{1,1},'b','DisplayName','distance');
plot(1:rounds,total_system_energy_consumed{2,2},'g','DisplayName','balanced');
plot(1:rounds,total_system_energy_consumed{3,3},'r','DisplayName','interest');
legend('show')

figure;
hold on;
title('Total power used for information transmission');
plot(1:rounds,total_power_info_transmission{1,1},'b','DisplayName','distance');
plot(1:rounds,total_power_info_transmission{2,2},'g','DisplayName','balanced');
plot(1:rounds,total_power_info_transmission{3,3},'r','DisplayName','interest');
legend('show')