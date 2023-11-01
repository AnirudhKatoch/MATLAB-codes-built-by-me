SOC = [30, 60, 80];

Resistance_25_20ms = [110.4, 101.0 , 90.33];
Resistance_50_20ms = [83.36, 73.92,72.66];
Resistance_25_10ms = [131.3, 123.7, 110.1];
Resistance_50_10ms = [100.9, 90.52, 88.68];

% Plot SOC vs Resistance for charge at 20 ms
subplot(1, 2, 1);
plot(SOC, Resistance_25_20ms, 'bo-', 'LineWidth', 1.5);
hold on
plot(SOC, Resistance_50_20ms, 'ro-', 'LineWidth', 1.5);
xlabel('SOC [%]');
ylabel('Resistance [mΩ]');
legend('T = 25 °C', 'T = 50 °C','Location', 'northeast');
title('Charge R_i after 20ms')
xlim([0 100]);
ylim([70 135]);
xticks(0:20:100);
hold off

% Plot SOC vs Resistance for charge at 10 ms
subplot(1, 2, 2);
plot(SOC, Resistance_25_10ms, 'bx-', 'LineWidth', 1.5);
hold on
plot(SOC, Resistance_50_10ms, 'rx-', 'LineWidth', 1.5);
xlabel('SOC [%]');
ylabel('Resistance [mΩ]');
legend('T = 25 °C','T = 50 °C','Location', 'southeast');
title('Charge R_i after 10ms')
xlim([0 100]);
ylim([70 135]);
xticks(0:20:100);
hold off