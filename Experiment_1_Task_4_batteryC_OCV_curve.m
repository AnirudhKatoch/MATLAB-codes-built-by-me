clear all
SOC = linspace(0, 100, 11); 
OCV_datasheet = linspace(1.9257, 2.14, 11); 
OCV_density =  linspace(1.92, 2.16, 11);                                                   
plot(SOC,OCV_datasheet,'b','LineWidth', 1.5)
hold on
plot(SOC,OCV_density,'r','LineWidth', 1.5)
hold on
legend("OCV based on datasheet","OCV based on sulfuric acid density ","Location","northwest")
grid on
xlabel("SOC [%]")
ylabel("Voltage [V]")







	
