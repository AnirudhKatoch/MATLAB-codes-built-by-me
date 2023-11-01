% Specify the file name and sheet name
filename = 'Measurement_BasicSheet_100mA.xlsx';
% Read the Excel file into a table
data = readtable(filename, 'Sheet', 6);

subplot(3,2, 1);

plot(data.Re_Z__Ohm_T_05, data.Im_Z__Ohm_T_05, '-x','Color','r','LineWidth',0.5);
hold on
plot(data.Re_Z__Ohm_T_05_zfit, data.Im_Z__Ohm_T_05_zfit, '-x','Color','b','LineWidth',0.5);
hold on
title("Temperature 5°C")
%xlabel('Re(Z)/Ohm');
ylabel('-Im(Z)/Ohm');
xlim([0.03 0.12])
%ylim([-0.02 0.03])
line([0.03,0.12], [0, 0], 'Color', 'k', 'LineWidth', 0.5);
legend("Observation","zFit",'Location',"southeast",'FontSize', 6)
grid on


subplot(3,2, 2);

plot(data.Re_Z__Ohm_T_10, data.Im_Z__Ohm_T_10, '-x','Color','r','LineWidth',0.5);
hold on
plot(data.Re_Z__Ohm_T_10_zfit, data.Im_Z__Ohm_T_10_zfit, '-x','Color','b','LineWidth',0.5);
hold on
title("Temperature 10°C")
%xlabel('Re(Z)/Ohm');
%ylabel('-Im(Z)/Ohm');
xlim([0.03 0.1])
%ylim([-0.02 0.03])
line([0.03,0.1], [0, 0], 'Color', 'k', 'LineWidth', 0.5);

legend("Observation","zFit",'Location',"southeast",'FontSize', 6)
grid on



subplot(3,2, 3);

plot(data.Re_Z__Ohm_T_15, data.Im_Z__Ohm_T_15, '-x','Color','r','LineWidth',0.5);
hold on
plot(data.Re_Z__Ohm_T_15_zfit, data.Im_Z__Ohm_T_15_zfit, '-x','Color','b','LineWidth',0.5);
hold on
title("Temperature 15°C")
%xlabel('Re(Z)/Ohm');
ylabel('-Im(Z)/Ohm');
xlim([0.03 0.08])
%ylim([-0.02 0.03])
line([0.03,0.08], [0, 0], 'Color', 'k', 'LineWidth', 0.5);
legend("Observation","zFit",'Location',"southeast",'FontSize', 6)

grid on

subplot(3,2, 4);

plot(data.Re_Z__Ohm_T_20, data.Im_Z__Ohm_T_20, '-x','Color','r','LineWidth',0.5);
hold on
plot(data.Re_Z__Ohm_T_20_zfit, data.Im_Z__Ohm_T_20_zfit, '-x','Color','b','LineWidth',0.5);
hold on
title("Temperature 20°C")
%xlabel('Re(Z)/Ohm');
%ylabel('-Im(Z)/Ohm');
xlim([0.03 0.065])
%ylim([-0.02 0.03])
line([0.03,0.065], [0, 0], 'Color', 'k', 'LineWidth', 0.5);
legend("Observation","zFit",'Location',"southeast",'FontSize', 6)

grid on



subplot(3,2, 5);



plot(data.Re_Z__Ohm_T_30, data.Im_Z__Ohm_T_30, '-x','Color','r','LineWidth',0.5);
hold on
plot(data.Re_Z__Ohm_T_30_zfit, data.Im_Z__Ohm_T_30_zfit, '-x','Color','b','LineWidth',0.5);
hold on
title("Temperature 30°C")
xlabel('Re(Z)/Ohm');
ylabel('-Im(Z)/Ohm');
xlim([0.0325 0.05])
%ylim([-0.02 0.03])
line([0.0325,0.05], [0, 0], 'Color', 'k', 'LineWidth', 0.5);
legend("Observation","zFit",'Location',"southeast",'FontSize', 6)

grid on




subplot(3,2, 6);




plot(data.Re_Z__Ohm_T_40, data.Im_Z__Ohm_T_40, '-x','Color','r','LineWidth',0.5);
hold on
plot(data.Re_Z__Ohm_T_40_zfit, data.Im_Z__Ohm_T_40_zfit, '-x','Color','b','LineWidth',0.5);
hold on
title("Temperature 40°C")
xlabel('Re(Z)/Ohm');
%ylabel('-Im(Z)/Ohm');
xlim([0.0325 0.045])
%ylim([-0.02 0.03])
line([0.0325,0.045], [0, 0], 'Color', 'k', 'LineWidth', 0.5);
legend("Observation","zFit",'Location',"southeast",'FontSize', 6)

grid on
