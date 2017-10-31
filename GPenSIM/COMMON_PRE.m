function [fire, transition] = COMMON_PRE(transition)

if ismember(transition.name, {'tFPe_Clubs_Add', 'tFPe_Diamonds_Add', ...
        'tFPe_Hearts_Add', 'tFPe_Spades_Add'}),
    [fire, transition] = pre_tFPe_Add(transition);
elseif ismember(transition.name, {'tFPe_Clubs_Move', 'tFPe_Diamonds_Move', ...
        'tFPe_Hearts_Move', 'tFPe_Spades_Move'}),
    [fire, transition] = pre_tFPe_Move(transition);
elseif ismember(transition.name, {'tPe_FP_Clubs_Move', 'tPe_FP_Diamonds_Move', ...
        'tPe_FP_Hearts_Move', 'tPe_FP_Spades_Move'}),
    [fire, transition] = pre_tPe_FP_Move(transition);
elseif ismember(transition.name, {'tTPe_1_Add_FaceDown', 'tTPe_2_Add_FaceDown', ...
        'tTPe_3_Add_FaceDown', 'tTPe_4_Add_FaceDown', 'tTPe_5_Add_FaceDown', ...
        'tTPe_6_Add_FaceDown', 'tTPe_7_Add_FaceDown'}),
    [fire, transition] = pre_tTPe_Add_FaceDown(transition);
elseif ismember(transition.name, {'tTPe_1_Add_FaceUp', 'tTPe_2_Add_FaceUp', ...
        'tTPe_3_Add_FaceUp', 'tTPe_4_Add_FaceUp', 'tTPe_5_Add_FaceUp', ...
        'tTPe_6_Add_FaceUp', 'tTPe_7_Add_FaceUp'}),
    [fire, transition] = pre_tTPe_Add_FaceUp(transition);
elseif ismember(transition.name, {'tTPe_1_Add_FaceUp', 'tTPe_2_Add_FaceUp', ...
        'tTPe_3_Add_FaceUp', 'tTPe_4_Add_FaceUp', 'tTPe_5_Add_FaceUp', ...
        'tTPe_6_Add_FaceUp', 'tTPe_7_Add_FaceUp'}),
    [fire, transition] = pre_tTPe_Add_FaceUp(transition);
elseif ismember(transition.name, {'tPe_TP_1_Turn', 'tPe_TP_2_Turn', ...
        'tPe_TP_3_Turn', 'tPe_TP_4_Turn', 'tPe_TP_5_Turn', ...
        'tPe_TP_6_Turn', 'tPe_TP_7_Turn'}),
    [fire, transition] = pre_tPe_TP_Turn(transition);
elseif ismember(transition.name, {'tTPe_1_Turn', 'tTPe_2_Turn', ...
        'tTPe_3_Turn', 'tTPe_4_Turn', 'tTPe_5_Turn', ...
        'tTPe_6_Turn', 'tTPe_7_Turn'}),
    [fire, transition] = pre_tTPe_Turn(transition);
else
    fire = 1;
end

end