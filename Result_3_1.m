
% Specify the file name and sheet name
filename = 'Measurement_BasicSheet_100mA.xlsx';
%sheetname =2;
% Read the Excel file into a table
data = readtable(filename, 'Sheet', 2);

% Plot the data with markers
plot(data.Re_Z__Ohm_10mA, data.Im_Z__Ohm_10mA, '-x','Color','red','LineWidth',0.25);
hold on
plot(data.Re_Z__Ohm_50mA, data.Im_Z__Ohm_50mA, '-x','Color','blue','LineWidth',0.25);
plot(data.Re_Z__Ohm_100mA, data.Im_Z__Ohm_100mA, '-x','Color','k','LineWidth',0.25);
hold on
plot(data.Re_Z__Ohm_2_5A, data.Im_Z__Ohm_2_5A, '-x','Color','m','LineWidth',0.25);
hold on
x = [0,1];  % X-axis data
y = zeros(size(x));   % Y-axis data set to zero
plot(x, y, '-k', 'LineWidth', 0.5);
xlim([0.02 0.055])
hold on
legend('Panasonic 10mA','Panasonic 50mA','Panasonic 100mA','Panasonic 2500mA','Location','northwest')

grid on
yticks(-0.01:0.0025:0.015);
% Set the labels for x-axis and y-axis
xlabel('Re(Z)/Ohm');
ylabel('-Im(Z)/Ohm');





