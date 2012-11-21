%function test = convert( modelname, kdes_params, max_imsize, min_imsize, emk_params, G, model,% maxvalue, minvalue, classname )
% Written by Hideshi T. on 2012/07/04
   
disp('Convert from liblinear matlab model to C++ model');

% RGB-D grad on Depth
if f_DEP_GRAD

disp('Convert rgbd_depth_gradkdes model');

% About kdes
modelgkdes.kdes.max_imsize = 300;
modelgkdes.kdes.min_imsize = 45;
modelgkdes.kdes.grid_space = kdes_params.grid;
modelgkdes.kdes.patch_size = kdes_params.patchsize;
modelgkdes.kdes.low_contrast = 0.8;% Really?
load('gradkdes_dep_params');
modelgkdes.kdes.kdes_params = kdes_params.kdes;

% About emk
modelgkdes.emk.words = rgbdwords;
modelgkdes.emk.pyramid = emk_params.pyramid;
modelgkdes.emk.ktype = emk_params.ktype;
modelgkdes.emk.kparam = emk_params.kparam;
modelgkdes.emk.G = G;

% About svm
modelgkdes.svm.Parameters = model.Parameters;
modelgkdes.svm.nr_class = model.nr_class;
modelgkdes.svm.nr_feature = model.nr_feature;
modelgkdes.svm.bias = model.bias;
modelgkdes.svm.Label = model.Label;
modelgkdes.svm.w = model.w;
modelgkdes.svm.minvalue = minvalue;
modelgkdes.svm.maxvalue = maxvalue;
modelgkdes.svm.classname = classname;% Please ready this array before running this program

% For Matlab Program
modelgkdes.matlab.model = model;

% Result
disp('------------------------------------');
disp('Result -----modelgkdes----------');
disp('       -----modelgkdes.kdes-----');
disp(modelgkdes.kdes);
disp('       -----modelgkdes.emk------');
disp(modelgkdes.emk);
disp('       -----modelgkdes.svm------');
disp(modelgkdes.svm);
disp('------------------------------------');

% Save
savefile = 'modelgkdes_dep.mat';
save( savefile, 'modelgkdes' );
disp('Save Done!!');

end

% RGB-D Spin on Point Cloud
if f_DEP_SPIN

disp('Convert rgbd_pcloud_normalkdes model');

% About kdes
modelspinkdes.kdes.max_imsize = 300;
modelspinkdes.kdes.min_imsize = 45;
modelspinkdes.kdes.grid_space = kdes_params.grid;
modelspinkdes.kdes.patch_size = kdes_params.patchsize;
%modelspinkdes.kdes.nromal_window = 5;  % Really?
%modelspinkdes.kdes.normal_threshold = 0.01; % Really?
modelspinkdes.kdes.kdes_params = kdes_params.kdes;

% About emk
modelspinkdes.emk.words = rgbdwords;
modelspinkdes.emk.pyramid = emk_params.pyramid;
modelspinkdes.emk.ktype = emk_params.ktype;
modelspinkdes.emk.kparam = emk_params.kparam;
modelspinkdes.emk.G = G;

% About svm
modelspinkdes.svm.Parameters = model.Parameters;
modelspinkdes.svm.nr_class = model.nr_class;
modelspinkdes.svm.nr_feature = model.nr_feature;
modelspinkdes.svm.bias = model.bias;
modelspinkdes.svm.Label = model.Label;
modelspinkdes.svm.w = model.w;
modelspinkdes.svm.minvalue = minvalue;
modelspinkdes.svm.maxvalue = maxvalue;
modelspinkdes.svm.classname = classname;% Please ready this array before running this program

% For Matlab Program
modelspinkdes.matlab.model = model;

% Result
disp('------------------------------------');
disp('Result -----modelspinkdes----------');
disp('       -----modelspinkdes.kdes-----');
disp(modelspinkdes.kdes);
disp('       -----modelspinkdes.emk------');
disp(modelspinkdes.emk);
disp('       -----modelspinkdes.svm------');
disp(modelspinkdes.svm);
disp('------------------------------------');

