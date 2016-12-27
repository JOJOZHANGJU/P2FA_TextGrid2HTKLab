function [WS,WE,PS,PE] = P2FATextGrid2HTKLab(str)
%Convert the TextGrid format obtained from P2FA into Lab format for HTK.
%str: content of .TextGrid format speech annotation.
%WS and WE: starting and ending index of the word level annotation.
%PS and PE: starting and ending index of the phoneme level annotation.

   [bool,inx]=ismember('"word"',str);
    WS = inx + 4;
	WE = length(str);
	
	PS = 16;
    PE = inx-2;
end