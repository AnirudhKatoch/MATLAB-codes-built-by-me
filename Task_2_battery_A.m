filename = 'Task_2_2_batteryB';
sheet = 'Tabelle1';
data = readtable(filename, 'Sheet', sheet);
plot(data.Time_minutes_,data.U_V_,'b','LineWidth', 1.5)
hold on 
plot(data.Time_minutes_,data.I_A_, 'r', 'LineWidth', 1.5)
hold on 
plot(data.Time_minutes_,data.Ah_Ah_, 'k', 'LineWidth', 1.5)
hold on 
ylim([0 2.2])
grid on
legend("Voltage [V]","Current [A]","Charge [Ah]","Location","southeast")
xlabel("Time [minutes]")
