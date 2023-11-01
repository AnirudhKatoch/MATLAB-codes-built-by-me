SOC = [30, 60, 80];

Efficiency_25_02C = [96.68, 96.77, 97.22];
Efficiency_25_1C = [84.57, 85.82, 87.77];
Efficiency_50_02C = [97.52, 97.79, 97.99];
Efficiency_50_1C = [88.52, 89.99, 90.31];

% Plot SOC vs Efficiency for I = 0.2 C
subplot(1, 2, 1);
plot(SOC, Efficiency_25_02C, 'bo-', 'LineWidth', 1.5);
hold on
plot(SOC, Efficiency_50_02C, 'ro-', 'LineWidth', 1.5);
xlabel('SOC [%]');
ylabel('Efficiency [%]');
title('I = 0.2 C');
legend('T = 25 °C', 'T = 50 °C','Location', 'southwest');
xlim([0 100]);
ylim([82 100]);
xticks(0:20:100);
hold off

% Plot SOC vs Efficiency for I = 1 C
subplot(1, 2, 2);
plot(SOC, Efficiency_25_1C, 'bx-', 'LineWidth', 1.5);
hold on
plot(SOC, Efficiency_50_1C, 'rx-', 'LineWidth', 1.5);
xlabel('SOC [%]');
ylabel('Efficiency [%]');
title('I = 1 C');
legend('T = 25 °C', 'T = 50 °C','Location', 'northeast');
xlim([0 100]);
ylim([82 100]);
xticks(0:20:100);
hold off