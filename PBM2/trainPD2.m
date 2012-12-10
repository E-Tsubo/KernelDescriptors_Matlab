%% Bat Script
%% 2012/11/21 Written by Hideshi T.

% Params( Please edit follows... )
rootimgdir = '../images/rgbdsubset/';
rootmodeldir = '../Evaluate/rgbdsubset/';
mkdir( rootmodeldir );
%classname = {'cereal_box', 'coffee_mug', 'soda_can', 'water_bottle'};
%classname = {'bottle', 'can', 'cup', 'koaramarch', 'ornament', 'pack', 'pakuncho' };
load classname.mat;
subsample = 15;

RGB_RGB  = 0;
RGB_GRAD = 0;
DEP_GRAD = 0;
DEP_SPIN = 1;
COMBINATION = 0; %Please cheack others flag's value.
addpath('./KDES');

f_RGB_RGB = 0;
f_RGB_GRAD = 0;
f_DEP_GRAD = 0;
f_DEP_SPIN = 0;
f_COM = 0;

CALC_PART_MODEL = 5;
CALC_FULL = 0;
CALC_LEFT = 0;
CALC_RIGHT = 1;
CALC_TOP = 1;
CALC_BOTTOM = 1;

CALC_SVMMODEL = 1;

%% CALC FEATURE
if RGB_RGB
    if CALC_FULL
        imdir = [ rootimgdir 'full/' ];
                
        rgbd_rgb_rgbkdes;
		if CALC_SVMMODEL
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
		else
			mkdir( rootmodeldir );
			dst = [ rootmodeldir 'full' ];
			mkdir( dst );
			movedir = [ rootmodeldir 'full/rgbdfea_rgb_rgbkdes.mat' ];
			movefile( 'rgbdfea_rgb_rgbkdes.mat', movedir );
		end
    end
    if CALC_LEFT
        imdir = [ rootimgdir 'left/' ];
                
        rgbd_rgb_rgbkdes;
		if CALC_SVMMODEL
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
		else
			mkdir( rootmodeldir );
			dst = [ rootmodeldir 'left' ];
			mkdir( dst );
			movedir = [ rootmodeldir 'left/rgbdfea_rgb_rgbkdes.mat' ];
			movefile( 'rgbdfea_rgb_rgbkdes.mat', movedir );
		end
    end
    if CALC_RIGHT
        imdir = [ rootimgdir 'right/' ];
                
        rgbd_rgb_rgbkdes;
		if CALC_SVMMODEL
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
		else
			mkdir( rootmodeldir );
			dst = [ rootmodeldir 'right' ];
			mkdir( dst );
			movedir = [ rootmodeldir 'right/rgbdfea_rgb_rgbkdes.mat' ];
			movefile( 'rgbdfea_rgb_rgbkdes.mat', movedir );
		end
    end
    if CALC_TOP
        imdir = [ rootimgdir 'top/' ];
                
        rgbd_rgb_rgbkdes;
		if CALC_SVMMODEL
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
		else
			mkdir( rootmodeldir );
			dst = [ rootmodeldir 'top' ];
			mkdir( dst );
			movedir = [ rootmodeldir 'top/rgbdfea_rgb_rgbkdes.mat' ];
			movefile( 'rgbdfea_rgb_rgbkdes.mat', movedir );
		end
    end
    if CALC_BOTTOM
        imdir = [ rootimgdir 'bottom/' ];
                
        rgbd_rgb_rgbkdes;
		if CALC_SVMMODEL
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
		else
			mkdir( rootmodeldir );
			dst = [ rootmodeldir 'bottom' ];
			mkdir( dst );
			movedir = [ rootmodeldir 'bottom/rgbdfea_rgb_rgbkdes.mat' ];
			movefile( 'rgbdfea_rgb_rgbkdes.mat', movedir );
		end
    end
end

