%function test = convert( modelname, kdes_params, max_imsize, min_imsize, emk_params, G, model,% maxvalue, minvalue, classname )
% Written by Hideshi T. on 2012/07/04
   
% below array is needed by this program. So please use this array before running this program.
classname = {'koaramarch_1','koaramarch_2','koaramarch_3','pakuncho_1','pakuncho_2','pakuncho_3'};

rgbd_depth_gradkdes    = 0;% C++ Supported
rgbd_depthlbpkdes      = 0;% Not yet, C++ Supported
rgbd_pcloud_normalkdes = 0;% Not yet,
rgbd_pcloud_sizekdes   = 0;% Not yet
rgbd_rgb_gradkdes      = 0;% C++ Supported
rgbd_rgb_lbpkdes       = 0;% Not yet
rgbd_rgb_nrgbkdes      = 1;% Not yet, C++ Supported

disp('Convert from liblinear matlab model to C++ model');

if rgbd_depth_gradkdes

disp('Convert rgbd_depth_gradkdes model');

% About kdes
modelgkdes_dep.kdes.max_imsize = 300;
modelgkdes_dep.kdes.min_imsize = 45;
modelgkdes_dep.kdes.grid_space = kdes_params.grid;
modelgkdes_dep.kdes.patch_size = kdes_params.patchsize;
modelgkdes_dep.kdes.low_contrast = 0.8;% Really?

% About emk
modelgkdes_dep.emk.words = rgbdwords;
modelgkdes_dep.emk.pyramid = emk_params.pyramid;
modelgkdes_dep.emk.ktype = emk_params.ktype;
modelgkdes_dep.emk.kparam = emk_params.kparam;
modelgkdes_dep.emk.G = G;

% About svm
modelgkdes_dep.svm.Parameters = model.Parameters;
modelgkdes_dep.svm.nr_class = model.nr_class;
modelgkdes_dep.svm.nr_feature = model.nr_feature;
modelgkdes_dep.svm.bias = model.bias;
modelgkdes_dep.svm.Label = model.Label;
modelgkdes_dep.svm.w = model.w;
modelgkdes_dep.svm.minvalue = minvalue;
modelgkdes_dep.svm.maxvalue = maxvalue;
modelgkdes_dep.svm.classname = classname;% Please ready this array before running this program

% Result
disp('------------------------------------');
disp('Result -----modelgkdes_dep----------');
disp('       -----modelgkdes_dep.kdes-----');
disp(modelgkdes_dep.kdes);
disp('       -----modelgkdes_dep.emk------');
disp(modelgkdes_dep.emk);
disp('       -----modelgkdes_dep.svm------');
disp(modelgkdes_dep.svm);
disp('------------------------------------');

% Save
savefile = 'modelgkdes_dep.mat';
save( savefile, 'modelgkdes_dep' );
disp('Save Done!!');

end

if rgbd_rgb_gradkdes

disp('Convert rgbd_rgb_gradkdes model');

% About kdes
modelgkdes.kdes.max_imsize = 300;
modelgkdes.kdes.min_imsize = 45;
modelgkdes.kdes.grid_space = kdes_params.grid;
modelgkdes.kdes.patch_size = kdes_params.patchsize;
modelgkdes.kdes.low_contrast = 0.8;% Really?

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


if rgbd_rgb_nrgbkdes

disp('Convert rgbd_rgb_nrgbkdes model');

% About kdes
modelrgbkdes.kdes.max_imsize = 300;
modelrgbkdes.kdes.min_imsize = 45;
modelrgbkdes.kdes.grid_space = kdes_params.grid;
modelrgbkdes.kdes.patch_size = kdes_params.patchsize;
modelrgbkdes.kdes.low_contrast = 0;% Really?

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

% Result
disp('--------------------------------');
disp('Result -----modelrgbkdes----------');
disp('       -----modelrgbkdes.kdes-----');
disp(modelrgbkdes.kdes);
disp('       -----modelrgbkdes.emk------');
disp(modelrgbkdes.emk);
disp('       -----modelrgbkdes.svm------');
disp(modelrgbkdes.svm);
disp('--------------------------------');

% Save
savefile = 'modelrgbkdes.mat';
save( savefile, 'modelrgbkdes' );
disp('Save Done!!');

end
