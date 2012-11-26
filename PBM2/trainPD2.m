%% Bat Script
%% 2012/11/21 Written by Hideshi T.

% Params( Please edit follows... )
rootimgdir = '../images/Model/';
rootmodeldir = '../Evaluate/Model/';
mkdir( rootmodeldir );
classname = {'camera', 'cereal_box', 'coffee_mug', 'soda_can', 'water_bottle'};
%classname = {'bottle', 'can', 'cup', 'koaramarch', 'ornament', 'pack', 'pakuncho' };
subsample = 20;

RGB_RGB  = 1;
RGB_GRAD = 1;
DEP_GRAD = 1;
DEP_SPIN = 0;%not yet
addpath('./KDES');

f_RGB_RGB = 0;
f_RGB_GRAD = 0;
f_DEP_GRAD = 0;
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
        dst = [ rootmodeldir 'full' ];
        mkdir( dst );
        movedir = [ rootmodeldir 'full/rgbdfea_rgb_rgbkdes.mat' ];
        movefile( 'rgbdfea_rgb_rgbkdes.mat', movedir );
        movedir = [ rootmodeldir 'full/modelrgbkdes.mat' ];
        movefile( 'modelrgbkdes.mat', movedir );
        movedir = [ rootmodeldir 'full/rgbdrgbkdes' ];
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
        dst = [ rootmodeldir 'left' ];
        mkdir( dst );
        movedir = [ rootmodeldir 'left/rgbdfea_rgb_rgbkdes.mat' ];
        movefile( 'rgbdfea_rgb_rgbkdes.mat', movedir );
        movedir = [ rootmodeldir 'left/modelrgbkdes.mat' ];
        movefile( 'modelrgbkdes.mat', movedir );
        movedir = [ rootmodeldir 'left/rgbdrgbkdes' ];
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
        dst = [ rootmodeldir 'right' ];
        mkdir( dst );
        movedir = [ rootmodeldir 'right/rgbdfea_rgb_rgbkdes.mat' ];
        movefile( 'rgbdfea_rgb_rgbkdes.mat', movedir );
        movedir = [ rootmodeldir 'right/modelrgbkdes.mat' ];
        movefile( 'modelrgbkdes.mat', movedir );
        movedir = [ rootmodeldir 'right/rgbdrgbkdes' ];
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
        dst = [ rootmodeldir 'top' ];
        mkdir( dst );
        movedir = [ rootmodeldir 'top/rgbdfea_rgb_rgbkdes.mat' ];
        movefile( 'rgbdfea_rgb_rgbkdes.mat', movedir );
        movedir = [ rootmodeldir 'top/modelrgbkdes.mat' ];
        movefile( 'modelrgbkdes.mat', movedir );
        movedir = [ rootmodeldir 'top/rgbdrgbkdes' ];
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
        dst = [ rootmodeldir 'bottom' ];
        mkdir( dst );
        movedir = [ rootmodeldir 'bottom/rgbdfea_rgb_rgbkdes.mat' ];
        movefile( 'rgbdfea_rgb_rgbkdes.mat', movedir );
        movedir = [ rootmodeldir 'bottom/modelrgbkdes.mat' ];
        movefile( 'modelrgbkdes.mat', movedir );
        movedir = [ rootmodeldir 'bottom/rgbdrgbkdes' ];
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
        movedir = [ rootmodeldir 'full/rgbdfea_rgb_gradkdes.mat' ];
        movefile( 'rgbdfea_rgb_gradkdes.mat', movedir );
        movedir = [ rootmodeldir 'full/modelgkdes.mat' ];
        movefile( 'modelgkdes.mat', movedir );
        movedir = [ rootmodeldir 'full/rgbdgradkdes' ];
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
        dst = [ rootmodeldir 'left' ];
        mkdir( dst );
        movedir = [ rootmodeldir 'left/rgbdfea_rgb_gradkdes.mat' ];
        movefile( 'rgbdfea_rgb_gradkdes.mat', movedir );
        movedir = [ rootmodeldir 'left/modelgkdes.mat' ];
        movefile( 'modelgkdes.mat', movedir );
        movedir = [ rootmodeldir 'left/rgbdgradkdes' ];
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
        dst = [ rootmodeldir 'right' ];
        mkdir( dst );
        movedir = [ rootmodeldir 'right/rgbdfea_rgb_gradkdes.mat' ];
        movefile( 'rgbdfea_rgb_gradkdes.mat', movedir );
        movedir = [ rootmodeldir 'right/modelgkdes.mat' ];
        movefile( 'modelgkdes.mat', movedir );
        movedir = [ rootmodeldir 'right/rgbdgradkdes' ];
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
        movedir = [ rootmodeldir 'top/rgbdfea_rgb_gradkdes.mat' ];
        movefile( 'rgbdfea_rgb_gradkdes.mat', movedir );
        movedir = [ rootmodeldir 'top/modelgkdes.mat' ];
        movefile( 'modelgkdes.mat', movedir );
        movedir = [ rootmodeldir 'top/rgbdgradkdes' ];
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
        dst = [ rootmodeldir 'bottom' ];
        mkdir( dst );
        movedir = [ rootmodeldir 'bottom/rgbdfea_rgb_gradkdes.mat' ];
        movefile( 'rgbdfea_rgb_gradkdes.mat', movedir );
        movedir = [ rootmodeldir 'bottom/modelgkdes.mat' ];
        movefile( 'modelgkdes.mat', movedir );
        movedir = [ rootmodeldir 'bottom/rgbdgradkdes' ];
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
        dst = [ rootmodeldir 'full' ];
        mkdir( dst );
        movedir = [ rootmodeldir 'full/rgbdfea_depth_gradkes.mat' ];
        movefile( 'rgbdfea_depth_gradkdes.mat', movedir );
        movedir = [ rootmodeldir 'full/modelgkdes_dep.mat' ];
        movefile( 'modelgkdes_dep.mat', movedir );
        movedir = [ rootmodeldir 'full/rgbdgradkdes_dep' ];
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
        dst = [ rootmodeldir 'left' ];
        mkdir( dst );
        movedir = [ rootmodeldir 'left/rgbdfea_depth_gradkdes.mat' ];
        movefile( 'rgbdfea_depth_gradkdes.mat', movedir );
        movedir = [ rootmodeldir 'left/modelgkdes_dep.mat' ];
        movefile( 'modelgkdes_dep.mat', movedir );
        movedir = [ rootmodeldir 'left/rgbdgradkdes_dep' ];
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
        dst = [ rootmodeldir 'right' ];
        mkdir( dst );
        movedir = [ rootmodeldir 'right/rgbdfea_depth_gradkdes.mat' ];
        movefile( 'rgbdfea_depth_gradkdes.mat', movedir );
        movedir = [ rootmodeldir 'right/modelgkdes_dep.mat' ];
        movefile( 'modelgkdes_dep.mat', movedir );
        movedir = [ rootmodeldir 'right/rgbdgradkdes_dep' ];
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
        dst = [ rootmodeldir 'top' ];
        mkdir( dst );
        movedir = [ rootmodeldir 'top/rgbdfea_depth_gradkdes.mat' ];
        movefile( 'rgbdfea_depth_gradkdes.mat', movedir );
        movedir = [ rootmodeldir 'top/modelgkdes_dep.mat' ];
        movefile( 'modelgkdes_dep.mat', movedir );
        movedir = [ rootmodeldir 'top/rgbdgradkdes_dep' ];
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
        dst = [ rootmodeldir 'bottom' ];
        mkdir( dst );
        movedir = [ rootmodeldir 'bottom/rgbdfea_depth_gradkdes.mat' ];
        movefile( 'rgbdfea_depth_gradkdes.mat', movedir );
        movedir = [ rootmodeldir 'bottom/modelgkdes_dep.mat' ];
        movefile( 'modelgkdes_dep.mat', movedir );
        movedir = [ rootmodeldir 'bottom/rgbdgradkdes_dep' ];
        movefile( '../kdesfeatures/rgbdgradkdes_dep', movedir );
        %movedir = [ rootmodeldir 'Bottom/modelrgbkdes.linear' ];
        %movefile( 'model.linear', movedir );
    end
end