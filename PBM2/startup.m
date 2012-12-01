%%

disp( 'This is easy startup script!' );

[partmodel{1}] = loadPBM2('full', 'rgbdpcloudspinkdes');
[partmodel{2}] = loadPBM2('left', 'rgbdpcloudspinkdes');
[partmodel{3}] = loadPBM2('right', 'rgbdpcloudspinkdes');
[partmodel{4}] = loadPBM2('top', 'rgbdpcloudspinkdes');
[partmodel{5}] = loadPBM2('bottom', 'rgbdpcloudspinkdes');

[combinePBM, maxvalue, minvalue, trainfea ] = trainPBM2(partmodel);
pbm;