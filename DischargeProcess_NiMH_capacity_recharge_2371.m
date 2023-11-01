clc
clear all
file_name = 'BK-3MCC__DischargeProcess NiMH capacity recharge_2371';
data = readtable(file_name);

data.x_Time_h_ =data.x_Time_h_ *60 % Changing time to minutes

figure ;
subplot(4,1, 1)
plot(data.x_Time_h_,data.U_V_,'b','LineWidth', 1.50)
%xlabel("")
ylabel("Voltage [V]")
xlim([0 44.3483])
grid on
hold on

subplot(4,1,2)
plot(data.x_Time_h_,data.I_A_,'r','LineWidth', 1.50)
%xlabel("")
ylabel("Current [A]")
xlim([0 44.3483])
grid on
hold on

subplot(4,1, 3)
plot(data.x_Time_h_,data.Ah_Ah_,'g','LineWidth', 1.50)
%xlabel("")
ylabel("Capacity [Ah]")
xlim([0 44.3483])
grid on
hold on

subplot(4,1, 4)
plot(data.x_Time_h_,data.T1__C_,'k','LineWidth', 1.50)
xlabel("Time [minutes]")
ylabel("Temperature [°C]")
xlim([0 44.3483])
grid on
hold off

% The behaviour of W_h and A_h is similar therefore no need for this graph
%subplot(5, 1, 5)
%plot(data.x_Time_h_,data.Wh_Wh_,'y','LineWidth', 1.50)
%xlabel("")
%ylabel("")
%xlim([0 45.0203])
%grid on
%hold on

