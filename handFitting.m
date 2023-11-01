%> @file	handFitting.m
%> @brief	Fit pulse measurement manualy
% =========================================================================
%> @brief	Fit pulse measurement manualy
%>
%> @author	Markus Hofmann (m.hofmann@tum.de)
%> @author	Peter Keil (peter.keil@tum.de) (EIS_Fitting_GUI)
%> @date	12.04.2016
%>
% @syntax	handFitting();
% =========================================================================
function handFitting()

%% Read data
[OCVfile,PathName] = uigetfile('mat','load OCV data'); % load OCV data
load([PathName OCVfile])
% uiopen('mat') % load OCV data
[DATAfile,PathName] = uigetfile('mat','load measured data'); % load measured data
load([PathName DATAfile])
% uiopen('mat') % load measured data

% Info zu den Schiebereglern:

    %% Definitions 
    Def_MarkerSize = 12;
    Def_Offset_Vert_Param = -20;
    
    %% Beschriftungen für die Schieberegler
    str_labels_LC = {'Ri';'R1';'C1';'R2';'C2';'OCV_0'};
    
    %% Startwerte für die Parameter
    esb_param = inputdlg('Geben Sie Ri R1 C1 R2 C2 und OCV_0 in Ohm, Farad bzw. Volt an.', 'Startwerte', 1, ...
                         {'0.04; 0.05; 50; 0.08; 300; 3.7'});
    esb_param = str2double(strsplit(cell2mat(esb_param),';'));
    %esb_param = [0.06; 0.04; 1;   0.09; 200;  3.8];
    %           {'Ri'; 'R1'; 'C1';'R2'; 'C2'; 'OCV_0'}
    plot_param = esb_param;
    
    %% Create a figure and axes
    f = figure('Position',[200 75 1200 700],'Visible','off');
    ax = subplot(1,3,[1,2]); hold all; xlabel('time in s');ylabel('voltage in V');
    
    %% Falls verfügbar: Standarddaten
    if (evalin('base','exist(''timeA'')'))
        timeI = evalin('base','timeA');  
        timeU = evalin('base','timeB');  
        Imea = evalin('base','A');  
        Imea = -Imea;  
        Umea = evalin('base','B');  
        h_ref(1) = plot(timeU, Umea, '.-','MarkerSize',Def_MarkerSize);
        
        [ OVR1, OVrcR1, OVrcR2 ] = RiRCRC(plot_param, timeI, Imea );
        Usim = ones(length(Imea), 1) * plot_param(6) + OVR1 + OVrcR1 + OVrcR2;
        h_fit(1) = plot(ax,timeI,Usim,'r.-');
    else
        timeI = (Tstart:Tinterval:Tinterval*length(A)+Tstart-Tinterval)';  
        timeU = (Tstart:Tinterval:Tinterval*length(B)+Tstart-Tinterval)';
        Imea = -A;  
        Umea = B;  
    end
    
    %% Send to base workspace
    assignin('base', 'timeI', timeI);
    assignin('base', 'timeU', timeU);
    assignin('base', 'Imea', Imea);
    assignin('base', 'Umea', Umea);

    assignin('base', 'str_labels_LC', str_labels_LC);
    
    assignin('base', 'OCV', OCV);
    assignin('base', 'plot_param', plot_param);

    assignin('base', 'ax', ax);
    
    %% Make figure visble after adding all components
    f.Visible = 'on';

    %% Schieberegler positionieren und konfigurieren
    for i = 1:length(str_labels_LC)-1
        label(i) = uicontrol('Style','text',...
                                'Position',[800-10 700-60-i*40+Def_Offset_Vert_Param 60 20],...
                                'String',str_labels_LC{i});
        txt_val(i) = uicontrol('Style','text',...
                                'Position',[800+60+200 700-60-i*40+Def_Offset_Vert_Param 100 20],...
                                'String',num2str(plot_param(i)));
        slider(i) = uicontrol('Style', 'slider',...
                                'Min',0,'Max',2,'Value',1,...
                                'UserData',[i,plot_param(i)],...
                                'Position', [800+60 700-60-i*40+3+Def_Offset_Vert_Param 200 20],...
                                'Callback', @replot); 
    end
    % Schieberegler OCV
    label(6) = uicontrol('Style','text',...
                            'Position',[800-10 700-60-6*40+Def_Offset_Vert_Param 60 20],...
                            'String',str_labels_LC{6});
    txt_val(6) = uicontrol('Style','text',...
                            'Position',[800+60+200 700-60-6*40+Def_Offset_Vert_Param 100 20],...
                            'String',num2str(plot_param(6)));
    slider(6) = uicontrol('Style', 'slider',...
                            'Min',0.97,'Max',1.03,'Value',1,...
                            'UserData',[6,plot_param(6)],...
                            'Position', [800+60 700-60-6*40+3+Def_Offset_Vert_Param 200 20],...
                            'Callback', @replot); 
 


    %% Create pop-up menu %  
    % Auswahlmenü für die Impedanzdaten (Daten beginnenden mit EIS... oder Z_...)
    var_list = evalin('base','who(''-regexp'',''Umea'')');
    popup(1) = uicontrol('Style', 'popup',...
           'String', ['Select Impedance Data'; var_list],...
           'Position', [250 700-60 250 50],...
           'Callback', @select_data);    

   %% Create push button
   % Schieberegler erneut zentrieren für größeren oder feineren Arbeitsbereich
    btn(1) = uicontrol('Style', 'pushbutton', 'String', 'Center',...
        'Position', [800+110 80+Def_Offset_Vert_Param 100 20],...
        'Callback', @recenter); 
    % Datenliste aktualisieren
    btn(2) = uicontrol('Style', 'pushbutton', 'String', 'Update',...
        'Position', [180 700-30 50 20],...
        'Callback', @update_list);  
    % Aktuelle Parameter abspeichern
    btn(3) = uicontrol('Style', 'pushbutton', 'String', 'Save Parameters',...
    'Position', [800+110 50+Def_Offset_Vert_Param 100 20],...
    'Callback', @save_parameters);  
   
    assignin('base', 'txt_val', txt_val);
    assignin('base', 'slider', slider);
    assignin('base', 'popup', popup);

