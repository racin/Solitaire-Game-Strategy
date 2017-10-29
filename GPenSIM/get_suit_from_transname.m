function [suit_abbr, suit, handle_err, handle_move_btn, handle_move_loc] ...
    = get_suit_from_transname(transitionname)
    global global_info;
    handle_err = 0;
    handle_move_btn = 0;
    handle_move_loc = 0;
    if contains(transitionname,'Clubs'),
        suit_abbr = 'C';
        suit = 'Clubs';
        if global_info.GUI_ENABLED,
            handle_err = global_info.handles.FP_C_ErrorMsg;
            handle_move_btn = global_info.handles.FP_C_Move_Btn;
            handle_move_loc = global_info.handles.FP_C_Move_Location;
        end
    elseif contains(transitionname,'Diamonds'),
        suit_abbr = 'D';
        suit = 'Diamonds';
        if global_info.GUI_ENABLED,
            handle_err = global_info.handles.FP_D_ErrorMsg;
            handle_move_btn = global_info.handles.FP_D_Move_Btn;
            handle_move_loc = global_info.handles.FP_D_Move_Location;
        end
    elseif contains(transitionname,'Hearts'),
        suit_abbr = 'H';
        suit = 'Hearts';
        if global_info.GUI_ENABLED,
            handle_err = global_info.handles.FP_H_ErrorMsg;
            handle_move_btn = global_info.handles.FP_H_Move_Btn;
            handle_move_loc = global_info.handles.FP_H_Move_Location;
        end
    else,
        suit_abbr = 'S';
        suit = 'Spades';
        if global_info.GUI_ENABLED,
            handle_err = global_info.handles.FP_S_ErrorMsg;
            handle_move_btn = global_info.handles.FP_S_Move_Btn;
            handle_move_loc = global_info.handles.FP_S_Move_Location;
        end
    end
end