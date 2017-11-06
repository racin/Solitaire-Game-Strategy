function [png] = player_pdf() 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% File: module_connector_pdf.m : Handles the connections of the modules.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

png.PN_name = 'Player Bot module';

png.set_of_Ps = {'pPB_Gen', 'pPB_Cmd'};
png.set_of_Ts = {'tPBi_Gen', 'tPBi_Gen_Stop', 'tPBe_DP_Turn', 'tPBe_DP_Move', 'tPBe_TP_Turn', ...
    'tPBe_TP_Move', 'tPBe_FP_Move', 'tPBi_Siphon'}; 
png.set_of_As = {
    'pPB_Gen', 'tPBi_Gen', 1, ...
    'tPBi_Gen', 'pPB_Gen', 1, ...
    'tPBi_Gen', 'pPB_Cmd', 1, ...
    'pPB_Gen', 'tPBi_Gen_Stop', 1, ...
    'pPB_Cmd', 'tPBi_Siphon', 1, ...
    'pPB_Cmd', 'tPBe_DP_Turn', 1, ...
    'pPB_Cmd', 'tPBe_DP_Move', 1, ...
    'pPB_Cmd', 'tPBe_FP_Move', 1, ...
    'pPB_Cmd', 'tPBe_TP_Turn', 1, ...
    'pPB_Cmd', 'tPBe_TP_Move', 1, ...
    'tPBe_DP_Turn', 'pMC_DP_Turn', 1, ...
    'tPBe_DP_Move', 'pMC_DP_Move', 1, ...
    'tPBe_FP_Move', 'pMC_FP_Move', 1, ...
    'tPBe_TP_Turn', 'pMC_TP_Turn', 1, ...
    'tPBe_TP_Move', 'pMC_TP_Move', 1, ...
    };

% Add connections to all 7 tableau piles %
% for i = 1:7
%     num = num2str(i);
%     png.set_of_As = [png.set_of_As, {strcat('tPe_TP_',num,'_Turn'),'pMC_TP_Turn', 1}];
%     png.set_of_As = [png.set_of_As, {strcat('tPe_TP_',num,'_Move'),'pMC_TP_Move', 1}];
% end;
% 
% % Add connections to all 4 foundation piles %
% foundationpiles = {'Clubs','Diamonds','Hearts','Spades'};
% for i = 1:4
%     fp = foundationpiles(i);
%     png.set_of_As = [png.set_of_As, {strcat('tPe_FP_',fp{1},'_Move'),'pMC_FP_Move', 1}];
% end;