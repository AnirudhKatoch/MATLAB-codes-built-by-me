% Specify the file name and sheet name
filename = 'Measurement_BasicSheet_100mA.xlsx';
sheetname =4;
% Read the Excel file into a table
data = readtable(filename, 'Sheet', 4);

% Plot the data with markers
plot(data.Re_Z__Ohm_original, data.Im_Z__Ohm_original, '-x','Color','red','LineWidth',0.25);
hold on
plot(data.Re_Z__Ohm_hand, data.Im_Z__Ohm_hand, '-x','Color','blue','LineWidth',0.25);
hold on
plot(data.Re_Z__Ohm_given_ECM, data.Im_Z__Ohm_given_ECM, '-x','Color','cyan','LineWidth',0.25);
hold on
plot(data.Re_Z__Ohm_complicated_ECM,data.Im_Z__Ohm_complicated_ECM, '-x','Color','m','LineWidth',0.25);
hold on
grid on
line([0.02 0.055], [0, 0], 'Color', 'k', 'LineWidth', 0.5);
legend("Observed Values","Z Fit ECM 1 manual","Z Fit ECM 1 computer ","Z Fit ECM 2 computer",'Location','southeast')
xlim([0.02 0.055])
xlabel('Re(Z)/Ohm');
ylabel('-Im(Z)/Ohm');