filename = 'Task_3_batteryA';
sheet = 'Tabelle1';
data = readtable(filename, 'Sheet', sheet);
for i = 1:numel(data.I_A_)
    if data.I_A_(i) < -4 || data.I_A_(i) > 4
        data.I_A_(i) = data.I_A_(i) / 1000000;
    end
end

figure;
plot(data.Time_minutes_,data.U_V_,'b','LineWidth', 1.5);
xlabel("Time [minutes]")
ylabel("Voltage [V]")
grid on

figure;
plot(data.Time_minutes_,data.I_A_, 'r', 'LineWidth', 1.5);
xlabel("Time [minutes]")
ylabel("Current [A]")
grid on

figure;
plot(data.Time_minutes_,data.Ah_Ah_, 'k', 'LineWidth', 1.5);
xlabel("Time [minutes]")
ylabel("Charge [Ah]")
grid on

