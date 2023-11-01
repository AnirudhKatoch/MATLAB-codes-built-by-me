% Task_3_3_SET1_MB122_0_2C = readtable('Task_3,3_SET_1_MB122_0,2C', 'Sheet','Tabelle1');
% Task_3_3_SET1_MB124_0_2C = readtable('Task_3,3_SET_1_MB124_0,2C', 'Sheet','Tabelle1');
% Task_3_3_SET1_MB137_0_2C = readtable('Task_3,3_SET_1_MB137_0,2C', 'Sheet','Tabelle1');
% Task_3_3_SET2_MB149_0_2C = readtable('Task_3,3_SET_2_MB149_0,2C', 'Sheet','Tabelle1');
% Task_3_3_SET2_MB140_0_2C = readtable('Task_3,3_SET_2_MB140_0,2C', 'Sheet','Tabelle1');
% Task_3_3_SET2_MB138_0_2C = readtable('Task_3,3_SET_2_MB138_0,2C', 'Sheet','Tabelle1');

Time = 60 *(Task_3_3_SET1_MB122_0_2C.Time_h_);

T_25_SOC_30_I_A = Task_3_3_SET1_MB122_0_2C.I_A_;

T_25_SOC_30_U_V = Task_3_3_SET1_MB122_0_2C.U_V_;
T_25_SOC_60_U_V = Task_3_3_SET1_MB124_0_2C.U_V_;
T_25_SOC_80_U_V = Task_3_3_SET1_MB137_0_2C.U_V_;
T_50_SOC_30_U_V = Task_3_3_SET2_MB149_0_2C.U_V_;
T_50_SOC_60_U_V = Task_3_3_SET2_MB140_0_2C.U_V_;
T_50_SOC_80_U_V = Task_3_3_SET2_MB138_0_2C.U_V_;

% subplot(2, 1, 1);
plot(Time,T_25_SOC_30_U_V, 'r', 'LineWidth', 1.5)
hold on 
plot(Time,T_25_SOC_60_U_V,'b','LineWidth', 1.5)
hold on 
plot(Time,T_25_SOC_80_U_V, 'g', 'LineWidth', 1.5)
hold on 
plot(Time,T_50_SOC_30_U_V,'c','LineWidth', 1.5)
hold on 
plot(Time,T_50_SOC_60_U_V, 'k', 'LineWidth', 1.5)
hold on 
plot(Time,T_50_SOC_80_U_V,'m','LineWidth', 1.5)
hold on 
legend("T 25°C SOC 30%","T 25°C SOC 60%","T 25°C SOC 80%","T 50°C SOC 30%","T 50°C SOC 60%","T 50°C SOC 80%")
grid on
xlabel("Time [minutes]")
ylabel("U [V]")
% xlim([0 18])
ylim([3.55 4.45])

% subplot(2, 1, 2);
% plot(Time,T_25_SOC_30_I_A,'b','LineWidth', 1.5)
% hold on 
% grid on
% xlabel("Time [minutes]")
% ylabel("I [A]")
% grid on