if RGB_GRAD
    if CALC_FULL
        imdir = [ rootimgdir 'full/' ];
                
        rgbd_rgb_gradkdes;
		if CALC_SVMMODEL
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
		else
			mkdir( rootmodeldir );
			dst = [ rootmodeldir 'Full' ];
			mkdir( dst );
			movedir = [ rootmodeldir 'full/rgbdfea_rgb_gradkdes.mat' ];
			movefile( 'rgbdfea_rgb_gradkdes.mat', movedir );
		end
    end
    if CALC_LEFT
        imdir = [ rootimgdir 'left/' ];
                
        rgbd_rgb_gradkdes;
		if CALC_SVMMODEL
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
		else
			mkdir( rootmodeldir );
			dst = [ rootmodeldir 'left' ];
			mkdir( dst );
			movedir = [ rootmodeldir 'left/rgbdfea_rgb_gradkdes.mat' ];
			movefile( 'rgbdfea_rgb_gradkdes.mat', movedir );
		end
    end
    if CALC_RIGHT
        imdir = [ rootimgdir 'right/' ];
                
        rgbd_rgb_gradkdes;
		if CALC_SVMMODEL
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
		else
			mkdir( rootmodeldir );
			dst = [ rootmodeldir 'right' ];
			mkdir( dst );
			movedir = [ rootmodeldir 'right/rgbdfea_rgb_gradkdes.mat' ];
			movefile( 'rgbdfea_rgb_gradkdes.mat', movedir );
		end
    end
    if CALC_TOP
        imdir = [ rootimgdir 'top/' ];
                
        rgbd_rgb_gradkdes;
		if CALC_SVMMODEL
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
		else
			mkdir( rootmodeldir );
			dst = [ rootmodeldir 'Top' ];
			mkdir( dst );
			movedir = [ rootmodeldir 'top/rgbdfea_rgb_gradkdes.mat' ];
			movefile( 'rgbdfea_rgb_gradkdes.mat', movedir );
		end
    end
    if CALC_BOTTOM
        imdir = [ rootimgdir 'bottom/' ];
                
        rgbd_rgb_gradkdes;
		if CALC_SVMMODEL
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
		else
			mkdir( rootmodeldir );
			dst = [ rootmodeldir 'bottom' ];
			mkdir( dst );
			movedir = [ rootmodeldir 'bottom/rgbdfea_rgb_gradkdes.mat' ];
			movefile( 'rgbdfea_rgb_gradkdes.mat', movedir );
		end
    end
end

if DEP_GRAD
    if CALC_FULL
        imdir = [ rootimgdir 'full/' ];
                
        rgbd_depth_gradkdes;
		if CALC_SVMMODEL
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
		else
			mkdir( rootmodeldir );
			dst = [ rootmodeldir 'full' ];
			mkdir( dst );
			movedir = [ rootmodeldir 'full/rgbdfea_depth_gradkes.mat' ];
			movefile( 'rgbdfea_depth_gradkdes.mat', movedir );
		end
    end
    if CALC_LEFT
        imdir = [ rootimgdir 'left/' ];
                
        rgbd_depth_gradkdes;
		if CALC_SVMMODEL
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
		else
			mkdir( rootmodeldir );
			dst = [ rootmodeldir 'left' ];
			mkdir( dst );
			movedir = [ rootmodeldir 'left/rgbdfea_depth_gradkdes.mat' ];
			movefile( 'rgbdfea_depth_gradkdes.mat', movedir );
		end
    end
    if CALC_RIGHT
        imdir = [ rootimgdir 'right/' ];
                
        rgbd_depth_gradkdes;
		if CALC_SVMMODEL
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
		else
			mkdir( rootmodeldir );
			dst = [ rootmodeldir 'right' ];
			mkdir( dst );
			movedir = [ rootmodeldir 'right/rgbdfea_depth_gradkdes.mat' ];
			movefile( 'rgbdfea_depth_gradkdes.mat', movedir );
		end
    end
    if CALC_TOP
        imdir = [ rootimgdir 'top/' ];
                
        rgbd_depth_gradkdes;
		if CALC_SVMMODEL
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
		else
			mkdir( rootmodeldir );
			dst = [ rootmodeldir 'top' ];
			mkdir( dst );
			movedir = [ rootmodeldir 'top/rgbdfea_depth_gradkdes.mat' ];
			movefile( 'rgbdfea_depth_gradkdes.mat', movedir );
		end
    end
    if CALC_BOTTOM
        imdir = [ rootimgdir 'bottom/' ];
                
        rgbd_depth_gradkdes;
		if CALC_SVMMODEL
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
		else
			mkdir( rootmodeldir );
			dst = [ rootmodeldir 'bottom' ];
			mkdir( dst );
			movedir = [ rootmodeldir 'bottom/rgbdfea_depth_gradkdes.mat' ];
			movefile( 'rgbdfea_depth_gradkdes.mat', movedir );
		end
    end
