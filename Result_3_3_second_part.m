% Specify the file name and sheet name
%filename = 'Measurement_BasicSheet_100mA.xlsx';
% Read the Excel file into a table
%data = readtable(filename, 'Sheet', 8);


plot(data.Re_Z__Ohm_A231_A123, data.Im_Z__Ohm_A123, '-x','Color','b','LineWidth',0.5);
hold on
plot(data.Re_Z__Ohm_Panasonic, data.Im_Z__Ohm_Panasonic, '-x','Color','k','LineWidth',0.5);
hold on
plot(data.Re_Z__Ohm_A231_Sanyo, data.Im_Z__Ohm_A231_Sanyo, '-x','Color','m','LineWidth',0.5);
hold on
plot(data.Re_Z__Ohm_A231_Sanyo_gealtert_, data.Im_Z__Ohm_A231_Sanyo_gealtert_, '-x','Color','r','LineWidth',0.5);
hold on
x = [0,1];  % X-axis data
y = zeros(size(x));   % Y-axis data set to zero
plot(x, y, '-k', 'LineWidth', 0.5);
xlim([0.015 0.065])
hold on
legend("A231 A123","Panasonic","A231 Sanyo","A231 Sanyo gealtert",'Location','southeast')
xlabel('Re(Z)/Ohm');
ylabel('-Im(Z)/Ohm');
grid on