% Save
savefile = 'modelspinkdes.mat';
save( savefile, 'modelspinkdes' );
disp('Save Done!!');

end


% RGB-D grad on RGB-Image
if f_RGB_GRAD

disp('Convert rgbd_rgb_gradkdes model');

% About kdes
modelgkdes.kdes.max_imsize = 300;
modelgkdes.kdes.min_imsize = 45;
modelgkdes.kdes.grid_space = kdes_params.grid;
modelgkdes.kdes.patch_size = kdes_params.patchsize;
modelgkdes.kdes.low_contrast = 0.8;% Really?
modelgkdes.kdes.kdes_params = kdes_params.kdes;

% About emk
modelgkdes.emk.words = rgbdwords;
modelgkdes.emk.pyramid = emk_params.pyramid;
modelgkdes.emk.ktype = emk_params.ktype;
modelgkdes.emk.kparam = emk_params.kparam;
modelgkdes.emk.G = G;

% About svm
modelgkdes.svm.Parameters = model.Parameters;
modelgkdes.svm.nr_class = model.nr_class;
modelgkdes.svm.nr_feature = model.nr_feature;
modelgkdes.svm.bias = model.bias;
modelgkdes.svm.Label = model.Label;
modelgkdes.svm.w = model.w;
modelgkdes.svm.minvalue = minvalue;
modelgkdes.svm.maxvalue = maxvalue;
modelgkdes.svm.classname = classname;% Please ready this array before running this program

% For Matlab Program
modelgkdes.matlab.model = model;

% Result
disp('--------------------------------');
disp('Result -----modelgkdes----------');
disp('       -----modelgkdes.kdes-----');
disp(modelgkdes.kdes);
disp('       -----modelgkdes.emk------');
disp(modelgkdes.emk);
disp('       -----modelgkdes.svm------');
disp(modelgkdes.svm);
disp('--------------------------------');

% Save
savefile = 'modelgkdes.mat';
save( savefile, 'modelgkdes' );
disp('Save Done!!');

end


% RGB-D rgb on RGB-Image
if f_RGB_RGB

disp('Convert rgbd_rgb_rgbkdes model');

% About kdes
modelrgbkdes.kdes.max_imsize = 300;
modelrgbkdes.kdes.min_imsize = 45;
modelrgbkdes.kdes.grid_space = kdes_params.grid;
modelrgbkdes.kdes.patch_size = kdes_params.patchsize;
modelrgbkdes.kdes.low_contrast = 0;% Really?
modelrgbkdes.kdes.kdes_params = kdes_params.kdes;

% About emk
modelrgbkdes.emk.words = rgbdwords;
modelrgbkdes.emk.pyramid = emk_params.pyramid;
modelrgbkdes.emk.ktype = emk_params.ktype;
modelrgbkdes.emk.kparam = emk_params.kparam;
modelrgbkdes.emk.G = G;

% About svm
modelrgbkdes.svm.Parameters = model.Parameters;
modelrgbkdes.svm.nr_class = model.nr_class;
modelrgbkdes.svm.nr_feature = model.nr_feature;
modelrgbkdes.svm.bias = model.bias;
modelrgbkdes.svm.Label = model.Label;
modelrgbkdes.svm.w = model.w;
modelrgbkdes.svm.minvalue = minvalue;
modelrgbkdes.svm.maxvalue = maxvalue;
modelrgbkdes.svm.classname = classname;% Please ready this array before running this program

% For Matlab Program
modelrgbkdes.matlab.model = model;

% Result
disp('----------------------------------');
disp('Result -----modelrgbkdes----------');
disp('       -----modelrgbkdes.kdes-----');
disp(modelrgbkdes.kdes);
disp('       -----modelrgbkdes.emk------');
disp(modelrgbkdes.emk);
disp('       -----modelrgbkdes.svm------');
disp(modelrgbkdes.svm);
disp('----------------------------------');

% Save
savefile = 'modelrgbkdes.mat';
save( savefile, 'modelrgbkdes' );
disp('Save Done!!');

end
