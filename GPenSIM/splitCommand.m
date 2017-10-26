function [command, card] = splitCommand( tokenColors )

command = 0;
card = 0;
if length(tokenColors) ~= 2,
    return;
end;
global global_info;
global_info.racin = tokenColors;
color_1 = tokenColors{1};
color_2 = tokenColors{2};
if ~isempty(strfind(color_1,'Move:')),
    command = strsplit(color_1,':');
    card = color_2;
else,
    command = strsplit(color_2,':');
    card = color_1;
end;

