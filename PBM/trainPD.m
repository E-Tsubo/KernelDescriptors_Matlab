%% Bat Script
%% 2012/11/21 Written by Hideshi T.

% Params( Please edit follows... )
rootimgdir = '../images/rgbdsubset_my2/';
rootmodeldir = '../Evaluate/rgbdsubset_my2/';
mkdir( rootmodeldir );
%classname = {'camera', 'cereal_box', 'coffee_mug', 'soda_can',
%'water_bottle'};
classname = {'bottle', 'can', 'cup', 'koaramarch', 'ornament', 'pack', 'pakuncho' };
subsample = 1;

RGB_RGB  = 1;
RGB_GRAD = 1;
DEP_GRAD = 1;
DEP_SPIN = 0;%not yet
addpath('./KDES');

f_RGB_RGB = 1;
f_RGB_GRAD = 1;
f_DEP_GRAD = 1;
f_DEP_SPIN = 0;

CALC_PART_MODEL = 5;
CALC_FULL = 1;
CALC_LEFT = 1;
CALC_RIGHT = 1;
CALC_TOP = 1;
CALC_BOTTOM = 1;

%% CALC FEATURE
if RGB_RGB
    if CALC_FULL
        imdir = [ rootimgdir 'full/' ];
                
        rgbd_rgb_rgbkdes;
        f_RGB_RGB = 1
        convert;
        f_RGB_RGB = 0;
        
        mkdir( rootmodeldir );
        dst = [ rootmodeldir 'Full' ];
        mkdir( dst );
        movedir = [ rootmodeldir 'Full/rgbdfea_rgb_rgbkdes.mat' ];
        movefile( 'rgbdfea_rgb_rgbkdes.mat', movedir );
        movedir = [ rootmodeldir 'Full/modelrgbkdes.mat' ];
        movefile( 'modelrgbkdes.mat', movedir );
        movedir = [ rootmodeldir 'Full/rgbdrgbkdes' ];
        movefile( '../kdesfeatures/rgbdrgbkdes', movedir );
        %movedir = [ rootmodeldir 'Full/modelrgbkdes.linear' ];
        %movefile( 'model.linear', movedir );
    end
    if CALC_LEFT
        imdir = [ rootimgdir 'left/' ];
                
        rgbd_rgb_rgbkdes;
        f_RGB_RGB = 1
        convert;
        f_RGB_RGB = 0;
        
        mkdir( rootmodeldir );
        dst = [ rootmodeldir 'Left' ];
        mkdir( dst );
        movedir = [ rootmodeldir 'Left/rgbdfea_rgb_rgbkdes.mat' ];
        movefile( 'rgbdfea_rgb_rgbkdes.mat', movedir );
        movedir = [ rootmodeldir 'Left/modelrgbkdes.mat' ];
        movefile( 'modelrgbkdes.mat', movedir );
        movedir = [ rootmodeldir 'Left/rgbdrgbkdes' ];
        movefile( '../kdesfeatures/rgbdrgbkdes', movedir );
        %movedir = [ rootmodeldir 'Left/modelrgbkdes.linear' ];
        %movefile( 'model.linear', movedir );
    end
    if CALC_RIGHT
        imdir = [ rootimgdir 'right/' ];
                
        rgbd_rgb_rgbkdes;
        f_RGB_RGB = 1
        convert;
        f_RGB_RGB = 0;
        
        mkdir( rootmodeldir );
        dst = [ rootmodeldir 'Right' ];
        mkdir( dst );
        movedir = [ rootmodeldir 'Right/rgbdfea_rgb_rgbkdes.mat' ];
        movefile( 'rgbdfea_rgb_rgbkdes.mat', movedir );
        movedir = [ rootmodeldir 'Right/modelrgbkdes.mat' ];
        movefile( 'modelrgbkdes.mat', movedir );
        movedir = [ rootmodeldir 'Right/rgbdrgbkdes' ];
        movefile( '../kdesfeatures/rgbdrgbkdes', movedir );
        %movedir = [ rootmodeldir 'Right/modelrgbkdes.linear' ];
        %movefile( 'model.linear', movedir );
    end
    if CALC_TOP
        imdir = [ rootimgdir 'top/' ];
                
        rgbd_rgb_rgbkdes;
        f_RGB_RGB = 1
        convert;
        f_RGB_RGB = 0;
        
        mkdir( rootmodeldir );
        dst = [ rootmodeldir 'Top' ];
        mkdir( dst );
        movedir = [ rootmodeldir 'Top/rgbdfea_rgb_rgbkdes.mat' ];
        movefile( 'rgbdfea_rgb_rgbkdes.mat', movedir );
        movedir = [ rootmodeldir 'Top/modelrgbkdes.mat' ];
        movefile( 'modelrgbkdes.mat', movedir );
        movedir = [ rootmodeldir 'Top/rgbdrgbkdes' ];
        movefile( '../kdesfeatures/rgbdrgbkdes', movedir );
        %movedir = [ rootmodeldir 'Top/modelrgbkdes.linear' ];
        %movefile( 'model.linear', movedir );
    end
    if CALC_BOTTOM
        imdir = [ rootimgdir 'bottom/' ];
                
        rgbd_rgb_rgbkdes;
        f_RGB_RGB = 1
        convert;
        f_RGB_RGB = 0;
        
        mkdir( rootmodeldir );
        dst = [ rootmodeldir 'Bottom' ];
        mkdir( dst );
        movedir = [ rootmodeldir 'Bottom/rgbdfea_rgb_rgbkdes.mat' ];
        movefile( 'rgbdfea_rgb_rgbkdes.mat', movedir );
        movedir = [ rootmodeldir 'Bottom/modelrgbkdes.mat' ];
        movefile( 'modelrgbkdes.mat', movedir );
        movedir = [ rootmodeldir 'Bottom/rgbdrgbkdes' ];
        movefile( '../kdesfeatures/rgbdrgbkdes', movedir );
        %movedir = [ rootmodeldir 'Bottom/modelrgbkdes.linear' ];
        %movefile( 'model.linear', movedir );
    end
