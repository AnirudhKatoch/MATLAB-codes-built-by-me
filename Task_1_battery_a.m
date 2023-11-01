filename = 'Task_1_battery_a';
sheet = 'Sheet1';
data = readtable(filename, 'Sheet', sheet)
data.SOC = (data.Capacity/2300)*100
plot(data.SOC,data.OCV,'b','LineWidth', 1.5)
hold on 
plot(68.99, 3327, 'ro', 'MarkerSize', 10, 'LineWidth', 2)
hold on 
plot(68.71, 3326, 'gx', 'MarkerSize', 10, 'LineWidth', 2)
hold on 

legend("OCV Curve","BaSyTec","Multimeter","Location","northwest")
xlabel("SOC [%]")
ylabel("OCV [V]")
grid on 
	
