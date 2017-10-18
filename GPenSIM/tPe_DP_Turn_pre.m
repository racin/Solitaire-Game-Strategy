function [fire, transition] = tPe_DP_Turn_pre(transition)


pause(0.01); % Halts execution in the main loop to allow to check for events.
global global_info;
if length(tokIDs('pDP_Draw_Pile')) == 5,
    vistoken = tokenArrivedEarly('pDP_Draw_Pile',1);
    set(global_info.handles.DP_StatusMsg,'String',strcat('Visible card: ',get_color('pDP_Draw_Pile',vistoken)));
end

if global_info.DP_Turn_Btn ~= false,
    disp('DP Turn clicked!');
    global_info.DP_Turn_Btn = false;
    fire = 1;
else
    fire = 0;
end;

