function [suit_abbr, suit, handle_err, move_btn, handle_move_loc] ...
    = get_suit_from_transname(transitionname)
    global global_info;
    handle_err = 0;
    move_btn = 0;
    handle_move_loc = 0;
    if ~isempty(strfind(transitionname,'Clubs')),
        suit = 'Clubs';
    elseif ~isempty(strfind(transitionname,'Diamonds')),
        suit = 'Diamonds';
    elseif ~isempty(strfind(transitionname,'Hearts')),
        suit = 'Hearts';
    elseif ~isempty(strfind(transitionname,'Spades')),
        suit = 'Spades';
    else,
        suit = 0; % Invalid suit.
    end
    
    suit_abbr = suit(1);
    if global_info.GUI_ENABLED,
        handle_err = strcat('FP_',suit_abbr,'_ErrorMsg');
        move_btn = strcat('FP_',suit_abbr,'_Move_Btn');
        handle_move_loc = strcat('FP_',suit_abbr,'_Move_Location');
    end
end