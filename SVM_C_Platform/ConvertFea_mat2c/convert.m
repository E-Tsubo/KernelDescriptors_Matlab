% load rgbdfea_pcloud_spinkdes

rgbdclabel=rgbdclabel';
[trainhmp, minvalue, maxvalue] = scaletrain(rgbdfea, 'linear');
trainhmp=trainhmp';
trainhmp=sparse(double(trainhmp));

libsvmwrite('output.txt', rgbdclabel, trainhmp);

%% About minvalue, maxvalue, 
%% I fixed calc kdes program.
%% So, when program saves rgbdfea.mat, this feature file store.