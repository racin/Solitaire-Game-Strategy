function [fire, transition] = tPe_DP_Turn_pre(transition)


pause(0.01); % Halts execution in the main loop to allow to check for events.
global global_info;
if global_info.DP_Turn_Btn ~= false,
    disp('DP Turn clicked!');
    global_info.DP_Turn_Btn = false;
    fire = 1;
else
    fire = 0;
end;