end

if DEP_SPIN
    if CALC_FULL
        imdir = [ rootimgdir 'full/' ];
                
        rgbd_pcloud_normalkdes;
		if CALC_SVMMODEL
			f_DEP_SPIN = 1;
			convert;
			f_DEP_SPIN = 0;
        
			mkdir( rootmodeldir );
			dst = [ rootmodeldir 'full' ];
			mkdir( dst );
			movedir = [ rootmodeldir 'full/rgbdfea_pcloud_normalkdes.mat' ];
			movefile( 'rgbdfea_pcloud_normalkdes.mat', movedir );
			movedir = [ rootmodeldir 'full/modelspinkdes.mat' ];
			movefile( 'modelspinkdes.mat', movedir );
			movedir = [ rootmodeldir 'full/rgbdnormalkdes' ];
			movefile( '../kdesfeatures/rgbdnormalkdes', movedir );
			%movedir = [ rootmodeldir 'Full/modelrgbkdes.linear' ];
			%movefile( 'model.linear', movedir );
		else
			mkdir( rootmodeldir );
			dst = [ rootmodeldir 'full' ];
			mkdir( dst );
			movedir = [ rootmodeldir 'full/rgbdfea_pcloud_normalkdes.mat' ];
			movefile( 'rgbdfea_pcloud_normalkdes.mat', movedir );
		end
    end
    if CALC_LEFT
        imdir = [ rootimgdir 'left/' ];
                
        rgbd_pcloud_normalkdes;
		if CALC_SVMMODEL
			f_DEP_SPIN = 1;
			convert;
			f_DEP_SPIN = 0;
        
			mkdir( rootmodeldir );
			dst = [ rootmodeldir 'left' ];
			mkdir( dst );
			movedir = [ rootmodeldir 'left/rgbdfea_pcloud_normalkdes.mat' ];
			movefile( 'rgbdfea_pcloud_normalkdes.mat', movedir );
			movedir = [ rootmodeldir 'left/modelspinkdes.mat' ];
			movefile( 'modelspinkdes.mat', movedir );
			movedir = [ rootmodeldir 'left/rgbdnormalkdes' ];
			movefile( '../kdesfeatures/rgbdnormalkdes', movedir );
			%movedir = [ rootmodeldir 'Left/modelrgbkdes.linear' ];
			%movefile( 'model.linear', movedir );
		else
			mkdir( rootmodeldir );
			dst = [ rootmodeldir 'left' ];
			mkdir( dst );
			movedir = [ rootmodeldir 'left/rgbdfea_pcloud_normalkdes.mat' ];
			movefile( 'rgbdfea_pcloud_normalkdes.mat', movedir );
		end
    end
    if CALC_RIGHT
        imdir = [ rootimgdir 'right/' ];
                
        rgbd_pcloud_normalkdes;
		if CALC_SVMMODEL
			f_DEP_SPIN = 1;
			convert;
			f_DEP_SPIN = 0;
        
			mkdir( rootmodeldir );
			dst = [ rootmodeldir 'right' ];
			mkdir( dst );
			movedir = [ rootmodeldir 'right/rgbdfea_pcloud_normalkdes.mat' ];
			movefile( 'rgbdfea_pcloud_normalkdes.mat', movedir );
			movedir = [ rootmodeldir 'right/modelspinkdes.mat' ];
			movefile( 'modelspinkdes.mat', movedir );
			movedir = [ rootmodeldir 'right/rgbdnormalkdes' ];
			movefile( '../kdesfeatures/rgbdnormalkdes', movedir );
			%movedir = [ rootmodeldir 'Right/modelrgbkdes.linear' ];
			%movefile( 'model.linear', movedir );
		else
			mkdir( rootmodeldir );
			dst = [ rootmodeldir 'right' ];
			mkdir( dst );
			movedir = [ rootmodeldir 'right/rgbdfea_pcloud_normalkdes.mat' ];
			movefile( 'rgbdfea_pcloud_normalkdes.mat', movedir );
		end
    end
    if CALC_TOP
        imdir = [ rootimgdir 'top/' ];
                
        rgbd_pcloud_normalkdes;
		if CALC_SVMMODEL
			f_DEP_SPIN = 1;
			convert;
			f_DEP_SPIN = 0;
        
			mkdir( rootmodeldir );
			dst = [ rootmodeldir 'top' ];
			mkdir( dst );
			movedir = [ rootmodeldir 'top/rgbdfea_pcloud_normalkdes.mat' ];
			movefile( 'rgbdfea_pcloud_normalkdes.mat', movedir );
			movedir = [ rootmodeldir 'top/modelspinkdes.mat' ];
			movefile( 'modelspinkdes.mat', movedir );
			movedir = [ rootmodeldir 'top/rgbdnormalkdes' ];
			movefile( '../kdesfeatures/rgbdnormalkdes', movedir );
			%movedir = [ rootmodeldir 'Top/modelrgbkdes.linear' ];
			%movefile( 'model.linear', movedir );
		else
			mkdir( rootmodeldir );
			dst = [ rootmodeldir 'top' ];
			mkdir( dst );
			movedir = [ rootmodeldir 'top/rgbdfea_pcloud_normalkdes.mat' ];
			movefile( 'rgbdfea_pcloud_normalkdes.mat', movedir );
		end
    end
    if CALC_BOTTOM
        imdir = [ rootimgdir 'bottom/' ];
                
        rgbd_pcloud_normalkdes;
		if CALC_SVMMODEL
			f_DEP_SPIN = 1;
			convert;
			f_DEP_SPIN = 0;
        
			mkdir( rootmodeldir );
			dst = [ rootmodeldir 'bottom' ];
			mkdir( dst );
			movedir = [ rootmodeldir 'bottom/rgbdfea_pcloud_normalkdes.mat' ];
			movefile( 'rgbdfea_pcloud_normalkdes.mat', movedir );
			movedir = [ rootmodeldir 'bottom/modelspinkdes.mat' ];
			movefile( 'modelspinkdes.mat', movedir );
			movedir = [ rootmodeldir 'bottom/rgbdnormalkdes' ];
			movefile( '../kdesfeatures/rgbdnormalkdes', movedir );
			%movedir = [ rootmodeldir 'Bottom/modelrgbkdes.linear' ];
			%movefile( 'model.linear', movedir );
		else
			mkdir( rootmodeldir );
			dst = [ rootmodeldir 'bottom' ];
			mkdir( dst );
			movedir = [ rootmodeldir 'bottom/rgbdfea_pcloud_normalkdes.mat' ];
			movefile( 'rgbdfea_pcloud_normalkdes.mat', movedir );
		end
    end
