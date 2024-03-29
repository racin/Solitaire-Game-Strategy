function [fire, transition] = tPBi_Gen_pre(transition)

fire = 0;
global global_info;
global PN;
if global_info.CARDS_DEALT < global_info.INITIAL_DEAL_MOVE_LENGTH,
    return;
end;
% Only one resource used, thus we can check directly in the internal
% data structure of the resource.
if global_info.BOT_ENABLED && global_info.BOT_ACTIONS_NEW_CMD && ...
        PN.system_resources.instance_usage(1,1) == 0,
    if isempty(global_info.BOT_NEXT_CMD),
        rndNum = randi(100);
        source = '';
        if rndNum <= global_info.BOT_ACTIONS(1) && ...
                ~strcmp(global_info.BOT_LAST_CMD,'DP_Turn'),
            action = 'DP_Turn';
        elseif rndNum <= global_info.BOT_ACTIONS(2) && ...
                ~strcmp(global_info.BOT_LAST_CMD,'DP_Move'),
            action = 'DP_Move';
            
            if randi(100) <= global_info.BOT_ACTIONS_TP_FP,
                global_info.BOT_DP_MOVES = global_info.TP_PILES;
            else,
                global_info.BOT_DP_MOVES = global_info.FP_PILES;
            end
        elseif rndNum <= global_info.BOT_ACTIONS(3) && ...
                ~strcmp(global_info.BOT_LAST_CMD,'FP_Move'),
            action = 'FP_Move';
            suits = {':C', ':D', ':H', ':S'};
            source = suits(randi(length(suits)));
            global_info.BOT_FP_MOVES = global_info.TP_PILES;
        elseif rndNum <= global_info.BOT_ACTIONS(4) && ...
                ~strcmp(global_info.BOT_LAST_CMD,'TP_Turn'),
            action = 'TP_Turn';
            source = strcat(':',num2str(randi(7)));
        else
            action = 'TP_Move';
            source = strcat(':',num2str(randi(7)));
            if randi(100) <= global_info.BOT_ACTIONS_TP_FP,
                global_info.BOT_TP_MOVES = global_info.TP_PILES;
            else,
                global_info.BOT_TP_MOVES = global_info.FP_PILES;
            end
        end;
        transition.new_color = strcat(action,source);
    else,
        transition.new_color = global_info.BOT_NEXT_CMD;
    end;
    
     % Reset ongoing commands.
    global_info.BOT_ACTIONS_NEW_CMD = 0;
    global_info.BOT_NEXT_CMD = '';
    
    transition.override = 1;
    fire = 1;
end;