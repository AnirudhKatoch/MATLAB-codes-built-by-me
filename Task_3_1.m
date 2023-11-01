Sanyo_heating = readtable('Task_3,1_Sanyo', 'Sheet','Tabelle1');
Sanyo_cooling = readtable('Task_3,1_Sanyo_cooling', 'Sheet','Tabelle1');
Voltage_heat_ = Sanyo_heating.U_V_;
Voltage_heat = Voltage_heat_(1:end-8);
Voltage_cool = Sanyo_cooling.U_V_;
Time = 60*(Sanyo_cooling.Time_h_);

plot(Time,Voltage_cool,'b','LineWidth', 1.5)
hold on 
plot(Time,Voltage_heat, 'r', 'LineWidth', 1.5)
hold on 
grid on
legend("OCV as T is decreasing","OCV as T is increasing")
xlabel("Time [minutes]")
ylabel("U[V]")
ylim([3.6765 3.6815])