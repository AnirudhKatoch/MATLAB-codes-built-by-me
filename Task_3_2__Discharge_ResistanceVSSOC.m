SOC = [30, 60, 80];

Resistance_25_20ms = [109.9, 100.0 , 89.39];
Resistance_50_20ms = [82.92, 73.81,72.49];
Resistance_25_10ms = [132.7, 127.6, 113.0];
Resistance_50_10ms = [101.6, 91.95, 88.65];

% Plot SOC vs Resistance for discharge at 20 ms
subplot(1, 2, 1);
plot(SOC, Resistance_25_20ms, 'bo-', 'LineWidth', 1.5);
hold on
plot(SOC, Resistance_50_20ms, 'ro-', 'LineWidth', 1.5);
xlabel('SOC [%]');
ylabel('Resistance [mΩ]');
legend('T = 25 °C', 'T = 50 °C','Location', 'northeast');
title('Disharge R_i after 20ms')
xlim([0 100]);
ylim([70 135]);
xticks(0:20:100);
hold off

% Plot SOC vs Resistance for discharge at 10 ms
subplot(1, 2, 2);
plot(SOC, Resistance_25_10ms, 'bx-', 'LineWidth', 1.5);
hold on
plot(SOC, Resistance_50_10ms, 'rx-', 'LineWidth', 1.5);
xlabel('SOC [%]');
ylabel('Resistance [mΩ]');
legend('T = 25 °C','T = 50 °C','Location', 'southeast');
title('Disharge R_i after 10s')
xlim([0 100]);
ylim([70 135]);
xticks(0:20:100);
hold off