%> @file	RiRCRC.m
%> @brief	Cell model Ri+RC+RC + OCV
% =========================================================================
%> @brief	Cell model Ri+RC+RC + OCV
%>
%> @author	Markus Hofmann (m.hofmann@tum.de)
%> @author	Peter Keil (peter.keil@tum.de) (EIS_Fitting_GUI)
%> @date	12.04.2016
%>
% @syntax	RiRCRC( x_bat, timeI, Imea );
% =========================================================================
function [ OVR1, OVrcR1, OVrcR2 ] = RiRCRC( x_bat, timeI, Imea )

%% Generate time vector separated in phases
t_s  = timeI - timeI(1);

paraNames = {'R1','rcR1','rcC1','rcR2','rcC2','OCV_0'};
phase.falling = timeI > 0;

%% Calc overvoltages
ov = zeros(size(timeI, 1), length(x_bat));
for iPara = 1:length(x_bat)
    % Get para name without terminating number
    paraName = regexp(paraNames{iPara}, '\D*', 'match');
    switch paraName{1}
        case 'R'
            %% Resistor
            % U = R * I
            ov(:, iPara) = x_bat(iPara) .* (-Imea); % R in Ohm
        case 'rcR'
            %% Resistor of RC element
            ov(phase.falling, iPara) = -x_bat(iPara) * Imea(phase.falling) .* (1 - exp( -(t_s(phase.falling)+timeI(1)) ./ (x_bat(iPara) * x_bat(iPara+1)) ));
        case 'rcC'
            % No calculation needed
        case 'OCV_'
            % No calculation needed
        otherwise
            %% Unknown element, should never get here
            error('Unknown element ''%s'', result might be wrong because we skip this!', paraNames{iPara});
    end
    % Clear temporary variables
    clearvars paraName;
end

%% Return sum of over potentials
OVR1   = ov(:,1);
OVrcR1 = ov(:,2);
OVrcR2 = ov(:,4);

end