end

%% RGB-D COMBINATION FEATURE
if COMBINATION
    if CALC_FULL
        imdir = [ rootmodeldir 'full/' ];
        disp( imdir );
                
        rgbd_joint_category;
		if CALC_SVMMODEL
			f_COM = 1;
			convert;
			f_COM = 0;
    
			mkdir( rootmodeldir );
			dst = [ rootmodeldir 'full' ];
			mkdir( dst );
			movedir = [ rootmodeldir 'full/rgbdfea_joint.mat' ];
			movefile( 'rgbdfea_joint.mat', movedir );
			movedir = [ rootmodeldir 'full/combinekdes.mat' ];
			movefile( 'combinekdes.mat', movedir );
			%movedir = [ rootmodeldir 'Full/modelrgbkdes.linear' ];
			%movefile( 'model.linear', movedir );
		else
			mkdir( rootmodeldir );
			dst = [ rootmodeldir 'full' ];
			mkdir( dst );
			movedir = [ rootmodeldir 'full/rgbdfea_joint.mat' ];
			movefile( 'rgbdfea_joint.mat', movedir );
		end
    end
    
    if CALC_LEFT
        imdir = [ rootmodeldir 'left/' ];
        disp( imdir );
        
        rgbd_joint_category;
		if CALC_SVMMODEL
			f_COM = 1;
			convert;
			f_COM = 0;
    
			mkdir( rootmodeldir );
			dst = [ rootmodeldir 'left' ];
			mkdir( dst );
			movedir = [ rootmodeldir 'left/rgbdfea_joint.mat' ];
			movefile( 'rgbdfea_joint.mat', movedir );
			movedir = [ rootmodeldir 'left/combinekdes.mat' ];
			movefile( 'combinekdes.mat', movedir );
			%movedir = [ rootmodeldir 'Full/modelrgbkdes.linear' ];
			%movefile( 'model.linear', movedir );
		else
			mkdir( rootmodeldir );
			dst = [ rootmodeldir 'left' ];
			mkdir( dst );
			movedir = [ rootmodeldir 'left/rgbdfea_joint.mat' ];
			movefile( 'rgbdfea_joint.mat', movedir );
		end
    end
    
    if CALC_RIGHT
        imdir = [ rootmodeldir 'right/' ];
        disp( imdir );
        
        rgbd_joint_category;
		if CALC_SVMMODEL
			f_COM = 1;
			convert;
			f_COM = 0;
    
			mkdir( rootmodeldir );
			dst = [ rootmodeldir 'right' ];
			mkdir( dst );
			movedir = [ rootmodeldir 'right/rgbdfea_joint.mat' ];
			movefile( 'rgbdfea_joint.mat', movedir );
			movedir = [ rootmodeldir 'right/combinekdes.mat' ];
			movefile( 'combinekdes.mat', movedir );
			%movedir = [ rootmodeldir 'Full/modelrgbkdes.linear' ];
			%movefile( 'model.linear', movedir );
		else
			mkdir( rootmodeldir );
			dst = [ rootmodeldir 'right' ];
			mkdir( dst );
			movedir = [ rootmodeldir 'right/rgbdfea_joint.mat' ];
			movefile( 'rgbdfea_joint.mat', movedir );
		end
    end
    
    if CALC_TOP
        imdir = [ rootmodeldir 'top/' ];
        disp( imdir );
        
        rgbd_joint_category;
		if CALC_SVMMODEL
			f_COM = 1;
			convert;
			f_COM = 0;
    
			mkdir( rootmodeldir );
			dst = [ rootmodeldir 'top' ];
			mkdir( dst );
			movedir = [ rootmodeldir 'top/rgbdfea_joint.mat' ];
			movefile( 'rgbdfea_joint.mat', movedir );
			movedir = [ rootmodeldir 'top/combinekdes.mat' ];
			movefile( 'combinekdes.mat', movedir );
			%movedir = [ rootmodeldir 'Full/modelrgbkdes.linear' ];
			%movefile( 'model.linear', movedir );
		else
			mkdir( rootmodeldir );
			dst = [ rootmodeldir 'top' ];
			mkdir( dst );
			movedir = [ rootmodeldir 'top/rgbdfea_joint.mat' ];
			movefile( 'rgbdfea_joint.mat', movedir );
		end
    end
    
    if CALC_BOTTOM
        imdir = [ rootmodeldir 'bottom/' ];
        disp( imdir );
        
        rgbd_joint_category;
		if CALC_SVMMODEL
			f_COM = 1;
			convert;
			f_COM = 0;
    
			mkdir( rootmodeldir );
			dst = [ rootmodeldir 'bottom' ];
			mkdir( dst );
			movedir = [ rootmodeldir 'bottom/rgbdfea_joint.mat' ];
			movefile( 'rgbdfea_joint.mat', movedir );
			movedir = [ rootmodeldir 'bottom/combinekdes.mat' ];
			movefile( 'combinekdes.mat', movedir );
			%movedir = [ rootmodeldir 'Full/modelrgbkdes.linear' ];
			%movefile( 'model.linear', movedir );
		else
			mkdir( rootmodeldir );
			dst = [ rootmodeldir 'bottom' ];
			mkdir( dst );
			movedir = [ rootmodeldir 'bottom/rgbdfea_joint.mat' ];
			movefile( 'rgbdfea_joint.mat', movedir );
		end
    end
end