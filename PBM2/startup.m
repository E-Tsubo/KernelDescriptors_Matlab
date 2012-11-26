%%

disp( 'This is easy startup script!' );

[partmodel{1}] = loadPBM2('left', 'rgbdrgbgkdes');
[partmodel{2}] = loadPBM2('right', 'rgbdrgbgkdes');
[partmodel{3}] = loadPBM2('top', 'rgbdrgbgkdes');
[partmodel{4}] = loadPBM2('bottom', 'rgbdrgbgkdes');

[combinePBM, maxvalue, minvalue, trainfea ] = trainPBM2(partmodel);
pbm;