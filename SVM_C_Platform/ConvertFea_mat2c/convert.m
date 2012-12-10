% load rgbdfea_pcloud_spinkdes

rgbdclabel=rgbdclabel';
[trainhmp, minvalue, maxvalue] = scaletrain(rgbdfea, 'linear');
trainhmp=trainhmp';
trainhmp=sparse(double(trainhmp));

libsvmwrite('output.txt', rgbdclabel, trainhmp);
