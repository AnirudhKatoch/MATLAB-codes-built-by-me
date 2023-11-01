% Specify the file name and sheet name
filename = 'Measurement_BasicSheet_100mA.xlsx';
% Read the Excel file into a table
data = readtable(filename, 'Sheet', 6);

% Plot the data with markers
plot(data.Re_Z__Ohm_T_05, data.Im_Z__Ohm_T_05, '-x','Color','b','LineWidth',0.25);
hold on
plot(data.Re_Z__Ohm_T_10, data.Im_Z__Ohm_T_10, '-x','Color','k','LineWidth',0.25);
hold on
plot(data.Re_Z__Ohm_T_15, data.Im_Z__Ohm_T_15, '-x','Color','m','LineWidth',0.25);
hold on
plot(data.Re_Z__Ohm_T_20, data.Im_Z__Ohm_T_20, '-x','Color','y','LineWidth',0.25);
hold on
plot(data.Re_Z__Ohm_T_30, data.Im_Z__Ohm_T_30, '-x','Color','cyan','LineWidth',0.25);
hold on
plot(data.Re_Z__Ohm_T_40, data.Im_Z__Ohm_T_40, '-x','Color','r','LineWidth',0.25);
hold on
x = [0,1];  % X-axis data
y = zeros(size(x));   % Y-axis data set to zero
plot(x, y, '-k', 'LineWidth', 0.5);
xlim([0.03 0.12])
hold on
legend("Temperature 5°C","Temperature 10°C","Temperature 15°C","Temperature 20°C",...
    "Temperature 30°C","Temperature 40°C",'Location','southeast')
grid on
yticks(-0.02:0.005:0.03);
xlabel('Re(Z)/Ohm');
ylabel('-Im(Z)/Ohm');