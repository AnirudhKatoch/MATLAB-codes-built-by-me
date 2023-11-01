data = readtable('Cylindrical_cell_homogeneous_and_heterogenous_path.xlsx', 'Sheet', 'Sheet1');
plot(data.Length_m,data.Heterogeneous_Value_in_celcius,'r','LineWidth', 1.75)
hold on
plot(data.Length_m,data.Homogeneous_Value_in_celcius,'b','LineWidth', 1.75)
hold on
legend("Heterogeneous Model","Homogeneous model")
xlabel("Length [mm]");
ylabel("Temperature [°C]");
grid on 