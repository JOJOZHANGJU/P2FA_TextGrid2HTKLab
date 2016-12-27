%This is an example about how to convert the P2FA TextGrid format into HTK Lab format.
loadPath = '';
phnSavePath = '';
wrdSavePath = '';
textGridFiles = dir([loadPath,'*.TextGrid']);
for n = 1:length(textGridFiles)
    str = textread([loadPath,textGridFiles(n).name],'%s');
	[WS,WE,PS,PE] = P2FATextGrid2HTKLab(str);
	
	
	wrdFid = fopen([wrdSavePath,strrep(textGridFiles(n).name,'TextGrid','WORD')], 'w');
	for w = WS:3:WE
        fprintf(wrdFid, '%s ', str{i});
        fprintf(wrdFid, '%s ', str{i+1});
        fprintf(wrdFid,'%s\n',strrep(str{i+2},'"',''));
    end
    fclose(wrdFid);
	
	phnFid = fopen([phnSavePath,strrep(textGridFiles(n).name,'TextGrid','PHN')], 'w');
	for p = PS:3:PE
        fprintf(phnFid, '%s ', str{i});
        fprintf(phnFid, '%s ', str{i+1});
        fprintf(phnFid,'%s\n',strrep(str{i+2},'"',''));
    end
    fclose(phnFid);
	
end
