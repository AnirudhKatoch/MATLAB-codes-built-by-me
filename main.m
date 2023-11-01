clear
clc
% OCV
 load('OCV.mat')

% PARAMETRIERUNG
C1SOC10 = {'para_10_1C'};   % SOC 10% 1C
C1SOC90 = {'para_90_1C'};   % SOC 90% 1C
C2SOC10 = {'para_10_2C'};   % SOC 10% 2C
C2SOC90 = {'para_90_2C'};   % SOC 90% 2C


PARA =  {'para'};
for iC=2:-1:1 % loop: c-rates
for iS=[10 90] % loop: SOC
    
    if iS == 10
        temp = 1;
    elseif iS == 90
        temp = 2;
    end
    
    eval(['load(C' int2str(iC) 'SOC' int2str(iS) '{1});']);
    eval(['Rohm('  int2str(temp) ',' int2str(abs(iC-2)+1) ')=' PARA{1} '.Ri;']);
    eval(['Rion1(' int2str(temp) ',' int2str(abs(iC-2)+1) ')=' PARA{1} '.R1;']);
    eval(['Cion1(' int2str(temp) ',' int2str(abs(iC-2)+1) ')=' PARA{1} '.C1;']);
    eval(['Rion2(' int2str(temp) ',' int2str(abs(iC-2)+1) ')=' PARA{1} '.R2;']);
    eval(['Cion2(' int2str(temp) ',' int2str(abs(iC-2)+1) ')=' PARA{1} '.C2;']);
end % loop: c-rates
end % loop: SOC

% Stromprofil
% Stromprofil = -1.95;
Stromprofil = inputdlg('Geben Sie den Stromsprung in A an.', 'Stromsprung', 1, {'-5'}); 
Stromprofil = str2double(Stromprofil{1});
% find path of measurements
x=what;
x=x.path;
y=0;
for i=1:length(x)
    if contains(x(i),'\')
        y=y+1;
    end
    if y==5
        break
    end
end
x=x(1:i);
x=strcat(x,'Measurements\Oscilloscope');
% uiopen('mat') % load measured data
try
    [DATAfile,PathName] = uigetfile('mat','load measured data',x); % load measured data
catch
    [DATAfile,PathName] = uigetfile('mat','load measured data'); % if not on lab pc desktop
end
load([PathName DATAfile])
% Messdaten
Mess.time = (Tstart:Tinterval:Tinterval*length(B)+Tstart-Tinterval)';
Mess.signals.values = B;
% Zellkapazität
% Cn = 1.95;
Cn = inputdlg('Geben Sie die Kapazität der Zelle in Ah an.', 'Cn', 1, {'4.95'});
Cn = str2double(Cn{1});
% Start SOC
% SOC_0 = 40;
SOC_0 = inputdlg('Geben Sie den Start-SOC in % an.', 'SOC_0', 1, {'10'});
SOC_0 = str2double(SOC_0{1});

%Parametrierungspunkte
SOC = [10 90];
Strom = [-2 -1];

% Simulation
disp('simulating...')
warning('off')
sim('battery_model_2RC.slx')

t=simResultsVoltage.time;
simulation=simResultsVoltage.signals.values(:,1);
measurement=simResultsVoltage.signals.values(:,2);
OCV=simResultsVoltage.signals.values(:,3);
C_rate=round(abs(Stromprofil/Cn),0);

% save results
mkdir('results')
save(sprintf('results/results_%dpercSOC_%dC',SOC_0,C_rate),'t','measurement','simulation','OCV','SOC_0','C_rate')

% plot
plot_results(t,simulation,measurement,OCV,SOC_0,C_rate)

clearvars -except t simulation measurement OCV SOC_0 C_rate
rmdir('slprj','s')
delete('*.slxc')
clc