end

if RGB_GRAD
    if CALC_FULL
        imdir = [ rootimgdir 'full/' ];
                
        rgbd_rgb_gradkdes;
        f_RGB_GRAD = 1;
        convert;
        f_RGB_GRAD = 1;
        
        mkdir( rootmodeldir );
        dst = [ rootmodeldir 'Full' ];
        mkdir( dst );
        movedir = [ rootmodeldir 'Full/rgbdfea_rgb_gradkdes.mat' ];
        movefile( 'rgbdfea_rgb_gradkdes.mat', movedir );
        movedir = [ rootmodeldir 'Full/modelgkdes.mat' ];
        movefile( 'modelgkdes.mat', movedir );
        movedir = [ rootmodeldir 'Full/rgbdgradkdes' ];
        movefile( '../kdesfeatures/rgbdgradkdes', movedir );
        %movedir = [ rootmodeldir 'Full/modelrgbkdes.linear' ];
        %movefile( 'model.linear', movedir );
    end
    if CALC_LEFT
        imdir = [ rootimgdir 'left/' ];
                
        rgbd_rgb_gradkdes;
        f_RGB_GRAD = 1
        convert;
        f_RGB_GRAD = 0;
        
        mkdir( rootmodeldir );
        dst = [ rootmodeldir 'Left' ];
        mkdir( dst );
        movedir = [ rootmodeldir 'Left/rgbdfea_rgb_gradkdes.mat' ];
        movefile( 'rgbdfea_rgb_gradkdes.mat', movedir );
        movedir = [ rootmodeldir 'Left/modelgkdes.mat' ];
        movefile( 'modelgkdes.mat', movedir );
        movedir = [ rootmodeldir 'Left/rgbdgradkdes' ];
        movefile( '../kdesfeatures/rgbdgradkdes', movedir );
        %movedir = [ rootmodeldir 'Left/modelrgbkdes.linear' ];
        %movefile( 'model.linear', movedir );
    end
    if CALC_RIGHT
        imdir = [ rootimgdir 'right/' ];
                
        rgbd_rgb_gradkdes;
        f_RGB_GRAD = 1
        convert;
        f_RGB_GRAD = 0;
        
        mkdir( rootmodeldir );
        dst = [ rootmodeldir 'Right' ];
        mkdir( dst );
        movedir = [ rootmodeldir 'Right/rgbdfea_rgb_gradkdes.mat' ];
        movefile( 'rgbdfea_rgb_gradkdes.mat', movedir );
        movedir = [ rootmodeldir 'Right/modelgkdes.mat' ];
        movefile( 'modelgkdes.mat', movedir );
        movedir = [ rootmodeldir 'Right/rgbdgradkdes' ];
        movefile( '../kdesfeatures/rgbdgradkdes', movedir );
        %movedir = [ rootmodeldir 'Right/modelrgbkdes.linear' ];
        %movefile( 'model.linear', movedir );
    end
    if CALC_TOP
        imdir = [ rootimgdir 'top/' ];
                
        rgbd_rgb_gradkdes;
        f_RGB_GRAD = 1
        convert;
        f_RGB_GRAD = 0;
        
        mkdir( rootmodeldir );
        dst = [ rootmodeldir 'Top' ];
        mkdir( dst );
        movedir = [ rootmodeldir 'Top/rgbdfea_rgb_gradkdes.mat' ];
        movefile( 'rgbdfea_rgb_gradkdes.mat', movedir );
        movedir = [ rootmodeldir 'Top/modelgkdes.mat' ];
        movefile( 'modelgkdes.mat', movedir );
        movedir = [ rootmodeldir 'Top/rgbdgradkdes' ];
        movefile( '../kdesfeatures/rgbdgradkdes', movedir );
        %movedir = [ rootmodeldir 'Top/modelrgbkdes.linear' ];
        %movefile( 'model.linear', movedir );
    end
    if CALC_BOTTOM
        imdir = [ rootimgdir 'bottom/' ];
                
        rgbd_rgb_gradkdes;
        f_RGB_GRAD = 1
        convert;
        f_RGB_GRAD = 0;
        
        mkdir( rootmodeldir );
        dst = [ rootmodeldir 'Bottom' ];
        mkdir( dst );
        movedir = [ rootmodeldir 'Bottom/rgbdfea_rgb_gradkdes.mat' ];
        movefile( 'rgbdfea_rgb_gradkdes.mat', movedir );
        movedir = [ rootmodeldir 'Bottom/modelgkdes.mat' ];
        movefile( 'modelgkdes.mat', movedir );
        movedir = [ rootmodeldir 'Bottom/rgbdgradkdes' ];
        movefile( '../kdesfeatures/rgbdgradkdes', movedir );
        %movedir = [ rootmodeldir 'Bottom/modelrgbkdes.linear' ];
        %movefile( 'model.linear', movedir );
    end
