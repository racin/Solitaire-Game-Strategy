function [] = tDPi_Flip_Pile_post(transition)
global global_info;
if length(tokIDs('pDP_Draw_FaceUp_Pile')) == 0,
    
    global_info.DP_Flip_Pile_Running = false;
    disp('Ending Reverse Pile.');
    % Release playerAction resource to allow for another player action.
    release(global_info.last_command_source);
end;