end

    % CALLBACK-Funktionen%
    % Auswahl eines Datensatzen über Pulldown-Menü %
    function select_data(source,callbackdata)
        % Auswahl ermitteln und Daten laden
        Umea = evalin('base','Umea');
        timeU = evalin('base','timeU');
        Imea = evalin('base','Imea');
        timeI = evalin('base','timeI');
        plot_param = evalin('base','plot_param');
        ax = evalin('base','ax');
        % alte Kurven löschen
        cla(ax);

        % Neue Kurve Plotten
        h_ref(1) = plot(timeU,Umea,'b.-');
        
        % Erstes Fitting Plotten
        [ OVR1, OVrcR1, OVrcR2 ] = RiRCRC(plot_param, timeI, Imea );
        Usim = ones(length(Imea), 1) * plot_param(6) + OVR1 + OVrcR1 + OVrcR2;
        h_fit(1) = plot(ax,timeI,Usim,'r.-');
        legend([h_ref(1);h_fit(1)],{'Measurement';'Fit'},'Location','NorthEast');

        assignin('base', 'h_fit', h_fit);

    end    

    function replot(source,callbackdata)
       nr = source.UserData(1);

       Umea = evalin('base','Umea');
       timeU = evalin('base','timeU');
       Imea = evalin('base','Imea');
       timeI = evalin('base','timeI');
       plot_param = evalin('base','plot_param');
       h_fit = evalin('base','h_fit');
       txt_val = evalin('base','txt_val');

       plot_param(nr) = source.Value*source.UserData(2);
       txt_val(nr).String = num2str(source.Value*source.UserData(2));
       % Spannung berechnen und Plotten
       [ OVR1, OVrcR1, OVrcR2 ] = RiRCRC(plot_param, timeI, Imea );
       Usim = ones(length(Imea), 1) * plot_param(6) + OVR1 + OVrcR1 + OVrcR2;
       h_fit(1).XData = timeI;
       h_fit(1).YData = Usim;

       assignin('base', 'plot_param', plot_param);
       assignin('base', 'txt_val', txt_val);
   
    end

    % Zentrierung aller Schieberegler unter Beibhaltung des aktuellen
    % Wertes zur Änderung des Stellintervalls
    function recenter(source,callbackdata)
        plot_param = evalin('base','plot_param');
        slider = evalin('base','slider');
        for j = 1:length(plot_param)
            if slider(j).Value > 0
                slider(j).UserData(2) = slider(j).Value * slider(j).UserData(2);
                slider(j).Value = 1;  
            end
        end
        assignin('base', 'slider', slider);
    end

    % Dropdown-Menü mit den Messdaten aktualisieren
    function update_list(source,callbackdata)
        new_list = evalin('base','who(''-regexp'',''Umea'')');
        popup = evalin('base','popup');
        popup(1).Value = 1;
        popup(1).String = ['Select Impedance Data';new_list];
        assignin('base', 'popup', popup);
   end

    % Aktuelle Parameter abspeichern
    function save_parameters(source,callbackdata)
        clear Temp_Parameters
        str_labels_LC = evalin('base','str_labels_LC');
        slider = evalin('base','slider');
        % Parametermodus abfragen zur Auswahl der richtigen
        % Parameter-Bezeichner
        % Aufbau eines Structs mit den Parameterwerten
        for i = 1:length(str_labels_LC)
            Temp_Parameters.(str_labels_LC{i}) = slider(i).UserData(2) * slider(i).Value;
        end
        % Abspeichern im Base-Workspace unter Standard-Namen +
        % benutzerdefiniertem Namen
        assignin('base','Save_Parameters',Temp_Parameters);
%         var_name = inputdlg('The parameter set has already been saved as ''Save_Parameters''. Shall the parameters also be saved under a separate name?','Save Parameters');
        var_name = {'para'};
        if ~isempty(var_name)
            assignin('base',genvarname(var_name{1}),Temp_Parameters);
            txt = msgbox(['Eine Variable namens "' var_name '" wurde im Workspace erstellt.']);
        end
    end