end

if DEP_GRAD
    if CALC_FULL
        imdir = [ rootimgdir 'full/' ];
                
        rgbd_depth_gradkdes;
        f_DEP_GRAD = 1;
        convert;
        f_DEP_GRAD = 0;
        
        mkdir( rootmodeldir );
        dst = [ rootmodeldir 'Full' ];
        mkdir( dst );
        movedir = [ rootmodeldir 'Full/rgbdfea_depth_gradkes.mat' ];
        movefile( 'rgbdfea_depth_gradkdes.mat', movedir );
        movedir = [ rootmodeldir 'Full/modelgkdes_dep.mat' ];
        movefile( 'modelgkdes_dep.mat', movedir );
        movedir = [ rootmodeldir 'Full/rgbdgradkdes_dep' ];
        movefile( '../kdesfeatures/rgbdgradkdes_dep', movedir );
        %movedir = [ rootmodeldir 'Full/modelrgbkdes.linear' ];
        %movefile( 'model.linear', movedir );
    end
    if CALC_LEFT
        imdir = [ rootimgdir 'left/' ];
                
        rgbd_depth_gradkdes;
        f_DEP_GRAD = 1;
        convert;
        f_DEP_GRAD = 0;
        
        mkdir( rootmodeldir );
        dst = [ rootmodeldir 'Left' ];
        mkdir( dst );
        movedir = [ rootmodeldir 'Left/rgbdfea_depth_gradkdes.mat' ];
        movefile( 'rgbdfea_depth_gradkdes.mat', movedir );
        movedir = [ rootmodeldir 'Left/modelgkdes_dep.mat' ];
        movefile( 'modelgkdes_dep.mat', movedir );
        movedir = [ rootmodeldir 'Left/rgbdgradkdes_dep' ];
        movefile( '../kdesfeatures/rgbdgradkdes_dep', movedir );
        %movedir = [ rootmodeldir 'Left/modelrgbkdes.linear' ];
        %movefile( 'model.linear', movedir );
    end
    if CALC_RIGHT
        imdir = [ rootimgdir 'right/' ];
                
        rgbd_depth_gradkdes;
        f_DEP_GRAD = 1;
        convert;
        f_DEP_GRAD = 0;
        
        mkdir( rootmodeldir );
        dst = [ rootmodeldir 'Right' ];
        mkdir( dst );
        movedir = [ rootmodeldir 'Right/rgbdfea_depth_gradkdes.mat' ];
        movefile( 'rgbdfea_depth_gradkdes.mat', movedir );
        movedir = [ rootmodeldir 'Right/modelgkdes_dep.mat' ];
        movefile( 'modelgkdes_dep.mat', movedir );
        movedir = [ rootmodeldir 'Right/rgbdgradkdes_dep' ];
        movefile( '../kdesfeatures/rgbdgradkdes_dep', movedir );
        %movedir = [ rootmodeldir 'Right/modelrgbkdes.linear' ];
        %movefile( 'model.linear', movedir );
    end
    if CALC_TOP
        imdir = [ rootimgdir 'top/' ];
                
        rgbd_depth_gradkdes;
        f_DEP_GRAD = 1;
        convert;
        f_DEP_GRAD = 0;
        
        mkdir( rootmodeldir );
        dst = [ rootmodeldir 'Top' ];
        mkdir( dst );
        movedir = [ rootmodeldir 'Top/rgbdfea_depth_gradkdes.mat' ];
        movefile( 'rgbdfea_depth_gradkdes.mat', movedir );
        movedir = [ rootmodeldir 'Top/modelgkdes_dep.mat' ];
        movefile( 'modelgkdes_dep.mat', movedir );
        movedir = [ rootmodeldir 'Top/rgbdgradkdes_dep' ];
        movefile( '../kdesfeatures/rgbdgradkdes_dep', movedir );
        %movedir = [ rootmodeldir 'Top/modelrgbkdes.linear' ];
        %movefile( 'model.linear', movedir );
    end
    if CALC_BOTTOM
        imdir = [ rootimgdir 'bottom/' ];
                
        rgbd_depth_gradkdes;
        f_DEP_GRAD = 1;
        convert;
        f_DEP_GRAD = 0;
        
        mkdir( rootmodeldir );
        dst = [ rootmodeldir 'Bottom' ];
        mkdir( dst );
        movedir = [ rootmodeldir 'Bottom/rgbdfea_depth_gradkdes.mat' ];
        movefile( 'rgbdfea_depth_gradkdes.mat', movedir );
        movedir = [ rootmodeldir 'Bottom/modelgkdes_dep.mat' ];
        movefile( 'modelgkdes_dep.mat', movedir );
        movedir = [ rootmodeldir 'Bottom/rgbdgradkdes_dep' ];
        movefile( '../kdesfeatures/rgbdgradkdes_dep', movedir );
        %movedir = [ rootmodeldir 'Bottom/modelrgbkdes.linear' ];
        %movefile( 'model.linear', movedir );
    end
end