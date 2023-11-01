data = readtable('Task_3_3_.xlsx', 'Sheet', 'Sheet1');
plot(data.Var1,data.WithCoolingOf10W,'b','LineWidth', 1.75)
hold on
plot(data.Var1,data.WithoutAnyCooling,'r','LineWidth', 1.75)
hold on
legend("With cooling","Without cooling","Location","northwest")
xlabel("Time (s)");
ylabel("Temperature [°C]");
grid on 