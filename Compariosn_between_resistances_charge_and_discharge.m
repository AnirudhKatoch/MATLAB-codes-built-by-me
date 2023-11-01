SOC = [30, 60, 80];

Resistance_25_20ms_charge = [110.4, 101.0 , 90.33];
Resistance_50_20ms_charge = [83.36, 73.92,72.66];
Resistance_25_10ms_charge = [131.3, 123.7, 110.1];
Resistance_50_10ms_charge = [100.9, 90.52, 88.68];

% Plot SOC vs Resistance for charge at 20 ms
subplot(2, 2, 1);
plot(SOC, Resistance_25_20ms_charge, 'bo-', 'LineWidth', 1.5);
hold on
plot(SOC, Resistance_50_20ms_charge, 'ro-', 'LineWidth', 1.5);
xlabel('SOC [%]');
ylabel('Resistance [mΩ]');
legend('T = 25 °C', 'T = 50 °C','Location', 'northeast');
title('Charge R_i after 20ms')
xlim([0 100]);
ylim([70 135]);
xticks(0:20:100);
hold off

% Plot SOC vs Resistance for charge at 10 ms
subplot(2, 2, 3);
plot(SOC, Resistance_25_10ms_charge, 'bx-', 'LineWidth', 1.5);
hold on
plot(SOC, Resistance_50_10ms_charge, 'rx-', 'LineWidth', 1.5);
xlabel('SOC [%]');
ylabel('Resistance [mΩ]');
legend('T = 25 °C','T = 50 °C','Location', 'southwest');
title('Charge R_i after 10s')
xlim([0 100]);
ylim([70 135]);
xticks(0:20:100);
hold off


Resistance_25_20ms_discharge = [109.9, 100.0 , 89.39];
Resistance_50_20ms_discharge = [82.92, 73.81,72.49];
Resistance_25_10ms_discharge = [132.7, 127.6, 113.0];
Resistance_50_10ms_discharge = [101.6, 91.95, 88.65];

% Plot SOC vs Resistance for discharge at 20 ms
subplot(2, 2, 2);
plot(SOC, Resistance_25_20ms_discharge, 'bo-', 'LineWidth', 1.5);
hold on
plot(SOC, Resistance_50_20ms_discharge, 'ro-', 'LineWidth', 1.5);
xlabel('SOC [%]');
ylabel('Resistance [mΩ]');
legend('T = 25 °C', 'T = 50 °C','Location', 'northeast');
title('Discharge R_i after 20ms')
xlim([0 100]);
ylim([70 135]);
xticks(0:20:100);
hold off

% Plot SOC vs Resistance for discharge at 10 ms
subplot(2, 2, 4);
plot(SOC, Resistance_25_10ms_discharge, 'bx-', 'LineWidth', 1.5);
hold on
plot(SOC, Resistance_50_10ms_discharge, 'rx-', 'LineWidth', 1.5);
xlabel('SOC [%]');
ylabel('Resistance [mΩ]');
legend('T = 25 °C','T = 50 °C','Location', 'southwest');
title('Disharge R_i after 10s')
xlim([0 100]);
ylim([70 135]);
xticks(0:20:100);
hold off