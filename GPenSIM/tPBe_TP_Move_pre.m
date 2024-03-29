function [fire, transition] = tPBe_TP_Move_pre(transition)

global global_info;
fire = 0;
if global_info.CARDS_DEALT < global_info.INITIAL_DEAL_MOVE_LENGTH,
    return;
end;
moveToken = tokenArrivedLate('pPB_Cmd', 1);
if isempty(moveToken),
    return;
end;
moveColor = get_color('pPB_Cmd', moveToken);
moveColor = moveColor{1};
[playerAction] = request(transition.name, {'playerAction', 1});
if ~isempty(strfind(moveColor,'TP_Move')) && playerAction,
    movesLeft = length(global_info.BOT_TP_MOVES);
    if movesLeft == 0,
        global_info.BOT_ACTIONS_NEW_CMD = 1;
        return;
    end
    cmd_split = strsplit(moveColor,':');
    tableau = cmd_split{2};
    lenTokens = length(tokIDs(strcat('pTP_',tableau,'_FaceUp_Pile')));
    
    if lenTokens == 0,
        if ~isempty(tokIDs(strcat('pTP_',tableau,'_FaceDown_Pile'))),
            global_info.BOT_NEXT_CMD = strcat('TP_Turn:',tableau);
        end;
        global_info.BOT_ACTIONS_NEW_CMD = 1;
        return;
    end;
    moveTo = randi(movesLeft);
    dest = global_info.BOT_TP_MOVES{moveTo};
    if strcmp(dest,tableau),
        global_info.BOT_TP_MOVES(moveTo) = [];
        moveTo = randi(movesLeft);
        dest = global_info.BOT_TP_MOVES{moveTo};
    end;
    
    
    % 20% of the time the bot will attempt to move partial amount of cards.
    % 80% of the time it will attempt to move all.
    if lenTokens > 1 && ismember(dest, global_info.TP_PILES),
        if randi(100) <= global_info.BOT_ACTIONS_TP_FULL_PARTIAL_MOVE,
            amount = lenTokens;
        else,
            amount = randi(lenTokens-1);
        end
    else,
        amount = 1;
    end;
    command = strcat('Move:',dest,':TP',tableau,':',num2str(amount));
    
    % The top card to be moved is used to check validity of the command.
    vistoken = tokenArrivedLate(strcat('pTP_',tableau,'_FaceUp_Pile'), amount);
    vistoken = vistoken(amount);
    color = get_color(strcat('pTP_',tableau,'_FaceUp_Pile'),vistoken);
    color = color{1};
    if checkCommand_Move({command;color},'',transition.name,strcat('TP_',tableau,'_ErrorMsg')),
        transition.selected_tokens = moveToken;
        transition.new_color = command;
        transition.override = 1;
        fire = 1;
        return;
    end;
    global_info.BOT_TP_MOVES(moveTo) = [];
end;