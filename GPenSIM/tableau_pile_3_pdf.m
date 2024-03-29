function [png] = tableau_pile_3_pdf() 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% File: tableau_pile_3_pdf.m : Tableau Pile - 3
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
modname = '3';
png.PN_name = strcat('Tableau Pile -',{' '},modname);

png.set_of_Ps = {strcat('pTP_',modname,'_FaceUp_Pile'),strcat('pTP_',modname,'_FaceDown_Pile'),strcat('pTP_',modname,'_Move')};
png.set_of_Ts = {strcat('tTPe_',modname,'_Add_FaceUp'),strcat('tTPe_',modname,'_Add_FaceDown'),strcat('tTPe_',modname,'_Move'), ...
    strcat('tTPe_',modname,'_Turn'),strcat('tTPe_',modname,'_Out'),strcat('tTPi_',modname,'_Move_Multiple')}; 
png.set_of_As = {
    strcat('tTPe_',modname,'_Add_FaceUp'),strcat('pTP_',modname,'_FaceUp_Pile'),1, ...
    strcat('tTPe_',modname,'_Add_FaceDown'),strcat('pTP_',modname,'_FaceDown_Pile'),1, ...
    strcat('tTPe_',modname,'_Turn'),strcat('pTP_',modname,'_FaceUp_Pile'),1, ...
    strcat('pTP_',modname,'_FaceDown_Pile'), strcat('tTPe_',modname,'_Turn'), 1, ...
    strcat('pTP_',modname,'_FaceUp_Pile'), strcat('tTPe_',modname,'_Out'), 1, ...
    strcat('tTPe_',modname,'_Move'), strcat('pTP_',modname,'_Move'), 1 ...
    strcat('pTP_',modname,'_Move'), strcat('tTPe_',modname,'_Out'), 1, ...
    strcat('tTPi_',modname,'_Move_Multiple'), strcat('pTP_',modname,'_Move'), 2, ...
    strcat('pTP_',modname,'_Move'), strcat('tTPi_',modname,'_Move_Multiple'), 1
    };
png.set_of_Is = {
    strcat('pTP_',modname,'_FaceUp_Pile'), strcat('tTPe_',modname,'_Turn'), 1
    };