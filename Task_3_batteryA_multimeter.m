filename = 'Task_3_batteryA_multimeter';
sheet = 'Tabelle1';
data = readtable(filename, 'Sheet', sheet);


figure;
plot(data.Time_minutes_,data.I_A_, 'r', 'LineWidth', 1.5);
xlabel("Time [minutes]")
ylabel("Current [A]")
legend("Current [A]")
grid on


