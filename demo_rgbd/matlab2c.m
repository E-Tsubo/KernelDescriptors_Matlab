%matlab`s liblinear model to C`s model
%This program`s output is able to be loaded load_model function on *.c or *.cpp
matlabModel=load('model.mat');

%model`s param
%Parameters, nr_class, nr_feature, bias, Label, w
%I think Parameters is loaded from default file.

%echo model`s data
model;

fp = fopen('tmp.txt', 'w');
fprintf(fp, '%s %d\n', 'Parameters', model.Parameters);
fprintf(fp, '%s %d\n', 'nr_class', model.nr_class);
fprintf(fp, '%s %d\n', 'nr_feature', model.nr_feature);
fprintf(fp, '%s %d\n', 'bias', model.bias);
fprintf(fp, '%s ', 'Label')
for i = 1:length(model.Label)
	  fprintf(fp, '%d ', 'Label', model.Label(i));
end
fprintf(fp, "\n");
fprintf(fp, '%s\n', 'w');
for i = 1:3
	  for j = 1:length(model.w())
		    fpritnf(fp, '%d ', model.w(i));
          end
	  fprintf(fp, '\n');
end
fclose(fp);


